package app.afterglow.patches.compat.morphe

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File

private var checks = 0
private fun verify(value: Boolean, message: String) {
    checks++
    check(value) { message }
}

private fun operands(op: Instruction): List<Any> = buildList {
    add(op.opcode); add(op.codeUnits)
    if (op is OneRegisterInstruction) add(op.registerA)
    if (op is TwoRegisterInstruction) add(op.registerB)
    if (op is ThreeRegisterInstruction) add(op.registerC)
    if (op is FiveRegisterInstruction) addAll(listOf(op.registerCount, op.registerC, op.registerD,
        op.registerE, op.registerF, op.registerG))
    if (op is RegisterRangeInstruction) addAll(listOf(op.startRegister, op.registerCount))
    if (op is OffsetInstruction) add(op.codeOffset)
    if (op is WideLiteralInstruction) add(op.wideLiteral)
}

private fun verifyBody(source: Method, relocated: Method) {
    val original = requireNotNull(source.implementation)
    val actual = requireNotNull(relocated.implementation)
    verify(original.registerCount == actual.registerCount, "Preserve register count")
    val before = original.instructions.toList()
    val after = actual.instructions.toList()
    verify(before.size == 15 && after.size == before.size, "Exact pinned observer body")
    before.zip(after).forEachIndexed { index, (old, new) ->
        verify(operands(old) == operands(new), "Preserve opcode/registers/branches at $index")
        val oldRef = (old as? ReferenceInstruction)?.reference
        val newRef = (new as? ReferenceInstruction)?.reference
        if (oldRef is FieldReference && oldRef.definingClass == source.definingClass) {
            verify(newRef is FieldReference && newRef.definingClass == relocated.definingClass &&
                newRef.name == "afterglow_currentThemeValueOrdinal" && newRef.type == "I", "Relocate cached ordinal")
        } else {
            verify(oldRef == newRef, "Preserve setter and last-theme persistence reference at $index")
        }
        verify(newRef?.toString()?.contains("ActivityHook;") != true, "No settings Activity initialization at $index")
    }
}

fun main(args: Array<String>) {
    val extensions = File(args[0])
    fun load(file: String, type: String): ClassDef = DexFileFactory.loadDexFile(File(extensions, file),
        Opcodes.getDefault()).classes.single { it.type == type }
    val utilsOriginal = load("shared-youtube.mpe", "Lapp/morphe/extension/shared/Utils;")
    val activity = load("youtube.mpe", "Lapp/morphe/extension/youtube/settings/YouTubeActivityHook;")
    val source = activity.methods.single { it.name == "updateLightDarkModeStatus" }
    val utils = MutableClass(utilsOriginal)
    val descriptor = installCompatibilityThemeObserver(utils, source)
    verify(descriptor == "Lapp/morphe/extension/shared/Utils;->afterglow_updateLightDarkModeStatus(Ljava/lang/Enum;)V",
        "Observer targets Utils")
    verify(utils.superclass == "Ljava/lang/Object;", "Observer owner has no settings Activity superclass")
    val moved = utils.methods.single { it.name == COMPATIBILITY_THEME_OBSERVER }
    verifyBody(source, moved)
    val field = utils.fields.single { it.name == "afterglow_currentThemeValueOrdinal" }
    verify((field.initialValue as IntEncodedValue).value == -1, "First theme must update even when its ordinal is zero")
    verify(utilsOriginal.methods.count() + 1 == utils.methods.size, "No original methods replaced")
    verify(utilsOriginal.fields.count() + 1 == utils.fields.size, "No original fields replaced")
    val dex = File(args[1], "theme-observer.dex")
    DexPool.writeTo(dex.path, ImmutableDexFile(Opcodes.getDefault(), listOf(utils)))
    val roundTrip = DexFileFactory.loadDexFile(dex, Opcodes.getDefault()).classes.single()
    verifyBody(source, roundTrip.methods.single { it.name == COMPATIBILITY_THEME_OBSERVER })
    verify((roundTrip.fields.single { it.name == field.name }.initialValue as IntEncodedValue).value == -1,
        "DEX serialization preserves the initial cached ordinal")
    verify(source.implementation!!.instructions.filterIsInstance<ReferenceInstruction>()
        .map { it.reference }.filterIsInstance<FieldReference>()
        .count { it.definingClass == activity.type && it.name == "currentThemeValueOrdinal" } == 2,
        "Original Activity observer remains unchanged")
    println("PASS: $checks observer relocation checks; exact body and DEX round trip")
}
