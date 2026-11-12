package app.template.patches.truecaller.misc.callscreen

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// The tooltip state that carries the poor-network message, and the tooltip type it is rendered as.
// Both live in code R8 does not rename (the callui tooltip package keeps its names), unlike the
// anonymous stateful lambda class that maps the states.
private const val TOOLTIP_TYPE =
    "Lcom/truecaller/callui/presentation/ui/components/tooltip/CallUITooltipViewModel\$Type;"
private const val SIGNAL_FIELD = "$TOOLTIP_TYPE->SIGNAL:$TOOLTIP_TYPE"

private const val FEATURE = "truecaller.hide_poor_network_warning"

/**
 * The in-call "Your network is poor • Try a new location" tooltip (#126). The call UI collects
 * network-quality states and its tooltip ViewModel maps each state to a tooltip object; the
 * poor-network state becomes a CallUITooltipViewModel.Type.SIGNAL tooltip built with
 * string/call_ui_poor_network_message.
 *
 * The state class itself is R8-renamed, so the patch does not name it: it finds the one method
 * that reads Type.SIGNAL (26.43.5: the mapping lambda's invokeSuspend), takes the "no tooltip"
 * constant that the same method returns for another state (a static field of its own type returned
 * right away, 26.43.5: Ljb9;->a) and, while the feature is on, returns that constant instead of
 * building the SIGNAL tooltip. The call itself is untouched.
 */
@Suppress("unused")
val hidePoorNetworkWarningPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide poor network warning",
        description = "Hides the \"Your network is poor\" tooltip on the in-call screen.",
        category = TruecallerControlsCategory.CALL_SCREEN,
    ),
    default = false,
) {
    // 1. The tooltip mapping method: the only one that reads Type.SIGNAL.
    val candidates = mutableListOf<Pair<ClassDef, Method>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            if (method.readsSignalTooltip()) candidates += classDef to method
        }
    }
    val (tooltipClass, tooltipMethod) = candidates.singleOrNull() ?: throw PatchException(
        "expected one tooltip mapping method reading $SIGNAL_FIELD, found ${candidates.size}: " +
            candidates.joinToString { (classDef, method) -> "${classDef.type}->${method.name}" },
    )

    val insns = tooltipMethod.instructions.toList()
    val signalIndex = insns.indexOfFirst { it.fieldKey() == SIGNAL_FIELD }
    if (signalIndex < 1) throw PatchException("${tooltipClass.type}->${tooltipMethod.name}: Type.SIGNAL is not read")
    val newInstance = insns[signalIndex - 1]
    val createdType = ((newInstance as? ReferenceInstruction)?.reference as? TypeReference)?.type
    if (newInstance.opcode != Opcode.NEW_INSTANCE || createdType == null) {
        throw PatchException(
            "${tooltipClass.type}->${tooltipMethod.name}: the instruction before Type.SIGNAL is " +
                "${newInstance.opcode}, not the tooltip constructor",
        )
    }
    val constructorRef = (insns.getOrNull(signalIndex + 1) as? ReferenceInstruction)?.reference as? MethodReference
    if (constructorRef?.definingClass != createdType ||
        constructorRef.parameterTypes.lastOrNull()?.toString() != TOOLTIP_TYPE
    ) {
        throw PatchException(
            "${tooltipClass.type}->${tooltipMethod.name}: Type.SIGNAL is not passed to the " +
                "$createdType constructor; got $constructorRef",
        )
    }

    // 2. The no-tooltip constant this method already returns for another state: a static field of
    // its own type, read and returned in the next instruction.
    val noneFields = insns.indices.mapNotNull { index ->
        val read = insns[index] as? ReferenceInstruction ?: return@mapNotNull null
        if (read.opcode != Opcode.SGET_OBJECT) return@mapNotNull null
        val field = read.reference as? FieldReference ?: return@mapNotNull null
        if (field.type != field.definingClass || field.type == "Ljava/lang/Object;") return@mapNotNull null
        val ret = insns.getOrNull(index + 1) ?: return@mapNotNull null
        if (ret.opcode != Opcode.RETURN_OBJECT) return@mapNotNull null
        if ((read as OneRegisterInstruction).registerA != (ret as OneRegisterInstruction).registerA) return@mapNotNull null
        "${field.definingClass}->${field.name}:${field.type}"
    }.distinct()
    val noneField = noneFields.singleOrNull() ?: throw PatchException(
        "${tooltipClass.type}->${tooltipMethod.name}: expected one no-tooltip constant, found $noneFields",
    )

    // 3. While the feature is on, answer with the no-tooltip constant before the SIGNAL tooltip is
    // built. The state is mapped per call event, so no restart is needed.
    val mutable = mutableClassDefBy(tooltipClass).methods.single {
        it.name == tooltipMethod.name && it.returnType == tooltipMethod.returnType &&
            it.parameterTypes.map(CharSequence::toString) == tooltipMethod.parameterTypes.map(CharSequence::toString)
    }
    mutable.requireNoBranchTargetAt(signalIndex - 1, "poor network tooltip")
    mutable.addHevalGate(
        featureId = FEATURE,
        index = signalIndex - 1,
        whenEnabled = { v -> "sget-object $v, $noneField\nreturn-object $v" },
    )
}

/** True for the tooltip mapping method: it passes the SIGNAL tooltip type to a constructor. */
private fun Method.readsSignalTooltip(): Boolean {
    val insns = implementation?.instructions?.toList() ?: return false
    return insns.indices.any { index ->
        insns[index].fieldKey() == SIGNAL_FIELD &&
            ((insns.getOrNull(index + 1) as? ReferenceInstruction)?.reference as? MethodReference)
                ?.let { it.name == "<init>" && it.parameterTypes.lastOrNull()?.toString() == TOOLTIP_TYPE } == true
    }
}

private fun Instruction.fieldKey(): String? = (this as? ReferenceInstruction)?.reference?.let { reference ->
    (reference as? FieldReference)?.let { "${it.definingClass}->${it.name}:${it.type}" }
}
