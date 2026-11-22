import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.xml.ResXmlElement
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import java.io.File

fun main(args: Array<String>) {
    val apk = File(args.single())
    val manifest = ApkModule.loadApkFile(apk).androidManifest
    check("android.permission.FOREGROUND_SERVICE_CONNECTED_DEVICE" in manifest.usesPermissions) { "Falta permiso del servicio de emisión en segundo plano." }
    check("android.permission.WAKE_LOCK" in manifest.usesPermissions)
    for (permission in listOf("FOREGROUND_SERVICE", "FOREGROUND_SERVICE_CONNECTED_DEVICE", "WAKE_LOCK", "POST_NOTIFICATIONS")) {
        check(manifest.usesPermissions.count { it == "android.permission.$permission" } == 1)
    }
    val service = manifest.applicationElement.getElements("service").asSequence().map { it as ResXmlElement }.single {
        it.searchAttributeByName("name")?.dataAsString == "local.lunaredge.cast.CastKeepAliveService"
    }
    check(service.searchAttributeByName("exported")?.decodeValue() == "false")
    check(service.searchAttributeByName("foregroundServiceType")?.data == 16)
    val dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
    val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
    val player = classes.getValue("Lcom/lunaredge/browser/ui/JYAlternativeZero;")
    for (name in listOf("onPause", "onResume")) {
        val code = player.methods.single { it.name == name }.implementation!!.instructions.toList()
        val superIndex = code.indexOfFirst { it.opcode in listOf(Opcode.INVOKE_SUPER, Opcode.INVOKE_SUPER_RANGE) }
        val guard = code.indexOfFirst { (it as? ReferenceInstruction)?.reference.toString() == "Llocal/lunaredge/cast/CastBackground;->keepAlive(Landroid/app/Activity;)Z" }
        check(superIndex >= 0 && guard > superIndex) { "$name debe ejecutar super antes de proteger la sesión activa." }
        check(code[guard + 1].opcode == Opcode.MOVE_RESULT && code[guard + 2].opcode == Opcode.IF_EQZ && code[guard + 3].opcode == Opcode.RETURN_VOID)
        fun address(index: Int) = code.take(index).sumOf { it.codeUnits }
        check(address(guard + 2) + (code[guard + 2] as OffsetInstruction).codeOffset == address(guard + 4)) { "Sin emisión debe continuar el ciclo de vida original." }
    }
    check(classes.containsKey("Llocal/lunaredge/cast/CastKeepAliveService;"))
    check(classes.containsKey("Llocal/lunaredge/cast/SessionLease;"))
    val control = classes.getValue("Lcom/android/cast/dlna/dmc/control/CastControlImpl;")
    check(control.methods.single { it.name == "a" }.implementation!!.instructions.any {
        (it as? ReferenceInstruction)?.reference.toString().contains("CastBackground;->dlnaStopped")
    })
    check(control.methods.single { it.name == "c" }.implementation!!.instructions.any {
        (it as? ReferenceInstruction)?.reference.toString().contains("CastBackground;->dlnaPlayCallback")
    })
    for (suffix in listOf("\$26", "\$27")) {
        val callback = classes.getValue("Lcom/lunaredge/browser/ui/JYAlternativeZero$suffix;")
        check(callback.methods.any { method -> method.implementation?.instructions?.any {
            (it as? ReferenceInstruction)?.reference.toString().contains("CastBackground;->beginDlna")
        } == true })
    }
    println("OK: servicio conectado, permisos, DEX, guardas tras super y parada DLNA.")
}
