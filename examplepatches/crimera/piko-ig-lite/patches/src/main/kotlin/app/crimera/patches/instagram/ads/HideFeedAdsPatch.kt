/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.ads

import app.crimera.bytecode.Target
import app.crimera.bytecode.fieldReference
import app.crimera.bytecode.insertHook
import app.crimera.bytecode.methodReference
import app.crimera.patches.common.requireExactlyOne
import app.crimera.patches.instagram.feed.BRIDGE_OBJECT_DESCRIPTOR
import app.crimera.patches.instagram.feed.FEED_FILTER_DESCRIPTOR
import app.crimera.patches.instagram.feed.feedFilterHookPatch
import app.crimera.patches.instagram.misc.extension.sharedExtensionPatch
import app.crimera.patches.instagram.misc.settings.Categories
import app.crimera.patches.instagram.misc.settings.instagramToggle
import app.crimera.patches.instagram.models.MEDIA_DESCRIPTOR
import app.crimera.patches.instagram.models.PandoField
import app.crimera.patches.instagram.models.PandoModel
import app.crimera.patches.instagram.models.ResolvedFeedModels
import app.crimera.patches.instagram.models.feedItemsStoreIndex
import app.crimera.patches.instagram.models.mutableResponseParser
import app.crimera.patches.instagram.models.readModelValue
import app.crimera.patches.instagram.models.resolvedFeedModels
import app.crimera.patches.instagram.models.resolvedModelGetter
import app.crimera.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.instagram.utils.replaceBridgeBody
import app.crimera.patches.settings.settingStrings
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** Pando key of the ad payload a sponsored `Media` carries; organic posts leave it null. */
private const val INJECTED_KEY = "injected"

private const val HIDE_FEED_ADS = "$FEED_FILTER_DESCRIPTOR->hideAds()Z"
private const val BOOLEAN_TRUE = "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"
private const val INTEGER_VALUE_OF = "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;"

@Suppress("unused")
val hideFeedAdsPatch =
    bytecodePatch(
        name = "Hide feed ads",
        description = "Removes sponsored posts and ad units from the main feed.",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(sharedExtensionPatch, feedFilterHookPatch)

        instagramToggle(
            id = "instagram.ads.hide_feed",
            category = Categories.ADS,
            strings = settingStrings("piko_ig_hide_feed_ads"),
            order = 100,
            defaultValue = true,
        )

        execute {
            val models = resolvedFeedModels()
            patchAdBridges(models)
            disableClientAdInsertions(models)
        }
    }

/** Server-sent ads: the bridges `FeedFilter.isAd` reads while it filters each page. */
context(patchContext: BytecodePatchContext)
private fun patchAdBridges(models: ResolvedFeedModels) {
    // FeedFilter.getMultiAdPivot(item): the item's `stand_alone_multi_ad_pivot` media.
    replaceBridgeBody(
        FEED_FILTER_DESCRIPTOR,
        "getMultiAdPivot",
        listOf(BRIDGE_OBJECT_DESCRIPTOR),
        BRIDGE_OBJECT_DESCRIPTOR,
        registers = 2,
    ) {
        val value = 0
        val item = 1
        instanceOf(value, item, models.feedItemDescriptor)
        ifEqz(value, Target.Local("none"))
        checkCast(item, models.feedItemDescriptor)
        iget(value, item, models.multiAdPivotField)
        returnObject(value)

        label("none")
        constInt(value, 0)
        returnObject(value)
    }

    val injected = resolvedModelGetter(PandoModel.MEDIA, PandoField.Key(INJECTED_KEY))
    if (!injected.getter.returnType.startsWith("L")) {
        throw PatchException("Media \"$INJECTED_KEY\" getter returns ${injected.getter.returnType}, not an object")
    }
    // FeedFilter.getMediaInjected(media): the media's ad payload, null for organic posts.
    replaceBridgeBody(
        FEED_FILTER_DESCRIPTOR,
        "getMediaInjected",
        listOf(BRIDGE_OBJECT_DESCRIPTOR),
        BRIDGE_OBJECT_DESCRIPTOR,
        registers = 2,
    ) {
        val value = 0
        val media = 1
        instanceOf(value, media, MEDIA_DESCRIPTOR)
        ifEqz(value, Target.Local("none"))
        checkCast(media, MEDIA_DESCRIPTOR)
        readModelValue(value, media, injected, Target.Local("none"))
        returnObject(value)

        label("none")
        constInt(value, 0)
        returnObject(value)
    }
}

/**
 * Client-inserted ads: the feed response tells the client whether, and how many, ads it may insert
 * from its ad pool. Both values are overridden when the parser returns the response, because the
 * server can omit either key and the response defaults allow insertions.
 */
context(patchContext: BytecodePatchContext)
private fun disableClientAdInsertions(models: ResolvedFeedModels) {
    val parser = models.mutableResponseParser()
    val instructions = parser.implementation!!.instructions
    val responseRegister = (instructions[models.feedItemsStoreIndex(parser)] as TwoRegisterInstruction).registerB
    val returnIndex =
        requireExactlyOne(
            "feed response return in $parser",
            instructions.indices.filter { index ->
                instructions[index].opcode == Opcode.RETURN_OBJECT &&
                    (instructions[index] as OneRegisterInstruction).registerA == responseRegister
            },
        )

    // The return is the loop's exit target: every path that returns the response runs the override.
    parser.insertHook(
        index = returnIndex,
        excludedRegisters = listOf(responseRegister),
        relocateBranchTargets = true,
    ) {
        val value = scratchRegister()
        invokeStatic(methodReference(HIDE_FEED_ADS))
        moveResult(value, "Z")
        ifEqz(value, Target.Original)

        // 4-bit `iput` cannot address a high response register, so it is copied first.
        val response = scratchRegister()
        move(response, responseRegister, models.responseDescriptor)
        sget(value, fieldReference(BOOLEAN_TRUE))
        iput(value, response, models.disableClientInsertionsField)
        constInt(value, 0)
        invokeStatic(methodReference(INTEGER_VALUE_OF), value)
        moveResult(value, "Ljava/lang/Integer;")
        iput(value, response, models.maxAdInsertionsField)
    }
}
