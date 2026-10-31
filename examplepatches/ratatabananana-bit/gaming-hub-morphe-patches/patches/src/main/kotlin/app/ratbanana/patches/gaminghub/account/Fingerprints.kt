package app.ratbanana.patches.gaminghub.account

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/** Startup status enum. Its class name is kept, but its constant fields are obfuscated. */
internal const val ONBOARDING_STATUS_CLASS = "Lcom/samsung/android/game/gamehome/app/oobe/Status;"

internal const val START_VIEW_MODEL_CLASS = "Lcom/samsung/android/game/gamehome/app/StartViewModel;"

/**
 * `StartViewModel.getOobeStatus(context: Context, isRetry: Boolean): Status` (suspend)
 *
 * Decides the first screen at startup: the mandatory sign-in screen, the welcome
 * (terms) screen, an error screen, or home. Every path except home needs a
 * Samsung account that a re-signed APK can never see.
 */
internal object GetOnboardingStatusFingerprint : Fingerprint(
    definingClass = START_VIEW_MODEL_CLASS,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;", "Z", "L"),
    filters = listOf(
        string("graduateChild getOobeStatus userStatus == AccountUserStatus.GRADUATE_CHILD_ACCOUNT"),
    ),
)

/**
 * `isPrivacyNoticeRequired(context: Context, settingRepository: SettingRepository): Boolean`
 *
 * True until the user agrees to the privacy notice on the welcome screen. Many local features,
 * such as play time recording and My games, stay off while it is true.
 */
internal object IsPrivacyNoticeRequiredFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "L"),
    filters = listOf(
        string("settingRepository"),
        // agreedPrivacyNoticeVersion > 0
        opcode(Opcode.IF_LEZ),
    ),
)
