package verificar

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import java.io.File

/**
 * Aplica el bundle de parches a una APK real y escribe el resultado.
 *
 * Es la unica comprobacion automatica posible sin un dispositivo: si el smali inyectado esta
 * mal formado, si un salto apunta a una etiqueta que no existe o si el manifiesto queda
 * invalido, el proceso falla aqui.
 *
 * Uso:
 *
 * ```bash
 * APK_A_VERIFICAR=/ruta/facemoji.apkm ./gradlew verificarParcheo
 * ```
 */
object VerificarParcheo {

    @JvmStatic
    fun main(args: Array<String>) {
        val rutaApk = System.getenv("APK_A_VERIFICAR")
            ?: error("Falta la variable de entorno APK_A_VERIFICAR con la ruta de la APK")

        val apk = File(rutaApk)
        require(apk.isFile) { "No existe la APK: $rutaApk" }

        val bundle = File("build/libs").listFiles { fichero ->
            fichero.name.endsWith(".mpp") &&
                    !fichero.name.contains("sources") &&
                    !fichero.name.contains("javadoc")
        }?.firstOrNull() ?: error("No se ha encontrado el .mpp en build/libs")

        println("APK de entrada: ${apk.absolutePath} (${apk.length()} bytes)")
        println("Bundle: ${bundle.absolutePath}")

        val salida = File("build/verificacion/facemoji-parcheado.apk")
        salida.parentFile.mkdirs()
        if (salida.exists()) salida.delete()

        Patcher(PatcherConfig(apk)).use { patcher ->
            patcher += loadPatchesFromJar(setOf(bundle))

            val resultados = runBlocking { patcher.invoke().toList() }
            println("Parches ejecutados: ${resultados.size}")

            patcher.writeApk(salida)
        }

        check(salida.isFile && salida.length() > 0) { "El parcheo no ha generado ningun APK" }

        println("OK: APK parcheado en ${salida.absolutePath} (${salida.length()} bytes)")
    }
}
