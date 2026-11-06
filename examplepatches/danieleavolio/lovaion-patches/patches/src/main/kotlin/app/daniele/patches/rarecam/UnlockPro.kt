package app.daniele.patches.rarecam

import app.daniele.patches.shared.Constants.COMPATIBILITY_RARE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * The app's purchase manager (`Ld8/d`): a holder of `MutableStateFlow<Boolean>`
 * that the whole UI reads as "Rarecam Pro is active".
 *
 * Rare sells one entitlement through RevenueCat and keeps no premium flag of its
 * own. The camera options read the flow directly (`getValue()`), the look picker
 * asks `e(String)` whether a look is Pro-only, and the settings screen collects
 * the same flow to show the "Rarecam Pro Active" row.
 */
private const val PURCHASE_MANAGER = "Ld8/d;"

/** The `MutableStateFlow<Boolean>` field that carries the entitlement. */
private const val PRO_FLOW_FIELD = "a"

/** The `MutableStateFlow` implementation, which all the `getValue()` calls go to. */
private const val STATE_FLOW = "Lj0/z1;"

/** The base class that owns `setValue(Object)`. */
private const val MUTABLE_STATE_FLOW = "Lj0/m3;"

/**
 * `checkLicense(Context)` in `com.pairip.licensecheck.LicenseClient`.
 *
 * `com.pairip.application.Application.attachBaseContext` calls this entry point,
 * and a build signed with a key other than the Play one fails the installer check
 * it performs, which makes the app refuse to start. The APK ships no
 * `libpairipcore` VM (the check is the Java one only), so replacing the body with
 * a single `return-void` removes the enforcement while leaving the billing code
 * untouched.
 */
private object LicenseCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf(
        "Cannot check license with null context.",
        "Skipping license check in isolated process.",
    ),
)

/**
 * The purchase manager class initializer, which seeds the Pro flow with `false`
 * before RevenueCat has answered anything.
 *
 * The field is a plain static on an obfuscated class with no string of its own,
 * so the class is matched by name and the instruction checks reject anything that
 * is not the expected `sput-object <flow> ProFlow` sequence.
 */
private object ProFlagInitializerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = emptyList(),
    custom = { _, classDef -> classDef.type == PURCHASE_MANAGER },
)

/**
 * `g(CustomerInfo)` in the purchase manager: the only place the entitlement is
 * evaluated.
 *
 * RevenueCat reports the customer through three callbacks (purchase, restore and
 * the updated-customer-info listener), and all of them forward to this method,
 * which looks up the `rarecam_pro` entitlement, reads `isActive()` and publishes
 * the resulting boolean into the flow. Forcing the published value keeps the app
 * unlocked whatever Play or RevenueCat answer, including offline.
 */
private object EntitlementUpdateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"),
    strings = listOf("rarecam_pro"),
    custom = { _, classDef -> classDef.type == PURCHASE_MANAGER },
)

@Suppress("unused")
val pairIpBypassPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Disables the PairIP license check so a re-signed build of Rare " +
        "starts instead of being refused. Required by every other patch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RARE)

    execute {
        LicenseCheckFingerprint.method.addInstructions(0, "return-void")
    }
}

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Rarecam Pro",
    description = "Forces the Rarecam Pro entitlement to always resolve as active, " +
        "unlocking the Pro looks, the custom 3D LUT import, the S-Log3 and 16-bit TIFF " +
        "export, unlimited Mist, Bayer RAW (DNG) saving and multi-frame RAW Stack " +
        "capture, with or without a Play purchase and with or without a network " +
        "connection.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RARE)

    dependsOn(pairIpBypassPatch)

    execute {
        // 1. Seed the Pro flow with true at the end of the class initializer, so the
        // app starts unlocked before RevenueCat has spoken (and stays unlocked when
        // it never does). The registers are reused from the tail of the initializer,
        // where the flow objects created by the preceding `sput-object` are dead.
        run {
            val method = ProFlagInitializerFingerprint.method
            val implementation = method.implementation
                ?: throw PatchException("The purchase manager initializer has no body.")
            val instructions = implementation.instructions.toList()

            val proFlowStore = instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                instruction.opcode == Opcode.SPUT_OBJECT &&
                    reference is FieldReference &&
                    reference.definingClass == PURCHASE_MANAGER &&
                    reference.name == PRO_FLOW_FIELD &&
                    reference.type == STATE_FLOW
            }
            if (proFlowStore < 0) {
                throw PatchException(
                    "Obsolete patch: the Pro flow is not created in the purchase manager " +
                        "initializer. This patch set targets Rare 1.0.95.",
                )
            }

            val seededWithBoolean = instructions.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                instruction.opcode == Opcode.SGET_OBJECT &&
                    reference is FieldReference &&
                    reference.definingClass == "Ljava/lang/Boolean;"
            }
            if (!seededWithBoolean) {
                throw PatchException(
                    "Obsolete patch: the Pro flow is not seeded with a Boolean. " +
                        "This patch set targets Rare 1.0.95.",
                )
            }

            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (returnIndex < 0) {
                throw PatchException("The purchase manager initializer does not return.")
            }
            if (implementation.registerCount < 2) {
                throw PatchException(
                    "Obsolete patch: the purchase manager initializer no longer has a " +
                        "spare register pair. This patch set targets Rare 1.0.95.",
                )
            }

            method.addInstructions(
                returnIndex,
                """
                    sget-object v0, $PURCHASE_MANAGER->$PRO_FLOW_FIELD:$STATE_FLOW
                    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    invoke-virtual {v0, v1}, $MUTABLE_STATE_FLOW->setValue(Ljava/lang/Object;)V
                """,
            )
        }

        // 2. Replace every verdict the entitlement check publishes. The method is
        // entered with the customer info, evaluates `rarecam_pro` and stores the
        // result in the flow; the forced value is written first and the original
        // evaluation is left unreachable behind the return.
        run {
            val method = EntitlementUpdateFingerprint.method
            val implementation = method.implementation
                ?: throw PatchException("The entitlement check has no body.")
            if (implementation.registerCount < 2) {
                throw PatchException(
                    "Obsolete patch: the entitlement check no longer has a spare register " +
                        "pair. This patch set targets Rare 1.0.95.",
                )
            }

            method.addInstructions(
                0,
                """
                    sget-object v0, $PURCHASE_MANAGER->$PRO_FLOW_FIELD:$STATE_FLOW
                    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    invoke-virtual {v0, v1}, $MUTABLE_STATE_FLOW->setValue(Ljava/lang/Object;)V
                    return-void
                """,
            )
        }
    }
}
