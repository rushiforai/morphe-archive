package semicoloncolonel.mobilestream.patches.yttvshell.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import semicoloncolonel.mobilestream.patches.yttvshell.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// YouTube TV (Android TV) 4.01.03, the official app — Skip ads (EXPERIMENTAL).
//
// From its 4.x builds for Android 12 and later, YouTube TV's own app runs on the
// Chromium-based Cobalt, like YouTube for Android TV, and already loads the
// youtube.com/tv/upg web app. So the YT TV+ script injection (ads.js and
// tracking.js) works in the app itself, without a start URL change or a new
// package. Three things differ from YouTube for Android TV 7.32.300:
//
//   - StartupGuardNavigationObserver has no constructor of its own (R8 merged
//     it into its superclass), so the page's WebContents is read from the
//     superclass's WeakReference field (TvScripts.setWebContentsFromObserver).
//   - After the first navigation the observer detaches with destroy(), not
//     observe(null). The destroy() calls are removed so it keeps observing.
//   - The JNI bridge is org.chromium.base.natives.GEN_JNI; TvScripts looks there
//     too.
//
// Not tested on a device: it needs an Android TV on Android 12 or later. The
// 3.83 builds (Android 11, such as the NVIDIA Shield) are classic Cobalt and
// cannot be patched; YT TV+ covers them. Commercials inside a live broadcast
// still play.
// ─────────────────────────────────────────────────────────────────────────────

private const val EXTENSION_CLASS = "Lsemicoloncolonel/mobilestream/extension/yttvshell/TvScripts;"
private val ABIS = listOf("armeabi-v7a", "arm64-v8a", "x86", "x86_64")

// The native libraries are in the bundle's ABI split.
private val requireOfficialNativeLibsPatch = resourcePatch {
    execute {
        val present = ABIS.any { abi ->
            try {
                get("lib/$abi/libchrobalt.so", true).exists()
            } catch (e: Exception) {
                false
            }
        }
        if (!present) {
            throw PatchException(
                "This is not YouTube TV 4.01.03 with its native libraries. Patch the whole 4.01.03 bundle from " +
                    "APKMirror, including its armeabi_v7a split. Version 3.83, which Android 11 devices get, " +
                    "cannot be patched; use YT TV+ there.",
            )
        }
    }
}

@Suppress("unused")
val officialSkipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads YouTube adds to on-demand videos and recordings in the official YouTube TV " +
        "app, along with ad and analytics tracking. Experimental and not yet tested on a device. It needs " +
        "version 4.01.03, for Android TV devices on Android 12 or later. Commercials that are part of a " +
        "live broadcast still play.",
) {
    category("Ads")
    compatibleWith(Constants.OFFICIAL_COMPATIBILITY)

    dependsOn(requireOfficialNativeLibsPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Keep observing after the first navigation: drop the observer's destroy() calls.
        listOf(StartupGuardFinishNavigationFingerprint, StartupGuardRedirectNavigationFingerprint).forEach {
            it.method.apply {
                val indices = instructions.withIndex().filter { (_, instruction) ->
                    instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((instruction as ReferenceInstruction).reference as MethodReference).let { ref ->
                            ref.name == "destroy" && ref.parameterTypes.isEmpty() && ref.returnType == "V"
                        }
                }.map { it.index }
                if (indices.isEmpty()) throw PatchException("destroy() not found in $name")
                indices.reversed().forEach { index -> removeInstruction(index) }
            }
        }

        // Read the page from the observer and inject on every finished navigation.
        StartupGuardFinishNavigationFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS->onObserverNavigation(Ljava/lang/Object;)V",
        )

        // New overrides on the observer: inject as soon as the document element is
        // available, and relay the scripts' title-based log messages.
        val observer = StartupGuardFinishNavigationFingerprint.classDef
        fun addOverride(name: String, parameters: List<String>, body: String) {
            if (observer.methods.any { it.name == name }) throw PatchException("$name is already overridden")
            observer.methods.add(
                ImmutableMethod(
                    observer.type,
                    name,
                    parameters.map { ImmutableMethodParameter(it, null, null) },
                    "V",
                    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(1 + parameters.size),
                ).toMutable().apply { addInstructions(0, body) },
            )
        }
        addOverride(
            "primaryMainDocumentElementAvailable",
            emptyList(),
            """
                invoke-static { p0 }, $EXTENSION_CLASS->onObserverDocument(Ljava/lang/Object;)V
                return-void
            """,
        )
        addOverride(
            "titleWasSet",
            listOf("Ljava/lang/String;"),
            """
                invoke-static { p1 }, $EXTENSION_CLASS->onTitle(Ljava/lang/String;)V
                return-void
            """,
        )
    }
}
