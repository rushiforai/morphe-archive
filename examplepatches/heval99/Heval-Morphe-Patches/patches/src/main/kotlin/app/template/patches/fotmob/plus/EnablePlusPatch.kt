package app.template.patches.fotmob.plus

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.patches.shared.addInstructionChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.logging.Logger

// The staff-account check holds these unique addresses.
private const val STAFF_EMAIL = "norapps.as@"

private const val MEMBERSHIP_ACTIVITY = "Lcom/fotmob/android/feature/billing/ui/MembershipActivity;"

private val logger = Logger.getLogger("EnablePlus")

private fun MutableMethod?.returnEarlyIfImplemented(value: Boolean) =
    this?.takeIf { it.implementation != null }?.returnEarly(value)

@Suppress("unused")
val enablePlusPatch = bytecodePatch(
    name = "Enable FotMob+",
    description = "Unlocks FotMob+ features and its ad-free mode in the app, without a real subscription."
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    execute {
        // 1. Disable the staff account bypass (forces the normal path).
        val staffMethod = StaffAccountFingerprint.method
        staffMethod.returnEarlyIfImplemented(false)

        // 2. The storage layer changes between releases (236 read SharedPreferencesRepository,
        // 237 goes through a settings holder), so locate the subscription getter by shape:
        // inside the manager class it is the only no-arg boolean method that is neither the
        // staff check (holds the staff email string) nor a constant-false stub. Force it true.
        // This removes ads and routes More > FotMob+ to MembershipActivity instead of the paywall.
        val manager = staffMethod.definingClass
        val candidates = mutableClassDefBy(manager).methods
            .filter { it.implementation != null }
            .filter { it.parameterTypes.isEmpty() && it.returnType == "Z" }
            .filter { method ->
                val insns = method.implementation!!.instructions.toList()
                val holdsStaffEmail = insns.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string == STAFF_EMAIL
                }
                val constantFalse = insns.size <= 2 &&
                    (insns.firstOrNull() as? NarrowLiteralInstruction)?.narrowLiteral?.toInt() == 0
                !holdsStaffEmail && !constantFalse
            }

        // Exactly one: a second match would mean the shape no longer singles out the getter
        // (238.17794 has one), and forcing the wrong boolean true could change anything.
        val getter = candidates.singleOrNull()
            ?: throw PatchException(
                "Expected one subscription getter in $manager, found ${candidates.map { it.name }}"
            )
        getter.returnEarly(true)

        // 3. App icons. MembershipActivity reads the RevenueCat entitlements from the server, so
        // with no real subscription it takes the NoEntitlement branch, which shows only "No
        // active subscriptions found" and skips the "Exclusive app icons" picker that the three
        // entitlement branches draw. Call the picker there too. Builds without this screen (no
        // such literal, before 238) keep steps 1-2 only. When the literal is there (238 and
        // newer, where the description promises the icons) a picker or branch shape that no
        // longer matches fails the patch instead of shipping it without the icons
        // (238.17794 and 238.17666 are checked; 237/236 had no APK at hand).
        // (2026-11-22) Optional only for builds without MembershipActivity: when the activity is
        // there the literal must be too (.method fails loudly), else the icons would silently drop.
        if (classDefByOrNull(MEMBERSHIP_ACTIVITY) == null) {
            logger.info("Enable FotMob+: no MembershipActivity, skipping the app-icon step")
        } else {
            unlockAppIcons(MembershipScreenFingerprint.method)
        }
    }
}

/**
 * Inserts `activity.<picker>(0, composer)` after the NoEntitlement Text call of the membership
 * screen lambda, right before that branch closes its Compose group with `composer.q(false)`:
 *
 * ```
 * invoke-static/range {...}, Text(Ljava/lang/String;...)V
 * const/4 v0, 0x0
 * invoke-virtual {v1, v0, v4}, MembershipActivity;-><picker>(I<composer>)V   <- added
 * invoke-virtual {v4, v0}, <composer>;->q(Z)V
 * ```
 */
private fun unlockAppIcons(screen: MutableMethod) {
    val where = "${screen.definingClass}->${screen.name}"
    val insns = screen.instructions.toList()

    // The Text call: the first void invoke-static/range after the literal whose first
    // parameter is the String.
    val textIndex = insns.indexOfFirst { it.stringOrNull() == NO_SUBSCRIPTION_TEXT }
    val textCall = (textIndex + 1 until insns.size).firstOrNull { index ->
        val ref = insns[index].methodOrNull()
        insns[index].opcode == Opcode.INVOKE_STATIC_RANGE && ref?.returnType == "V" &&
            ref.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/String;"
    } ?: throw PatchException("$where: no Text call after \"$NO_SUBSCRIPTION_TEXT\"")

    // Then `const/4 vX, 0x0` and the composer's end-group call `q(Z)V` on that register. The
    // composer type is read from that call rather than pinned (zi5 in 238.17794, dj5 in 238.17666).
    val zero = insns.getOrNull(textCall + 1)
        ?.takeIf { it.opcode == Opcode.CONST_4 && (it as NarrowLiteralInstruction).narrowLiteral == 0 }
        as OneRegisterInstruction?
    val endGroup = insns.getOrNull(textCall + 2)
        ?.takeIf { it.opcode == Opcode.INVOKE_VIRTUAL } as FiveRegisterInstruction?
    val endGroupRef = endGroup?.methodOrNull()
        ?.takeIf { it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") }
    if (zero == null || endGroup == null || endGroupRef == null || endGroup.registerD != zero.registerA) {
        throw PatchException("$where: the Text call is not followed by const/4 0 + composer.(Z)V")
    }
    val composerType = endGroupRef.definingClass
    val composerReg = endGroup.registerC
    val zeroReg = zero.registerA
    if (composerType !in insns[textCall].methodOrNull()!!.parameterTypes.map(CharSequence::toString)) {
        throw PatchException("$where: Text call takes no $composerType, the composer guess is wrong")
    }

    // The picker is the MembershipActivity (I, composer)V method that the entitlement branches
    // already call (three times in 238; c0, the only other such call, appears once). All its
    // calls must use the same activity register.
    val calls = insns.filter { insn ->
        val ref = insn.methodOrNull()
        insn.opcode == Opcode.INVOKE_VIRTUAL && ref?.definingClass == MEMBERSHIP_ACTIVITY &&
            ref.returnType == "V" &&
            ref.parameterTypes.map(CharSequence::toString) == listOf("I", composerType)
    }.groupBy { it.methodOrNull()!!.name }
    val ranked = calls.entries.sortedByDescending { it.value.size }
    val (picker, pickerCalls) = ranked.firstOrNull()
        ?: throw PatchException("$where: no MembershipActivity (I, $composerType)V call")
    if (pickerCalls.size < 2 || ranked.getOrNull(1)?.value?.size == pickerCalls.size) {
        throw PatchException(
            "$where: no single picker among ${calls.mapValues { it.value.size }} (I, $composerType)V calls"
        )
    }
    val activityRegs = pickerCalls.map { (it as FiveRegisterInstruction).registerC }.toSet()

    // R8 may keep the activity in different registers per branch (242: v0 in two branches, v5
    // after a `move-object v5, v0` in the others), so the register is tracked into this branch:
    // it starts as the one the screen lambda's check-cast to MembershipActivity wrote, a move-object
    // from a holder adds the destination, and any other write drops a register. Whatever still
    // holds the activity at the insertion point, and is also used by a picker call, is used.
    val castIndex = (textIndex downTo 0).firstOrNull { index ->
        insns[index].opcode == Opcode.CHECK_CAST &&
            ((insns[index] as ReferenceInstruction).reference as? TypeReference)?.type == MEMBERSHIP_ACTIVITY
    } ?: throw PatchException("$where: no check-cast to MembershipActivity before the Text call")
    val holders = mutableSetOf((insns[castIndex] as OneRegisterInstruction).registerA)

    // The NoEntitlement branch starts after the previous branch's goto.
    val branchStart = (textIndex downTo 0).firstOrNull { insns[it].opcode in GOTOS }
        ?: throw PatchException("$where: NoEntitlement branch start not found")
    if (branchStart < castIndex) {
        throw PatchException("$where: the NoEntitlement branch starts before the MembershipActivity cast")
    }
    for (index in branchStart + 1..textCall + 1) {
        val insn = insns[index]
        if (insn.opcode in MOVE_OBJECTS) {
            val move = insn as TwoRegisterInstruction
            if (move.registerB in holders) holders += move.registerA else holders -= move.registerA
        } else {
            holders.removeAll { insn.writes(it) }
        }
    }
    val activityReg = holders.filter { it in activityRegs }.minOrNull()
        ?: throw PatchException(
            "$where: no register holds the activity at the insertion point (holders $holders, $picker calls use $activityRegs)"
        )

    // invoke-virtual takes 4-bit registers only.
    if (listOf(activityReg, zeroReg, composerReg).any { it >= 16 }) {
        throw PatchException("$where: registers v$activityReg/v$zeroReg/v$composerReg do not fit invoke-virtual")
    }

    screen.addInstructionChecked(
        textCall + 2,
        "invoke-virtual {v$activityReg, v$zeroReg, v$composerReg}, " +
            "$MEMBERSHIP_ACTIVITY->$picker(I$composerType)V",
    )
}

private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private val MOVE_OBJECTS = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

private fun Instruction.stringOrNull(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.methodOrNull(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister() || this !is OneRegisterInstruction) return false
    return registerA == register || (opcode.setsWideRegister() && registerA + 1 == register)
}
