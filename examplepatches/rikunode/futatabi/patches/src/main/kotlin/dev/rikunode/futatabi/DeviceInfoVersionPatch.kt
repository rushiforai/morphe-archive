package dev.rikunode.futatabi

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private object DeviceInfoVersionResource

/**
 * Stock AOT InitApp.init is the only caller of DeviceInfoPlugin.androidInfo.
 * It consumes version.release as the final component of tanmatsuInfoProvider.
 * Keep the Android system property and all other fields intact. Append only
 * to the release value in this app's device-info plugin response.
 */
@Suppress("unused")
val deviceInfoVersionPatch = bytecodePatch(
    name = "Append futatabi version to device info",
    description = "Append the applied bundle version to the stock device-info text.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "futatter", packageName = "com.Nanasaki.ftutter", apkFileType = ApkFileType.APK,
        targets = listOf(AppTarget(version = "3.1.1", versionCodes = mapOf(app.morphe.patcher.patch.SupportedAbi.ARM64_V8A to 65))),
    ))
    dependsOn(cacheTargetGuard)
    execute {
        val version = DeviceInfoVersionResource::class.java.classLoader
            ?.getResourceAsStream("futatabi-patch-version.txt")?.use { it.bufferedReader().readText().trim() }
            ?: throw PatchException("futatabi: missing bundle version resource")
        if (!Regex("[0-9]+\\.[0-9]+\\.[0-9]+(?:-[0-9A-Za-z.-]+)?").matches(version))
            throw PatchException("futatabi: invalid bundle version")
        // Stock PackageInfo.appName is the original APK label, ふたったー.
        // Restore just the plugin value, not the launcher/manifest label.
        val packageClass = mutableClassDefByOrNull("LD5/e;")
            ?: throw PatchException("futatabi: package-info plugin class missing")
        val packageMethod = packageClass.methods.singleOrNull {
            it.name == "onMethodCall" && it.parameterTypes.map { p -> p.toString() } ==
                listOf("LR5/j;", "LR5/k\$d;") && it.returnType == "V"
        } ?: throw PatchException("futatabi: package-info method missing")
        val packageImpl = packageMethod.implementation ?: throw PatchException("futatabi: package-info method has no code")
        val packageCode = packageImpl.instructions.toList()
        val names = packageCode.indices.filter { n ->
            val insn = packageCode[n]
            insn.opcode == Opcode.CONST_STRING &&
                (insn as? OneRegisterInstruction)?.registerA == 8 &&
                ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string == "appName"
        }
        if (packageImpl.registerCount != 14 || names.size != 1)
            throw PatchException("futatabi: package-info name site mismatch")
        val nameAt = names.single()
        val namePut = (nameAt + 1 until packageCode.size).firstOrNull { n ->
            val insn = packageCode[n] as? Instruction35c
            val ref = insn?.reference as? MethodReference
            insn?.opcode == Opcode.INVOKE_VIRTUAL && ref?.definingClass == "Ljava/util/HashMap;" && ref.name == "put"
        } ?: throw PatchException("futatabi: appName Map.put missing")
        val putName = packageCode[namePut] as Instruction35c
        val putRef = putName.reference as MethodReference
        if (putName.registerCount != 3 || putName.registerC != 7 || putName.registerD != 8 || putName.registerE != 12 ||
            putRef.parameterTypes.map { it.toString() } != listOf("Ljava/lang/Object;", "Ljava/lang/Object;") ||
            putRef.returnType != "Ljava/lang/Object;" ||
            packageCode.getOrNull(namePut + 1)?.opcode != Opcode.CONST_STRING ||
            (packageCode[namePut + 1] as? OneRegisterInstruction)?.registerA != 12 ||
            ((packageCode[namePut + 1] as? ReferenceInstruction)?.reference as? StringReference)?.string != "packageName")
            throw PatchException("futatabi: appName Map.put mismatch")
        // Replace the call location so both original branches pass through.
        packageImpl.replaceInstruction(namePut, BuilderInstruction21c(
            Opcode.CONST_STRING, 12, ImmutableStringReference("ふたったー")))
        packageMethod.addInstructions(namePut + 1, """
            invoke-virtual {v7, v8, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        """)

        val clazz = mutableClassDefByOrNull("LC5/c;")
            ?: throw PatchException("futatabi: device-info plugin class missing")
        val method = clazz.methods.singleOrNull {
            it.name == "onMethodCall" &&
                it.parameterTypes.map { p -> p.toString() } == listOf("LR5/j;", "LR5/k\$d;") &&
                it.returnType == "V"
        } ?: throw PatchException("futatabi: device-info method missing")
        val impl = method.implementation ?: throw PatchException("futatabi: device-info method has no code")
        val instructions = impl.instructions.toList()
        val sites = instructions.indices.filter { index ->
            val insn = instructions[index]
            insn.opcode == Opcode.SGET_OBJECT &&
                ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                    it.definingClass == "Landroid/os/Build\$VERSION;" && it.name == "RELEASE" && it.type == "Ljava/lang/String;"
                } == true
        }
        if (impl.registerCount != 7 || sites.size != 1)
            throw PatchException("futatabi: device-info register/site mismatch")
        val i = sites.single()
        if (i == 0 || i + 1 >= instructions.size)
            throw PatchException("futatabi: device-info site out of bounds")
        val key = instructions[i - 1]
        val field = instructions[i]
        val put = instructions[i + 1] as? Instruction35c
            ?: throw PatchException("futatabi: device-info Map.put missing")
        val ref = put.reference as? MethodReference
        if (key.opcode != Opcode.CONST_STRING ||
            (key as? OneRegisterInstruction)?.registerA != 2 ||
            ((key as? ReferenceInstruction)?.reference as? StringReference)?.string != "release" ||
            (field as? OneRegisterInstruction)?.registerA != 3 ||
            put.opcode != Opcode.INVOKE_INTERFACE || put.registerCount != 3 ||
            put.registerC != 1 || put.registerD != 2 || put.registerE != 3 ||
            ref?.definingClass != "Ljava/util/Map;" || ref.name != "put" ||
            ref.parameterTypes.map { it.toString() } != listOf("Ljava/lang/Object;", "Ljava/lang/Object;") ||
            ref.returnType != "Ljava/lang/Object;")
            throw PatchException("futatabi: device-info original instructions mismatch")
        method.addInstructions(i + 1, """
            const-string v2, "/futatabi $version"
            invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v3
            const-string v2, "release"
        """)
    }
}
