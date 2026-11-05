package app.polishapps.patches.yanosik.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.shared.Constants.COMPATIBILITY_YANOSIK
import app.polishapps.patches.shared.Constants.YANOSIK_26_10_0
import app.polishapps.patches.shared.Constants.YANOSIK_26_9_0
import app.polishapps.patches.shared.MethodTarget
import app.polishapps.patches.shared.methodFingerprint
import app.polishapps.patches.shared.replaceBody
import app.polishapps.patches.shared.targetsFor
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS = "Lapp/polishapps/extension/yanosik/YanosikPatch;"

/**
 * Obfuscated names for the premium entitlement flow.
 *
 * - [mapperClass] owns the two RevenueCat entitlement mappers (`b` phone, `c` web).
 * - [premiumClass] implements the active entitlement interface returned by them.
 * - [entitlementStateType] is the enum that provides `ACTIVE`.
 * - [seedConstructor]/[seedStateClass]/[seedStateField] locate the initial (non-premium) state
 *   assigned to the subscription StateFlow in the premium repository constructor.
 * - [premiumStateMethod] is the extension factory that builds the seeded active state.
 * - [proState]/[overlayState] are the immutable state holders for the PRO-only settings.
 */
private data class ProTargets(
    val mapperClass: String,
    val premiumClass: String,
    val entitlementStateType: String,
    val seedConstructor: MethodTarget,
    val seedStateClass: String,
    val seedStateField: String,
    val premiumStateMethod: String,
    val proState: MethodTarget,
    val proStateType: String,
    val proStateDetailsType: String,
    val overlayState: MethodTarget,
    val overlayStateType: String,
    val overlayStateSubscriptionType: String,
    val overlayStateDetailsType: String,
)

private val targetsByVersion = mapOf(
    YANOSIK_26_9_0 to ProTargets(
        mapperClass = "Lr5f;",
        premiumClass = "Lb6f;",
        entitlementStateType = "Lh4f;",
        seedConstructor = MethodTarget(
            "Lr5f;",
            "<init>",
            listOf("L", "Landroid/content/Context;"),
            "V",
        ),
        seedStateClass = "Lwwb;",
        seedStateField = "L",
        premiumStateMethod = "premiumState",
        proState = MethodTarget("Ll9f;", "<init>", listOf("Z", "Z", "L"), "V"),
        proStateType = "Ll9f;",
        proStateDetailsType = "Lh9f;",
        overlayState = MethodTarget("Ltmd;", "<init>", listOf("L", "Z", "Z", "L"), "V"),
        overlayStateType = "Ltmd;",
        overlayStateSubscriptionType = "Limd;",
        overlayStateDetailsType = "Lh9f;",
    ),
    YANOSIK_26_10_0 to ProTargets(
        mapperClass = "Lraf;",
        premiumClass = "Lebf;",
        entitlementStateType = "Lz8f;",
        seedConstructor = MethodTarget(
            "Lraf;",
            "<init>",
            listOf("Landroid/content/Context;", "L", "L", "L"),
            "V",
        ),
        seedStateClass = "Ltll;",
        seedStateField = "A",
        premiumStateMethod = "premiumStateV2610",
        proState = MethodTarget("Lkef;", "<init>", listOf("Z", "Z", "L"), "V"),
        proStateType = "Lkef;",
        proStateDetailsType = "Lgef;",
        overlayState = MethodTarget("Luqd;", "<init>", listOf("L", "Z", "Z", "L"), "V"),
        overlayStateType = "Luqd;",
        overlayStateSubscriptionType = "Lhqd;",
        overlayStateDetailsType = "Lgef;",
    ),
)

private fun premiumBody(targets: ProTargets) = """
    new-instance v0, ${targets.premiumClass}
    sget-object v1, ${targets.entitlementStateType}->ACTIVE:${targets.entitlementStateType}
    new-instance v2, Ljava/util/Date;
    invoke-direct {v2}, Ljava/util/Date;-><init>()V
    const/4 v3, 0x1
    invoke-direct {v0, v1, v2, v3}, ${targets.premiumClass}-><init>(${targets.entitlementStateType}Ljava/util/Date;Z)V
    return-object v0
"""

private fun proStateBody(targets: ProTargets) = """
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p3, p0, ${targets.proStateType}->c:${targets.proStateDetailsType}
    const/4 p1, 0x1
    iput-boolean p1, p0, ${targets.proStateType}->a:Z
    iput-boolean p1, p0, ${targets.proStateType}->b:Z
    iput-boolean p1, p0, ${targets.proStateType}->d:Z
    iput-boolean p1, p0, ${targets.proStateType}->e:Z
    return-void
"""

private fun overlayStateBody(targets: ProTargets) = """
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, ${targets.overlayStateType}->a:${targets.overlayStateSubscriptionType}
    iput-object p4, p0, ${targets.overlayStateType}->d:${targets.overlayStateDetailsType}
    const/4 p2, 0x1
    const/4 p3, 0x1
    iput-boolean p2, p0, ${targets.overlayStateType}->b:Z
    iput-boolean p3, p0, ${targets.overlayStateType}->c:Z
    return-void
"""

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Yanosik PRO",
    description = "Reports an active premium entitlement and unlocks the PRO-only settings " +
        "(view after launch, floating icon).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YANOSIK)

    extendWith("extensions/extension.mpe")

    execute {
        val targets = targetsFor(targetsByVersion)

        // RevenueCat entitlement mappers (phone + web) -> always active premium.
        val premium = premiumBody(targets)
        methodFingerprint(
            targets.mapperClass,
            "b",
            parameters = listOf("L", "Lcom/revenuecat/purchases/EntitlementInfos;"),
            returnType = "L",
        ).method.replaceBody(premium)

        methodFingerprint(
            targets.mapperClass,
            "c",
            parameters = listOf("L", "Lcom/revenuecat/purchases/EntitlementInfos;"),
            returnType = "L",
        ).method.replaceBody(premium)

        // Seed the subscription StateFlow with an active premium entitlement, so isPro is true
        // before (and even without) a RevenueCat round-trip. Mirrors the manual build, which
        // replaced the initial non-premium value in the premium repository constructor.
        val subscriptionConstructor = targets.seedConstructor.fingerprint().method

        val seedIndex = subscriptionConstructor.instructions.toList().indexOfFirst { instruction ->
            instruction.opcode == Opcode.SGET_OBJECT &&
                (instruction as? BuilderInstruction21c)?.reference.let { reference ->
                    reference is FieldReference &&
                        reference.definingClass == targets.seedStateClass &&
                        reference.name == targets.seedStateField
                }
        }
        if (seedIndex < 0) {
            throw PatchException("${targets.seedConstructor.definingClass}<init>: entitlement seed instruction not found")
        }

        subscriptionConstructor.replaceInstruction(
            seedIndex,
            "invoke-static {}, $EXTENSION_CLASS->${targets.premiumStateMethod}()Ljava/lang/Object;",
        )
        subscriptionConstructor.addInstruction(seedIndex + 1, "move-result-object p1")

        // AppPreferenceActivity ProState -> full PRO (view after launch).
        targets.proState.fingerprint().method.replaceBody(proStateBody(targets))

        // OverlaySettingsActivity state -> full PRO (floating icon).
        targets.overlayState.fingerprint().method.replaceBody(overlayStateBody(targets))
    }
}
