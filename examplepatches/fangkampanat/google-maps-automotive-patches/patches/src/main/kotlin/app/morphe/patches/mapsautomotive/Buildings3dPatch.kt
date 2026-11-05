package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

// 3D buildings, a separate patch on top of the core one. Maps for Android Automotive can draw buildings
// in 3D and has a "3D buildings" (or "Raised buildings") row in its map layers. One flag of Google's
// client parameters hides that row and keeps the map setup, the renderer and the layer rules flat;
// Google keeps it off for this app. Every read of that flag passes through Buildings3d.flag, which
// gives true while the feature is on and Maps' value otherwise. Maps' own layer row and preference
// then turn the buildings on or off.
// The flag: Maps' map-layer enums (TRAFFIC, SATELLITE, TERRAIN, THREE_DIMENSIONAL, ...) give the 3D
// layer constants; the layer rules read one boolean field and, when it is true, add the 3D layer at
// once (one such method in Maps). The cluster screen's only boolean read must be the same field. Every
// read of the field (9 in 120003.E) needs a straight-line point after it.
// Required: a missing anchor, an ambiguity, another number of reads or an unknown layout fails the patch.

private const val BUILDINGS_3D_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/Buildings3d;"
private val LAYER_NAMES = setOf("TRAFFIC", "SATELLITE", "TERRAIN", "THREE_DIMENSIONAL")
private const val LAYER_3D = "THREE_DIMENSIONAL"
// The cluster screen reads the flag once in onStart; a second anchor for the same field.
private const val CLUSTER_ACTIVITY = "Lcom/google/android/apps/gmm/car/embedded/auxiliarymap/EmbeddedClusterActivity;"
// The reads of the flag in 120003.E: map setup (2), renderer (2), layer rules, render config, the
// layer row, the cluster screen and one more map class.
private const val FLAG_READS = 9
// The layer row's title, so the user can turn the buildings off again in Maps.
private const val LAYER_ROW_TITLE = "CAR_DRAWER_3D_BUILDINGS"
private val buildingsLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.Buildings3dPatch")

@Suppress("unused")
val buildings3dPatch = bytecodePatch(
    name = "3D buildings",
    description = "Adds Maps' own 3D buildings to the map layers. Google hides them in this app.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(automotiveMicroGPatch)

    execute {
        useBuildings3d()
        IncludedFeatures.features += "buildings_3d"
    }
}

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

private fun FieldReference.key() = "$definingClass->$name:$type"

private fun BytecodePatchContext.useBuildings3d() {
    requireExtensionMethod(BUILDINGS_3D_CLASS, "flag", listOf("Z"), "Z")
    requireLayerRow()
    val flag = buildingsFlag(layer3dConstants())
    requireClusterRead(flag)
    passFlagReads(flag)
}

// A sanity check: Maps code still uses the buildings row's title, so the user can turn them off in Maps.
private fun BytecodePatchContext.requireLayerRow() {
    val title = resourceId(ResourceType.STRING, LAYER_ROW_TITLE)
    var users = 0
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { method ->
            if (method.implementation?.instructions?.any { (it as? NarrowLiteralInstruction)?.narrowLiteral?.toLong() == title } == true) {
                users++
            }
        }
    }
    if (users == 0) throw PatchException("No Maps code shows the $LAYER_ROW_TITLE layer row")
}

// The THREE_DIMENSIONAL constant of each map-layer enum: in <clinit>, its name, the constructor call
// with that name and the store of the new constant.
private fun BytecodePatchContext.layer3dConstants(): Set<String> {
    val constants = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/") || classDef.superclass != "Ljava/lang/Enum;") return@classDefForEach
        val code = classDef.methods.firstOrNull { it.name == "<clinit>" }?.implementation?.instructions?.toList()
            ?: return@classDefForEach
        if (!code.mapNotNullTo(HashSet()) { it.string() }.containsAll(LAYER_NAMES)) return@classDefForEach
        val names = code.indices.filter { code[it].string() == LAYER_3D }
        val name = names.singleOrNull() ?: throw PatchException("Expected one $LAYER_3D in ${classDef.type}, found ${names.size}")
        val register = (code[name] as OneRegisterInstruction).registerA
        val init = (name + 1 until minOf(code.size, name + 4)).firstOrNull { index ->
            val reference = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
            code[index].opcode == Opcode.INVOKE_DIRECT && reference?.definingClass == classDef.type &&
                reference.name == "<init>" && code[index].registers().getOrNull(1) == register
        } ?: throw PatchException("$LAYER_3D is not passed to a constructor in ${classDef.type}")
        val store = code.getOrNull(init + 1)
        val field = store?.field()
        if (store?.opcode != Opcode.SPUT_OBJECT || (store as OneRegisterInstruction).registerA != code[init].registers().first() ||
            field?.definingClass != classDef.type || field.type != classDef.type
        ) {
            throw PatchException("Unexpected store of the $LAYER_3D constant in ${classDef.type}")
        }
        constants += field.key()
    }
    if (constants.isEmpty()) throw PatchException("No map-layer enum with ${LAYER_NAMES.joinToString()}")
    buildingsLogger.info("3D buildings: 3D layer constants ${constants.joinToString()}")
    return constants
}

// The layer rules: iget-boolean flag, if-eqz on it, then at once the 3D layer constant. One method.
private fun BytecodePatchContext.buildingsFlag(constants: Set<String>): FieldReference {
    val matches = mutableListOf<Pair<Method, FieldReference>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            for (index in 0 until code.size - 2) {
                if (code[index].opcode != Opcode.IGET_BOOLEAN) continue
                val register = (code[index] as TwoRegisterInstruction).registerA
                val branch = code[index + 1]
                val constant = code[index + 2]
                if (branch.opcode == Opcode.IF_EQZ && (branch as OneRegisterInstruction).registerA == register &&
                    constant.opcode == Opcode.SGET_OBJECT && constant.field()?.key() in constants
                ) {
                    matches += method to code[index].field()!!
                }
            }
        }
    }
    val (rules, flag) = matches.singleOrNull()
        ?: throw PatchException("Expected one layer rule that adds the 3D layer by a flag, found ${matches.map { it.first }}")
    if (flag.type != "Z") throw PatchException("Unexpected 3D buildings flag ${flag.key()} in $rules")
    buildingsLogger.info("3D buildings: flag ${flag.key()} from the layer rules $rules")
    return flag
}

private fun BytecodePatchContext.requireClusterRead(flag: FieldReference) {
    val cluster = classDefByOrNull(CLUSTER_ACTIVITY) ?: throw PatchException("Missing $CLUSTER_ACTIVITY")
    val onStart = cluster.methods.singleOrNull { it.name == "onStart" && it.parameterTypes.isEmpty() && it.returnType == "V" }
        ?: throw PatchException("Expected one onStart in $CLUSTER_ACTIVITY")
    val reads = onStart.implementation?.instructions?.filter { it.opcode == Opcode.IGET_BOOLEAN }.orEmpty()
    val read = reads.singleOrNull()?.field() ?: throw PatchException("Expected one boolean read in $onStart, found ${reads.size}")
    if (read.key() != flag.key()) throw PatchException("$onStart reads ${read.key()}, not the 3D buildings flag ${flag.key()}")
}

// Each read: iget-boolean vA, then Buildings3d.flag(vA) into vA.
private fun BytecodePatchContext.passFlagReads(flag: FieldReference) {
    val reads = mutableListOf<Pair<Method, Int>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            code.indices.filter { code[it].field()?.key() == flag.key() }.forEach { index ->
                if (code[index].opcode != Opcode.IGET_BOOLEAN) {
                    throw PatchException("Unexpected use of the 3D buildings flag in $method at $index: ${code[index].opcode}")
                }
                reads += method to index
            }
        }
    }
    if (reads.size != FLAG_READS) {
        throw PatchException("Expected $FLAG_READS reads of the 3D buildings flag ${flag.key()}, found ${reads.size}: ${reads.map { it.first }}")
    }
    // Last read first, so the indices of the earlier reads in the same method stay valid.
    reads.groupBy({ it.first }, { it.second }).forEach { (site, indices) ->
        val method = mutableMethodOf(site)
        indices.sortedDescending().forEach { index ->
            val code = method.implementation!!.instructions
            val register = (code[index] as TwoRegisterInstruction).registerA
            // Inserted code before a branch target would be skipped by that branch.
            if (code.getOrNull(index + 1)?.location?.labels?.isNotEmpty() != false) {
                throw PatchException("No straight-line point after the 3D buildings flag read in $site at $index")
            }
            method.addInstructions(
                index + 1,
                """
                    invoke-static/range { v$register .. v$register }, $BUILDINGS_3D_CLASS->flag(Z)Z
                    move-result v$register
                """.trimIndent(),
            )
            buildingsLogger.info("3D buildings: $site reads the flag into v$register at $index through Buildings3d.flag")
        }
    }
}
