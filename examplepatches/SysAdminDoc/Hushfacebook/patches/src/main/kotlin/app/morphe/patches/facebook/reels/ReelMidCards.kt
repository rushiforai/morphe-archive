/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef

/*
 * The "Threads you might like" card between reels (#85), found by kept names only (read from 577,
 * 580 and 581, 2026-10-06). The obfuscated names in these comments are for reviewers; the code
 * never writes one down.
 *
 * - The cards Facebook puts between reels (people you may know, groups, games, a Threads post) are
 *   Reels mid-cards, typed by a GraphQL enum whose constant names Redex keeps: THREADS_MIDCARD
 *   beside PYML_MIDCARD, GYSJ_MIDCARD and UNSET_OR_UNRECOGNIZED_ENUM_VALUE (581 LX/55V, 580 LX/oiC,
 *   577 LX/oBA). One larger enum names THREADS_MIDCARD too (581 LX/5bI, 580 LX/oiD, 577 LX/oBs),
 *   but no model answers it.
 * - The mid-card model answers its type through one no-argument interface method (581
 *   LX/UeF;->B75, 580 LX/Uxb;->B6L, 577 LX/V8y;->B8U), and the unit that holds the model hands it
 *   over through one more (581 LX/Udt;->BOZ, 580 LX/Ux9;->BNg, 577 LX/V8g;->BPW).
 * - A mid-card's Reels item keeps that unit in a field and answers a story like every reel item
 *   (581 LX/8bO;->A01, 580 LX/8Qi;->A01, 577 LX/Aw5;->A01). Every other class that keeps the unit is
 *   a Litho component drawing one, and none of those answers a story.
 * - The Reels controller's page method, the one the page filters already go on, walks each
 *   section's items, picks out this item class and reads its type the same way (581
 *   LX/5IF;->A0K through LX/58Z;->A02). So a mid-card is in the section lists ReelSections walks.
 */

/** The mid-card type of the Threads card. */
internal const val THREADS_MID_CARD = "THREADS_MIDCARD"

internal const val REEL_MID_CARDS = "$EXTENSION_PACKAGE/reels/ReelMidCards;"
internal const val MID_CARD_TYPE_STUB = "midCardType"
internal const val THREADS_CARD_SECTION_FILTER =
    "$REEL_MID_CARDS->withoutThreadsCards(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;"

private const val ENUM = "Ljava/lang/Enum;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STORY = "Lcom/facebook/graphql/model/GraphQLStory;"

/** The reads from a Reels mid-card item to its type. */
internal class MidCardType(
    /** The mid-card item class. */
    val item: String,
    /** The item's field holding the mid-card unit. */
    val unitField: String,
    /** The unit interface. */
    val unit: String,
    /** The unit's no-argument getter of the model. */
    val modelGetter: String,
    /** The model interface. */
    val model: String,
    /** The model's no-argument getter of the type. */
    val typeGetter: String,
    /** The mid-card type enum. */
    val type: String,
)

/**
 * One pass over every class, then the chain from the mid-card type enum back to the item, each
 * step required to be the only one. Shared by the patch and its fixture test.
 */
internal class MidCardScan {
    private class Getter(val owner: String, val name: String, val public: Boolean)
    private class ItemField(val owner: String, val name: String, val public: Boolean)

    class Result(val found: MidCardType?, val problem: String?)

    private val enums = mutableListOf<String>()

    /** Every no-argument abstract interface method returning an object, by its return type. */
    private val interfaceGetters = HashMap<String, MutableList<Getter>>()

    /** Every instance field of a class that answers a story, by the field's type. */
    private val itemFields = HashMap<String, MutableList<ItemField>>()

    fun visit(classDef: ClassDef) {
        val flags = classDef.accessFlags
        if (classDef.superclass == ENUM &&
            classDef.methods.any { it.name == "<clinit>" && holdsString(it, THREADS_MID_CARD) }
        ) {
            enums += classDef.type
        }

        if (AccessFlags.INTERFACE.isSet(flags)) {
            val public = AccessFlags.PUBLIC.isSet(flags)
            for (method in classDef.methods) {
                if (method.parameterTypes.isNotEmpty() || !AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                if (!method.returnType.startsWith("L")) continue
                interfaceGetters.getOrPut(method.returnType) { mutableListOf() } += Getter(classDef.type, method.name, public)
            }
            return
        }

        val answersStory = classDef.methods.any {
            it.parameterTypes.isEmpty() && it.returnType == STORY && !AccessFlags.STATIC.isSet(it.accessFlags)
        }
        if (!answersStory) return
        val public = AccessFlags.PUBLIC.isSet(flags)
        for (field in classDef.instanceFields) {
            itemFields.getOrPut(field.type) { mutableListOf() } +=
                ItemField(classDef.type, field.name, public && AccessFlags.PUBLIC.isSet(field.accessFlags))
        }
    }

    fun resolve(): Result {
        if (enums.isEmpty()) return Result(null, "no enum names $THREADS_MID_CARD")

        val typeGetters = enums.flatMap { interfaceGetters[it].orEmpty() }
        val typeGetter = typeGetters.singleOrNull() ?: return Result(
            null,
            "expected one interface getter of an enum naming $THREADS_MID_CARD (${enums.joinToString()}), " +
                "found ${typeGetters.size}",
        )
        val type = enums.single { interfaceGetters[it].orEmpty().isNotEmpty() }

        val modelGetters = interfaceGetters[typeGetter.owner].orEmpty()
        val modelGetter = modelGetters.singleOrNull() ?: return Result(
            null,
            "expected one interface getter of the mid-card model ${typeGetter.owner}, found ${modelGetters.size}",
        )

        val fields = itemFields[modelGetter.owner].orEmpty()
        val field = fields.singleOrNull() ?: return Result(
            null,
            "expected one reel item keeping the mid-card unit ${modelGetter.owner}, " +
                "found ${fields.joinToString { "${it.owner}->${it.name}" }.ifEmpty { "none" }}",
        )

        if (!typeGetter.public || !modelGetter.public || !field.public) {
            return Result(
                null,
                "the mid-card reads (${field.owner}->${field.name}, ${modelGetter.owner}, ${typeGetter.owner}) " +
                    "aren't all public, so the extension can't make them",
            )
        }

        return Result(
            MidCardType(
                item = field.owner,
                unitField = field.name,
                unit = modelGetter.owner,
                modelGetter = modelGetter.name,
                model = typeGetter.owner,
                typeGetter = typeGetter.name,
                type = type,
            ),
            null,
        )
    }
}

/**
 * Fills the extension's mid-card type stub with the three reads: the item's unit, the unit's
 * model, the model's type, answering null where one is missing. Only the parameter register is
 * used, so the stub's own register count doesn't matter; the extension passes only an object of
 * the item class.
 */
internal fun BytecodePatchContext.fillMidCardTypeStub(card: MidCardType) {
    val stub = mutableClassDefBy(REEL_MID_CARDS).methods.singleOrNull {
        it.name == MID_CARD_TYPE_STUB && AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == OBJECT &&
            it.parameterTypes.map { type -> type.toString() } == listOf(OBJECT)
    } ?: throw PatchException("$REEL_MID_CARDS has no static Object $MID_CARD_TYPE_STUB(Object)")

    stub.addInstructionsWithLabels(0, midCardTypeReads(card))
}

/** The stub's body, on its own so the shapes test can read it. */
internal fun midCardTypeReads(card: MidCardType) =
    """
        check-cast p0, ${card.item}
        iget-object p0, p0, ${card.item}->${card.unitField}:${card.unit}
        if-eqz p0, :no_type
        invoke-interface { p0 }, ${card.unit}->${card.modelGetter}()${card.model}
        move-result-object p0
        if-eqz p0, :no_type
        invoke-interface { p0 }, ${card.model}->${card.typeGetter}()${card.type}
        move-result-object p0
        :no_type
        return-object p0
    """
