import com.android.apksig.ApkVerifier
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.io.File
import java.util.zip.ZipFile

fun main(args: Array<String>) {
    val apk = File(args.single())
    val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
    val classes = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
    val root = "Lcom/lunaredge/browser/"
    fun method(owner: String, name: String): Method = classes.getValue(owner).methods.single { it.name == name }
    fun checkPrefix(owner: String, name: String, target: String?) {
        val implementation = method(owner, name).implementation!!
        val instructions = implementation.instructions.toList()
        if (target == null) {
            check(instructions.first().opcode == Opcode.RETURN_VOID)
        } else {
            check(instructions[0].opcode == Opcode.INVOKE_VIRTUAL_RANGE)
            check((instructions[0] as ReferenceInstruction).reference.toString() == target)
            check(instructions[1].opcode == Opcode.RETURN_VOID)
            val expectedRegister = if (name == "loadAdPlay") implementation.registerCount - 10 else implementation.registerCount - 1
            check((instructions[0] as RegisterRangeInstruction).startRegister == expectedRegister)
        }
        println("OK: $owner->$name")
    }
    checkPrefix("${root}ui/JYAlternativeZero;", "loadAdPlay", "${root}ui/JYAlternativeZero;->v2()V")
    checkPrefix("${root}ui/JYAlternativeZero;", "raiseLoop", "Lchuangyuan/ycj/videolibrary/video/ExoUserPlayer;->M()V")
    checkPrefix("${root}ui/JYNameTask;", "matchFocusObject", "Lchuangyuan/ycj/videolibrary/video/ExoUserPlayer;->h0()V")
    checkPrefix("${root}util/JYTailSession;", "c", null)
    checkPrefix("${root}ui/JYAlternativeZero;", "disableMirror", null)
    checkPrefix("${root}ui/JYAlternativeZero;", "s2", null)
    // Comprobamos también que sigue presente la ruta DLNA y sus botones originales.
    check(classes.containsKey("Lcom/android/cast/dlna/dmc/DLNACastManager;"))
    check(method("${root}ui/JYAlternativeZero;", "transformRules").implementation != null)
    check(method("${root}ui/JYAlternativeZero;", "willWindow").implementation != null)
    if (classes.containsKey("Llocal/lunaredge/cast/CastBridge;")) {
        for (entry in listOf("transformRules", "willWindow")) {
            val first = method("${root}ui/JYAlternativeZero;", entry).implementation!!.instructions.first()
            check((first as ReferenceInstruction).reference.toString() == "Llocal/lunaredge/cast/CastBridge;->show(Landroid/app/Activity;)V")
        }
        check(method("${root}ui/JYAlternativeZero;", "lunarDlnaPortrait").implementation != null)
        check(method("${root}ui/JYAlternativeZero;", "lunarDlnaLandscape").implementation != null)
        check(classes.containsKey("Llocal/lunaredge/cast/CastSession;"))
        println("OK: selector Cast, sesión y alternativas DLNA.")
    }
    check(classes.keys.none { it.startsWith("Llocal/lunaredge/diagnostic/") }) {
        "La APK contiene instrumentación temporal. Parte de un original limpio."
    }
    ZipFile(apk).use { zip ->
        val expectedInstructions = mapOf(
            "lib/arm64-v8a/libpp_hls.so" to (0x15fcc8 to byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())),
            "lib/armeabi-v7a/libpp_hls.so" to (0xd82e4 to byteArrayOf(0x00, 0xbf.toByte()))
        )
        val engines = zip.entries().asSequence().filter { it.name.endsWith("/libpp_hls.so") }.toList()
        check(engines.isNotEmpty())
        engines.forEach { entry ->
            val (offset, expected) = expectedInstructions.getValue(entry.name)
            val bytes = zip.getInputStream(entry).use { it.readBytes() }
            check(bytes.copyOfRange(offset, offset + expected.size).contentEquals(expected)) {
                "No está aplicada la corrección del motor: ${entry.name}"
            }
            println("OK: motor local ${entry.name}")
        }
    }
    val signature = ApkVerifier.Builder(apk).build().verify()
    check(signature.isVerified) { "Firma inválida: ${signature.errors}" }
    println("OK: firma APK, motor local, ausencia de diagnóstico y rutas DLNA conservadas.")
    println("Reproducción confirmada en ARM64; pendiente prueba real ARMv7 y descubrimiento de TV.")
}
