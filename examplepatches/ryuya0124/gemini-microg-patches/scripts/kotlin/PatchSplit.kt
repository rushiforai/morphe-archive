import com.reandroid.apk.ApkModule
import java.io.File

/** Clone the resource split independently of APK signing. */
fun main(args: Array<String>) {
    require(args.size == 2) { "Usage: PatchSplitKt input.apk output.apk" }
    val apk = ApkModule.loadApkFile(File(args[0]))
    try {
        val manifest = apk.androidManifest
        check(manifest.packageName == "com.google.android.googlequicksearchbox")
        val attribute = manifest.manifestElement!!.searchAttributeByName("package")
            ?: error("Missing package attribute")
        attribute.setValueAsString("com.google.android.googlequicksearchbox.morphe")
        apk.writeApk(File(args[1]))
    } finally { apk.close() }
}
