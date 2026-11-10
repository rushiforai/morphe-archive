package app.template.patches.steamlink.androidxr
import java.io.File
// Apktool needs an IDs resource when rebuilding the Shizuku manifest.
internal fun ensureIdsXml(file: File) {
    if (file.exists()) return
    file.parentFile!!.mkdirs()
    file.writeText("""<?xml version="1.0" encoding="utf-8"?><resources/>""")
}
