package app.ratbanana.patches.gaminghub.history

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal const val API_SERVICE_CLASS = "Lcom/samsung/android/game/gamehome/network/gamelauncher/service/a;"

private const val MAIN_FRAGMENT_CLASS = "Lcom/samsung/android/game/gamehome/app/main/MainFragment;"

/**
 * `MainToolbar.initProfileMenu(binding, listener)`
 *
 * Wires the signed-in profile button. The signed-out profile button gets no click action.
 */
internal object InitProfileMenuFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/game/gamehome/app/main/toolbar/MainToolbar;",
    returnType = "V",
    parameters = listOf("L", "L"),
    filters = listOf(
        // binding.profileSignInContainer
        fieldAccess(opcode = Opcode.IGET_OBJECT),
        // Kotlin null check of the view binding property.
        string("profileSignInContainer", location = MatchAfterImmediately()),
    ),
)

/**
 * `MainFragment.toolbarListener.onProfileClick()`
 *
 * Opens the gamer profile when signed in, and the Samsung account sign-in prompt otherwise,
 * which can never succeed for a re-signed APK.
 */
internal object ProfileClickFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/game/gamehome/app/main/MainFragment\$f;",
    name = "c",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        // MainFragment.showSignInPrompt(fragment)
        methodCall(
            definingClass = MAIN_FRAGMENT_CLASS,
            returnType = "V",
            parameters = listOf(MAIN_FRAGMENT_CLASS),
        ),
        // ProfileActivity::class.java
        opcode(Opcode.CONST_CLASS),
    ),
)
