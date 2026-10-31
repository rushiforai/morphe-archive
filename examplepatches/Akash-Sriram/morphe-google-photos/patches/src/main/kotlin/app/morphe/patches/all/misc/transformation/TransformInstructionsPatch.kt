/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/all/misc/transformation/TransformInstructionsPatch.kt
 */
package app.morphe.patches.all.misc.transformation

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction

fun <T> transformInstructionsPatch(
    filterMap: (ClassDef, Method, Instruction, Int) -> T?,
    transform: (MutableMethod, T) -> Unit,
) = bytecodePatch {
    execute {
        val matches = mutableListOf<Pair<ClassDef, List<Pair<Method, List<T>>>>>()

        classDefForEach { classDef ->
            var classMatches: MutableList<Pair<Method, List<T>>>? = null

            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                var methodIndices: MutableList<T>? = null
                var index = 0
                for (instruction in impl.instructions) {
                    val match = filterMap(classDef, method, instruction, index)
                    if (match != null) {
                        if (methodIndices == null) methodIndices = mutableListOf()
                        methodIndices.add(match)
                    }
                    index++
                }

                if (methodIndices != null) {
                    if (classMatches == null) classMatches = mutableListOf()
                    classMatches.add(method to methodIndices)
                }
            }

            if (classMatches != null) {
                matches.add(classDef to classMatches)
            }
        }

        for ((classDef, classMatches) in matches) {
            val mutableClass = mutableClassDefBy(classDef)
            for ((method, indices) in classMatches) {
                val mutableMethod = mutableClass.findMutableMethodOf(method)
                for (i in indices.indices.reversed()) {
                    transform(mutableMethod, indices[i])
                }
            }
        }
    }
}
