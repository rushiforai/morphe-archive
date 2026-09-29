/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.mirinae.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.extension.ExtensionHook
import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import hoodles.morphe.compatibility.Compat

internal val extensionPatch = sharedExtensionPatch(
    "mirinae",
    ExtensionHook(MainActivityOnCreateFingerprint)
)

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(Compat.MIRINAE)

    dependsOn(extensionPatch)

    execute {
        ShouldInterceptRequestFingerprint.method.addInstructions(0, """
            invoke-static { p2 }, Lhoodles/morphe/extension/mirinae/pro/EnableProPatch;->patchAppJavascript(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
            move-result-object v0
            if-eqz v0, :continue
            return-object v0
            :continue
        """.trimIndent())
    }
}