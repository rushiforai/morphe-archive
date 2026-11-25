package dev.custom.tools

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.instruction.DualReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FieldOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.InlineIndexInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.VtableIndexInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.VerificationErrorInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import java.util.zip.ZipFile

/**
 * Small inspection helper for the Gboard APK used while re-resolving obfuscated patch targets.
 *
 * Usage: DexQuery <apk> <command> [args...]
 *   classes <substring>                 list class descriptors containing the substring
 *   class <descriptor>                  dump a class: fields and methods with signatures
 *   strings <needle> [classSubstring]   find const-string literals containing the needle
 *   sig <returnType> <paramTypesCsv>    list methods with that exact signature shape
 *   refs <methodRef>                    list methods that call the given class->name(...)signature
 */
fun main(args: Array<String>) {
    if (args.size < 2) {
        System.err.println("usage: DexQuery <apk> <command> [args...]")
        return
    }
    val apk = File(args[0])
    val classes = loadClasses(apk)
    when (val command = args[1]) {
        "classes" -> {
            val needle = args[2]
            classes.forEach { classDef ->
                if (classDef.type.contains(needle)) println(classDef.type)
            }
        }
        "class" -> {
            val wanted = args[2]
            classes.filter { it.type == wanted }.forEach { classDef ->
                println("${flags(classDef.accessFlags)} ${classDef.type} super=${classDef.superclass}")
                classDef.fields.forEach { println("  field ${it.type} ${it.name}") }
                classDef.methods.sortedBy { it.name }.forEach { m ->
                    println("  method ${m.returnType} ${m.name}(${m.parameterTypes.joinToString("")}) size=${m.implementation?.instructions?.count() ?: 0} ${flags(m.accessFlags)}")
                }
            }
        }
        "strings" -> {
            val needle = args[2]
            val filter = args.getOrNull(3)
            classes.forEach { classDef ->
                if (filter != null && !classDef.type.contains(filter)) return@forEach
                classDef.methods.forEach { method ->
                    val insns: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction> =
                        method.implementation?.instructions?.toList() ?: emptyList()
                    val hits = insns
                        .filter { it.opcode.name.startsWith("const-string") }
                        .mapNotNull { (it as? ReferenceInstruction)?.reference as? StringReference }
                        .map { it.string }
                        .filter { it.contains(needle, ignoreCase = true) }
                        .toSet()
                    if (hits.isNotEmpty()) {
                        println("${classDef.type}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType} :: ${hits.joinToString(" | ")}")
                    }
                }
            }
        }
        "sig" -> {
            val returnType = args[2]
            val params = args.getOrNull(3).orEmpty()
            val paramList = parseParamList(params)
            classes.forEach { classDef ->
                classDef.methods.forEach { method ->
                    if (method.returnType == returnType && method.parameterTypes == paramList) {
                        println("${classDef.type}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType} size=${method.implementation?.instructions?.count() ?: 0} flags=${flags(method.accessFlags)}")
                    }
                }
            }
        }
        "index" -> {
            classes.forEach { classDef ->
                println("C ${classDef.type} super=${classDef.superclass} flags=${flags(classDef.accessFlags)}")
                classDef.fields.forEach { println("F ${classDef.type} ${it.name}:${it.type}") }
                classDef.methods.forEach { m ->
                    println("M ${classDef.type} ${m.name}(${m.parameterTypes.joinToString("")})${m.returnType} flags=${flags(m.accessFlags)} regs=${m.implementation?.registerCount ?: -1}")
                }
            }
        }
        "fp" -> {
            val wanted = args[2]
            val methodName = args[3]
            classes.filter { it.type == wanted }.forEach { classDef ->
                classDef.methods.filter { it.name == methodName }.forEach { method ->
                    println("$wanted->$methodName(${method.parameterTypes.joinToString("")})${method.returnType} fp=${structuralFingerprint(method)}")
                }
            }
        }
        "insns" -> {
            val wanted = args[2]
            val methodName = args[3]
            classes.filter { it.type == wanted }.forEach { classDef ->
                classDef.methods.filter { it.name == methodName }.forEach { method ->
                    println("--- ${classDef.type}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType} regs=${method.implementation?.registerCount ?: 0} flags=${flags(method.accessFlags)}")
                    method.implementation?.instructions?.forEachIndexed { index, instruction ->
                        val ref = if (instruction is ReferenceInstruction) " " + instruction.reference.toString() else ""
                        val literal = (instruction as? WideLiteralInstruction)?.let { " = " + it.wideLiteral } ?: ""
                        println("  $index: ${instruction.opcode.name}$literal$ref")
                    }
                }
            }
        }
        "retsig" -> {
            val wanted = args[2]
            classes.forEach { classDef ->
                classDef.methods.forEach { method ->
                    if (method.returnType == wanted) {
                        println("${classDef.type}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType} size=${method.implementation?.instructions?.count() ?: 0} flags=${flags(method.accessFlags)}")
                    }
                }
            }
        }
        "paramsig" -> {
            val paramList = parseParamList(args[2])
            val returnFilter = args.getOrNull(3)
            classes.forEach { classDef ->
                classDef.methods.forEach { method ->
                    if (method.parameterTypes == paramList &&
                        (returnFilter == null || method.returnType == returnFilter)) {
                        println("${classDef.type}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType} size=${method.implementation?.instructions?.count() ?: 0} flags=${flags(method.accessFlags)}")
                    }
                }
            }
        }
        "insns" -> {
            // insns <class> <method> <paramList>   e.g. insns Lcom/.../SoftKeyView; onTouchEvent Landroid/view/MotionEvent;
            val wanted = args[2]
            val methodName = args[3]
            val paramList = parseParamList(args.getOrNull(4).orEmpty())
            classes.filter { it.type == wanted }.forEach { classDef ->
                classDef.methods.filter { it.name == methodName && it.parameterTypes == paramList }
                    .forEach { method ->
                        println("${classDef.type}->$methodName(${method.parameterTypes.joinToString("")})${method.returnType} regs=${method.implementation?.registerCount}")
                        method.implementation?.instructions?.forEach { println("  $it") }
                    }
            }
        }
        "newinst" -> {
            // newinst <typeDescriptor>   list methods that instantiate the given type
            val wanted = args[2]
            classes.forEach { classDef ->
                classDef.methods.forEach { method ->
                    val insns = method.implementation?.instructions ?: return@forEach
                    val hit = insns.any { instruction ->
                        instruction.opcode.name == "new-instance" &&
                            (instruction as? ReferenceInstruction)?.reference?.toString() == wanted
                    }
                    if (hit) println("${classDef.type}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType} size=${insns.count()}")
                }
            }
        }
        "match" -> {
            // match <returnType|-> <p0,p1,...|- as wildcard>   e.g. match V Lpwf;,-,Lcom/.../KeyboardDef;
            val returnFilter = args[2].takeIf { it != "-" }
            val paramFilter = args[3].split(',').map { it.trim() }.filter { it.isNotEmpty() }
            classes.forEach { classDef ->
                classDef.methods.forEach { method ->
                    val params = method.parameterTypes.toList()
                    if (params.size != paramFilter.size) return@forEach
                    if (returnFilter != null && method.returnType != returnFilter) return@forEach
                    if (paramFilter.indices.any { i -> paramFilter[i] != "-" && params[i] != paramFilter[i] }) return@forEach
                    println("${classDef.type}->${method.name}(${params.joinToString("")})${method.returnType} size=${method.implementation?.instructions?.count() ?: 0} flags=${flags(method.accessFlags)}")
                }
            }
        }
        "fieldtype" -> {
            val wanted = args[2]
            val classFilter = args.getOrNull(3)
            classes.forEach { classDef ->
                if (classFilter != null && !classDef.type.contains(classFilter)) return@forEach
                val hits = classDef.fields.filter { it.type == wanted }
                if (hits.isNotEmpty()) {
                    println("${classDef.type} :: " + hits.joinToString(", ") { "${it.name}:${it.type}" })
                }
            }
        }
        "refs" -> {
            val ref = args[2]
            val (classType, name) = ref.split("->")
            val bareName = name.substringBefore('(')
            classes.forEach { classDef ->
                classDef.methods.forEach { method ->
                    val insns = method.implementation?.instructions?.toList()
                    val calls = insns?.any { instruction ->
                        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        reference != null && reference.definingClass == classType && reference.name == bareName
                    } ?: false
                    if (calls) println("${classDef.type}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}")
                }
            }
        }
        "idrefs" -> {
            // idrefs <literal>   methods that load the given integer constant (resource ids, pref ids)
            val literal = if (args[2].startsWith("0x")) args[2].substring(2).toLong(16) else args[2].toLong()
            classes.forEach { classDef ->
                classDef.methods.forEach { method ->
                    val insns = method.implementation?.instructions?.toList() ?: return@forEach
                    insns.forEachIndexed { index, instruction ->
                        val value = (instruction as? WideLiteralInstruction)?.wideLiteral ?: return@forEachIndexed
                        if (value != literal) return@forEachIndexed
                        println("${classDef.type}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType} @$index")
                        insns.drop(index).take(4).forEach { println("     $it") }
                    }
                }
            }
        }
        "unresolved" -> {
            // Report every method/field reference that cannot be resolved against the classes in
            // this APK. Generated patch code that still targets a previous release's obfuscated
            // names shows up here instead of failing quietly at runtime.
            val byType = classes.associateBy { it.type }
            var findings = 0

            fun isFramework(type: String) = listOf(
                "Ljava/", "Landroid/", "Ljavax/", "Ldalvik/", "Lsun/",
                "Lorg/json/", "Lorg/w3c/", "Lorg/xml/",
            ).any { prefix -> type.startsWith(prefix) }

            fun hasMethod(
                owner: ClassDef?,
                name: String,
                params: List<String>,
                returnType: String,
                seen: MutableSet<String> = mutableSetOf(),
            ): Boolean {
                // An ancestor that is not shipped in this APK (java.util.*, android.*) cannot be
                // inspected; treat it as resolved instead of reporting a false positive.
                if (owner == null) return true
                if (!seen.add(owner.type)) return false
                if (owner.methods.any { candidate ->
                        candidate.name == name &&
                            candidate.parameterTypes.map(CharSequence::toString) == params &&
                            candidate.returnType == returnType
                    }
                ) {
                    return true
                }
                return hasMethod(byType[owner.superclass], name, params, returnType, seen) ||
                    owner.interfaces.any { hasMethod(byType[it], name, params, returnType, seen) }
            }

            fun hasField(
                owner: ClassDef?,
                name: String,
                type: String,
                seen: MutableSet<String> = mutableSetOf(),
            ): Boolean {
                if (owner == null) return true
                if (!seen.add(owner.type)) return false
                if (owner.fields.any { it.name == name && it.type == type }) return true
                return hasField(byType[owner.superclass], name, type, seen) ||
                    owner.interfaces.any { hasField(byType[it], name, type, seen) }
            }

            fun report(where: String, what: String) {
                findings++
                println("UNRESOLVED $what <- $where")
            }

            classes.forEach { classDef ->
                classDef.methods.forEach { method ->
                    val where = "${classDef.type}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"
                    method.implementation?.instructions?.forEach { instruction ->
                        when (val reference = (instruction as? ReferenceInstruction)?.reference) {
                            is MethodReference -> {
                                // Array types are not class defs; their members come from Object.
                                if (reference.definingClass.startsWith("[")) return@forEach
                                val owner = byType[reference.definingClass]
                                val signature = "${reference.definingClass}->${reference.name}" +
                                    "(${reference.parameterTypes.joinToString("")})" +
                                    reference.returnType
                                if (owner == null) {
                                    if (!isFramework(reference.definingClass)) {
                                        report(where, "class ${reference.definingClass} for $signature")
                                    }
                                } else if (!hasMethod(
                                        owner,
                                        reference.name,
                                        reference.parameterTypes.map(CharSequence::toString),
                                        reference.returnType,
                                    )
                                ) {
                                    report(where, "method $signature")
                                }
                            }

                            is FieldReference -> {
                                val owner = byType[reference.definingClass]
                                if (owner == null) {
                                    if (!isFramework(reference.definingClass)) {
                                        report(where, "class ${reference.definingClass} for field ${reference.name}:${reference.type}")
                                    }
                                } else if (!hasField(owner, reference.name, reference.type)) {
                                    report(where, "field ${reference.definingClass}->${reference.name}:${reference.type}")
                                }
                            }

                            else -> Unit
                        }
                    }
                }
            }
            println("unresolved=$findings")
        }

        else -> System.err.println("unknown command: $command")
    }
}

private fun parseParamList(text: String): List<String> {
    if (text.isBlank()) return emptyList()
    val result = mutableListOf<String>()
    var i = 0
    while (i < text.length) {
        val start = i
        when (text[i]) {
            'L' -> {
                val semi = text.indexOf(';', i)
                if (semi == -1) { i = text.length } else { i = semi + 1; result.add(text.substring(start, i)) }
            }
            '[' -> i++
            else -> { i++; result.add(text.substring(start, i)) }
        }
    }
    return result
}

private fun loadClasses(apk: File): List<ClassDef> {
    val result = mutableListOf<ClassDef>()
    ZipFile(apk).use { zip ->
        val entries = zip.entries().toList().filter { it.name.endsWith(".dex") }
        for (entry in entries) {
            val bytes = zip.getInputStream(entry).use { it.readBytes() }
            val dex = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), bytes.inputStream())
            result += dex.classes
        }
    }
    return result
}

private fun Method.referenceSignature(): String {
    val ref = this as MethodReference
    return "${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}"
}

private fun flags(value: Int): String = "0x" + Integer.toHexString(value)

private fun structuralFingerprint(method: Method): String {
    val impl = method.implementation ?: return "no-implementation"
    val canonical = buildString {
        append("registers=").append(impl.registerCount)
        impl.instructions.forEachIndexed { index, instruction ->
            append('\n').append(index).append(':').append(instruction.opcode.name)
            when (instruction) {
                is RegisterRangeInstruction -> append("|range=")
                    .append(instruction.startRegister).append(',').append(instruction.registerCount)
                is FiveRegisterInstruction -> append("|registers=")
                    .append(instruction.registerCount).append(',')
                    .append(instruction.registerC).append(',').append(instruction.registerD)
                    .append(',').append(instruction.registerE).append(',')
                    .append(instruction.registerF).append(',').append(instruction.registerG)
                is ThreeRegisterInstruction -> append("|registers=")
                    .append(instruction.registerA).append(',').append(instruction.registerB)
                    .append(',').append(instruction.registerC)
                is TwoRegisterInstruction -> append("|registers=")
                    .append(instruction.registerA).append(',').append(instruction.registerB)
                is OneRegisterInstruction -> append("|register=").append(instruction.registerA)
            }
            if (instruction is ReferenceInstruction) append("|reference=").append(instruction.reference)
            if (instruction is DualReferenceInstruction) append("|reference2=").append(instruction.reference2)
            if (instruction is WideLiteralInstruction) append("|literal=").append(instruction.wideLiteral)
            if (instruction is OffsetInstruction) append("|offset=").append(instruction.codeOffset)
            if (instruction is FieldOffsetInstruction) append("|fieldOffset=").append(instruction.fieldOffset)
            if (instruction is VtableIndexInstruction) append("|vtableIndex=").append(instruction.vtableIndex)
            if (instruction is InlineIndexInstruction) append("|inlineIndex=").append(instruction.inlineIndex)
            if (instruction is SwitchPayload) {
                append("|switch=")
                instruction.switchElements.forEach { element -> append(element.key).append('@').append(element.offset).append(',') }
            }
            if (instruction is ArrayPayload) {
                append("|array=").append(instruction.elementWidth).append(':')
                instruction.arrayElements.forEach { element -> append(element).append(',') }
            }
        }
        impl.tryBlocks.forEach { tryBlock ->
            append("\ntry=").append(tryBlock.startCodeAddress).append(',')
                .append(tryBlock.codeUnitCount).append(':')
            tryBlock.exceptionHandlers.forEach { handler ->
                append(handler.exceptionType).append('@').append(handler.handlerCodeAddress).append(',')
            }
        }
    }
    val digest = java.security.MessageDigest.getInstance("SHA-256").digest(canonical.toByteArray(Charsets.UTF_8))
    return digest.joinToString("") { byte -> "%02x".format(byte) }
}
