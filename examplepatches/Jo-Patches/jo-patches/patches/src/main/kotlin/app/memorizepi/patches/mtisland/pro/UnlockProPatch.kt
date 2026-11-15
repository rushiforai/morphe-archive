package app.memorizepi.patches.mtisland.pro

import app.memorizepi.patches.mtisland.shared.Constants
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnBoxedBooleanEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * How Pro works in Material Capsule 17.3
 * ----------------------------------------
 *
 * The Pro flag is derived from a single encrypted value in the app's DataStore
 * (`SECURE_DATA`, AES key alias `pro_version_key`, plaintext `"yes"` / `"no"`
 * after `uu1.e(...)`).
 *
 * - `uu1.d()` exposes that value as a `Flow<Boolean>`. Every feature view model
 *   (gestures, widgets, card colours, full mode player, ...) collects this flow
 *   and enables its feature when it is `true`.
 * - Both `uu1.d()` and the activity's own state flow go through the same
 *   transform (`az2.d(...)` implementation) that reads the DataStore snapshot
 *   and emits the `Boolean`. That transform additionally requires the integrity
 *   check (`integrity_status`) to be `true`.
 * - `uu1.c(...)` is the suspend one-shot read of the same value.
 *
 * Nothing else decides Pro: the feature gates only consume the flow. Billing
 * (`u40`, `sku_five_dollars`, ...) merely *writes* the flag via `uu1.e(true)`
 * after a successful purchase.
 *
 * Patch strategy
 * --------------
 *
 * 1. The flow transform emits `Boolean.TRUE` unconditionally, so every
 *    collector sees Pro as active from the first emission and the integrity
 *    check is bypassed at the same time.
 * 2. The suspend one-shot read returns `true`, so code that does not use the
 *    flow (purchase verification) agrees with it and never revokes Pro.
 * 3. The gesture item's `isEnabled` setter always stores `true`. The app resets
 *    every gesture to disabled whenever its own Pro bookkeeping runs (the
 *    billing coroutine in `u40` calls the gesture repository's bulk reset),
 *    which wipes the user's switches on each app start. Since the patched app
 *    always reports Pro, that reset must never win. Side effect: a gesture
 *    switch flips back on if it is turned off manually.
 *
 * No billing code is touched: the purchase screen still exists, but the app no
 * longer needs it.
 */

private const val BOOLEAN_TRUE = "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"

private fun MethodReference.matchesSignature(
    returnType: String,
    parameters: List<String>,
): Boolean =
    this.returnType == returnType &&
        parameterTypes.map(CharSequence::toString) == parameters

private fun Any?.isProDecryptCall(): Boolean {
    val reference = this as? MethodReference ?: return false
    return reference.matchesSignature(
        returnType = "Ljava/lang/String;",
        parameters = listOf("Ljava/lang/String;", "Ljavax/crypto/SecretKey;"),
    )
}

/**
 * The flow transform: implements the collector interface, decrypts
 * `SECURE_DATA` and compares the plaintext with the `"yes"` literal.
 *
 * Matched by shape instead of the obfuscated name so a re-obfuscated build
 * fails loudly here instead of silently patching the wrong method.
 */
private object ProFlowTransformFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Lij1;"),
    custom = { method, classDef ->
        val instructions = method.implementation?.instructions
        val hasYesLiteral = instructions?.any { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is StringReference && reference.string == "yes"
        } == true
        val hasDecryptCall = instructions?.any { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference.isProDecryptCall()
        } == true
        classDef.interfaces.contains("Laz2;") && hasYesLiteral && hasDecryptCall
    },
)

/**
 * The suspend one-shot read: lives in the same class as the AES helpers
 * (`SecretKey` factory + `String` decrypt) and reads the encrypted value.
 */
private object ProSuspendReadFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkj1;"),
    custom = { method, classDef ->
        val instructions = method.implementation?.instructions
        val readsSecureData = instructions?.any { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is FieldReference &&
                reference.definingClass == "Lty1;" &&
                reference.name == "d"
        } == true
        val hasKeyFactory = classDef.methods.any {
            it.returnType == "Ljavax/crypto/SecretKey;" && it.parameterTypes.isEmpty()
        }
        val hasDecryptHelper = classDef.methods.any {
            it.returnType == "Ljava/lang/String;" &&
                it.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/String;", "Ljavax/crypto/SecretKey;")
        }
        readsSecureData && hasKeyFactory && hasDecryptHelper
    },
)

/**
 * The generated setter of the gesture item's `isEnabled` field:
 * `static void x(Item, boolean)` with a body of exactly
 * `iput-boolean p1, p0, LItem;->isEnabled_:Z` + `return-void`.
 *
 * Matched by the protobuf field name instead of the obfuscated class name, so
 * a re-obfuscated build fails loudly here instead of patching something else.
 */
private object GestureEnabledSetterFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        val parameters = method.parameterTypes.map(CharSequence::toString)
        val instructions = method.implementation?.instructions?.toList()
        val first = instructions?.getOrNull(0)
        val second = instructions?.getOrNull(1)
        val field = (first as? ReferenceInstruction)?.reference as? FieldReference
        val isGestureItem = classDef.fields.any { it.name == "gestureActionId_" }
        parameters.size == 2 &&
            isGestureItem &&
            parameters[0] == classDef.type &&
            parameters[1] == "Z" &&
            instructions?.size == 2 &&
            first?.opcode == Opcode.IPUT_BOOLEAN &&
            field?.name == "isEnabled_" &&
            field?.definingClass == classDef.type &&
            second?.opcode == Opcode.RETURN_VOID
    },
)

/**
 * Index/register pairs of the two `collector.emit(Boolean, continuation)`
 * calls in the transform. The second argument register holds the value that
 * is forwarded to the downstream collector.
 */
private fun MutableMethod.emitSites(): List<Pair<Int, Int>> =
    implementation!!.instructions
        .mapIndexedNotNull { index, instruction ->
            if (instruction.opcode != Opcode.INVOKE_INTERFACE) return@mapIndexedNotNull null
            val reference = (instruction as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@mapIndexedNotNull null
            if (!reference.matchesSignature(
                    returnType = "Ljava/lang/Object;",
                    parameters = listOf("Ljava/lang/Object;", "Lij1;"),
                )
            ) {
                return@mapIndexedNotNull null
            }
            val valueRegister = when (instruction) {
                is FiveRegisterInstruction -> instruction.registerD
                is RegisterRangeInstruction -> instruction.startRegister + 1
                else -> error("Unexpected emit instruction: $instruction")
            }
            index to valueRegister
        }

val unlockProPatch = patch(
    name = "Unlock Pro features",
    description = "Forces the Pro/Premium entitlement to active, so every locked " +
        "feature (gestures, widgets, card colours, full mode player, app search, ...) " +
        "works without a Play purchase. The billing code is left untouched.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_MATERIAL_CAPSULE)

    execute {
        // 1) Every flow-based Pro read emits `true` immediately.
        val transform = ProFlowTransformFingerprint.method
        val emitSites = transform.emitSites()
        check(emitSites.isNotEmpty()) {
            "No collector emit call found in the Pro flow transform"
        }
        emitSites.sortedByDescending { it.first }.forEach { (index, valueRegister) ->
            require(valueRegister in 0..15) {
                "Unexpected value register v$valueRegister in the Pro flow transform"
            }
            transform.addInstructions(index, "sget-object v$valueRegister, $BOOLEAN_TRUE")
        }

        // 2) The suspend one-shot read agrees with the flow.
        ProSuspendReadFingerprint.method.returnBoxedBooleanEarly(true)

        // 3) Gestures can never be disabled behind the user's back. The
        //    billing/entitlement reconciliation calls the gesture repository's
        //    bulk reset, which sets `isEnabled = false` for every gesture.
        GestureEnabledSetterFingerprint.method.addInstructions(0, "const/4 p1, 0x1")
    }
}
