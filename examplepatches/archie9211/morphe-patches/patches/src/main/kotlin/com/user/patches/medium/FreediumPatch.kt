package com.user.patches.medium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

val mediumCompatibility = Compatibility(
    name = "Medium",
    packageName = "com.medium.reader",
    targets = listOf(
        AppTarget(version = "4.5.1784910415")
    )
)

val processPostDataFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/medium/android/graphql/FullPostQuery\$Data;", "Z", "Ljava/util/ArrayList;")
)

val donkeyAppFingerprint = Fingerprint(
    definingClass = "Lcom/medium/android/donkey/DonkeyApplication;",
    name = "onCreate",
    returnType = "V"
)

val freediumPatch = bytecodePatch(
    name = "Freedium paywall bypass",
    description = "Opens a webview to Freedium for locked articles.",
    default = true
) {
    compatibleWith(mediumCompatibility)
    val mirrorUrlOption by stringOption(
        key = "freedium_mirror_url",
        title = "Freedium Mirror URL",
        description = "URL of the Freedium mirror to use",
        default = "https://freedium-mirror.cfd/"
    )

    extendWith("extensions/extension.mpe")

    execute {
        donkeyAppFingerprint.method.addInstructions(0, """
            move-object/from16 v0, p0
            invoke-static { v0 }, Lcom/user/patches/medium/ActivityTracker;->register(Landroid/app/Application;)V
        """)

        processPostDataFingerprint.method.addInstructions(0, """
            const-string v0, "$mirrorUrlOption"
            sput-object v0, Lcom/user/patches/medium/FreediumInterceptor;->mirrorUrl:Ljava/lang/String;
            move-object/from16 v0, p1
            invoke-static { v0 }, Lcom/user/patches/medium/FreediumInterceptor;->checkAndRedirect(Ljava/lang/Object;)V
        """)

        val webViewClientFingerprint = Fingerprint(
            name = "onPageFinished",
            returnType = "V",
            parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;")
        )
        webViewClientFingerprint.matchAllOrNull()?.forEach { match ->
            match.method.addInstructions(0, """
                move-object/from16 v0, p1
                move-object/from16 v1, p2
                invoke-static { v0, v1 }, Lcom/user/patches/medium/FreediumInterceptor;->injectCSS(Landroid/webkit/WebView;Ljava/lang/String;)V
            """)
        }
    }
}
