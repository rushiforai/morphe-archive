/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0). The feed cache's merge as the place to take ads out
 * is the one zeldrisho/morphe-patches found: https://github.com/zeldrisho/morphe-patches
 * The feed unit types read as ads are the ones MrxSiN/ThreadsHideAds named (2.0.0, GPL-3.0):
 * https://github.com/MrxSiN/ThreadsHideAds
 */
package app.morphe.patches.threads.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.feed.reaching
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide ads"

/**
 * Constant names that tell Threads' feed unit type enum apart, which Threads keeps: the ad kinds
 * FeedAds drops (an ad, an ad for ads, the two ad pivots and the ads feedback prompt) and the
 * ordinary post and suggestion kinds it keeps.
 */
internal val UNIT_TYPE_NAMES = listOf(
    "AD", "AD4AD", "INTENT_AWARE_AD_PIVOT", "STAND_ALONE_MULTI_AD_PIVOT", "ADS_FEEDBACK_INTERFACE",
    "THREAD", "SUGGESTED_USERS",
)

/** The name Kotlin's lateinit check gives the feed item's unit type when it's read unset. */
internal const val FEED_ITEM_TYPE = "feedItemType"

/**
 * Takes ad posts out of the feed.
 *
 * Each page Threads fetches for the feed goes to the extension before the feed cache merges it,
 * and comes back without the items whose post Threads itself would call an ad. Two of the
 * extension's methods are written in here, since what they call has a new name in every build:
 * the feed item's getter for its post, which the merge itself calls, and Media's own ad check,
 * the one method of Media that asks the "injected" check.
 *
 * Found by reading 449 (2026-09-29). A thread unit's own ad check asks its first post's, so an
 * item counts by the post the feed shows.
 *
 * An item also counts as an ad by its feed unit type. Each item carries an enum saying what kind of
 * unit it is, and that enum keeps its constant names, so the extension reads the type's name and
 * drops the ad kinds whole (AD, AD4AD, the ad pivots and the ads feedback prompts), whatever post
 * the unit carries. A third stub reads the item's field for it. The field is found by its type, the
 * one enum on the item naming every ad kind and the ordinary ones, and checked against the item's
 * own getter for it, which names it "feedItemType".
 *
 * An opened post fetches its own ads to show among its replies, and those never reach the feed
 * cache. [permalinkAdsPatch] hands that list to the extension too.
 *
 * Threads can also put an ad into a For You page it already holds, one item at a position, which
 * passes no merge. The insert asks the extension first, and an ad goes the way the insert goes
 * when the cache holds no page, instead of going in (454, 2026-11-05; 455 inlined the insert).
 */
@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = PATCH,
    description = "Removes sponsored posts from your feed and from under the posts you open before Threads shows" +
        " them, so they leave no gap. On by default. Turn it off in HushThreads settings > Feed.",
    default = true,
) {
    category("Ads")
    dependsOn(settingsPatch)
    dependsOn(feedPageFilterPatch)
    dependsOn(permalinkAdsPatch)
    compatibleWith(*AppCompatibilities.threads())
    dependsOn(threadsExtensionPatch)

    execute {
        requireStatusMethod("hideAds")
        // Media's own ad check directly returns the injected check, without an alternate exit.
        val injected = InjectedAdCheckFingerprint.method
        val isAd = mutableClassDefBy(MEDIA).methods.filter { method ->
            if (method.returnType != "Z" || method.parameterTypes.isNotEmpty() || AccessFlags.STATIC.isSet(method.accessFlags)) {
                return@filter false
            }
            val body = method.implementation?.instructions?.toList() ?: return@filter false
            val calls = body.mapIndexedNotNull { index, instruction ->
                instruction.getReference<MethodReference>()?.takeIf {
                    it.definingClass == injected.definingClass && it.name == injected.name &&
                        it.returnType == injected.returnType &&
                        it.parameterTypes.map(CharSequence::toString) == injected.parameterTypes.map(CharSequence::toString)
                }?.let { index }
            }
            body.size >= 3 && calls.singleOrNull() == body.size - 3 &&
                body[body.size - 3].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) &&
                body[body.size - 2].opcode == Opcode.MOVE_RESULT && body.last().opcode == Opcode.RETURN &&
                (body[body.size - 2] as OneRegisterInstruction).registerA == (body.last() as OneRegisterInstruction).registerA &&
                method.implementation!!.tryBlocks.isEmpty() &&
                body.dropLast(1).all { it.opcode.canContinue() && it !is OffsetInstruction }
        }.singleOrPatchException("$PATCH: Media's own boolean method that directly returns the injected check")

        writeStub(
            FEED_ADS, "isAd", 2,
            """
                check-cast p0, $MEDIA
                invoke-virtual { p0 }, $MEDIA->${isAd.name}()Z
                move-result v0
                return v0
            """,
        )

        val item = FeedPageMergeFingerprint.method.itemMediaGetter().definingClass
        hookAdInserts(item)
        val unitType = feedUnitTypeField(item)
        writeStub(
            FEED_ADS, "itemUnitType", 2,
            """
                instance-of v0, p0, $item
                if-eqz v0, :none
                check-cast p0, $item
                iget-object v0, p0, $unitType
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """,
        )

        enableStatus("hideAds")
    }
}

/** The insert's result code. */
internal const val INSERT_RESULT = "Ljava/lang/Integer;"

/**
 * Whether [method] is For You's insert of one feed item at a position in a page the cache already
 * holds, as 455 inlines it: a method answering an Integer code, its last parameter the int
 * position, that casts the For You data source it's given to the feed cache's handler.
 */
internal fun isAdInsert(method: Method): Boolean = method.returnType == INSERT_RESULT &&
    method.parameterTypes.lastOrNull()?.toString() == "I" &&
    method.implementation?.instructions?.any {
        it.opcode == Opcode.CHECK_CAST && it.getReference<TypeReference>()?.type == FEED_CACHE_HANDLER
    } == true

/**
 * For You's insert of one feed item at a position in a page the cache already holds. Threads
 * places an ad through it apart from any page fetch, so the ad never meets the merge's filter. 455
 * moved it out of the handler into a class holding the data source, which reads the item off its
 * argument, takes the cache's first page and, for none, goes to its own code for having no page.
 * Right before that check the insert asks [FeedAds], and an ad goes the no-page way, which tells
 * the caller nothing went in. Threads logs every code but success as an insert that didn't happen
 * and moves on (it retries only one other code), so the ad reads as one Threads itself declined,
 * never as one to try again.
 */
private fun BytecodePatchContext.hookAdInserts(item: String) {
    val inserts = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.fields.none { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == FOR_YOU_LOCAL_SOURCE }) return@classDefForEach
        classDef.methods.filter { isAdInsert(it) }.mapTo(inserts) { it.toString() }
    }
    val found = inserts.singleOrPatchException("$PATCH: For You's insert of one item at a position")
    val insert = mutableClassDefBy(found.substringBefore("->")).methods.single { it.toString() == found }
    val (check, noPage) = insert.noPageCheck()
    val reads = insert.implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.IGET_OBJECT && instruction.getReference<FieldReference>()?.type == item
    }
    val read = reads.singleOrNull() ?: throw PatchException("$PATCH: the insert reads the feed item $item ${reads.size} times")
    val held = (read.value as TwoRegisterInstruction).registerA
    val reaching = insert.reaching(check, setOf(held))
    if (reaching.fromEntry || reaching.writes != setOf(read.index)) {
        throw PatchException("$PATCH: the insert's item register v$held doesn't hold the item at its page check")
    }
    // A register the ask can borrow: read on neither way on from it.
    val liveness = RegisterLiveness.of(insert)
    val free = (0 until minOf(16, insert.implementation!!.registerCount)).firstOrNull {
        it != held && it !in liveness.liveInto(check) && it !in liveness.liveInto(noPage)
    } ?: throw PatchException("$PATCH: the insert has no register free at its page check")
    insert.addInstructionsWithLabels(
        check,
        """
            invoke-static/range { v$held .. v$held }, $FEED_ADS->insertedAd(Ljava/lang/Object;)Z
            move-result v$free
            if-nez v$free, :no_page
        """,
        ExternalLabel("no_page", insert.getInstruction(noPage)),
    )
}

/**
 * The insert's check for a page to put the item in, and where it goes for none: the `check-cast`
 * of the page right before an `if-eqz` on it, which jumps to a read of a static Integer code.
 */
private fun Method.noPageCheck(): Pair<Int, Int> {
    val flow = ControlFlow.of(this)
    val body = flow.instructions
    val checks = body.indices.filter { index ->
        index + 1 < body.size && body[index].opcode == Opcode.CHECK_CAST && body[index + 1].opcode == Opcode.IF_EQZ &&
            (body[index] as OneRegisterInstruction).registerA == (body[index + 1] as OneRegisterInstruction).registerA
    }.mapNotNull { index ->
        val target = flow.normal[index + 1].singleOrNull { it != index + 2 } ?: return@mapNotNull null
        val read = body[target]
        (index to target).takeIf {
            read.opcode == Opcode.SGET_OBJECT && read.getReference<FieldReference>()?.type == INSERT_RESULT
        }
    }
    return checks.singleOrPatchException("$PATCH: $definingClass->$name's check for having no page")
}

private fun Method.strings(): Set<String> =
    implementation?.instructions?.mapNotNull { it.getReference<StringReference>()?.string }?.toSet().orEmpty()

/** Whether [type] is Threads' feed unit type: an enum whose constants include every one of [UNIT_TYPE_NAMES]. */
internal fun BytecodePatchContext.isFeedUnitType(type: String): Boolean {
    val enum = classDefByOrNull(type) ?: return false
    if (enum.superclass != "Ljava/lang/Enum;") return false
    val names = enum.methods.singleOrNull { it.name == "<clinit>" }?.strings() ?: return false
    return UNIT_TYPE_NAMES.all { it in names }
}

/**
 * The feed item's field holding its unit type, as smali names it: the item's one instance field of
 * the feed unit type enum, and the one its "feedItemType" getter reads. Throws unless both agree.
 */
internal fun BytecodePatchContext.feedUnitTypeField(item: String): String {
    val itemClass = classDefByOrNull(item) ?: throw PatchException("$PATCH: Threads carries no feed item class $item")
    val fields = itemClass.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && isFeedUnitType(it.type) }
    val field = fields.singleOrNull()
        ?: throw PatchException("$PATCH: expected one feed unit type field in $item, found ${fields.map { it.name }}")
    val getters = itemClass.methods.filter { FEED_ITEM_TYPE in it.strings() }
    val getter = getters.singleOrNull()
        ?: throw PatchException("$PATCH: expected one $FEED_ITEM_TYPE getter in $item, found ${getters.size}")
    val reads = getter.implementation!!.instructions.mapNotNull { instruction ->
        instruction.getReference<FieldReference>()?.takeIf { instruction.opcode == Opcode.IGET_OBJECT }
    }
    val read = reads.singleOrNull()
    if (read == null || read.definingClass != item || read.name != field.name || read.type != field.type ||
        getter.returnType != field.type
    ) {
        throw PatchException("$PATCH: $item's $FEED_ITEM_TYPE getter ${getter.name} doesn't answer ${field.name}")
    }
    return "$item->${field.name}:${field.type}"
}
