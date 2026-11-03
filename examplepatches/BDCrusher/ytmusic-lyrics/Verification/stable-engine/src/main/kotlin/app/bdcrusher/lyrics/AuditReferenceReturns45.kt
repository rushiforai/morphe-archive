/* Copyright 2026 BDCrusher. GPL-3.0. Desktop DEX analysis, not ART acceptance. */
package app.bdcrusher.lyrics

import java.io.DataInputStream
import java.io.File
import java.security.MessageDigest
import java.util.zip.ZipFile
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.analysis.*
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.*
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef

private fun hash45(file: File) = MessageDigest.getInstance("SHA-256").digest(file.readBytes()).joinToString("") { "%02x".format(it) }

/** SDK hierarchy only. DEX instructions supply field and method result types directly. */
private fun sdk45(): Map<String, ClassDef> {
    val out = mutableMapOf<String, ClassDef>()
    ZipFile(File(System.getenv("ANDROID_HOME"), "platforms/android-36/android.jar")).use { jar ->
        for (entry in jar.entries().asSequence().filter { it.name.endsWith(".class") }) {
            DataInputStream(jar.getInputStream(entry)).use { input ->
                require(input.readInt() == 0xcafebabe.toInt())
                input.readUnsignedShort(); input.readUnsignedShort()
                val pool = arrayOfNulls<Any>(input.readUnsignedShort()); var n = 1
                while (n < pool.size) {
                    when (input.readUnsignedByte()) {
                        1 -> pool[n] = input.readUTF()
                        7 -> pool[n] = input.readUnsignedShort()
                        3, 4 -> input.skipNBytes(4)
                        5, 6 -> { input.skipNBytes(8); n++ }
                        8, 16, 19, 20 -> input.skipNBytes(2)
                        9, 10, 11, 12, 17, 18 -> input.skipNBytes(4)
                        15 -> input.skipNBytes(3)
                        else -> error("Unsupported SDK constant pool")
                    }; n++
                }
                fun type(index: Int) = "L${pool[pool[index] as Int] as String};"
                val flags = input.readUnsignedShort(); val name = type(input.readUnsignedShort())
                val parent = input.readUnsignedShort().let { if (it == 0) null else type(it) }
                val interfaces = List(input.readUnsignedShort()) { type(input.readUnsignedShort()) }
                out[name] = ImmutableClassDef(name, flags, parent, interfaces, null, null, null, null)
            }
        }
    }
    return out
}

private fun assignable45(actual: String, expected: String, types: Map<String, ClassDef>, seen: MutableSet<String> = mutableSetOf()): Boolean {
    if (actual == expected || expected == "Ljava/lang/Object;") return true
    if (!seen.add(actual)) return false
    if (actual.startsWith("[")) {
        if (expected in setOf("Ljava/lang/Cloneable;", "Ljava/io/Serializable;")) return true
        return expected.startsWith("[") && actual.substring(1).let { element ->
            if (element.startsWith("L") || element.startsWith("[")) assignable45(element, expected.substring(1), types)
            else element == expected.substring(1)
        }
    }
    val definition = types[actual] ?: error("Missing hierarchy for $actual -> $expected")
    return (definition.interfaces + listOfNotNull(definition.superclass)).any { assignable45(it, expected, types, seen) }
}

/** Execute the actual small native content bridge against absent/wrong/right host fixtures. */
private fun contentCases45(method: Method): Int {
    val code = method.implementation!!.instructions.toList()
    val addresses = mutableMapOf<Int, Int>(); var address = 0
    code.forEachIndexed { n, instruction -> addresses[address] = n; address += instruction.codeUnits }
    val starts = addresses.entries.associate { it.value to it.key }
    val cases = listOf(false to 0, true to 0, true to 1, true to 2)
    for ((rootPresent, content) in cases) {
        val registers = IntArray(method.implementation!!.registerCount); var at = 0; var result = 0; var steps = 0; var returned = false
        while (at in code.indices) {
            require(++steps < 40)
            val i = code[at]
            fun branch() { at = addresses.getValue(starts.getValue(at) + (i as OffsetInstruction).codeOffset) }
            when (i.opcode) {
                Opcode.IGET_OBJECT -> registers[(i as TwoRegisterInstruction).registerA] = if (rootPresent) 3 else 0
                Opcode.CONST, Opcode.CONST_4, Opcode.CONST_16 -> registers[(i as OneRegisterInstruction).registerA] = (i as NarrowLiteralInstruction).narrowLiteral
                Opcode.IF_EQZ -> if (registers[(i as OneRegisterInstruction).registerA] == 0) { branch(); continue }
                Opcode.INVOKE_VIRTUAL -> {
                    require((i as ReferenceInstruction).reference.let { it is MethodReference && it.name == "findViewById" })
                    require(registers[(i as FiveRegisterInstruction).registerC] == 3); result = content
                }
                Opcode.MOVE_RESULT_OBJECT -> registers[(i as OneRegisterInstruction).registerA] = result
                Opcode.INSTANCE_OF -> { i as TwoRegisterInstruction; registers[i.registerA] = if (registers[i.registerB] == 2) 1 else 0 }
                Opcode.CHECK_CAST -> require(registers[(i as OneRegisterInstruction).registerA] in setOf(0, 2)) { "Non-container reaches cast" }
                Opcode.RETURN_OBJECT -> {
                    require(registers[(i as OneRegisterInstruction).registerA] == if (rootPresent && content == 2) 2 else 0)
                    returned = true; break
                }
                else -> error("Unexpected content bridge instruction: ${i.opcode}")
            }
            at++
        }
        require(returned)
    }
    return cases.size
}

fun main(args: Array<String>) {
    val sdk = sdk45(); val expectedFailure = args.getOrNull(1) == "expect-released-failure"
    val home = File(System.getProperty("user.dir")).resolve("../..").canonicalFile
    for (line in File(args[0]).readLines().filter { it.isNotBlank() }) {
        val apk = File(line)
        val classes = ZipFile(apk).use { zip -> zip.entries().asSequence().filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }.flatMap { DexBackedDexFile.fromInputStream(null, zip.getInputStream(it).buffered()).classes.asSequence() }.associateBy { it.type } }
        val types = sdk + classes
        val path = ClassPath(ClassProvider { types[it] })
        val owned = "Lapp/bdcrusher/ytmusic/playlists/"
        val special = setOf("createRequest", "decode", "decodePlayer", "fileUri")
        val methods = classes.values.flatMap { it.methods }.filter { method ->
            method.implementation != null && (method.name.startsWith("bd_") || method.definingClass.startsWith(owned) && method.name in special)
        }
        require(methods.isNotEmpty())
        var returns = 0; val failures = mutableListOf<String>()
        for (method in methods) {
            val analyzer = MethodAnalyzer(path, method, null, false)
            val error = analyzer.analysisException
            if (error != null) { failures += "$method analysis: ${error.message}"; continue }
            for (instruction in analyzer.analyzedInstructions) {
                if (instruction.instruction.opcode != Opcode.RETURN_OBJECT || instruction.predecessorCount == 0) continue
                returns++
                val register = (instruction.instruction as OneRegisterInstruction).registerA
                val type = instruction.getPreInstructionRegisterType(register)
                val declaredReference = method.returnType.startsWith("L") || method.returnType.startsWith("[")
                val valid = declaredReference && (type.category == RegisterType.NULL || type.category == RegisterType.REFERENCE && assignable45(type.type!!.type, method.returnType, types))
                if (!valid) failures += "$method @${instruction.instructionIndex}: $type cannot return ${method.returnType}"
            }
        }
        val host = classes.values.single { owned + "DownloadsHost\$Owner;" in it.interfaces }
        val content = host.methods.single { it.name == "bd_downloadContent" }
        if (expectedFailure) {
            require(failures.any { it.contains("bd_downloadContent") && it.contains("Landroid/view/ViewGroup;") }) { "Released regression was not reproduced: $failures" }
        } else require(failures.isEmpty()) { failures.joinToString("\n") }
        val cases = if (expectedFailure) 0 else contentCases45(content)
        val report = apk.parentFile.resolve(if (expectedFailure) "reference-returns45-released-regression-final.json" else "reference-returns45-audit.json")
        require(!report.exists())
        val escaped = failures.joinToString(",") { "\"" + it.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n") + "\"" }
        report.writeText("""{"passed":${!expectedFailure},"releasedRegressionReproduced":$expectedFailure,"apkSha256":"${hash45(apk)}","sdkSha256":"${hash45(File(System.getenv("ANDROID_HOME"), "platforms/android-36/android.jar"))}","bridgeMethods":${methods.size},"referenceReturns":$returns,"contentBranchCases":$cases,"failures":[$escaped],"phoneVerified":false,"scope":"dexlib control-flow/register types plus SDK hierarchy; not full ART verification"}
""")
        println("PASS: ${apk.parentFile.name}: ${methods.size} bridge methods, $returns reference returns, $cases content cases; releasedRegression=$expectedFailure")
    }
}
