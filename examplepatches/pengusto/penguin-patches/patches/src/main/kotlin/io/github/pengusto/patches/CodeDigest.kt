package io.github.pengusto.patches

import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.DualReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import java.security.MessageDigest

// Compatibility guard for original APK classes. Hashing a DexPool-written dex ties the
// value to the dexlib2 bundled with the patcher: Manager 2.x / Desktop 1.19 serialize
// identical code differently from Desktop 1.18. Hash a canonical text form instead.
// It covers class shape, fields, method signatures, registers, every instruction with
// its operands and references, payloads and try blocks; debug information is ignored.
internal fun ClassDef.codeDigest(include: (Method) -> Boolean = { true }): String {
    val text = buildString {
        appendLine("C $type f=$accessFlags s=$superclass i=$interfaces a=${annotations.map { it.type }.sorted()}")
        fields.sortedBy { it.name + it.type }.forEach { appendLine("F ${it.name}:${it.type} f=${it.accessFlags}") }
        methods.filter(include).sortedBy { it.name + it.parameterTypes + it.returnType }.forEach { m ->
            appendLine("M ${m.name}(${m.parameterTypes.joinToString("")})${m.returnType} f=${m.accessFlags}")
            val code = m.implementation ?: return@forEach
            appendLine("R ${code.registerCount}")
            code.instructions.forEach { i ->
                append("  ${i.opcode.name}")
                if (i is OneRegisterInstruction) append(" a=${i.registerA}")
                if (i is TwoRegisterInstruction) append(" b=${i.registerB}")
                if (i is ThreeRegisterInstruction) append(" c=${i.registerC}")
                if (i is FiveRegisterInstruction) append(" n=${i.registerCount}:${i.registerC},${i.registerD},${i.registerE},${i.registerF},${i.registerG}")
                if (i is RegisterRangeInstruction) append(" r=${i.startRegister}+${i.registerCount}")
                if (i is WideLiteralInstruction) append(" l=${i.wideLiteral}")
                if (i is OffsetInstruction) append(" o=${i.codeOffset}")
                if (i is ReferenceInstruction) append(" ref=${i.reference}")
                if (i is DualReferenceInstruction) append(" ref2=${i.reference2}")
                if (i is SwitchPayload) append(" sw=${i.switchElements.map { it.key to it.offset }}")
                if (i is ArrayPayload) append(" arr=${i.elementWidth}:${i.arrayElements}")
                appendLine()
            }
            code.tryBlocks.forEach { t ->
                appendLine("  T ${t.startCodeAddress}+${t.codeUnitCount} ${t.exceptionHandlers.map { it.exceptionType to it.handlerCodeAddress }}")
            }
        }
    }
    return MessageDigest.getInstance("SHA-256").digest(text.toByteArray()).joinToString("") { "%02x".format(it) }
}
