package semicoloncolonel.mobilestream.patches.nytimes.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import semicoloncolonel.mobilestream.patches.nytimes.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Library pass reminder (OPT-IN, default OFF). NYT 12.1.0.
//
// A patron reads the NYT through a library pass that attaches to their NYT
// account and lasts a set time (72 hours for the California program). It must
// be re-redeemed at the library's EZproxy link. This shows a dialog whose
// button opens the patron's saved redeem link in a browser, so they re-run the
// proper redeem flow in one tap. It never submits or stores a code, and it does
// nothing when the link option is blank. It does not change the paywall.
//
// Primary trigger (status-based): NYT's user-state holder (subauth.core.nytuser)
// exposes the account's SubscriptionLevel. The patch records it from that
// getter, and on each foreground (BaseAppCompatActivity.onStart) the extension
// prompts only when the level is REGISTERED — signed in, with no active
// subscription or entitlement (the pass has lapsed). ANONYMOUS (not signed in)
// and every subscribed level stay silent. This reads the app's real entitlement
// state, so it assumes nothing about how long a library's pass lasts.
//
// Fallback trigger (gateway): the patch also hooks GatewayFragmentCard, the
// paywall/meter card, as a backstop (the app's own "no active entitlement"
// verdict). It is optional — if that class is ever absent or renamed (NYT also
// has a Compose paywall path), the patch still applies on the status trigger.
// ─────────────────────────────────────────────────────────────────────────────

private const val REMINDER =
    "Lsemicoloncolonel/mobilestream/extension/nytimes/misc/LibraryPassReminder;"

private const val SUBSCRIPTION_LEVEL =
    "Lcom/nytimes/android/subauth/core/api/client/SubscriptionLevel;"

// A sample link, offered in the option's list. The default is blank, so no
// particular library is baked into the build.
private const val SAMPLE_URL = "https://pacl.idm.oclc.org/login/NYT"

// The extension getter the patch rewrites with the chosen URL.
internal object RenewUrlFingerprint : Fingerprint(
    definingClass = REMINDER,
    name = "renewUrl",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
)

// The app's base activity. onStart runs whenever an activity comes to the
// foreground; the extension gates the prompt by the recorded SubscriptionLevel.
internal object BaseActivityOnStartFingerprint : Fingerprint(
    definingClass = "Lcom/nytimes/android/BaseAppCompatActivity;",
    name = "onStart",
    parameters = listOf(),
    returnType = "V",
)

// NYT's user-state getter that returns the account's SubscriptionLevel. The
// class and method are R8-renamed, so match by package, no params, and the
// (un-obfuscated) SubscriptionLevel return type.
internal object SubscriptionLevelGetterFingerprint : Fingerprint(
    parameters = listOf(),
    returnType = SUBSCRIPTION_LEVEL,
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/nytimes/android/subauth/core/nytuser/") &&
            method.implementation != null
    },
)

// Fallback: the gateway card fragment. onActivityCreated runs when the paywall /
// meter / regiwall is shown.
internal object GatewayFragmentCardOnActivityCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/nytimes/android/gateway/GatewayFragmentCard;",
    name = "onActivityCreated",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

@Suppress("unused")
val libraryPassReminderPatch = bytecodePatch(
    name = "Library pass reminder",
    description = "Experimental. When you are signed in but your access has lapsed, shows a dialog whose button " +
        "opens your library's redeem link so you can renew your pass. Set the link in the Library auth URL option. " +
        "It does not change the paywall.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    val libraryUrl by stringOption(
        key = "libraryUrl",
        default = "",
        values = mapOf(
            "Off (blank)" to "",
            "Palo Alto example" to SAMPLE_URL,
        ),
        title = "Library auth URL",
        description = "Your library's NYT redeem link, opened when you tap Renew. Blank by default, which " +
            "keeps the reminder off; type your library's link to turn it on. The Palo Alto City Library link is " +
            "offered as an example of the format.",
        required = false,
    )

    execute {
        val url = libraryUrl.orEmpty().trim()
        if (url.contains('"') || url.contains('\\') || url.contains('\n')) {
            throw PatchException("Library auth URL cannot contain quotes, backslashes, or line breaks")
        }
        if (url.isNotEmpty() && !url.startsWith("https://") && !url.startsWith("http://")) {
            throw PatchException("Library auth URL must start with https:// or http://")
        }

        // Tell the extension the configured URL. Required: this is the option
        // plumbing, so a miss means the extension is not merged.
        RenewUrlFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "$url"
                return-object v0
            """,
        )

        // Record the account's SubscriptionLevel wherever NYT's getter returns
        // it, so the foreground check can read it. Best effort: if the getter
        // is not found the status trigger simply stays idle and the gateway
        // fallback still works.
        SubscriptionLevelGetterFingerprint.methodOrNull?.apply {
            val instructions = implementation!!.instructions.toList()
            instructions.indices.reversed()
                .filter { instructions[it].opcode == Opcode.RETURN_OBJECT }
                .forEach { index ->
                    val register = (instructions[index] as OneRegisterInstruction).registerA
                    addInstruction(
                        index,
                        "invoke-static { v$register }, $REMINDER->recordLevel(Ljava/lang/Object;)V",
                    )
                }
        }

        // Status trigger: check on every foreground. p0 is the activity.
        val onStart = BaseActivityOnStartFingerprint.methodOrNull?.apply {
            addInstruction(
                0,
                "invoke-static { p0 }, $REMINDER->maybeRemind(Landroid/app/Activity;)V",
            )
        }

        // Fallback trigger: the gateway card. Optional — kept as a backstop.
        // onActivityCreated uses high registers, so pass p0 with an /range call.
        val gateway = GatewayFragmentCardOnActivityCreatedFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                "invoke-static/range { p0 .. p0 }, $REMINDER->onGatewayShown(Ljava/lang/Object;)V",
            )
        }

        if (onStart == null && gateway == null) {
            throw PatchException("No trigger found: neither BaseAppCompatActivity.onStart nor GatewayFragmentCard")
        }
    }
}
