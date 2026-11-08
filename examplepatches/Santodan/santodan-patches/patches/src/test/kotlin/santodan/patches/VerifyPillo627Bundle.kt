package santodan.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import kotlinx.coroutines.runBlocking
import java.io.File
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream

private fun premiumInstructionShape(i: Instruction): List<Any?> = buildList {
    add(i.opcode); add(i.codeUnits)
    if (i is ReferenceInstruction) add(i.reference.toString())
    if (i is OneRegisterInstruction) add(i.registerA)
    if (i is TwoRegisterInstruction) add(i.registerB)
    if (i is FiveRegisterInstruction) addAll(listOf(i.registerCount, i.registerC, i.registerD, i.registerE, i.registerF, i.registerG))
    if (i is RegisterRangeInstruction) addAll(listOf(i.startRegister, i.registerCount))
    if (i is WideLiteralInstruction) add(i.wideLiteral)
    if (i is OffsetInstruction) add(i.codeOffset)
}

/** Follow the actual callback's DEX branches; record its native side effects. */
private fun profileCallbackEffects(method: com.android.tools.smali.dexlib2.iface.Method, premium: Boolean, adfree: Boolean): List<String> {
    val ins = PilloHybridNotificationPatch.instructions(method)
    val registers = intArrayOf(0, if (premium) 1 else 0, if (adfree) 1 else 0)
    val addresses = ins.runningFold(0) { address, i -> address + i.codeUnits }
    val effects = mutableListOf<String>()
    var pc = 0
    repeat(30) {
        val i = ins[pc]
        when (i.opcode) {
            Opcode.CONST_4 -> registers[(i as OneRegisterInstruction).registerA] = (i as NarrowLiteralInstruction).narrowLiteral
            Opcode.IF_EQZ, Opcode.IF_NEZ -> {
                val zero = registers[(i as OneRegisterInstruction).registerA] == 0
                if (zero == (i.opcode == Opcode.IF_EQZ)) {
                    pc = addresses.indexOf(addresses[pc] + (i as OffsetInstruction).codeOffset)
                    check(pc in ins.indices)
                    return@repeat
                }
            }
            Opcode.INVOKE_DIRECT, Opcode.INVOKE_VIRTUAL -> effects += ((i as ReferenceInstruction).reference as MethodReference).name
            Opcode.IGET_OBJECT, Opcode.SGET_OBJECT -> Unit
            Opcode.RETURN_OBJECT -> return effects
            else -> error("Unexpected profile callback opcode: ${i.opcode}")
        }
        pc++
    }
    error("Callback did not return")
}

/** Applies every 0.6.27 selection to original DEX and audits the serialized result. */
fun main(args: Array<String>) = runBlocking {
    val apk = File(args[0])
    val originals = mutableListOf<ClassDef>()
    ZipFile(apk).use { zip ->
        for (entry in zip.entries().asSequence().filter { it.name.matches(Regex("classes\\d*\\.dex")) })
            zip.getInputStream(entry).buffered().use { originals += DexBackedDexFile.fromInputStream(null, it).classes }
    }
    Pillo627.validateBackup(originals)
    Pillo627Import.validate(originals)
    for (owner in listOf("Lxyz/rtrvr/pillo/ui/components/buttons/ButtonsKt;",
        "Lxyz/rtrvr/pillo/ui/components/buttons/ButtonProps\$2;", "Lxyz/rtrvr/pillo/ui/components/buttons/ButtonProps\$3;")) {
        check(runCatching { Pillo627Import.validate(originals.filterNot { it.type == owner }) }.isFailure)
        check(runCatching { Pillo627Import.validate(originals + originals.single { it.type == owner }) }.isFailure)
    }
    Pillo627Contracts.summary(originals)
    Pillo627Contracts.progress(originals)
    val premium = PilloPremiumPatch.validate(originals)
    val profileCallback = PilloPremiumPatch.validateProfileCallback(originals)
    check(profileCallbackEffects(profileCallback, false, false) == listOf("resetDailyInterruptSetting", "setWatchNotificationEnabled"))
    check(profileCallbackEffects(profileCallback, true, false) == listOf("enableMultiDependents"))
    val patchedCallback = MutableMethod(profileCallback)
    PilloPremiumPatch.applyProfileCallback(patchedCallback)
    for (premiumResult in listOf(false, true)) for (adfreeResult in listOf(false, true)) {
        // Refreshes preserve either user choice, including an intentional disable.
        for (directLogging in listOf(false, true)) {
            var chosen = directLogging
            repeat(3) {
                val effects = profileCallbackEffects(patchedCallback, premiumResult, adfreeResult)
                if ("resetDailyInterruptSetting" in effects) chosen = false
                check(effects == listOf("enableMultiDependents") && chosen == directLogging)
            }
        }
    }
    check(runCatching { PilloPremiumPatch.applyProfileCallback(patchedCallback) }.isFailure)
    check(runCatching { PilloPremiumPatch.validateProfileCallback(emptyList()) }.isFailure)
    check(runCatching { PilloPremiumPatch.validateProfileCallback(originals + originals.single { it.type == PilloPremiumPatch.OWNER }) }.isFailure)
    val changedCallback = MutableMethod(profileCallback).apply {
        implementation!!.replaceInstruction(5, BuilderInstruction11n(Opcode.CONST_4, 1, 1))
    }
    check(runCatching { PilloPremiumPatch.applyProfileCallback(changedCallback) }.isFailure)
    check(runCatching { PilloPremiumPatch.validate(originals.filterNot { it.type == PilloPremiumPatch.OWNER }) }.isFailure)
    check(runCatching { PilloPremiumPatch.validate(originals + originals.single { it.type == PilloPremiumPatch.OWNER }) }.isFailure)
    for (setter in premium) {
        val target = MutableMethod(setter)
        val before = PilloHybridNotificationPatch.instructions(target)
        PilloPremiumPatch.apply(target)
        val after = PilloHybridNotificationPatch.instructions(target)
        check(after.size == before.size + 1 && after.drop(1).zip(before).all { (a, b) -> a === b })
        check(target.implementation!!.registerCount == setter.implementation!!.registerCount)
        check((after.first() as OneRegisterInstruction).registerA == 4 && (after.first() as NarrowLiteralInstruction).narrowLiteral == 1)
        check(runCatching { PilloPremiumPatch.apply(target) }.isFailure)
        val changed = MutableMethod(setter).apply { implementation!!.removeInstruction(3) }
        check(runCatching { PilloPremiumPatch.apply(changed) }.isFailure)
    }
    val alarm = Pillo627Alarm.findUnique(originals)
    val mutable = MutableMethod(alarm.method)
    Pillo627Alarm.apply(mutable, alarm)
    check(runCatching { Pillo627Alarm.apply(mutable, alarm) }.isFailure)
    check(runCatching { Pillo627Alarm.findUnique(originals + originals.single { it.type == Pillo627Alarm.TARGET }) }.isFailure)
    check(runCatching { Pillo627Alarm.findUnique(emptyList()) }.isFailure)
    check(runCatching { Pillo627.validateBackup(originals.filterNot { it.type.startsWith(Pillo627.ROOT + "data/persistence/database/AppDatabase_Impl") }) }.isFailure)
    val progress = originals.single { it.type == Pillo627.PROGRESS_SCREEN }.methods.single { it.name == Pillo627.PROGRESS_CONTENT }
    val instructions = PilloHybridNotificationPatch.instructions(progress)
    val index = instructions.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref -> ref.definingClass == "Lz0/l;" && ref.name == "c" } == true }
    check(index >= 0)
    val redirected = MutableMethod(progress)
    Pillo627.redirect(redirected, "Lz0/l;", "c", Pillo627.PROGRESS, "progress")
    check(redirected.implementation!!.registerCount == progress.implementation!!.registerCount)
    check(PilloHybridNotificationPatch.instructions(redirected).size == instructions.size)
    check(runCatching { Pillo627.redirect(redirected, "Lz0/l;", "c", Pillo627.PROGRESS, "progress") }.isFailure)
    val missing = MutableMethod(progress).apply { implementation!!.removeInstruction(index) }
    check(runCatching { Pillo627.redirect(missing, "Lz0/l;", "c", Pillo627.PROGRESS, "progress") }.isFailure)
    val ambiguous = MutableMethod(progress)
    val call = instructions[index] as RegisterRangeInstruction
    val reference = (instructions[index] as ReferenceInstruction).reference as MethodReference
    ambiguous.implementation!!.addInstruction(index, BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, call.startRegister, call.registerCount, reference))
    check(runCatching { Pillo627.redirect(ambiguous, "Lz0/l;", "c", Pillo627.PROGRESS, "progress") }.isFailure)
    println("PASS: original 0.6.27 native contracts, unique alarm match, missing/ambiguous/already-patched rejection")
    val names = listOf(PilloHybridNotificationPatch.NAME, PilloLocalBackupPatch.NAME,
        PilloWeightImportPatch.NAME, PilloWeightSummaryPatch.NAME, PilloProgressWeightPatch.NAME, PilloPremiumPatch.NAME)
    val bundle = loadPatchesFromJar(setOf(File(args[1])))
    for (selection in names.map { setOf(it) } + listOf(names.toSet())) {
        val selected = bundle.filter { it.name in selection }.toSet()
        check(selected.size == selection.size)
        val output = File(args[2], if (selection.size == names.size) "combined" else "single-${names.indexOf(selection.single())}").apply { mkdirs() }
        Patcher(PatcherConfig(apkFile = apk, temporaryFilesPath = File(output, "work"))).use { patcher ->
            patcher += selected
            patcher().collect { result -> result.exception?.let { throw it }; println("PASS: ${result.patch.name}") }
            val dexFiles = linkedMapOf<String, File>()
            for (dex in patcher.get().dexFiles) {
                val target = File(output, dex.name)
                dex.stream.use { input -> target.outputStream().use { input.copyTo(it) } }
                dexFiles[dex.name] = target
            }
            ZipFile(apk).use { zip ->
                for (entry in zip.entries().asSequence().filter { it.name.matches(Regex("classes\\d*\\.dex")) && it.name !in dexFiles }) {
                    val target = File(output, entry.name)
                    zip.getInputStream(entry).use { input -> target.outputStream().use { input.copyTo(it) } }
                    dexFiles[entry.name] = target
                }
            }
            val definitions = dexFiles.values.flatMap { file -> file.inputStream().buffered().use { DexBackedDexFile.fromInputStream(null, it).classes.toList() } }
            check(definitions.map { it.type }.distinct().size == definitions.size) { "Duplicate classes across DEX files" }
            val methods = definitions.flatMap { it.methods }.map { it.toString() }.toSet()
            val hooks = definitions.filter { it.type.startsWith(Pillo627.ROOT) }.flatMap { it.methods }
                .flatMap { PilloHybridNotificationPatch.instructions(it) }
                .mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference) }
                .filter { it.definingClass.startsWith("Lsoftware/santodan/extension/pillo") }
            check(hooks.all { it.toString() in methods }) { "Unresolved injected method signature" }
            val expected = mutableSetOf<String>()
            if (PilloLocalBackupPatch.NAME in selection) expected += Pillo627.BACKUP
            if (PilloWeightImportPatch.NAME in selection) expected += Pillo627.IMPORT
            if (PilloWeightSummaryPatch.NAME in selection || PilloProgressWeightPatch.NAME in selection) expected += Pillo627.SUMMARY
            if (PilloProgressWeightPatch.NAME in selection) expected += Pillo627.PROGRESS
            check(hooks.map { it.definingClass }.toSet() == expected) { "Missing or unexpected hooks: $hooks" }
            if (PilloLocalBackupPatch.NAME in selection) check(hooks.count { it.definingClass == Pillo627.BACKUP } == 7)
            if (PilloWeightImportPatch.NAME in selection) check(hooks.count { it.definingClass == Pillo627.IMPORT } == 2)
            if (PilloWeightSummaryPatch.NAME in selection || PilloProgressWeightPatch.NAME in selection)
                check(hooks.count { it.definingClass == Pillo627.SUMMARY } == 6)
            if (PilloProgressWeightPatch.NAME in selection) check(hooks.count { it.definingClass == Pillo627.PROGRESS } == 1)
            if (PilloPremiumPatch.NAME in selection) {
                val provider = definitions.single { it.type == PilloPremiumPatch.OWNER }
                for (name in PilloPremiumPatch.SETTERS) {
                    val method = provider.methods.single { it.name == name }
                    val ins = PilloHybridNotificationPatch.instructions(method)
                    val original = premium.single { it.name == name }
                    check(ins.size == PilloHybridNotificationPatch.instructions(original).size + 1)
                    check(method.implementation!!.registerCount == original.implementation!!.registerCount)
                    check(ins.first().opcode == Opcode.CONST_4 && (ins.first() as OneRegisterInstruction).registerA == 4
                        && (ins.first() as NarrowLiteralInstruction).narrowLiteral == 1)
                    check(ins.drop(1).map(::premiumInstructionShape) == PilloHybridNotificationPatch.instructions(original).map(::premiumInstructionShape))
                    check(method.implementation!!.tryBlocks.isEmpty() && original.implementation!!.tryBlocks.isEmpty())
                    check(runCatching { PilloPremiumPatch.validateSetter(method) }.isFailure)
                }
                val nativeProvider = originals.single { it.type == provider.type }
                val callback = provider.methods.single { it.name == PilloPremiumPatch.PROFILE_CALLBACK }
                val callbackIns = PilloHybridNotificationPatch.instructions(callback)
                check(callbackIns.size == PilloHybridNotificationPatch.instructions(profileCallback).size + 1)
                check(callback.implementation!!.registerCount == profileCallback.implementation!!.registerCount)
                check(callbackIns.first().opcode == Opcode.CONST_4
                    && (callbackIns.first() as OneRegisterInstruction).registerA == 1
                    && (callbackIns.first() as NarrowLiteralInstruction).narrowLiteral == 1)
                check(callbackIns.drop(1).map(::premiumInstructionShape) == PilloHybridNotificationPatch.instructions(profileCallback).map(::premiumInstructionShape))
                for (p in listOf(false, true)) for (a in listOf(false, true))
                    check(profileCallbackEffects(callback, p, a) == listOf("enableMultiDependents"))
                check(runCatching { PilloPremiumPatch.validateProfileCallbackMethod(callback) }.isFailure)
                for (method in provider.methods.filter { it.name !in PilloPremiumPatch.SETTERS && it.name != PilloPremiumPatch.PROFILE_CALLBACK }) {
                    val before = nativeProvider.methods.single { it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType }
                    check(PilloHybridNotificationPatch.instructions(method).map(::premiumInstructionShape) == PilloHybridNotificationPatch.instructions(before).map(::premiumInstructionShape))
                }
                println("PASS: serialized premium setters and profile callback agree; repeated raw billing results cannot reset notification choices; other native provider methods retained")
            }
            if (selection.size == names.size) {
                // Rebuild exclusively from this version's original base; configuration splits stay separate.
                val rebuilt = File(output, "pillo-0.6.27-base-unsigned.apk")
                ZipOutputStream(rebuilt.outputStream().buffered()).use { out ->
                    ZipFile(apk).use { zip ->
                        for (entry in zip.entries().asSequence()) {
                            if (entry.name.matches(Regex("classes\\d*\\.dex")) ||
                                entry.name.matches(Regex("META-INF/[^/]+\\.(SF|RSA|DSA|EC)", RegexOption.IGNORE_CASE)) ||
                                entry.name.equals("META-INF/MANIFEST.MF", ignoreCase = true)) continue
                            val copy = ZipEntry(entry.name)
                            if (entry.method == ZipEntry.STORED) { copy.method = ZipEntry.STORED; copy.size = entry.size; copy.crc = entry.crc }
                            out.putNextEntry(copy); zip.getInputStream(entry).use { it.copyTo(out) }; out.closeEntry()
                        }
                    }
                    for ((name, file) in dexFiles) { out.putNextEntry(ZipEntry(name)); file.inputStream().use { it.copyTo(out) }; out.closeEntry() }
                }
                println("Unsigned rebuilt base APK: $rebuilt")
            }
            println("PASS: ${output.name}: complete cross-DEX reload, exact hook counts, all injected signatures resolve")
        }
    }
}
