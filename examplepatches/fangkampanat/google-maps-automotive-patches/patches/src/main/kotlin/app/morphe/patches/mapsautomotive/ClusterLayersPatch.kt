package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.logging.Logger

// The cluster map's layers follow the saved map layers, like the main map. The cluster map reads the
// same saved layers as the main map (traffic, satellite, 3D buildings), but adds fixed overrides on top:
// - Satellite (core patch, next to the cluster colors): the cluster's map controller turns satellite
//   off because satellite is not allowed on the cluster. useCarSatelliteOnCluster passes that value
//   through ClusterSatellite.allowed (true while the cluster_satellite switch is on), so the saved
//   satellite choice applies there too. The main map's controller is the same class, with the value
//   true already.
// - 3D buildings (3D buildings patch): the layers controller overrides the 3D layer with "is this map
//   eligible for 3D buildings". The main map is eligible only while the user has 3D buildings on, so
//   there the override repeats the user's choice; once the 3D buildings patch turns Google's flag on,
//   the cluster map is always eligible, so it always showed 3D buildings. useSaved3dLayerOnCluster
//   adds the override only when the map is not eligible (as before: off), and leaves an eligible map to
//   the saved layers.
// Traffic already follows the saved layers. Required: a missing anchor or an ambiguity fails the patch.

private const val CLUSTER_SATELLITE_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/ClusterSatellite;"
// Dump titles printed by the two classes.
private const val LAYERS_CONTROLLER_TITLE = "FeatureEligibilityAwareLayersController:"
private const val SATELLITE_ALLOWED_LABEL = "isSatelliteAllowed: "
private val clusterLayersLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.ClusterLayersPatch")

internal fun BytecodePatchContext.useCarSatelliteOnCluster() {
    requireExtensionMethod(CLUSTER_SATELLITE_CLASS, "allowed", listOf("Z"), "Z")
    allowSatelliteOnCluster(threeDOverride().overrideType)
}

internal fun BytecodePatchContext.useSaved3dLayerOnCluster() {
    keep3DToSavedLayers(threeDOverride())
}

// The layers controller's update: a single instance-of (is the 3D buildings feature on) whose result is
// the value of a new layer override (new-instance <type>, constructor (layer, value)), applied by the
// last call before the return.
private class ThreeDOverride(val method: Method, val check: Int, val eligible: Int, val overrideType: String, val apply: Int)

private fun BytecodePatchContext.threeDOverride(): ThreeDOverride {
    val controller = classWithString(LAYERS_CONTROLLER_TITLE)
    val candidates = controller.methods.filter { m ->
        val code = m.implementation?.instructions?.toList() ?: return@filter false
        m.returnType == "V" && m.parameterTypes.size == 1 &&
            code.count { it.opcode == Opcode.INSTANCE_OF } == 1 &&
            code.any { methodRef(it)?.name == "anyMatch" }
    }
    val method = candidates.singleOrNull()
        ?: throw PatchException("Expected one 3D override update in ${controller.type}, found ${candidates.size}")
    val code = method.implementation!!.instructions.toList()
    val check = code.indexOfFirst { it.opcode == Opcode.INSTANCE_OF }
    val eligible = (code[check] as TwoRegisterInstruction).registerA
    val newOverride = code.drop(check).firstOrNull { it.opcode == Opcode.NEW_INSTANCE }
        ?: throw PatchException("No layer override created after the 3D check in $method")
    val overrideType = ((newOverride as ReferenceInstruction).reference as TypeReference).type
    val ctor = code.drop(check).firstOrNull {
        it.opcode == Opcode.INVOKE_DIRECT && methodRef(it)?.let { r -> r.definingClass == overrideType && r.name == "<init>" } == true
    } ?: throw PatchException("No $overrideType constructor after the 3D check in $method")
    if (methodRef(ctor)!!.parameterTypes.map { it.toString() }.lastOrNull() != "Z") {
        throw PatchException("Unexpected layer override constructor ${methodRef(ctor)}")
    }
    val apply = code.indexOfLast { it.opcode == Opcode.INVOKE_INTERFACE }
    if (apply < check || code.getOrNull(apply + 1)?.opcode != Opcode.RETURN_VOID) {
        throw PatchException("The 3D override in $method does not end in an apply call and return")
    }
    return ThreeDOverride(method, check, eligible, overrideType, apply)
}

// Jump past the override when the map is eligible, to the call that applies the unchanged list.
private fun BytecodePatchContext.keep3DToSavedLayers(o: ThreeDOverride) {
    val method = o.method
    val check = o.check
    val eligible = o.eligible
    val apply = o.apply
    val mutable = mutableMethodOf(method)
    // The label must point at the mutable method's own instruction (same index before the insert).
    val applyTarget = mutable.implementation!!.instructions.elementAt(apply)
    mutable.addInstructionsWithLabels(
        check + 1,
        "if-nez v$eligible, :morphe_saved_layers",
        ExternalLabel("morphe_saved_layers", applyTarget),
    )
    clusterLayersLogger.info("Cluster layers: 3D override skipped when eligible in $method (v$eligible)")
}

// The map controller's update reads "satellite allowed" (the field its dump prints) as a Boolean and
// adds a satellite-off override when false. The read value passes through ClusterSatellite.allowed.
private fun BytecodePatchContext.allowSatelliteOnCluster(overrideType: String) {
    val mapController = classWithString(SATELLITE_ALLOWED_LABEL)
    val allowedField = satelliteAllowedField(mapController)
    var patched = 0
    mapController.methods.toList().forEach { method ->
        val code = method.implementation?.instructions?.toList() ?: return@forEach
        if (code.none { it.opcode == Opcode.NEW_INSTANCE && typeRef(it) == overrideType }) return@forEach
        val sites = code.indices.filter { i -> fieldKey(code[i]) == allowedField && code[i].opcode == Opcode.IGET_OBJECT }
            .mapNotNull { i ->
                // iget field -> invoke c() -> move-result-object -> ... booleanValue -> move-result vN -> if-nez vN
                val unbox = (i until minOf(i + 8, code.size)).firstOrNull { methodRef(code[it])?.name == "booleanValue" }
                    ?: return@mapNotNull null
                val result = code.getOrNull(unbox + 1)
                val branch = code.getOrNull(unbox + 2)
                if (result?.opcode != Opcode.MOVE_RESULT || branch?.opcode != Opcode.IF_NEZ) return@mapNotNull null
                val reg = (result as OneRegisterInstruction).registerA
                if ((branch as OneRegisterInstruction).registerA != reg) return@mapNotNull null
                unbox + 1 to reg
            }
        if (sites.isEmpty()) return@forEach
        val mutable = mutableMethodOf(method)
        sites.sortedByDescending { it.first }.forEach { (index, reg) ->
            mutable.addInstructions(
                index + 1,
                """
                    invoke-static/range { v$reg .. v$reg }, $CLUSTER_SATELLITE_CLASS->allowed(Z)Z
                    move-result v$reg
                """,
            )
            patched++
        }
    }
    if (patched != 1) {
        throw PatchException("Expected one satellite override read of $allowedField in ${mapController.type}, patched $patched")
    }
    clusterLayersLogger.info("Cluster layers: satellite allowed via $allowedField")
}

// The field the dump prints after the label: the last field of the class read before the label string.
private fun satelliteAllowedField(mapController: ClassDef): String {
    val dump = mapController.methods.firstOrNull { m ->
        m.implementation?.instructions?.any { stringRef(it) == SATELLITE_ALLOWED_LABEL } == true
    } ?: throw PatchException("No dump method with '$SATELLITE_ALLOWED_LABEL' in ${mapController.type}")
    val code = dump.implementation!!.instructions.toList()
    val label = code.indexOfFirst { stringRef(it) == SATELLITE_ALLOWED_LABEL }
    val read = (label downTo 0).firstOrNull {
        code[it].opcode == Opcode.IGET_OBJECT && fieldRef(code[it])?.definingClass == mapController.type
    } ?: throw PatchException("No field read before '$SATELLITE_ALLOWED_LABEL' in $dump")
    return fieldKey(code[read])!!
}

// The one app class (not the extension) with this string.
private fun BytecodePatchContext.classWithString(text: String): ClassDef {
    val found = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        if (classDef.methods.any { m: Method -> m.implementation?.instructions?.any { stringRef(it) == text } == true }) {
            found += classDef
        }
    }
    return found.singleOrNull()
        ?: throw PatchException("Expected one class with '$text', found ${found.joinToString { it.type }}")
}

private fun stringRef(i: Instruction) = ((i as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun typeRef(i: Instruction) = ((i as? ReferenceInstruction)?.reference as? TypeReference)?.type
private fun methodRef(i: Instruction) = (i as? ReferenceInstruction)?.reference as? MethodReference
private fun fieldRef(i: Instruction) = (i as? ReferenceInstruction)?.reference as? FieldReference
private fun fieldKey(i: Instruction) = fieldRef(i)?.let { it.definingClass + "->" + it.name + ":" + it.type }
