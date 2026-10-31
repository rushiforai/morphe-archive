package dev.jibon.notes.patches.compat

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.util.ReferenceUtil
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES
import java.util.logging.Logger

/** One row of `notes/redirects.tsv`: a framework member One UI has and AOSP lacks, and what replaces it. */
private class Redirect(val kind: String, val target: String)

private fun loadRedirects(): Map<String, Redirect> {
    val stream = object {}.javaClass.classLoader.getResourceAsStream("notes/redirects.tsv")
        ?: throw PatchException("notes/redirects.tsv not found")
    return stream.bufferedReader().useLines { lines ->
        lines.filter { it.isNotBlank() && !it.startsWith("#") }.associate { line ->
            val (kind, from, to) = line.split('\t')
            key(kind.substringBefore('-').takeLast(3), from) to Redirect(kind, to)
        }
    }
}

private fun parseMethod(descriptor: String): MethodReference {
    val owner = descriptor.substringBefore("->")
    val rest = descriptor.substringAfter("->")
    val name = rest.substringBefore('(')
    val params = rest.substringAfter('(').substringBefore(')')
    val returnType = rest.substringAfter(')')
    val paramList = mutableListOf<String>()
    var i = 0
    while (i < params.length) {
        val start = i
        while (params[i] == '[') i++
        i = if (params[i] == 'L') params.indexOf(';', i) + 1 else i + 1
        paramList += params.substring(start, i)
    }
    return ImmutableMethodReference(owner, name, paramList, returnType)
}

private fun parseField(descriptor: String): FieldReference {
    val owner = descriptor.substringBefore("->")
    val rest = descriptor.substringAfter("->")
    return ImmutableFieldReference(owner, rest.substringBefore(':'), rest.substringAfter(':'))
}

/** Table key: access ("get"/"put" for fields, "oke" for invokes) + reference; a field can have a read and a write row. */
private fun key(access: String, descriptor: String) = "$access $descriptor"

private fun Instruction.redirectKey(): String? {
    val descriptor = referenceDescriptor() ?: return null
    val op = (opcode as Enum<*>).name
    val access = when {
        op.startsWith("INVOKE") -> "oke"
        op.startsWith("IGET") || op.startsWith("SGET") -> "get"
        op.startsWith("IPUT") || op.startsWith("SPUT") -> "put"
        else -> return null
    }
    return key(access, descriptor)
}

/** The descriptor of a method/field reference ("Lcls;->name(...)R" / "Lcls;->name:T"), or null. */
private fun Instruction.referenceDescriptor(): String? {
    val reference = (this as? ReferenceInstruction)?.reference ?: return null
    return when (reference) {
        is MethodReference, is FieldReference -> ReferenceUtil.getReferenceString(reference)
        else -> null
    }
}

/** Builds the replacement for [instruction], or null if it can't be replaced in place. */
private fun replacementFor(instruction: Instruction, redirect: Redirect): BuilderInstruction? {
    // Opcode has a Java field `name` (the smali mnemonic) that shadows Enum.name in Kotlin.
    val op = (instruction.opcode as Enum<*>).name
    if (redirect.target == "nop") return BuilderInstruction10x(Opcode.NOP)
    return when {
        // invoke-virtual/interface/static -> invoke-static on the shim; the receiver becomes the first argument.
        instruction is FiveRegisterInstruction && op.startsWith("INVOKE_") -> instruction.run {
            BuilderInstruction35c(
                Opcode.INVOKE_STATIC, registerCount, registerC, registerD, registerE, registerF, registerG,
                parseMethod(redirect.target),
            )
        }
        instruction is RegisterRangeInstruction && op.startsWith("INVOKE_") -> instruction.run {
            BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, startRegister, registerCount, parseMethod(redirect.target))
        }
        // iget/sget of a missing field -> sget of a static field on the shim (same value type).
        (op.startsWith("IGET") || op.startsWith("SGET")) && instruction is OneRegisterInstruction ->
            BuilderInstruction21c(
                Opcode.valueOf(op.replaceFirst("IGET", "SGET")),
                instruction.registerA,
                parseField(redirect.target),
            )
        else -> null
    }
}

@Suppress("unused")
val frameworkCompatPatch = bytecodePatch(
    name = "Samsung framework compatibility",
    description = "Adds stand-ins for One UI framework classes and redirects calls to One UI-only " +
        "methods and fields, so the app runs on non-Samsung Android.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTES)

    // Hand-written Java (backup, sync, pen buttons, content-resolver wrapper) and the generated stubs + Shim.
    extendWith("extensions/extension.mpe")
    extendWith("extensions/compat-stubs.mpe")

    execute {
        val redirects = loadRedirects()

        // Find the classes first; making a class mutable while iterating is not allowed.
        val toPatch = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lsamsungcompat/")) return@classDefForEach
            val hit = classDef.methods.any { method ->
                method.implementation?.instructions?.any { it.redirectKey() in redirects } == true
            }
            if (hit) toPatch += classDef
        }

        var replaced = 0
        val skipped = mutableSetOf<String>()
        toPatch.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                implementation.instructions.forEachIndexed { index, instruction ->
                    val descriptor = instruction.redirectKey() ?: return@forEachIndexed
                    val redirect = redirects[descriptor] ?: return@forEachIndexed
                    val replacement = replacementFor(instruction, redirect)
                    if (replacement == null) {
                        skipped += "${instruction.opcode} $descriptor"
                    } else {
                        implementation.replaceInstruction(index, replacement)
                        replaced++
                    }
                }
            }
        }
        Logger.getLogger(this::class.java.name).info(
            "Framework compatibility: $replaced instructions in ${toPatch.size} classes" +
                if (skipped.isEmpty()) "" else ", not replaceable: $skipped",
        )
    }
}
