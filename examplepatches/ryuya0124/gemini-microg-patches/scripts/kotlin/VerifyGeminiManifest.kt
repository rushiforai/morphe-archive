import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.xml.ResXmlElement
import java.io.File

fun main(args: Array<String>) {
    val apk = ApkModule.loadApkFile(File(args.single()))
    try {
        val manifest = apk.androidManifest
        check(manifest.packageName == "com.google.android.apps.bard.morphe")
        val queries = manifest.manifestElement.getElements("queries").asSequence().toList()
        val packages = queries.flatMap { q -> (q as ResXmlElement).getElements("package").asSequence().toList() }
        val names = packages.map { (it as ResXmlElement).searchAttributeByName("name")?.valueAsString }
        check(names.count { it == "com.google.android.googlequicksearchbox.morphe" } == 1) {
            "Gemini must explicitly query the clone exactly once: $names"
        }
        println("Gemini manifest verified: clone package visible explicitly and exactly once")
    } finally { apk.close() }
}
