package app.daniele.patches.photoncamera

import app.daniele.patches.shared.Constants.COMPATIBILITY_PHOTON
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The app's billing manager (`Lex`): owns the `MutableStateFlow<Boolean>` the
 * whole UI reads as "premium is active".
 *
 * Photon Camera sells a single one-time product and keeps no premium flag of
 * its own: every gated screen collects the StateFlow held here. The camera
 * ViewModel exposes it as `Lol0;->i`, the filter picker and the settings screen
 * collect `Lex;->b` directly, and the LUT gate in the camera ViewModel refuses
 * a VIP LUT while `Lex;->a` is `false`. Both the initial value and the Play
 * query callback are patched, so the flow is `true` before the store answers
 * and stays `true` whatever the store answers, offline included.
 */
private const val BILLING_MANAGER = "Lex;"

/** The coroutine flow class the billing manager stores its flag in. */
private const val STATE_FLOW = "Lud6;"

/**
 * `checkLicense(Context)` in `com.pairip.licensecheck.LicenseClient`.
 *
 * Both `com.pairip.application.Application.attachBaseContext` and
 * `com.pairip.licensecheck.LicenseContentProvider.onCreate` call this entry
 * point, and a build signed with a key other than the Play one fails the
 * installer check it performs, which makes the app refuse to start. The APK
 * ships no `libpairipcore` VM (the check is the Java one only), so replacing
 * the body with a single `return-void` removes the enforcement while leaving
 * the billing code untouched.
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
 * The billing manager constructor, which seeds the premium flow with `false`.
 * Matched by class name because the flag is a plain field on an obfuscated
 * class with no string of its own; the instruction checks reject anything that
 * is not the expected `sget-object Boolean.FALSE; tp.k(...)` sequence.
 */
private object BillingManagerInitFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    custom = { _, classDef -> classDef.type == BILLING_MANAGER },
)

/**
 * `c(BillingResult, List<Purchase>)` in the billing manager's listener: the
 * query callback that republishes "premium active" after every Play query.
 *
 * It computes a local boolean from the purchase list and forwards it to the
 * StateFlow through `Boolean.valueOf`, so the verdict is replaced at the only
 * place it is produced.
 */
private object PurchaseQueryFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lfx;", "Ljava/util/List;"),
    strings = listOf(
        "billingResult",
        "purchases",
        "Purchases queried: ",
    ),
)

@Suppress("unused")
val pairIpBypassPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Disables the PairIP license check so a re-signed build of " +
        "Photon Camera starts instead of being refused. Required by every other patch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PHOTON)

    execute {
        LicenseCheckFingerprint.method.addInstructions(0, "return-void")
    }
}

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces the premium entitlement to always resolve as active, " +
        "unlocking the VIP LUT packs, the AI photo review and the LUT Creator, " +
        "with or without a Play purchase and with or without a network connection.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PHOTON)

    dependsOn(pairIpBypassPatch)

    execute {
        // 1. Seed the premium flow with true instead of false, so the app starts
        // unlocked before Play has answered (and stays unlocked when it never
        // answers). The flow is created by the single tp.k(initialValue) call of
        // the constructor, and the initial value is the instruction before it.
        run {
            val method = BillingManagerInitFingerprint.method
            val instructions = method.implementation?.instructions?.toList()
                ?: throw PatchException("The billing manager constructor has no body.")

            val createFlowIndex = instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                instruction.opcode == Opcode.INVOKE_STATIC &&
                    reference is MethodReference &&
                    reference.definingClass == "Ltp;" &&
                    reference.name == "k"
            }
            if (createFlowIndex < 1) {
                throw PatchException(
                    "Obsolete patch: the premium flow is not created in the billing " +
                        "manager constructor. This patch set targets Photon Camera 1.28.3.1.",
                )
            }

            val initialValueIndex = createFlowIndex - 1
            val initialValue = instructions[initialValueIndex]
            val field = (initialValue as? ReferenceInstruction)?.reference
            if (initialValue.opcode != Opcode.SGET_OBJECT ||
                field !is FieldReference ||
                field.definingClass != "Ljava/lang/Boolean;"
            ) {
                throw PatchException(
                    "Obsolete patch: the premium flow is not seeded with a Boolean. " +
                        "This patch set targets Photon Camera 1.28.3.1.",
                )
            }

            val register = (initialValue as OneRegisterInstruction).registerA
            when (field.name) {
                "FALSE" -> method.replaceInstruction(
                    initialValueIndex,
                    "sget-object v$register, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
                )

                // Already patched.
                "TRUE" -> Unit

                else -> throw PatchException(
                    "Unexpected premium flow initial value ${field.name}.",
                )
            }
        }

        // 2. Replace the verdict the Play query callback publishes. The callback
        // forwards Boolean.valueOf(localVerdict) into the StateFlow: forcing the
        // local boolean would leave the flow at false on the paths that never
        // compute it, so the produced object is replaced instead. The
        // move-result-object after the call loses its producer and becomes a nop.
        run {
            val method = PurchaseQueryFingerprint.method
            val instructions = method.implementation?.instructions?.toList()
                ?: throw PatchException("The purchase query callback has no body.")

            val valueOfIndex = instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                instruction.opcode == Opcode.INVOKE_STATIC &&
                    reference is MethodReference &&
                    reference.definingClass == "Ljava/lang/Boolean;" &&
                    reference.name == "valueOf"
            }

            val moveResult =
                if (valueOfIndex >= 0) instructions.getOrNull(valueOfIndex + 1) else null
            val flowStore = if (moveResult?.opcode == Opcode.MOVE_RESULT_OBJECT) {
                instructions.drop(valueOfIndex + 2).take(10).firstOrNull { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                        reference is MethodReference &&
                        reference.definingClass == STATE_FLOW &&
                        reference.name == "k"
                }
            } else {
                null
            }

            if (moveResult == null || flowStore == null) {
                throw PatchException(
                    "Obsolete patch: the purchase query callback no longer publishes its " +
                        "verdict through Boolean.valueOf. This patch set targets " +
                        "Photon Camera 1.28.3.1.",
                )
            }

            val verdict = (moveResult as OneRegisterInstruction).registerA
            method.replaceInstruction(
                valueOfIndex,
                "sget-object v$verdict, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
            )
            method.replaceInstruction(valueOfIndex + 1, "nop")
        }
    }
}
