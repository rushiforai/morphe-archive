/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0). The feed cache's merge as the place to take ads out
 * is the one zeldrisho/morphe-patches found: https://github.com/zeldrisho/morphe-patches
 */
package app.morphe.patches.threads.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Hide ads"


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
    dependsOn(feedPageFilterPatch)
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

        enableStatus("hideAds")
    }
}
