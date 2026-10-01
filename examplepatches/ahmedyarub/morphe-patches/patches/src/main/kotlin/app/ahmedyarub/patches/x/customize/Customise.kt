package app.ahmedyarub.patches.x.customize

import app.ahmedyarub.patches.x.shared.EXTENSION_PACKAGE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchBuilder
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val CUSTOMISE_CLASS = "$EXTENSION_PACKAGE/Customise;"

/** A placeholder in the extension that returns the keys a patch hides. */
internal class CustomiseSetting(name: String) : Fingerprint(definingClass = CUSTOMISE_CLASS, name = name)

/** One option per item a Customize patch can hide, keyed by the key the extension matches on. */
internal fun BytecodePatchBuilder.hideOptions(items: Map<String, String>): Map<String, Option<Boolean>> =
    items.mapValues { (key, title) ->
        booleanOption(
            key = "hide${key.replaceFirstChar { it.uppercase() }}",
            default = false,
            title = "Hide $title",
        )
    }

/** Writes the keys whose options are on into [setting]. */
context(_: BytecodePatchContext)
internal fun Map<String, Option<Boolean>>.writeHidden(setting: CustomiseSetting, keyOf: (String) -> String = { it }) {
    setting.method.returnEarly(filterValues { it.value == true }.keys.joinToString(",", transform = keyOf))
}

/**
 * The class a data class toString belongs to, e.g. "Tab(homeTabType=". The tab and item types are
 * found this way: their names do not survive R8, their toString text does.
 */
internal class ToStringFingerprint(prefix: String) : Fingerprint(name = "toString", strings = listOf(prefix))

/**
 * Filters every array of [itemType] the app builds with filled-new-array, right after it is
 * built and before it becomes a list, through [extensionMethod] (Object[]) -> Object[].
 */
context(context: BytecodePatchContext)
internal fun filterArraysOf(itemType: String, extensionMethod: String): Int {
    val arrayType = "[$itemType"
    var patched = 0

    context.classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val builds = method.implementation?.instructions?.any { instruction ->
                instruction.opcode.let { it == Opcode.FILLED_NEW_ARRAY || it == Opcode.FILLED_NEW_ARRAY_RANGE } &&
                    instruction.getReference<TypeReference>()?.type == arrayType
            } ?: false
            if (!builds) return@forEach

            context.mutableClassDefBy(classDef).methods.first {
                it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
            }.apply {
                instructions
                    .filter { instruction ->
                        instruction.opcode.let { it == Opcode.FILLED_NEW_ARRAY || it == Opcode.FILLED_NEW_ARRAY_RANGE } &&
                            instruction.getReference<TypeReference>()?.type == arrayType
                    }
                    .map { it.location.index }
                    .sortedDescending()
                    .forEach { arrayIndex ->
                        val moveResult = instructions[arrayIndex + 1]
                        if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("$arrayType is built but not kept")
                        val array = (moveResult as OneRegisterInstruction).registerA

                        addInstructions(
                            arrayIndex + 2,
                            """
                            invoke-static/range { v$array .. v$array }, $CUSTOMISE_CLASS->$extensionMethod([Ljava/lang/Object;)[Ljava/lang/Object;
                            move-result-object v$array
                            """,
                        )
                        patched++
                    }
            }
        }
    }

    if (patched == 0) throw PatchException("The app builds no $arrayType")
    return patched
}
