package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

// Cluster colors follow the car (part of the core patch, with the color scheme). The cluster map
// (EmbeddedClusterActivity) gets its "car maker wants night" flag from the car maker's instrument
// cluster settings, read from a system content provider that BYD does not have. Without those
// settings the cluster's settings observer falls back to the map style (night for styles 2, 5 and 6).
// On a BYD Seal that fallback said night all day, so the cluster map stayed in night colors while the
// main map and everything else followed the car's day/night setting. Both fallback reads in the
// observer pass through ColorScheme.oemNight, which gives "not night" while Color scheme is on (Maps'
// value when it is switched off): the cluster map then follows the same night value as the main map
// (the system configuration, or ColorScheme's choice). A car maker setting that is actually sent still
// applies. The observer also serves the main map's night mode controller, which gets the same value.
// Required: a missing anchor, an ambiguity or an unknown layout fails the patch.

// The observer's dump title, printed by its dump method.
private const val CLUSTER_OBSERVER_TITLE = "ClusterOemMapsSettingsObserver:"
// The fallback maps the style to night for these values (night styles), see the class comment.
private val NIGHT_STYLE_VALUES = setOf(2, 5, 6)
private const val EXPECTED_FALLBACK_CALLS = 2
private val clusterNightLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.ClusterNightPatch")

internal fun BytecodePatchContext.useCarColorsOnCluster() {
    requireExtensionMethod(COLOR_SCHEME_CLASS, "oemNight", listOf("Z"), "Z")
    val observer = clusterSettingsObserver()
    val fallback = styleFallback(observer)
    var patched = 0
    observer.methods.toList().forEach { method ->
        val code = method.implementation?.instructions?.toList() ?: return@forEach
        // Collect the result registers first; inserting shifts the indexes, so patch from the end.
        val sites = code.indices.filter { i -> methodKey(code[i]) == fallback }.map { i ->
            val result = code.getOrNull(i + 1)
            if (result?.opcode != Opcode.MOVE_RESULT) {
                throw PatchException("The night fallback call in $method is not followed by move-result")
            }
            i + 1 to (result as OneRegisterInstruction).registerA
        }
        if (sites.isEmpty()) return@forEach
        val mutable = mutableMethodOf(method)
        sites.sortedByDescending { it.first }.forEach { (index, register) ->
            mutable.addInstructions(
                index + 1,
                """
                    invoke-static/range { v$register .. v$register }, $COLOR_SCHEME_CLASS->oemNight(Z)Z
                    move-result v$register
                """,
            )
            patched++
        }
    }
    if (patched != EXPECTED_FALLBACK_CALLS) {
        throw PatchException("Expected $EXPECTED_FALLBACK_CALLS night fallback reads in ${observer.type}, patched $patched")
    }
    clusterNightLogger.info("Cluster colors: observer ${observer.type}, fallback $fallback, $patched reads")
}

// The one class whose dump prints the cluster settings observer's title.
private fun BytecodePatchContext.clusterSettingsObserver(): ClassDef {
    val found = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        if (classDef.methods.any { method ->
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == CLUSTER_OBSERVER_TITLE
                } == true
            }
        ) {
            found += classDef
        }
    }
    return found.singleOrNull()
        ?: throw PatchException("Expected one cluster settings observer, found ${found.joinToString { it.type }}")
}

// The observer's night fallback: a static (settings)Z method of another class whose code compares the
// style with the night values. Exactly one such method may be called from the observer.
private fun BytecodePatchContext.styleFallback(observer: ClassDef): String {
    val candidates = observer.methods.flatMap { method ->
        method.implementation?.instructions?.filter { it.opcode == Opcode.INVOKE_STATIC }.orEmpty().mapNotNull {
            ((it as ReferenceInstruction).reference as MethodReference).takeIf { call ->
                call.returnType == "Z" && call.parameterTypes.size == 1 &&
                    call.parameterTypes.single().toString().startsWith("L") && call.definingClass != observer.type
            }
        }
    }.distinctBy { methodKey(it) }.filter { call ->
        val target = classDefByOrNull(call.definingClass)?.methods?.singleOrNull { it.matches(call) }
        target != null && comparesNightStyles(target)
    }
    val call = candidates.singleOrNull()
        ?: throw PatchException("Expected one night fallback called from ${observer.type}, found ${candidates.joinToString { methodKey(it) }}")
    return methodKey(call)
}

private fun comparesNightStyles(method: Method): Boolean {
    val literals = method.implementation?.instructions
        ?.filterIsInstance<NarrowLiteralInstruction>()?.map { it.narrowLiteral }?.toSet().orEmpty()
    return NIGHT_STYLE_VALUES.all { it in literals }
}

private fun Method.matches(call: MethodReference) =
    name == call.name && returnType == call.returnType &&
        parameterTypes.map { it.toString() } == call.parameterTypes.map { it.toString() }

private fun methodKey(call: MethodReference) =
    call.definingClass + "->" + call.name + call.parameterTypes.joinToString("", "(", ")") + call.returnType

private fun methodKey(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction): String? =
    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let { methodKey(it) }
