package app.template.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.truecaller.shared.overrideFeatureToggle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// The swipe helper fires this event when a swipe starts; its handlers place the call (swipe from
// the start edge) or open the SMS composer (from the end edge).
private const val SWIPE_START_EVENT = "ItemEvent.SWIPE_START"

private val CONDITIONAL_BRANCHES = setOf(
    Opcode.IF_EQ, Opcode.IF_NE, Opcode.IF_LT, Opcode.IF_GE, Opcode.IF_GT, Opcode.IF_LE,
    Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_LTZ, Opcode.IF_GEZ, Opcode.IF_GTZ, Opcode.IF_LEZ,
)

@Suppress("unused")
val restoreClassicCallLogPatch = bytecodePatch(
    name = "Restore classic call log",
    description = "Experimental: restores the classic call log.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // 1. "featureCallLogRevamp" is read in an R8-merged toggle lambda shared with other call
        // log toggles, so it is overridden in the toggle resolver itself.
        overrideFeatureToggle("featureCallLogRevamp", false)

        // 2. Swipe actions. The classic lists attach their swipe helper only when
        // "featureFavouriteContacts" is off. That toggle also drives the Favourites UI, so it is not
        // overridden; only this one check is forced to false.
        val matches = CallLogSwipeSetupFingerprint.matchAllOrNull().orEmpty()
        val match = matches.singleOrNull() ?: throw PatchException(
            "Expected one call log RecyclerView setup, found " +
                matches.map { "${it.classDef.type}->${it.method.name}" },
        )
        val method = match.method
        val label = "${match.classDef.type}->${method.name}()"
        val instructions = method.instructions

        fun callIndex(name: String) = instructions.indexOfFirst {
            val call = (it as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == RECYCLER_VIEW && call.name == name
        }
        val touchListener = callIndex("addOnItemTouchListener")
        val decoration = callIndex("addItemDecoration")
        if (touchListener < 0 || decoration < touchListener) {
            throw PatchException("$label does not add a touch listener and then an item decoration")
        }

        // The touch listener must be the swipe helper: the class it is cast to fires the swipe event.
        val listenerRegister = (instructions[touchListener] as? FiveRegisterInstruction)?.registerD
            ?: throw PatchException("$label does not pass its touch listener in a plain invoke")
        val cast = instructions.subList(0, touchListener).lastOrNull {
            it.opcode == Opcode.CHECK_CAST && (it as OneRegisterInstruction).registerA == listenerRegister
        } ?: throw PatchException("$label does not cast its touch listener v$listenerRegister")
        val helperType = ((cast as ReferenceInstruction).reference as TypeReference).type
        val helper = classDefByOrNull(helperType) ?: throw PatchException("$label: swipe helper $helperType not found")
        val firesSwipe = helper.methods.any { helperMethod ->
            helperMethod.implementation?.instructions?.any {
                it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == SWIPE_START_EVENT
            } == true
        }
        if (!firesSwipe) throw PatchException("$label: touch listener $helperType does not fire $SWIPE_START_EVENT")

        // The guard is the only branch before the touch listener: invoke ...()Z, move-result vX,
        // if-nez vX, jumping past the item decoration.
        val branches = (0 until touchListener).filter { instructions[it].opcode in CONDITIONAL_BRANCHES }
        val guard = branches.singleOrNull()
            ?: throw PatchException("$label has ${branches.size} branches before its touch listener, expected one")
        val toggleCall = (instructions.getOrNull(guard - 2) as? ReferenceInstruction)?.reference as? MethodReference
        val moveResult = instructions.getOrNull(guard - 1)
        val register = (instructions[guard] as OneRegisterInstruction).registerA
        if (instructions[guard].opcode != Opcode.IF_NEZ || moveResult?.opcode != Opcode.MOVE_RESULT ||
            (moveResult as OneRegisterInstruction).registerA != register ||
            toggleCall?.returnType != "Z" || toggleCall.parameterTypes.isNotEmpty()
        ) {
            throw PatchException("$label: the swipe guard is not invoke ...()Z, move-result v$register, if-nez v$register")
        }
        val target = (instructions[guard] as BuilderOffsetInstruction).target.location.index
        if (target <= decoration) {
            throw PatchException("$label: the swipe guard jumps to instruction $target, not past the item decoration ($decoration)")
        }

        // The toggle is still read; its result is replaced with false right before the branch.
        method.requireNoBranchTargetAt(guard, "swipe guard")
        method.addInstructionChecked(guard, if (register < 16) "const/4 v$register, 0x0" else "const/16 v$register, 0x0")
    }
}
