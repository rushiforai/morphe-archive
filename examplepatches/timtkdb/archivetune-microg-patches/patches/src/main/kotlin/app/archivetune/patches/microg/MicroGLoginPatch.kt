package app.archivetune.patches.microg

import app.archivetune.patches.shared.Constants.COMPATIBILITY_ARCHIVETUNE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.registersUsed

private const val EXTENSION_CLASS = "Lapp/archivetune/microg/extension/MicroGAuth;"
private const val LOGIN_ACTIVITY = "app.archivetune.microg.extension.MicroGLoginActivity"

/** Same vendor prefix microG-RE reads its spoofing metadata under (see PackageSpoofUtils.kt). */
private const val GMS_VENDOR_GROUP_ID = "app.revanced"
private const val SPOOFED_PACKAGE_NAME = "com.google.android.apps.youtube.music"

/** SHA-1 of YouTube Music's signing certificate. Same value Morphe's own YT Music patch uses. */
private const val SPOOFED_PACKAGE_SIGNATURE = "afb0fed5eeaebdd86f56a97742f4b6b33ef59875"

private val MICROG_PACKAGES = listOf("app.revanced.android.gms", "app.morphe.android.gms")

/**
 * Replaces the invoke at [matchIndex] of [fingerprint] with a static call to the extension that takes
 * the same registers in the same order (receiver first) and returns void, so nothing after it changes.
 *
 * Registers come from [registersUsed], which handles both `invoke { .. }` and `invoke/range`. The
 * non-range replacement can only address v0..v15, so anything else fails loudly instead of producing
 * broken bytecode.
 */
private fun redirectInvokeToExtension(
    fingerprint: Fingerprint,
    matchIndex: Int,
    expectedRegisters: Int,
    extensionSignature: String,
) {
    val match = fingerprint.instructionMatches[matchIndex]
    val registers = match.instruction.registersUsed
    if (registers.size != expectedRegisters || registers.any { it > 15 }) {
        throw PatchException(
            "Unexpected registers $registers for call at index ${match.index}; " +
                "the app was probably compiled differently. Fingerprint needs updating.",
        )
    }
    fingerprint.method.replaceInstruction(
        match.index,
        "invoke-static { ${registers.joinToString { "v$it" }} }, $EXTENSION_CLASS->$extensionSignature",
    )
}

@Suppress("unused")
val microGLoginPatch = patch(
    name = "Sign in with microG",
    description = "Sign in with an account from microG (GmsCore) instead of typing a Google password. " +
        "microG signs the login page in as the chosen account, then ArchiveTune's normal login flow " +
        "runs, including YouTube Music's own main/brand account switcher.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ARCHIVETUNE)
    extendWith("extensions/extension.mpe")

    execute {
        // 1. Manifest: make microG present this app to Google as YouTube Music,
        //    let the app see microG, and declare the account picker activity.
        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.elements("application").first()

            application.appendChild("meta-data") {
                setAttribute("android:name", "$GMS_VENDOR_GROUP_ID.android.gms.SPOOFED_PACKAGE_NAME")
                setAttribute("android:value", SPOOFED_PACKAGE_NAME)
            }
            application.appendChild("meta-data") {
                setAttribute("android:name", "$GMS_VENDOR_GROUP_ID.android.gms.SPOOFED_PACKAGE_SIGNATURE")
                setAttribute("android:value", SPOOFED_PACKAGE_SIGNATURE)
            }
            application.appendChild("activity") {
                setAttribute("android:name", LOGIN_ACTIVITY)
                setAttribute("android:exported", "false")
                setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            }

            val queries = manifest.elements("queries").firstOrNull() ?: manifest.root.appendChild("queries")
            MICROG_PACKAGES.forEach { pkg ->
                queries.appendChild("package") { setAttribute("android:name", pkg) }
            }
        }

        // 2. Login screen: instead of loading the Google sign-in page into the WebView, hand the WebView
        //    to the extension. It shows microG's account picker, asks microG for a "weblogin:" sign-in URL
        //    for that account and loads it in the WebView. The WebView ends up signed in as that account on
        //    music.youtube.com with real cookies, and ArchiveTune's own cookie capture and completeLogin()
        //    run unchanged. Falls back to the original Google page if microG is missing or refuses.
        //
        //    webView.loadUrl(url)  ->  MicroGAuth.loadLogin(webView, url)
        redirectInvokeToExtension(
            LoginWebViewLoadUrlFingerprint,
            matchIndex = 1,
            expectedRegisters = 2,
            extensionSignature = "loadLogin(Landroid/webkit/WebView;Ljava/lang/String;)V",
        )
    }
}
