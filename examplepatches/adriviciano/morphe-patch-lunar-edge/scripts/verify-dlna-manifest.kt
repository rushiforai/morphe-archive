import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.xml.ResXmlElement
import java.io.File

fun main(args: Array<String>) {
    val module = ApkModule.loadApkFile(File(args.single()))
    val application = module.androidManifest.applicationElement
    val service = application.getElements("service").asSequence().map { it as ResXmlElement }.singleOrNull {
        it.searchAttributeByName("name")?.dataAsString == "com.android.cast.dlna.dmc.DLNACastService"
    }
    check(service != null) { "Falta el servicio que alimenta la lista DLNA: Android no podrá enlazarlo." }
    check(service.searchAttributeByName("exported")?.decodeValue() == "false") { "El servicio DLNA debe ser interno." }
    println("OK: servicio DLNA registrado una vez y no exportado.")
}
