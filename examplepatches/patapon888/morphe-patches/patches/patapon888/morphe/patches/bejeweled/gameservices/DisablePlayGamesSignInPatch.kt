package patapon888.morphe.patches.bejeweled.gameservices

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import patapon888.morphe.patches.bejeweled.BEJEWELED_3

private const val GAME_HELPER = "Lcom/ea/game/bejeweled3/GameHelper;"

private object ActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/ea/game/bejeweled3/Bejeweled3Activity;",
    name = "onCreate",
    filters = listOf(
        methodCall(smali = "Lcom/google/android/gms/games/PlayGamesSdk;->initialize(Landroid/content/Context;)V")
    )
)

private object GameHelperSetupFingerprint : Fingerprint(definingClass = GAME_HELPER, name = "setup")
private object CheckAuthenticationFingerprint : Fingerprint(definingClass = GAME_HELPER, name = "checkAuthentication")
private object BeginSignInFingerprint : Fingerprint(definingClass = GAME_HELPER, name = "beginUserInitiatedSignIn")
private object AssertConfiguredFingerprint : Fingerprint(definingClass = GAME_HELPER, name = "assertConfigured")
private object GetApiClientFingerprint : Fingerprint(definingClass = GAME_HELPER, name = "getApiClient")

/**
 * The Play Games SDK signs in by itself when PlayGamesInitProvider starts it with the app.
 */
private val removePlayGamesInitProviderPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val providers = document.getElementsByTagName("provider")
            (0 until providers.length).map { providers.item(it) as Element }
                .filter { it.getAttribute("android:name") == "com.google.android.gms.games.provider.PlayGamesInitProvider" }
                .forEach { it.parentNode.removeChild(it) }
        }
    }
}

/**
 * GameHelper is never set up, so no sign-in client exists and the player is never signed in.
 * Scores and achievements are only sent when signed in, so they are skipped too.
 * The lifecycle callbacks that insist on a finished setup are allowed through.
 */
@Suppress("unused")
val disablePlayGamesSignInPatch = bytecodePatch(
    name = "Disable Play Games sign-in",
    description = "Stops the game from signing in to Google Play Games and showing its pop-up at launch."
) {
    compatibleWith(BEJEWELED_3)

    dependsOn(removePlayGamesInitProviderPatch)

    execute {
        ActivityOnCreateFingerprint.apply { method.removeInstruction(instructionMatches.first().index) }

        GameHelperSetupFingerprint.method.addInstructions(
            0,
            """
                iput-object p1, p0, $GAME_HELPER->mListener:Lcom/ea/game/bejeweled3/GameHelper${'$'}GameHelperListener;
                return-void
            """.trimIndent()
        )
        AssertConfiguredFingerprint.method.addInstructions(0, "return-void")
        CheckAuthenticationFingerprint.method.addInstructions(0, "return-void")
        BeginSignInFingerprint.method.addInstructions(0, "return-void")
        GetApiClientFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """.trimIndent()
        )
    }
}
