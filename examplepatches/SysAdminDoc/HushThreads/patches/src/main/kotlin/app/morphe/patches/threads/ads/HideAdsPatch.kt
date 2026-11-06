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
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.parameterRegister
import app.morphe.patches.threads.misc.extension.requireLocals
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

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
 * passes neither cache's merge. Both For You handlers' inserts ask the extension first, and an ad
 * gets the feed cache's own "no page" answer instead of going in (454, 2026-11-05).
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

/** The insert's result code, and the code it answers in place of a [FeedAds] ad. */
private const val INSERT_RESULT = "Ljava/lang/Integer;"

/**
 * For You's insert of one feed item at a position in a page the cache already holds: the one
 * method of [FOR_YOU_LOCAL_SOURCE] taking an object and an int and answering an Integer code.
 * Threads places an ad through it apart from any page fetch, so the ad never meets the merges'
 * filter. Both handlers' inserts ask [FeedAds] first and, for an ad, answer the feed cache
 * handler's own code for having no page to put it in, which tells the caller nothing went in.
 * Threads logs every code but success as an insert that didn't happen and moves on (it retries
 * only one other code), so the ad reads as one Threads itself declined, never as one to try again.
 */
private fun BytecodePatchContext.hookAdInserts(item: String) {
    val declared = classDefBy(FOR_YOU_LOCAL_SOURCE).methods.filter {
        it.returnType == INSERT_RESULT && it.parameterTypes.size == 2 && it.parameterTypes[1] == "I" &&
            it.parameterTypes[0].startsWith("L")
    }.singleOrPatchException("$PATCH: For You's insert of one item at a position")
    if (declared.parameterTypes[0].toString() != item) {
        throw PatchException("$PATCH: For You's insert takes ${declared.parameterTypes[0]}, not the feed item $item")
    }
    val inserts = listOf(FEED_CACHE_HANDLER, SPOOL_FEED_CACHE).map { handler ->
        val classDef = mutableClassDefBy(handler)
        if (classDef.superclass != FOR_YOU_LOCAL_SOURCE) {
            throw PatchException("$PATCH: $handler no longer extends $FOR_YOU_LOCAL_SOURCE")
        }
        classDef.methods.filter {
            it.name == declared.name && it.returnType == INSERT_RESULT &&
                it.parameterTypes.map(CharSequence::toString) == declared.parameterTypes.map(CharSequence::toString)
        }.singleOrPatchException("$PATCH: $handler's insert ${declared.name}")
    }
    val (feed, spool) = inserts
    val noPage = feed.noPageCode()
    // The spool's insert hands the item to a coroutine and always answers that it went in.
    val inserted = spool.implementation!!.instructions.mapNotNull { instruction ->
        instruction.getReference<FieldReference>()?.takeIf { instruction.opcode == Opcode.SGET_OBJECT && it.type == INSERT_RESULT }
    }.distinctBy { it.toString() }.singleOrPatchException("$PATCH: the spool insert's one answer")
    if (noPage.toString() == inserted.toString()) {
        throw PatchException("$PATCH: the feed cache's no-page answer $noPage is the spool's success answer")
    }
    inserts.forEach { insert ->
        insert.requireLocals(PATCH, 1)
        val held = insert.parameterRegister(0)
        insert.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { $held .. $held }, $FEED_ADS->insertedAd(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :insert
                sget-object v0, $noPage
                return-object v0
            """,
            ExternalLabel("insert", insert.getInstruction(0)),
        )
    }
}

/**
 * The code the feed cache handler's insert answers when the cache holds no page: the static
 * Integer it reads and returns where its `if-eqz` on the page it just cast jumps.
 */
private fun Method.noPageCode(): FieldReference {
    val flow = ControlFlow.of(this)
    val body = flow.instructions
    val codes = body.indices.filter { index ->
        index + 1 < body.size && body[index].opcode == Opcode.CHECK_CAST && body[index + 1].opcode == Opcode.IF_EQZ &&
            (body[index] as OneRegisterInstruction).registerA == (body[index + 1] as OneRegisterInstruction).registerA
    }.mapNotNull { index ->
        val target = flow.normal[index + 1].singleOrNull { it != index + 2 } ?: return@mapNotNull null
        val read = body[target]
        val code = read.getReference<FieldReference>()?.takeIf { read.opcode == Opcode.SGET_OBJECT && it.type == INSERT_RESULT }
        val returned = body.getOrNull(target + 1)
        code?.takeIf {
            returned?.opcode == Opcode.RETURN_OBJECT &&
                (returned as OneRegisterInstruction).registerA == (read as OneRegisterInstruction).registerA
        }
    }
    return codes.singleOrPatchException("$PATCH: $definingClass->$name's answer for having no page")
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
