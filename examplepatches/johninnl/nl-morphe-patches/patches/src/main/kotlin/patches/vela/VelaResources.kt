package patches.vela

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val velaResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        val android = "http://schemas.android.com/apk/res/android"
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val queries = doc.getElementsByTagName("queries").item(0)
                ?: doc.createElement("queries").also { manifest.appendChild(it) }
            listOf("com.waze", "nl.flitsmeister").forEach { name ->
                val exists = (0 until queries.childNodes.length).any { index ->
                    (queries.childNodes.item(index) as? org.w3c.dom.Element)?.getAttributeNS(android, "name") == name
                }
                if (!exists) queries.appendChild(doc.createElement("package").apply {
                    setAttributeNS(android, "android:name", name)
                })
            }
        }
        val values = mapOf(
            "values" to listOf("Speed and road alerts", "Vela (native data)", "Spoken road warnings", "Show details on Android Auto", "Uses Vela voice and mute settings", "Open selected provider", "Native Flock pauses while a provider advertises; it returns when both feeds stop.", "Observed average", "Average pending", "remaining", "Average speed check ahead", "Speed camera ahead", "Police ahead", "Road hazard ahead"),
            "values-nl" to listOf("Snelheid en wegwaarschuwingen", "Vela (eigen gegevens)", "Gesproken wegwaarschuwingen", "Details tonen op Android Auto", "Volgt Vela stem- en dempinstellingen", "Geselecteerde provider openen", "Vela Flock pauzeert zolang een provider gegevens deelt en keert terug als beide stoppen.", "Waargenomen gemiddelde", "Gemiddelde nog niet bekend", "resterend", "Trajectcontrole verderop", "Flitspaal verderop", "Politie verderop", "Gevaar op de weg"),
        )
        val names = listOf("title", "native", "spoken", "car", "spoken_hint", "open", "flock_hint", "average", "average_pending", "remaining", "zone_ahead", "camera_ahead", "police_ahead", "hazard_ahead")
        document("res/values/public.xml").use { doc ->
            val nodes = doc.getElementsByTagName("public")
            val entries = (0 until nodes.length).map { nodes.item(it) as Element }
            check(entries.none { it.getAttribute("name").startsWith("morphe_nav_") }) { "Vela telemetry resources already exist" }
            val strings = entries.filter { it.getAttribute("type") == "string" }
            val largest = strings.maxOf { it.getAttribute("id").removePrefix("0x").toLong(16) }
            check(largest ushr 24 == 0x7fL && (largest and 0xffff) + names.size < 0xffff)
            names.forEachIndexed { index, name ->
                doc.documentElement.appendChild(doc.createElement("public").apply {
                    setAttribute("type", "string"); setAttribute("name", "morphe_nav_$name")
                    setAttribute("id", "0x${(largest + index + 1).toString(16)}")
                })
            }
        }
        values.forEach { (folder, texts) ->
            val path = "res/$folder/strings.xml"
            get(path).apply { if (!exists()) { parentFile.mkdirs(); writeText("<resources/>") } }
            document(path).use { doc ->
                names.zip(texts).forEach { (name, text) ->
                    doc.documentElement.appendChild(doc.createElement("string").apply {
                        setAttribute("name", "morphe_nav_$name"); textContent = text
                    })
                }
            }
        }
    }
}
