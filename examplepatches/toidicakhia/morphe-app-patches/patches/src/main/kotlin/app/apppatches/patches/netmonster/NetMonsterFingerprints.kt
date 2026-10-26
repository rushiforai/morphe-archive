package app.apppatches.patches.netmonster

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * SubscriptionRepository flow collector (lwtw in 4.0.5) that maps
 * List<AdaptyProfile.Subscription> to the isPremium StateFlow.
 *
 * The class name is obfuscated and changes between builds, so match it by
 * structure: a FlowCollector whose emit() checks Adapty subscriptions.
 */
val SubscriptionActiveFlowFingerprint = Fingerprint(
    name = "emit",
    parameters = listOf("Ljava/lang/Object;", "Lealvjh;"),
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, classDef ->
        "Lovudgvbxy;" in classDef.interfaces &&
            classDef.fields.any { it.type == "Lrugdkng;" } &&
            method.implementation?.instructions?.any { instruction ->
                instruction is ReferenceInstruction &&
                    (instruction.reference as? MethodReference)?.let { reference ->
                        reference.definingClass == "Lcom/adapty/models/AdaptyProfile\$Subscription;" &&
                            (reference.name == "isActive" || reference.name == "isInGracePeriod")
                    } == true
            } == true
    }
)

/**
 * More screen subscription section, which shows the purchase button when the
 * subscription expiration is null and "Active till ..." otherwise.
 */
val SubscriptionExpiryDisplayFingerprint = Fingerprint(
    definingClass = "Lkbuo;",
    name = "fohefrngo",
    parameters = listOf(
        "Ljava/time/OffsetDateTime;",
        "Lyiaz;",
        "Lpfca;",
        "Lbuoorn;",
        "I"
    ),
    returnType = "V"
)

/**
 * NetMonster's Application class. PairIP's Application extends it, so onCreate
 * still runs after the license check wrapper has been installed.
 */
val NetMonsterAppOnCreateFingerprint = Fingerprint(
    definingClass = "Lcz/mroczis/kotlin/App;",
    name = "onCreate",
    returnType = "V"
)

/**
 * PairIP license check invoked from the generated Application and its content
 * provider. A repacked APK is no longer recognized as a Play installation, so
 * the check is disabled to avoid the paywall/exit path.
 */
val PairIpLicenseCheckFingerprint = Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)
