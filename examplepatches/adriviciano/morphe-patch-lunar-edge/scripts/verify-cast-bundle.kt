import app.morphe.patcher.patch.loadPatchesFromJar
import java.io.File
import java.util.jar.JarFile

fun main(args: Array<String>) {
    val file = File(args.single())
    val patches = loadPatchesFromJar(setOf(file))
    check(patches.size == 4) { "El paquete completo debe contener cuatro parches, contiene ${patches.size}." }
    val cast = patches.single { it.name == "Enable Google Cast" }
    check(patches.all { it.default }) { "Los cuatro parches deben estar seleccionados por defecto." }
    check(cast.dependencies.any { it.name == "Fix local video engine" }) { "Cast debe depender de la corrección del motor." }
    check(cast.compatibility!!.single().packageName == "com.lunaredge.browser")
    JarFile(file).use { jar ->
        check(jar.manifest.mainAttributes.getValue("Name") == "Lunar Edge local patches")
        check(jar.getEntry("classes.dex") != null)
        val extension = jar.getInputStream(jar.getEntry("extensions/cast.mpe")).use { it.readBytes() }
        check(extension.copyOfRange(0, 3).toString(Charsets.US_ASCII) == "dex")
        check(extension.toString(Charsets.ISO_8859_1).contains("Google Cast"))
        check(extension.toString(Charsets.ISO_8859_1).contains("CastRelay"))
        check(extension.toString(Charsets.ISO_8859_1).contains("CastKeepAliveService"))
        check(!extension.toString(Charsets.ISO_8859_1).contains("LunarDiag"))
    }
    println("OK: cuatro parches predeterminados, motor obligatorio para Cast y extensión DEX.")
}
