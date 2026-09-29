/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.coexist

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.parameterRegister
import app.morphe.patches.facebook.misc.extension.requireLocals
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Facebook's base for a provider whose cross-process callers are checked by a trusted-caller rule. */
internal const val TRUSTED_CALLER_DELEGATE =
    "Lcom/facebook/secure/content/delegate/TrustedCallerContentProviderDelegate;"

/** The delegate of the providers that take Facebook's SameKey rule, UserValuesProvider among them. */
internal const val SAME_KEY_DELEGATE =
    "Lcom/facebook/secure/content/delegate/SameKeyContentProviderDelegate;"

private const val CONTEXT = "Landroid/content/Context;"
private const val OBJECT = "Ljava/lang/Object;"

/**
 * The extension answers whether the rule being checked is the SameKey rule and the current caller is
 * a family app carrying this build's own key.
 */
internal const val ACCEPT_CALL =
    "$EXTENSION_PACKAGE/coexist/FamilySignatureTrust;->accept($CONTEXT$OBJECT$OBJECT)Z"

/**
 * Lets a Messenger re-signed with this build's key sign in through a patched Facebook.
 *
 * Facebook guards its sign-in store, UserValuesProvider, with its SameKey rule: a cross-process
 * caller passes only when it carries Facebook's own signing certificate. Restore screens on re-signed
 * builds answers Facebook its original Meta certificate for its own package, so that rule trusts
 * Meta's certificate rather than this build's, and a Messenger carrying the user's Manager key is
 * refused with "Component access not allowed".
 *
 * One static evaluator takes the provider's context and a caller rule and answers a boolean, for all
 * five rules: anyone, a list of trusted apps, Meta's family signatures, a named Facebook permission,
 * and SameKey. The delegate's two checks and Facebook's lite providers all call it. The hook hands
 * the extension the rule next to Facebook's SameKey singleton, and the extension answers true only
 * for that singleton and a family caller carrying this build's own key, on a re-signed build. Then the
 * evaluator returns true. Otherwise Facebook's own check runs unchanged, so every other rule keeps
 * its answer for every caller, and a Meta-signed caller keeps passing SameKey as before.
 */
internal fun BytecodePatchContext.trustSameKeyFamilyCallers() {
    val delegate = mutableClassDefBy(TRUSTED_CALLER_DELEGATE)

    // The delegate's caller checks take nothing and answer a boolean, each through the one static
    // evaluator (context, rule) -> boolean. Both checks call the same evaluator.
    val evaluators = delegate.methods
        .filter { it.parameterTypes.isEmpty() && it.returnType == "Z" }
        .mapNotNull(Method::trustEvaluatorCall)
        .distinct()
    if (evaluators.size != 1) {
        throw PatchException(
            "$PATCH: expected one caller-trust evaluator behind $TRUSTED_CALLER_DELEGATE, found ${evaluators.size}",
        )
    }
    val evaluator = evaluators.single()

    val method = mutableClassDefBy(evaluator.definingClass).methods.singleOrNull {
        it.name == evaluator.name &&
            it.returnType == evaluator.returnType &&
            it.parameterTypes.map(CharSequence::toString) == evaluator.parameterTypes.map(CharSequence::toString)
    } ?: throw PatchException("$PATCH: could not resolve the caller-trust evaluator $evaluator")

    // The evaluator compares the rule it's handed with this singleton for its own SameKey branch.
    val sameKey = classDefBy(SAME_KEY_DELEGATE).sameKeyRule()
    val comparesSameKey = method.implementation?.instructions?.any {
        it.opcode == Opcode.SGET_OBJECT && (it as ReferenceInstruction).reference.toString() == sameKey.toString()
    } == true
    if (!comparesSameKey) throw PatchException("$PATCH: the caller-trust evaluator $evaluator never reads $sameKey")

    method.acceptSameKeyFamilyCaller(sameKey)
}

/**
 * The one static `(Context, X) -> boolean` this caller-check method calls, or null. That's the shared
 * evaluator every trusted-caller rule runs through.
 */
internal fun Method.trustEvaluatorCall(): MethodReference? {
    val instructions = implementation?.instructions ?: return null
    return instructions
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .singleOrNull { call ->
            call.returnType == "Z" &&
                call.parameterTypes.size == 2 &&
                call.parameterTypes[0].toString() == CONTEXT
        }
}

/**
 * Facebook's SameKey rule, the singleton this delegate's constructor reads and hands to both of its
 * caller checks. Its class and field are Redex's and differ between builds, so it's found by that
 * read: the constructor's one static read of a field holding an instance of the field's own class.
 */
internal fun ClassDef.sameKeyRule(): FieldReference {
    val reads = methods.filter { it.name == "<init>" }
        .flatMap { it.implementation?.instructions?.toList().orEmpty() }
        .filter { it.opcode == Opcode.SGET_OBJECT }
        .map { (it as ReferenceInstruction).reference as FieldReference }
        .filter { it.type == it.definingClass }
        .distinctBy(FieldReference::toString)
    return reads.singleOrNull()
        ?: throw PatchException("$PATCH: expected one SameKey singleton read in $type's constructor, found ${reads.size}")
}

/**
 * Puts the family-caller check at the top of the evaluator, on the context and rule it's handed and
 * the SameKey singleton. A true answer returns straight away; false falls through to Facebook's own
 * check.
 *
 * The parameters are copied down with `move-object/from16` so the reads reach a parameter above v15,
 * the way Restore screens does, and the injected code borrows three locals, free before the method's
 * first instruction runs. The extension never throws, so the call needs no handler.
 */
internal fun MutableMethod.acceptSameKeyFamilyCaller(sameKey: FieldReference) {
    requireLocals(PATCH, 3)
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, ${parameterRegister(0)}
            move-object/from16 v1, ${parameterRegister(1)}
            sget-object v2, $sameKey
            invoke-static { v0, v1, v2 }, $ACCEPT_CALL
            move-result v0
            if-eqz v0, :facebook
            const/4 v0, 0x1
            return v0
        """,
        ExternalLabel("facebook", getInstruction(0)),
    )
}
