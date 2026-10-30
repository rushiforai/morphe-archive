package app.braintropy.patches.wakingup

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.braintropy.patches.shared.Constants.COMPATIBILITY_WAKING_UP
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.util.EnumSet
import java.util.logging.Level
import java.util.logging.Logger

private val logger = Logger.getLogger("UnlockPremiumPatch")

private val iputOpcodes = EnumSet.of(
    Opcode.IPUT, Opcode.IPUT_WIDE, Opcode.IPUT_OBJECT, Opcode.IPUT_BOOLEAN,
    Opcode.IPUT_BYTE, Opcode.IPUT_CHAR, Opcode.IPUT_SHORT
)

/**
 * Index of the IPUT assigning the constructor parameter named [anchor].
 * Kotlin data-model constructors call Intrinsics.checkNotNullParameter with
 * unobfuscated parameter names; the checked register is the same one the
 * field assignment reads, which links the name to the field assignment
 * without relying on R8-obfuscated field names.
 */
private fun anchorAssignmentIndex(instructions: List<Instruction>, anchor: String): Int {
    val constIndex = instructions.indexOfFirst {
        it.opcode == Opcode.CONST_STRING && (it as ReferenceInstruction).reference.toString() == anchor
    }
    require(constIndex >= 0) { "anchor '$anchor' not found" }
    val check = instructions[constIndex + 1]
    require(check.opcode == Opcode.INVOKE_STATIC) { "anchor '$anchor' not followed by a parameter check" }
    val valueRegister = (check as Instruction35c).registerC
    val index = instructions.indexOfFirst {
        it is Instruction22c && it.opcode in iputOpcodes && it.registerA == valueRegister
    }
    require(index >= 0) { "no field assignment found for anchor '$anchor'" }
    return index
}

private fun Instruction.isBooleanAssignment() = opcode == Opcode.IPUT_BOOLEAN

/**
 * Overrides boolean fields in the constructor of every class matched by
 * [fingerprint] (all model layers: domain, data/entity, view items).
 * [resolve] maps the constructor's instructions to the field assignments to
 * force, identified structurally via named parameter anchors instead of
 * obfuscated field names. Each targeted IPUT_BOOLEAN is preceded by a const
 * clobbering its (dead) source register, which avoids inserting new field
 * instructions whose p-registers may not fit the 4-bit iput format.
 * Classes whose layout does not fit are skipped, but at least one class must
 * be patched.
 */
context(_: BytecodePatchContext)
private fun overrideBooleanFields(
    fingerprint: Fingerprint,
    resolve: (List<Instruction>) -> List<Pair<Int, Boolean>>
) {
    val matches = fingerprint.matchAllOrNull()
        ?: throw IllegalStateException("No model toString() matched $fingerprint")
    var patched = 0
    matches.forEach { match ->
        runCatching {
            val constructor = match.classDef.methods
                .filter { it.name == "<init>" }
                .maxByOrNull { it.implementation?.instructions?.size ?: 0 }!!
            val instructions = constructor.implementation!!.instructions
            // Descending so earlier inserts don't shift later target indices.
            resolve(instructions).sortedByDescending { it.first }.forEach { (index, value) ->
                val register = (instructions[index] as Instruction22c).registerA
                constructor.addInstructions(index, "const/16 v$register, 0x${if (value) "1" else "0"}")
            }
            patched++
        }.onFailure {
            logger.log(Level.WARNING, "Could not patch ${match.classDef.type}", it)
        }
    }
    check(patched > 0) { "No model class could be patched for $fingerprint" }
}

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium content and removes subscription banners.",
    default = true
) {
    category("Unlock")
    compatibleWith(COMPATIBILITY_WAKING_UP)

    execute {
        // Force every user model layer to report an active paid subscription:
        // isSubscribed = true and isTrialSubscription = false. All subscription
        // checks (use cases, enforced paywall logic, widgets, menu entries and
        // the Room-level isUserSubscribed flag) read these fields downstream.
        //
        // isSubscribed is the first boolean property after the string identity
        // block (anchored on "fullName"); isTrialSubscription is the last
        // boolean before "uuid". Holds for both supported versions even though
        // the property order around them differs.
        overrideBooleanFields(SubscribedUserModelToStringFingerprint) { instructions ->
            val fullName = anchorAssignmentIndex(instructions, "fullName")
            val uuid = anchorAssignmentIndex(instructions, "uuid")
            val subscribed = (fullName + 1 until instructions.size)
                .first { instructions[it].isBooleanAssignment() }
            require(subscribed < uuid) { "isSubscribed assignment is not before the 'uuid' anchor" }
            val trial = (fullName + 1 until uuid).last { instructions[it].isBooleanAssignment() }
            listOf(subscribed to true, trial to false)
        }

        // Mark every course model layer as available. The server flags premium
        // content with is_unlocked=false for unsubscribed users; this overrides
        // it so all courses are playable and no lock icons are shown.
        // isAvailable is the first boolean property, right after "title".
        overrideBooleanFields(AvailableCourseModelToStringFingerprint) { instructions ->
            val title = anchorAssignmentIndex(instructions, "title")
            val available = (title + 1 until instructions.size)
                .first { instructions[it].isBooleanAssignment() }
            listOf(available to true)
        }
    }
}
