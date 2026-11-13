@file:Suppress("unused")
package app.bugsmith.patches.pingo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

/**
 * Pingo's Google login is the only auth method and it goes through
 * com.reactnativegooglesignin.RNGoogleSigninModule -> GMS GoogleSignIn.getClient().getSignInIntent().
 * The GMS SDK authenticates the calling app by package name + signing-cert SHA-1 against the
 * registered Android OAuth client, so a re-signed (patched) APK always fails with
 * DEVELOPER_ERROR (status 10). This patch set replaces that flow with a browser OAuth 2.0
 * authorization-code flow (PKCE) against the app's own installed-app OAuth client in the same
 * GCP project (pico-ai-442722):
 *
 *   client id   456815495379-cbq2qaaqpjcam1o0v5p1b8jqfu4q2jhg.apps.googleusercontent.com
 *               (the iOS client; its reverse scheme is published in assets/app.config)
 *   redirect    com.googleusercontent.apps.456815495379-cbq2qaaqpjcam1o0v5p1b8jqfu4q2jhg:/oauth2redirect
 *   token       id_token for a client of the same Firebase project, so
 *               GoogleAuthProvider.credential(idToken) -> signInWithCredential keeps working.
 *
 * Verified against Google's endpoints: the custom-scheme redirect_uri + PKCE authorize request
 * is accepted for that client, and the token exchange works with PKCE and no client secret.
 * The same technique is described in ../analysis 06-signature-login-and-detection.md (§1-2).
 */
object PingoLoginEdits {
    /** Extension artifact built by the `extensions:extension` subproject and merged at patch time. */
    const val EXTENSION = "extensions/extension.mpe"

    const val REDIRECT_ACTIVITY = "app.bugsmith.extension.pingo.login.LoginRedirectActivity"

    const val REDIRECT_SCHEME = "com.googleusercontent.apps.456815495379-cbq2qaaqpjcam1o0v5p1b8jqfu4q2jhg"
}

// --- RNGoogleSigninModule method fingerprints (classes4.dex) ---

object SignInFingerprint : Fingerprint(
    definingClass = "Lcom/reactnativegooglesignin/RNGoogleSigninModule;",
    name = "signIn",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Lcom/facebook/react/bridge/ReadableMap;", "Lcom/facebook/react/bridge/Promise;")
)

object SignInSilentlyFingerprint : Fingerprint(
    definingClass = "Lcom/reactnativegooglesignin/RNGoogleSigninModule;",
    name = "signInSilently",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Lcom/facebook/react/bridge/Promise;")
)

object HasPreviousSignInFingerprint : Fingerprint(
    definingClass = "Lcom/reactnativegooglesignin/RNGoogleSigninModule;",
    name = "hasPreviousSignIn",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf()
)

object GetCurrentUserFingerprint : Fingerprint(
    definingClass = "Lcom/reactnativegooglesignin/RNGoogleSigninModule;",
    name = "getCurrentUser",
    returnType = "Lcom/facebook/react/bridge/WritableMap;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf()
)

object SignOutFingerprint : Fingerprint(
    definingClass = "Lcom/reactnativegooglesignin/RNGoogleSigninModule;",
    name = "signOut",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Lcom/facebook/react/bridge/Promise;")
)

/** Registers the OAuth redirect activity + custom-scheme intent filter in AndroidManifest.xml. */
val pingoLoginManifestPatch = resourcePatch(
    name = "Pingo Google login (manifest)",
    description = "Registers the OAuth redirect activity and its com.googleusercontent.apps intent filter so the browser-based Google login can receive the authorization code.",
    default = false
) {
    compatibleWith(
        Compatibility(
            packageName = "com.picoai.languageapp.android",
            name = "Pingo",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFFFFFF,
            targets = listOf(AppTarget(version = "5.4.8"))
        )
    )
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val activities = application.getElementsByTagName("activity")
            val alreadyRegistered = (0 until activities.length).any {
                (activities.item(it) as Element).getAttribute("android:name") == PingoLoginEdits.REDIRECT_ACTIVITY
            }
            if (!alreadyRegistered) {
                val activity = document.createElement("activity").apply {
                    setAttribute("android:name", PingoLoginEdits.REDIRECT_ACTIVITY)
                    setAttribute("android:exported", "true")
                    setAttribute("android:excludeFromRecents", "true")
                    setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
                }
                activity.appendChild(document.createElement("intent-filter").apply {
                    appendChild(document.createElement("action").apply {
                        setAttribute("android:name", "android.intent.action.VIEW")
                    })
                    appendChild(document.createElement("category").apply {
                        setAttribute("android:name", "android.intent.category.DEFAULT")
                    })
                    appendChild(document.createElement("category").apply {
                        setAttribute("android:name", "android.intent.category.BROWSABLE")
                    })
                    appendChild(document.createElement("data").apply {
                        setAttribute("android:scheme", PingoLoginEdits.REDIRECT_SCHEME)
                    })
                })
                application.appendChild(activity)
            }
        }
    }
}

/**
 * Redirects RNGoogleSigninModule's GMS-backed methods to the LoginFlow helper class
 * (shipped in EXTENSION). Each patched method returns immediately after handing off,
 * mirroring how the stock flow resolves the same RN promises with Utils.getUserProperties.
 */
val pingoGoogleLoginPatch = bytecodePatch(
    name = "Pingo Google login",
    description = "Replaces the signature-bound GMS Google Sign-In with a browser OAuth code flow (PKCE) against the app's own installed-app OAuth client so Google login works on a re-signed build.",
    default = false
) {
    compatibleWith(
        Compatibility(
            packageName = "com.picoai.languageapp.android",
            name = "Pingo",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFFFFFF,
            targets = listOf(AppTarget(version = "5.4.8"))
        )
    )
    dependsOn(pingoLoginManifestPatch)
    extendWith(PingoLoginEdits.EXTENSION)

    execute {
        // signIn(ReadableMap, Promise) -> LoginFlow.signIn(module, promise)
        SignInFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0, p2}, Lapp/bugsmith/extension/pingo/login/LoginFlow;->signIn(Ljava/lang/Object;Ljava/lang/Object;)V
                return-void
            """
        )

        // signInSilently(Promise) -> LoginFlow.signInSilently(module, promise)
        SignInSilentlyFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0, p1}, Lapp/bugsmith/extension/pingo/login/LoginFlow;->signInSilently(Ljava/lang/Object;Ljava/lang/Object;)V
                return-void
            """
        )

        // hasPreviousSignIn() -> LoginFlow.hasPreviousSignIn(module)
        HasPreviousSignInFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, Lapp/bugsmith/extension/pingo/login/LoginFlow;->hasPreviousSignIn(Ljava/lang/Object;)Z
                move-result v0
                return v0
            """
        )

        // getCurrentUser() -> LoginFlow.getCurrentUser(module)
        GetCurrentUserFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, Lapp/bugsmith/extension/pingo/login/LoginFlow;->getCurrentUser(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lcom/facebook/react/bridge/WritableMap;
                return-object v0
            """
        )

        // signOut(Promise) -> LoginFlow.signOut(module, promise)
        SignOutFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0, p1}, Lapp/bugsmith/extension/pingo/login/LoginFlow;->signOut(Ljava/lang/Object;Ljava/lang/Object;)V
                return-void
            """
        )
    }
}
