package app.v4n1x.patches.soundcloud.premium

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.loadPatchesFromJar
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11n
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.runBlocking
import java.io.ByteArrayInputStream
import java.io.File
import java.util.zip.ZipFile

private const val FEATURE_CLASS = "Lcom/soundcloud/android/configuration/plans/Feature;"
private val featureParameters = listOf("Ljava/lang/String;", "Z", "Ljava/util/List;")

fun main(args: Array<String>) {
    val method = MutableMethod(ImmutableMethod(
        FEATURE_CLASS,
        "<init>",
        featureParameters.map { ImmutableMethodParameter(it, emptySet(), null) },
        "V",
        AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
        emptySet(),
        emptySet(),
        MutableMethodImplementation(4),
    ))
    method.addInstructions(0, """
        invoke-direct {p0}, Ljava/lang/Object;-><init>()V
        return-void
    """.trimIndent())
    val patched = method.enablePremiumFeatures()
    check(patched.implementation!!.registerCount == method.implementation!!.registerCount + 1)
    verifyFeatureConstructor(patched)

    // Re-read the actual encoded offsets, not just the in-memory builder labels.
    val classDef = ImmutableClassDef(
        FEATURE_CLASS, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", emptyList(),
        null, emptySet(), emptyList(), listOf(patched),
    )
    val pool = DexPool(Opcodes.getDefault())
    pool.internClass(classDef)
    val store = MemoryDataStore()
    val data = try {
        pool.writeTo(store)
        store.data
    } finally {
        store.close()
    }
    val encodedMethod = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), ByteArrayInputStream(data))
        .classes.single().methods.single()
    verifyFeatureConstructor(encodedMethod)
    println("SoundCloud Feature constructor regression passed before and after DEX serialization.")
    args.singleOrNull()?.let { verifyOriginalApk(File(it)) }
}

internal fun verifyFeatureConstructor(method: Method) {
    val implementation = checkNotNull(method.implementation)
    val instructions = implementation.instructions.toList()
    check(instructions.filter { it.opcode.name.startsWith("IF_") }.all {
        (it as OffsetInstruction).codeOffset != 0
    }) { "The rebuilt constructor contains a zero-offset conditional branch." }
    val addresses = mutableListOf<Int>()
    var address = 0
    instructions.forEach { addresses += address; address += it.codeUnits }
    // Only the first 15 instructions are injected feature checks. The original
    // constructor can contain additional branches (e.g. nullable tier lists).
    val branchIndices = (0..14).filter { instructions[it].opcode == Opcode.IF_EQZ }
    check(branchIndices == listOf(3, 8, 13)) { "Expected all three injected feature checks." }
    branchIndices.forEach { index ->
        val offset = (instructions[index] as OffsetInstruction).codeOffset
        check(offset != 0) {
            "Issue #2: branch offset of zero not allowed at 0x${addresses[index].toString(16)}."
        }
        val targetIndex = addresses.indexOf(addresses[index] + offset)
        check(targetIndex == index + 2) { "Feature branch must skip only const/4 p2, 0x1 (target $targetIndex, expected ${index + 2})." }
        check(instructions[index + 1].opcode == Opcode.CONST_4)
    }
    val originalBodyIndex = branchIndices.last() + 2
    val registerCount = implementation.registerCount
    val p0 = registerCount - 4
    check(p0 > 0) { "Scratch v0 must not alias p0 (this)." }
    val p1 = registerCount - 3
    val p2 = registerCount - 2
    val p3 = registerCount - 1
    val features = listOf("offline_sync", "no_audio_ads", "hq_audio")
    for (name in features + listOf("unrelated_feature", "", "offline_sync_extra")) {
        for (originalEnabled in listOf(false, true)) {
            val registers = mutableMapOf<Int, Any>(p0 to "unchanged-this", p1 to name, p2 to if (originalEnabled) 1 else 0, p3 to "unchanged-list")
            var result = 0
            var index = 0
            var steps = 0
            while (index < originalBodyIndex) {
                check(steps++ < 100) { "Feature constructor entered a loop." }
                val instruction = instructions[index]
                when (instruction.opcode) {
                    Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO -> {
                        val reference = (instruction as ReferenceInstruction).reference as StringReference
                        registers[(instruction as OneRegisterInstruction).registerA] = reference.string
                    }
                    Opcode.INVOKE_VIRTUAL -> {
                        val invoke = instruction as Instruction35c
                        val reference = invoke.reference as MethodReference
                        check(reference.definingClass == "Ljava/lang/String;" && reference.name == "equals")
                        result = if (registers[invoke.registerC] == registers[invoke.registerD]) 1 else 0
                    }
                    Opcode.MOVE_RESULT -> registers[(instruction as OneRegisterInstruction).registerA] = result
                    Opcode.IF_EQZ -> {
                        if (registers[(instruction as OneRegisterInstruction).registerA] == 0) {
                            index = addresses.indexOf(addresses[index] + (instruction as OffsetInstruction).codeOffset)
                            continue
                        }
                    }
                    Opcode.CONST_4 -> {
                        val constant = instruction as Instruction11n
                        check(constant.registerA == p2 && constant.narrowLiteral == 1)
                        registers[constant.registerA] = constant.narrowLiteral
                    }
                    else -> error("Unexpected injected instruction: ${instruction.opcode}")
                }
                index++
            }
            check(registers[p2] == if (name in features || originalEnabled) 1 else 0) { "Incorrect feature flag for $name." }
            check(registers[p0] == "unchanged-this" && registers[p1] == name && registers[p3] == "unchanged-list") {
                "Constructor receiver or parameters were corrupted."
            }
            // cloneMutable's prologue must restore the original register slots,
            // including the updated enabled flag, before the old body executes.
            val copies = instructions.subList(originalBodyIndex, originalBodyIndex + 4)
            copies.forEachIndexed { parameter, instruction ->
                check(instruction.opcode == if (parameter == 2) Opcode.MOVE_FROM16 else Opcode.MOVE_OBJECT_FROM16)
                val move = instruction as TwoRegisterInstruction
                check(move.registerA == p0 - 1 + parameter && move.registerB == p0 + parameter)
                registers[move.registerA] = checkNotNull(registers[move.registerB])
            }
            check(registers[p0 - 1] == "unchanged-this" && registers[p1 - 1] == name &&
                registers[p2 - 1] == (if (name in features || originalEnabled) 1 else 0))
            check(registers[p3 - 1] == "unchanged-list")
        }
    }
}

private fun verifyOriginalApk(input: File) = runBlocking {
    check(input.isFile) { "SoundCloud input not found: $input" }
    val output = File("patches/build/soundcloud-verification").apply { mkdirs() }
    val apk = if (input.extension.equals("apkm", ignoreCase = true)) {
        File(output, "base.apk").also { base ->
            ZipFile(input).use { archive ->
                val entry = checkNotNull(archive.getEntry("base.apk")) { "APKM contains no base.apk." }
                archive.getInputStream(entry).use { stream -> base.outputStream().use { stream.copyTo(it) } }
            }
        }
    } else input
    val originalConstructor = ZipFile(apk).use { original ->
        original.entries().asSequence().filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }
            .mapNotNull { entry ->
                val dex = original.getInputStream(entry).buffered().use { DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it) }
                dex.classes.singleOrNull { it.type == FEATURE_CLASS }?.methods?.single {
                    it.name == "<init>" && it.parameterTypes == featureParameters
                }?.let(ImmutableMethod::of)
            }.first()
    }
    val bundle = File(checkNotNull(System.getProperty("soundcloudPatchBundle")))
    val patch = loadPatchesFromJar(setOf(bundle)).single { it.name == "Enable SoundCloud Go+" }
    Patcher(PatcherConfig(apkFile = apk, temporaryFilesPath = File(output, "temporary"))).use { patcher ->
        patcher += setOf(patch)
        check(patcher.context.packageMetadata.packageName == "com.soundcloud.android")
        val supportedVersions = mapOf("2026.08.26-release" to "369070", "2026.09.23-release" to "374050")
        val version = patcher.context.packageMetadata.versionName
        check(supportedVersions[version] == patcher.context.packageMetadata.versionCode)
        patcher().collect { result ->
            check(result.exception == null) { "SoundCloud patch failed: ${result.exception}" }
        }
        var verified = false
        checkNotNull(patcher.get().dexFiles).forEach { dex ->
            val file = File(output, dex.name)
            dex.stream.use { stream -> file.outputStream().use { stream.copyTo(it) } }
            val parsed = file.inputStream().buffered().use { DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it) }
            parsed.classes.singleOrNull { it.type == FEATURE_CLASS }?.let { feature ->
                val constructor = feature.methods.single { it.name == "<init>" && it.parameterTypes == featureParameters }
                verifyFeatureConstructor(constructor)
                check(constructor.annotations == originalConstructor.annotations) { "Jackson constructor annotations changed." }
                check(constructor.parameters.map { it.annotations } == originalConstructor.parameters.map { it.annotations }) {
                    "Jackson parameter annotations changed."
                }
                check(constructor.implementation!!.registerCount == originalConstructor.implementation!!.registerCount + 1)
                verified = true
            }
        }
        check(verified) { "Rebuilt SoundCloud Feature constructor not found." }
        println("SoundCloud ${patcher.context.packageMetadata.versionName}: premium patch execution, DEX compilation, branch targets and feature behavior passed.")
    }
}
