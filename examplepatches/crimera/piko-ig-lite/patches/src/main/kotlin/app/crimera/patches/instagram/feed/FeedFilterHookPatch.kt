/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.feed

import app.crimera.bytecode.Target
import app.crimera.bytecode.insertHook
import app.crimera.bytecode.methodReference
import app.crimera.patches.instagram.misc.extension.sharedExtensionPatch
import app.crimera.patches.instagram.models.feedItemsStoreIndex
import app.crimera.patches.instagram.models.mutableResponseParser
import app.crimera.patches.instagram.models.resolvedFeedModels
import app.crimera.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.instagram.utils.Constants.PATCHES_DESCRIPTOR
import app.crimera.patches.instagram.utils.replaceBridgeBody
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

internal const val FEED_FILTER_DESCRIPTOR = "$PATCHES_DESCRIPTOR/feed/FeedFilter;"
internal const val BRIDGE_OBJECT_DESCRIPTOR = "Ljava/lang/Object;"
private const val LIST_DESCRIPTOR = "Ljava/util/List;"
private const val FILTER_FEED_ITEMS =
    "$FEED_FILTER_DESCRIPTOR->filterFeedItems($LIST_DESCRIPTOR)$LIST_DESCRIPTOR"

/**
 * Installs the single-pass feed filter: every parsed `feed_items` page passes through
 * `FeedFilter.filterFeedItems` before the feed response stores it. Network loads and the cold-start
 * feed cache share this parser, so both are filtered. Feature patches add their bridges on top.
 */
internal val feedFilterHookPatch =
    bytecodePatch(
        description = "Routes parsed main feed pages through the extension feed filter.",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(sharedExtensionPatch)

        execute {
            val models = resolvedFeedModels()

            val parser = models.mutableResponseParser()
            val storeIndex = models.feedItemsStoreIndex(parser)
            val listRegister = (parser.implementation!!.instructions[storeIndex] as TwoRegisterInstruction).registerA
            // The store is the loop exit target: every path that stores the list runs the filter.
            parser.insertHook(index = storeIndex, relocateBranchTargets = true) {
                invokeStatic(methodReference(FILTER_FEED_ITEMS), listRegister)
                moveResult(listRegister, LIST_DESCRIPTOR)
            }

            // FeedFilter.getMediaOrAd(item): the item's `media_or_ad` media, or null for any other value.
            replaceBridgeBody(
                FEED_FILTER_DESCRIPTOR,
                "getMediaOrAd",
                listOf(BRIDGE_OBJECT_DESCRIPTOR),
                BRIDGE_OBJECT_DESCRIPTOR,
                registers = 2,
            ) {
                val value = 0
                val item = 1
                instanceOf(value, item, models.feedItemDescriptor)
                ifEqz(value, Target.Local("none"))
                checkCast(item, models.feedItemDescriptor)
                iget(value, item, models.mediaOrAdField)
                returnObject(value)

                label("none")
                constInt(value, 0)
                returnObject(value)
            }
        }
    }
