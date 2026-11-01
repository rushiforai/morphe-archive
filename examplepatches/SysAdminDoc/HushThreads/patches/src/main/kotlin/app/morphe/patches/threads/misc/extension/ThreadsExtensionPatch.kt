/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.patches.threads.misc.extension

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patches.shared.misc.extension.EXTENSION_CLASS_DESCRIPTOR
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.AccessFlags

/** The application class the manifest names. A manifest name is never obfuscated. */
internal const val THREADS_APPLICATION = "Lcom/instagram/barcelona/app/BarcelonaAppShell;"

internal const val NATIVE_LIBRARIES = "$EXTENSION_PACKAGE/misc/NativeLibraries;"
internal const val SO_LOADER_FLAGS = "$NATIVE_LIBRARIES->soLoaderFlags(Landroid/content/Context;I)I"

/** SoLoader's init, whose fourth parameter holds the flags every caller passes. */
internal object SoLoaderInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "L", "L", "I"),
    filters = listOf(string("SoLoader already initialized"), string("Initializing SoLoader: ")),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

/**
 * Merges the shared and Threads extensions, hands them the application context and keeps the
 * merged app's native libraries loadable.
 *
 * <p>The context goes in at the start of the application's `onCreate()`, in whichever class of
 * its hierarchy declares one: every process Threads starts builds this application, and the
 * settings, the pause switch and safe mode all read preferences through that context before any
 * hook asks for a switch.
 *
 * <p>SoLoader's flags go through [SO_LOADER_FLAGS] at the start of its init, in every process that
 * starts it. The ARMv7 and x86 bundles whose base manifest asks for extracted libraries merge into
 * an APK with compressed libraries, before any patch runs, and those variants crash on launch while
 * SoLoader still tries to read them straight out of the APK.
 */
val threadsExtensionPatch = bytecodePatch {
    dependsOn(sharedExtensionPatch(extensionName = "threads", isYouTubeOrYouTubeMusic = false))

    execute {
        // The chain starts at the application class itself and stops at the first framework class
        // the APK does not carry.
        val declaring = superclassChain(THREADS_APPLICATION)
            .mapNotNull { type -> mutableClassDefByOrNull(type) }
            .firstNotNullOfOrNull { classDef ->
                classDef.methods.singleOrNull { method ->
                    method.name == "onCreate" && method.parameterTypes.isEmpty() &&
                        method.returnType == "V" && method.implementation != null
                }
            } ?: throw PatchException(
                "Neither $THREADS_APPLICATION nor a superclass in the APK declares onCreate()",
            )

        declaring.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS_DESCRIPTOR->setContext(Landroid/content/Context;)V",
        )

        // Every patch depends on this one, so a miss on a future build costs the affected variants
        // their launch rather than every variant its patches. The fixture test catches it at a retarget.
        val soLoaderInit = SoLoaderInitFingerprint.methodOrNull
        if (soLoaderInit == null) {
            patchLog.warning("SoLoader's init was not found, so a merged build with compressed libraries won't start")
        } else {
            soLoaderInit.requireLocals("Keep native libraries loadable", 2)
            soLoaderInit.addInstructions(
                0,
                """
                    move-object/from16 v0, p0
                    move/from16 v1, p3
                    invoke-static { v0, v1 }, $SO_LOADER_FLAGS
                    move-result v1
                    move/from16 p3, v1
                """,
            )
        }
    }
}
