package app.twrailway.patches.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Lets the patches that change libapp.so be adjusted in the patch settings: when a setting differs
 * from the patched libapp.so, the app loads a copy of libapp.so with that setting instead,
 * see `LibappCopy` in the extension.
 */
internal val libappCopyPatch = bytecodePatch {
    dependsOn(patchSettingsPatch)

    execute {
        FlutterLoaderEnsureInitializationCompleteFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p2 }, $EXTENSION_PACKAGE/LibappCopy;->flutterShellArgs(Landroid/content/Context;[Ljava/lang/String;)[Ljava/lang/String;
                move-result-object p2
            """,
        )
    }
}
