package app.spotify.capture.patches.spotify

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.spotify.capture.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private val allowAudioPlaybackCaptureResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val application =
                doc.getElementsByTagName("application").item(0) as? Element
                    ?: throw PatchException("AndroidManifest.xml has no <application> element")
            application.setAttribute("android:allowAudioPlaybackCapture", "true")
        }
    }
}

@Suppress("unused")
val allowInternalAudioCapturePatch = bytecodePatch(
    name = "Allow internal audio capture (RootlessJamesDSP)",
    description = "Sets allowAudioPlaybackCapture and ALLOW_CAPTURE_BY_ALL so RootlessJamesDSP can capture Spotify playback. " +
        "Does not unlock Premium or remove ads. See https://github.com/timschneeb/RootlessJamesDSP#spotify-support-patch",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)
    dependsOn(allowAudioPlaybackCaptureResourcePatch)

    execute {
        var editedSites = 0
        var alreadyAllowAllSites = 0
        var unresolvedSites = 0
        var methodsWithCaptureCall = 0

        classDefForEach { classDef ->
            if (classDef.type.startsWith("Landroid/") || classDef.type.startsWith("Lcom/android/")) {
                return@classDefForEach
            }
            val mutableClass = mutableClassDefByOrNull(classDef.type) ?: return@classDefForEach

            for (method in mutableClass.methods) {
                if (!method.definingClass.startsWith("Lcom/spotify/")) {
                    continue
                }
                if (!method.callsSetAllowedCapturePolicy()) continue
                methodsWithCaptureCall++
                patchAllowedCapturePolicyCalls(method).also { result ->
                    editedSites += result.edited
                    alreadyAllowAllSites += result.alreadyAllowAll
                    unresolvedSites += result.unresolved
                }
            }
        }

        if (methodsWithCaptureCall == 0) {
            throw PatchException(
                "No com.spotify.* methods call setAllowedCapturePolicy. " +
                    "This Spotify build may use AAudio-only playback; capture patches cannot help.",
            )
        }
        if (unresolvedSites > 0) {
            throw PatchException(
                "Found setAllowedCapturePolicy in Spotify but could not rewrite the policy constant " +
                    "($unresolvedSites call site(s)). Fingerprint refresh needed (jadx + smali).",
            )
        }
        if (editedSites == 0 && alreadyAllowAllSites == 0) {
            throw PatchException(
                "No setAllowedCapturePolicy call sites were processed in com.spotify.* bytecode.",
            )
        }
    }
}

private fun com.android.tools.smali.dexlib2.iface.Method.callsSetAllowedCapturePolicy(): Boolean {
    val impl = implementation ?: return false
    return impl.instructions.any { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.name == "setAllowedCapturePolicy"
    }
}
