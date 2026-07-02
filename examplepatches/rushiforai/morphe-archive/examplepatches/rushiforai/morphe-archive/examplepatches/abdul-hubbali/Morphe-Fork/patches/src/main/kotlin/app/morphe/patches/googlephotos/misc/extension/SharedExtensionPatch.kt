/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/patches/src/main/kotlin/app/revanced/patches/googlephotos/misc/extension/ExtensionPatch.kt
 */

package app.morphe.patches.googlephotos.misc.extension

import app.morphe.patches.googlephotos.misc.gms.HomeActivityOnCreateFingerprint
import app.morphe.patches.shared.misc.extension.ExtensionHook
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private class HomeActivityInitHook : ExtensionHook(
    fingerprint = HomeActivityOnCreateFingerprint,
    insertIndexResolver = { method: Method ->
        val getApplicationContextIndex = method.indexOfFirstInstructionOrThrow {
            getReference<MethodReference>()?.name == "getApplicationContext"
        }

        // Below the move-result-object instruction.
        getApplicationContextIndex + 2
    },
    contextRegisterResolver = { method: Method ->
        val getApplicationContextIndex = method.indexOfFirstInstructionOrThrow {
            getReference<MethodReference>()?.name == "getApplicationContext"
        }

        val moveResultInstruction =
            method.implementation!!.instructions.elementAt(getApplicationContextIndex + 1) as OneRegisterInstruction

        "v${moveResultInstruction.registerA}"
    },
)

internal val homeActivityInitHook: ExtensionHook = HomeActivityInitHook()

val sharedExtensionPatch = sharedExtensionPatch(
    isYouTubeOrYouTubeMusic = true,
    homeActivityInitHook,
)

