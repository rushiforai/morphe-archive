import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import com.reandroid.apk.ApkModule
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import java.util.zip.ZipFile

fun main(args: Array<String>) {
    val file = File(args.single())
    val apk = ApkModule.loadApkFile(file)
    val spec = try {
        VersionHookRegistry.requireProfile(apk.androidManifest.packageName.removeSuffix(".morphe"),
            apk.androidManifest.versionName).hooks.getValue(HookId.MICROG_RUNTIME_PERMISSIONS)
    } finally { apk.close() }
    val classes = ZipFile(file).use { zip ->
        zip.entries().asSequence().filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }.flatMap { entry ->
            zip.getInputStream(entry).buffered().use {
                DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it).classes.toList()
            }.asSequence()
        }.associateBy { it.type }
    }
    val helper = "Lapp/geminipatch/extension/MicrogPermissions;"
    val dialog = helper.dropLast(1) + "\$PermissionDialog;"
    check(classes.containsKey(helper) && classes.containsKey(dialog)) { "Permission runtime not merged into APK" }
    check(classes.getValue(dialog).superclass == "Landroid/app/DialogFragment;")
    val method = classes.getValue(requireNotNull(spec.className)).methods.single { spec.matches(it) }
    val body = method.implementation!!.instructions.toList()
    val call = body.withIndex().single {
        val ref = (it.value as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == helper && ref.name == "onCreate"
    }
    check(call.value.opcode == Opcode.INVOKE_STATIC)
    val invoke = call.value as FiveRegisterInstruction
    val activityRegister = spec.integers["activityAlias"] ?: (method.implementation!!.registerCount - spec.int("thisParameterOffset"))
    check(invoke.registerCount == 1 && invoke.registerC == activityRegister)
    check(call.index > 0 && body[call.index - 1].opcode == Opcode.IPUT_BOOLEAN)
    check((body[call.index - 1] as ReferenceInstruction).reference.toString() ==
        "${spec.className}->${spec.fieldName}:${spec.fieldType}")
    check(body.none {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.name == "requestPermissions"
    }) { "Old unexplained startup request remains" }
    val strings = mutableSetOf<String>()
    for (type in listOf(helper, dialog)) for (runtime in classes.getValue(type).methods) {
        val impl = runtime.implementation ?: continue
        for (instruction in impl.instructions) {
            val registers = when (instruction) {
                is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
                is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
                is ThreeRegisterInstruction -> listOf(instruction.registerA, instruction.registerB, instruction.registerC)
                is TwoRegisterInstruction -> listOf(instruction.registerA, instruction.registerB)
                is OneRegisterInstruction -> listOf(instruction.registerA)
                else -> emptyList()
            }
            check(registers.all { it in 0 until impl.registerCount }) { "Invalid extension registers in $type->${runtime.name}" }
            val reference = (instruction as? ReferenceInstruction)?.reference
            if (reference is StringReference) strings.add(reference.string)
            if (reference is MethodReference) check(!reference.definingClass.startsWith("Lapp/morphe/patcher/")
                && !reference.definingClass.startsWith("Lkotlin/")) { "Patcher dependency leaked into app runtime" }
        }
    }
    check("android.permission.GET_ACCOUNTS" in strings && "app.revanced.gms.EXTENDED_ACCESS" in strings)
    check("android.permission.READ_CONTACTS" !in strings)
    println("Permission setup verified: Activity alias, single startup hook, merged runtime and register bounds; no contact-reading request")
}
