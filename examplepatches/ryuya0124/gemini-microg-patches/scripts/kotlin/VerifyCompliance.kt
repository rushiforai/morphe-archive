import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.*
import java.util.zip.ZipFile
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import com.reandroid.apk.ApkModule
import java.io.File

// Also supports a previously patched installed APK as the original side.
fun main(args: Array<String>) {
    require(args.size in 2..4) { "ORIGINAL_APK PATCHED_APK [CLASS_DESCRIPTOR [feature]]" }
    if (args.size == 2) {
        val apk = ApkModule.loadApkFile(File(args[0]))
        val profile = try {
            VersionHookRegistry.requireProfile(apk.androidManifest.packageName, apk.androidManifest.versionName)
        } finally { apk.close() }
        main(arrayOf(args[0], args[1], requireNotNull(profile.hooks.getValue(HookId.DEVICE_COMPLIANCE_REDIRECT).className)))
        main(arrayOf(args[0], args[1], requireNotNull(profile.hooks.getValue(HookId.DEVICE_COMPLIANCE_FEATURE).className), "feature"))
        return
    }
    val feature = args.getOrNull(3) == "feature"
    fun read(path: String) = ZipFile(path).use { z ->
        z.entries().asSequence().filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }.flatMap { e ->
            z.getInputStream(e).buffered().use { DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it) }.classes.asSequence()
        }.single { it.type == args[2] }.methods.single { it.name == if (feature) "a" else "invoke" }.implementation!!.instructions.toList()
    }
    val original = read(args[0]); val patched = read(args[1])
    check(original.size == patched.size)
    var changes = 0
    for (i in original.indices) {
        val a = original[i]; val b = patched[i]
        check(a.codeUnits == b.codeUnits)
        if (a.opcode != b.opcode) {
            if (feature) {
                check(a.opcode == Opcode.MOVE_RESULT && b.opcode == Opcode.CONST_4)
                check((b as NarrowLiteralInstruction).narrowLiteral == 0)
                check((original[i-1] as ReferenceInstruction).reference.toString() == "Ljava/lang/Boolean;->booleanValue()Z")
                check(original[i+1].opcode == Opcode.IF_NEZ)
            } else {
                check(a.opcode == Opcode.IF_NEZ && b.opcode == Opcode.GOTO_16)
                check(i > 0 && original[i-1].opcode == Opcode.INSTANCE_OF)
                check((original[i-1] as ReferenceInstruction).reference.toString() == "Lcom/google/android/gms/gmscompliance/ui/UncertifiedDeviceActivity;")
            }
            changes++
        }
        if (a is OffsetInstruction) check(a.codeOffset == (b as OffsetInstruction).codeOffset)
        if (a is ReferenceInstruction) check(a.reference.toString() == (b as ReferenceInstruction).reference.toString())
        if (a is OneRegisterInstruction && b is OneRegisterInstruction) check(a.registerA == b.registerA)
        if (a is TwoRegisterInstruction && b is TwoRegisterInstruction) check(a.registerB == b.registerB)
        if (a is WideLiteralInstruction) check(a.wideLiteral == (b as WideLiteralInstruction).wideLiteral)
    }
    check(changes == 1)
    println("Compliance ${if (feature) "feature gate" else "redirect"} verified: exactly one instruction changed; sizes, offsets and references preserved")
}
