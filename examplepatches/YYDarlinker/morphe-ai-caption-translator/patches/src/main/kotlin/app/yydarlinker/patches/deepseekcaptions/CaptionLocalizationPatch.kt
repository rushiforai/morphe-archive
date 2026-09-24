package app.yydarlinker.patches.deepseekcaptions
import app.morphe.patcher.patch.resourcePatch
import java.io.File

internal val captionLocalizationPatch=resourcePatch {
    execute {
        val anchor=CaptionFeatures.javaClass.classLoader
        fun read(path:String)=anchor.getResourceAsStream("captionlocales/$path")?.bufferedReader()?.use { it.readText() }
            ?:error("Caption locale resource missing: $path")
        for(folder in read("index.txt").lineSequence().filter { it.isNotBlank() }){
            val destination=get("res/$folder/strings.xml")
            destination.parentFile.mkdirs()
            if(!destination.exists())destination.writeText("<resources/>")
            document("res/$folder/strings.xml").use { target ->
                document(read("$folder/caption_addon_strings.xml").byteInputStream()).use { source ->
                    val nodes=source.getElementsByTagName("string")
                    for(i in 0 until nodes.length)target.documentElement.appendChild(target.importNode(nodes.item(i),true))
                }
            }
        }
    }
}

internal fun captionResourceTitle(value:String):String {
    val rows=CaptionFeatures.javaClass.classLoader.getResourceAsStream("captionlocales/source-keys.tsv")
        ?.bufferedReader()?.use { it.readLines() } ?:return value
    val name=rows.firstOrNull { it.substringBefore('\t')==value }?.substringAfter('\t') ?:return value
    return "@string/$name"
}
