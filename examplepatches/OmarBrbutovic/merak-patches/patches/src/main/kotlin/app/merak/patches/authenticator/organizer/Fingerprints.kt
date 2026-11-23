package app.merak.patches.authenticator.organizer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.merak.patches.authenticator.shared.MAIN_ACTIVITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val OTP_VIEW = "Lcom/google/android/apps/authenticator2/main/OtpView;"

internal object MainActivityOnBackPressedFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "onBackPressed",
    returnType = "V",
    parameters = listOf(),
)

/**
 * Static initializer of the account list controller ("OtpListFragmentPeer"),
 * used to locate the controller class.
 */
internal object OtpListFragmentPeerFingerprint : Fingerprint(
    name = "<clinit>",
    filters = listOf(
        string("com/google/android/apps/authenticator2/main/OtpListFragmentPeer"),
    ),
)

/**
 * Account list controller update method. Copies the accounts, builds the list of
 * displayed codes, passes it to the adapter, and starts the code refresh timer:
 *
 * ```
 * for (account : accounts) displayed.add(DisplayedOtp.create(account, false));
 * adapter.setItems(displayed);
 * timer = new RefreshTimer(this).start();
 * ```
 */
internal object OtpListUpdateFingerprint : Fingerprint(
    classFingerprint = OtpListFragmentPeerFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(definingClass = "Ljava/util/List;", name = "iterator"),
        // adapter.setItems(displayed)
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("Ljava/util/List;"),
            returnType = "V",
        ),
        // new RefreshTimer(this).start()
        methodCall(returnType = "Landroid/os/CountDownTimer;"),
        fieldAccess(opcode = Opcode.IPUT_OBJECT, type = "Landroid/os/CountDownTimer;"),
    ),
)

/**
 * DisplayedOtp.create(account, hideCode): builds the displayed code model of an account.
 * The first parameter type is the account class, the return type is the displayed code class.
 */
internal object DisplayedOtpCreateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("L", "Z"),
    filters = listOf(
        string("hotp"),
        string("Could not create a TOTP code from local database"),
    ),
)

/** A method of the account class, used to locate the account class. */
internal object AccountMigrationFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    filters = listOf(
        string("Could not parse a migration otp type"),
    ),
)

/** Account display name: `issuer != null ? issuer + ": " + name : name`. */
internal object AccountDisplayNameFingerprint : Fingerprint(
    classFingerprint = AccountMigrationFingerprint,
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string(": "),
    ),
)

/** Account unique key: `secret.replaceAll("\\s+", "").toUpperCase() + "|" + name + "|" + issuer`. */
internal object AccountUniqueKeyFingerprint : Fingerprint(
    classFingerprint = AccountMigrationFingerprint,
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        // The secret field.
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "this", type = "Ljava/lang/String;"),
        string("\\s+", location = MatchAfterImmediately()),
        methodCall(definingClass = "Ljava/lang/String;", name = "replaceAll"),
        string("|"),
    ),
)

/** Binds a displayed code to an account row view. */
internal object OtpRowBindFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Ljava/lang/Object;"),
    filters = listOf(
        checkCast(OTP_VIEW),
        methodCall(definingClass = "Landroid/widget/TextView;", name = "setText"),
        methodCall(definingClass = OTP_VIEW, name = "setOnLongClickListener"),
    ),
)
