package app.pokemongo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val COMPATIBILITY_POKEMON_GO_WEB_SIGN_IN = Compatibility(
    name = "Pokémon GO",
    packageName = "com.nianticlabs.pokemongo",
    targets = listOf(AppTarget(version = "0.433.1"), AppTarget(version = "0.431.0")),
)

// Must match WebSignIn.SCHEME in extensions/extension (reversed OAuth client id).
private const val OAUTH_REDIRECT_SCHEME =
    "com.googleusercontent.apps.848232511240-dmrj3gba506c9svge2p9gq35p1fg654p"

private const val EXTENSION_CLASS = "Lapp/pogo/extension/WebSignIn;"
private const val SIGN_IN_MANAGER_COMPANION =
    "Lcom/nianticlabs/platform/authgooglesignin/SignInManager\$Companion;"
private const val UNITY_ACTIVITY =
    "Lcom/nianticproject/holoholo/libholoholo/unity/UnityMainActivity;"

private const val ACTIVITY = "Landroid/app/Activity;"
private const val GOOGLE_SIGN_IN_CLIENT = "Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;"
private const val KOTLIN_FUNCTION1 = "Lkotlin/jvm/functions/Function1;"

/**
 * Registers the OAuth redirect scheme on UnityMainActivity. The activity is
 * launchMode=singleTask, so the browser's redirect arrives in onNewIntent.
 */
private val pokemonGoWebSignInManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_POKEMON_GO_WEB_SIGN_IN)

    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            var unity: Element? = null
            for (i in 0 until activities.length) {
                val activity = activities.item(i) as? Element ?: continue
                if (activity.getAttribute("android:name").endsWith("UnityMainActivity")) {
                    unity = activity
                    break
                }
            }
            val unityActivity = unity
                ?: error("Web sign-in: UnityMainActivity was not found in AndroidManifest.xml")

            // Idempotent: skip if the scheme is already registered anywhere in the manifest.
            val allData = document.getElementsByTagName("data")
            for (i in 0 until allData.length) {
                val data = allData.item(i) as? Element ?: continue
                if (data.getAttribute("android:scheme") == OAUTH_REDIRECT_SCHEME) {
                    return@use
                }
            }

            val filter = document.createElement("intent-filter")

            val action = document.createElement("action")
            action.setAttribute("android:name", "android.intent.action.VIEW")
            filter.appendChild(action)

            for (name in listOf("android.intent.category.DEFAULT", "android.intent.category.BROWSABLE")) {
                val category = document.createElement("category")
                category.setAttribute("android:name", name)
                filter.appendChild(category)
            }

            val data = document.createElement("data")
            data.setAttribute("android:scheme", OAUTH_REDIRECT_SCHEME)
            filter.appendChild(data)

            unityActivity.appendChild(filter)
        }
    }
}

/**
 * Google sign-in for re-signed Pokémon GO builds.
 *
 * Play Services only issues tokens to the genuine, Niantic-signed app. This patch routes the
 * game's own sign-in calls (SignInManager.signIn / silentSignIn / signOut) to a browser-based
 * OAuth + PKCE flow implemented in the extension, and returns a SignInResponse in the format
 * the game already expects.
 */
@Suppress("unused")
val pokemonGoWebSignIn = bytecodePatch(
    name = "Google web sign-in",
    description = "Replaces Google Play Services sign-in with a browser-based Google login " +
        "so Google accounts work in re-signed builds. Pokémon GO 0.433.1 / 0.431.0.",
) {
    compatibleWith(COMPATIBILITY_POKEMON_GO_WEB_SIGN_IN)
    dependsOn(pokemonGoWebSignInManifestPatch)
    extendWith("extensions/extension.mpe")

    execute {
        fun findMethod(classType: String, name: String, vararg parameters: String) =
            (mutableClassDefByOrNull(classType)
                ?: error("Web sign-in: class $classType was not found in this APK"))
                .methods.singleOrNull { method ->
                    method.name == name &&
                        method.parameterTypes.map { it.toString() } == parameters.toList()
                }
                ?: error("Web sign-in: $classType->$name(${parameters.joinToString("")}) not found uniquely")

        // Game asks to sign in: run the browser flow instead of Play Services, then return.
        findMethod(
            SIGN_IN_MANAGER_COMPANION, "signIn",
            ACTIVITY, GOOGLE_SIGN_IN_CLIENT, KOTLIN_FUNCTION1,
        ).addInstructions(
            0,
            """
                invoke-static/range {p1 .. p3}, $EXTENSION_CLASS->signIn(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;)V
                return-void
            """,
        )

        // Silent sign-in: refresh-token based, or "sign in required".
        findMethod(
            SIGN_IN_MANAGER_COMPANION, "silentSignIn",
            ACTIVITY, GOOGLE_SIGN_IN_CLIENT, KOTLIN_FUNCTION1,
        ).addInstructions(
            0,
            """
                invoke-static/range {p1 .. p3}, $EXTENSION_CLASS->silentSignIn(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;)V
                return-void
            """,
        )

        // Sign out: also forget our stored refresh token, then let the original run.
        findMethod(
            SIGN_IN_MANAGER_COMPANION, "signOut",
            ACTIVITY, GOOGLE_SIGN_IN_CLIENT,
        ).addInstructions(
            0,
            """
                invoke-static/range {p1 .. p2}, $EXTENSION_CLASS->signOut(Landroid/app/Activity;Ljava/lang/Object;)V
            """,
        )

        // Browser redirect (singleTask activity => onNewIntent).
        findMethod(UNITY_ACTIVITY, "onNewIntent", "Landroid/content/Intent;").addInstructions(
            0,
            """
                invoke-static/range {p1 .. p1}, $EXTENSION_CLASS->onNewIntent(Landroid/content/Intent;)V
            """,
        )
    }
}
