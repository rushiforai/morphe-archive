package app.morphe.patches.sdmse

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.Constants.COMPATIBILITY_SDMSE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

// SD Maid SE FOSS Flavor Upgrade Model
//
// The standalone FOSS APK (eu.darken.sdmse) contains zero Google Play In-App Billing SDK
// dependencies or Play Billing client classes (UpgradeRepoGplay, BillingData, etc. do not exist).
// Instead, the FOSS build implements an in-house sponsor-based entitlement architecture
// backed by UpgradeRepoFoss, FossUpgrade, and UpgradeRepoFoss$Info.
// Consequently, no Play Billing or Gplay hooks exist in this patch; all unlock hooks target
// the FOSS upgrade engine and its coroutine/field consumers.

private const val FOSS_INFO_CLASS = "Leu/darken/sdmse/common/upgrade/core/UpgradeRepoFoss\$Info;"
private const val FIELD_IS_PRO = "isPro"
private const val TYPE_BOOLEAN = "Z"

// UpgradeRepoFoss$Info.<init>(Z, Instant, FossUpgrade$Type, Throwable)V [0x10001, classes.dex]
//
// Smali verified on 2.2.2-rc0 (versionCode 20202000, 5 registers total):
//   [0] invoke-direct {v0}, Ljava/lang/Object;-><init>()V
//   [1] iput-boolean v1, v0, Leu/darken/sdmse/common/upgrade/core/UpgradeRepoFoss$Info;->isPro:Z
//   [2] iput-object v2, v0, Leu/darken/sdmse/common/upgrade/core/UpgradeRepoFoss$Info;->upgradedAt:Ljava/time/Instant;
//   [3] iput-object v3, v0, Leu/darken/sdmse/common/upgrade/core/UpgradeRepoFoss$Info;->fossUpgradeType:Leu/darken/sdmse/common/upgrade/core/FossUpgrade$Type;
//   [4] iput-object v4, v0, Leu/darken/sdmse/common/upgrade/core/UpgradeRepoFoss$Info;->error:Ljava/lang/Throwable;
//   [5] const/4 v1, 1
//   [6] iput-boolean v1, v0, Leu/darken/sdmse/common/upgrade/core/UpgradeRepoFoss$Info;->isSettled:Z
//   [7] return-void
//
// In 2.2.2-rc0, .registers 5 maps p0..p4:
//   p0 = this
//   v1 = scratch register / isPro:Z parameter
// Injecting `const/4 v1, 0x1` and `iput-boolean v1, p0, ...->isPro:Z` immediately before
// RETURN_VOID safely overrides whatever parameter was passed to the constructor.
private val UpgradeInfoConstructorFingerprint = Fingerprint(
    definingClass = FOSS_INFO_CLASS,
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        TYPE_BOOLEAN,
        "Ljava/time/Instant;",
        "Leu/darken/sdmse/common/upgrade/core/FossUpgrade\$Type;",
        "Ljava/lang/Throwable;",
    ),
)

// UpgradeRepoExtensionsKt.isPro(UpgradeRepoFoss, ContinuationImpl)Object [0x19, classes.dex]
//
// In 2.2.2-rc0, UpgradeRepoExtensionsKt.isPro() has .registers 6:
// Static method with 2 parameters -> p0 is v4 (repo), p1 is v5 (continuation).
// Registers v0..v3 are locals.
// Injecting `sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean; return-object v0`
// at offset 0 immediately short-circuits the coroutine and returns Boolean.TRUE.
private val IsProSuspendFingerprint = Fingerprint(
    definingClass = "Leu/darken/sdmse/common/upgrade/UpgradeRepoExtensionsKt;",
    name = "isPro",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL, AccessFlags.STATIC),
    parameters = listOf(
        "Leu/darken/sdmse/common/upgrade/core/UpgradeRepoFoss;",
        "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
    ),
)

/**
 * Unlocks SD Maid SE Pro features for the FOSS standalone flavor.
 *
 * Strategy — three-layer defense:
 * 1. Layer 1: Force isPro=true in UpgradeRepoFoss.Info constructor before RETURN_VOID.
 * 2. Layer 2: Short-circuit UpgradeRepoExtensionsKt.isPro() coroutine to return Boolean.TRUE at entry.
 * 3. Layer 3: Replace every IGET_BOOLEAN of UpgradeRepoFoss.Info.isPro across all classes with const/4 0x1.
 */
@Suppress("unused")
val sdmseUnlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks SD Maid SE Pro features.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SDMSE)

    execute {
        hookInfoConstructor(UpgradeInfoConstructorFingerprint.method)
        shortCircuitIsPro(IsProSuspendFingerprint.method)

        var patchedReads = 0
        var patchedClasses = 0
        classDefForEach { classDef ->
            if (!readsFossIsProField(classDef)) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                patchedReads += patchMethodReads(method)
            }
            patchedClasses++
        }

        if (patchedReads == 0) {
            throw PatchException("No $FOSS_INFO_CLASS.$FIELD_IS_PRO reads found — fingerprint may be stale.")
        }

        println("[Unlock Pro] Applied FOSS unlock: constructor hooked, isPro() short-circuited, $patchedReads field read(s) in $patchedClasses class(es) forced to true.")
    }
}

private fun isFossIsProField(ref: FieldReference): Boolean {
    if (ref.definingClass != FOSS_INFO_CLASS) return false
    if (ref.name != FIELD_IS_PRO) return false
    return ref.type == TYPE_BOOLEAN
}

private fun writesFossIsProField(instruction: Instruction): Boolean {
    if (instruction.opcode != Opcode.IPUT_BOOLEAN) return false
    val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    return isFossIsProField(ref)
}

private fun writesFossIsProField(method: MutableMethod): Boolean =
    method.instructionsOrNull?.any { writesFossIsProField(it) } == true

private fun hookInfoConstructor(method: MutableMethod) {
    if (!writesFossIsProField(method)) {
        throw PatchException("UpgradeRepoFoss.Info.<init> does not write isPro field — app may have restructured.")
    }
    val returnIndex = method.instructionsOrNull
        ?.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        ?.takeIf { it >= 0 }
        ?: throw PatchException("Could not find RETURN_VOID in UpgradeRepoFoss.Info constructor.")

    method.addInstructions(
        returnIndex,
        """
            const/4 v1, 0x1
            iput-boolean v1, p0, $FOSS_INFO_CLASS->$FIELD_IS_PRO:$TYPE_BOOLEAN
        """.trimIndent(),
    )
}

private fun shortCircuitIsPro(method: MutableMethod) {
    method.addInstructions(
        0,
        """
            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            return-object v0
        """.trimIndent(),
    )
}

private fun isFossIsProRead(instruction: Instruction): Boolean {
    if (instruction.opcode != Opcode.IGET_BOOLEAN) return false
    val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    return isFossIsProField(ref)
}

private fun readsFossIsProField(method: Method): Boolean =
    method.implementation?.instructions?.any { isFossIsProRead(it) } == true

private fun readsFossIsProField(classDef: ClassDef): Boolean =
    classDef.methods.any { readsFossIsProField(it) }

private fun patchFieldRead(method: MutableMethod, index: Int, instruction: Instruction): Boolean {
    if (!isFossIsProRead(instruction)) return false
    val destReg = (instruction as? TwoRegisterInstruction)?.registerA ?: return false
    method.replaceInstruction(index, "const/4 v$destReg, 0x1")
    return true
}

private fun patchMethodReads(method: MutableMethod): Int {
    val instructions = method.instructionsOrNull?.toList() ?: return 0
    var patched = 0
    instructions.forEachIndexed { index, instruction ->
        if (patchFieldRead(method, index, instruction)) {
            patched++
        }
    }
    return patched
}
