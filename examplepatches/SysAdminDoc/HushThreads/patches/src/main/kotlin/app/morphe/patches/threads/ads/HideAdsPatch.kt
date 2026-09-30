/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0). The feed cache's merge as the place to take ads out
 * is the one zeldrisho/morphe-patches found: https://github.com/zeldrisho/morphe-patches
 */
package app.morphe.patches.threads.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.parameterRegister
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Hide ads"

private const val FEED_ADS = "$EXTENSION_PACKAGE/ads/FeedAds;"

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
 */
@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = PATCH,
    description = "Takes sponsored posts out of your Threads feed before they're shown.",
    default = true,
) {
    category("Ads")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.threads())
    dependsOn(threadsExtensionPatch)

    execute {
        requireStatusMethod("hideAds")
        val merge = FeedPageMergeFingerprint.method

        // The feed item's own getter for its post. It answers null for an item that carries none.
        val itemMedia = merge.implementation!!.instructions.mapNotNull { instruction ->
            if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@mapNotNull null
            instruction.getReference<MethodReference>()
                ?.takeIf { it.returnType == MEDIA && it.parameterTypes.isEmpty() && it.definingClass != MEDIA }
        }.firstOrNull() ?: throw PatchException("$PATCH: the feed merge never asks an item for its post")

        // Media's own ad check: an instance boolean method, no parameters, that asks the injected check.
        val injected = InjectedAdCheckFingerprint.method
        val isAd = mutableClassDefBy(MEDIA).methods.filter { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.implementation?.instructions?.any { instruction ->
                    instruction.getReference<MethodReference>()?.let {
                        it.definingClass == injected.definingClass && it.name == injected.name
                    } == true
                } == true
        }.singleOrPatchException("$PATCH: Media's own boolean method that asks the injected check")

        writeStub(
            FEED_ADS, "itemMedia", 2,
            """
                instance-of v0, p0, ${itemMedia.definingClass}
                if-eqz v0, :none
                check-cast p0, ${itemMedia.definingClass}
                invoke-virtual { p0 }, ${itemMedia.definingClass}->${itemMedia.name}()$MEDIA
                move-result-object v0
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """,
        )
        writeStub(
            FEED_ADS, "isAd", 2,
            """
                check-cast p0, $MEDIA
                invoke-virtual { p0 }, $MEDIA->${isAd.name}()Z
                move-result v0
                return v0
            """,
        )

        // The page, first thing. A resumed merge is called again with no page and reads its own saved
        // copy, which is the one filtered here on the first call.
        val page = merge.parameterRegister(4)
        merge.addInstructions(
            0,
            """
                invoke-static/range { $page .. $page }, $FEED_ADS->filter(Ljava/util/List;)Ljava/util/List;
                move-result-object $page
            """,
        )

        enableStatus("hideAds")
    }
}
