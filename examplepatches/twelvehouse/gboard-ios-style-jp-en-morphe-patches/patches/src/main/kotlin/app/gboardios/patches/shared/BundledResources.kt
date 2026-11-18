package app.gboardios.patches.shared

import app.morphe.patcher.patch.resourceFile

/**
 * Writes an XML file bundled with the patches (under `/gboardios/<dir>/`) to [target] in the APK,
 * after expanding the `{{0x...}}` resource placeholders with [ids]. [transform] runs on the text
 * before that, so a patch can write several variants of one bundled file.
 */
fun writeBundled(
    ids: ResourceIds,
    dir: String,
    bundled: String,
    target: String,
    transform: (String) -> String = { it },
) {
    val text = ResourceIds::class.java.getResourceAsStream("/gboardios/$dir/$bundled")
        ?.use { it.readBytes().toString(Charsets.UTF_8) }
        ?: error("Missing bundled resource $dir/$bundled")
    resourceFile(target, copy = false).apply {
        parentFile.mkdirs()
        writeText(ids.expand(transform(text)), Charsets.UTF_8)
    }
}
