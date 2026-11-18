/* Afterglow adaptation of Morphe v2.0.0's theme observer. GPLv3; see NOTICE.
 * Copies the pinned observer body without initializing the unused settings Activity.
 */
package app.afterglow.patches.compat.morphe

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.value.ImmutableIntEncodedValue

internal const val COMPATIBILITY_THEME_OBSERVER = "afterglow_updateLightDarkModeStatus"

internal fun installCompatibilityThemeObserver(utils: MutableClass, source: Method): String {
    require(utils.type == "Lapp/morphe/extension/shared/Utils;")
    require(source.definingClass == "Lapp/morphe/extension/youtube/settings/YouTubeActivityHook;" &&
        source.name == "updateLightDarkModeStatus" && source.parameterTypes == listOf("Ljava/lang/Enum;") &&
        source.returnType == "V" && AccessFlags.STATIC.isSet(source.accessFlags))
    val fieldName = "afterglow_currentThemeValueOrdinal"
    require(utils.methods.none { it.name == COMPATIBILITY_THEME_OBSERVER } && utils.fields.none { it.name == fieldName })
    val body = requireNotNull(source.implementation)
    val relocated = ImmutableMethod(utils.type, COMPATIBILITY_THEME_OBSERVER, source.parameters,
        source.returnType, source.accessFlags, source.annotations, source.hiddenApiRestrictions, body).toMutable()
    val newField = ImmutableFieldReference(utils.type, fieldName, "I")
    var relocatedReads = 0
    var relocatedWrites = 0
    body.instructions.forEachIndexed { index, instruction ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: return@forEachIndexed
        if (field.definingClass != source.definingClass) return@forEachIndexed
        require(field.name == "currentThemeValueOrdinal" && field.type == "I")
        when (instruction.opcode) {
            Opcode.SGET -> relocatedReads++
            Opcode.SPUT -> relocatedWrites++
            else -> error("Unexpected theme ordinal access: ${instruction.opcode}")
        }
        relocated.replaceInstruction(index, BuilderInstruction21c(instruction.opcode,
            (instruction as OneRegisterInstruction).registerA, newField))
    }
    require(relocatedReads == 1 && relocatedWrites == 1) { "Pinned theme observer changed" }
    // The original Activity's <clinit> sets this field to -1. An encoded static value
    // preserves that first-call behavior without referencing either settings Activity.
    utils.fields.add(ImmutableField(utils.type, fieldName, "I",
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, ImmutableIntEncodedValue(-1), null, null).toMutable())
    utils.methods.add(relocated)
    return "${utils.type}->$COMPATIBILITY_THEME_OBSERVER(Ljava/lang/Enum;)V"
}
