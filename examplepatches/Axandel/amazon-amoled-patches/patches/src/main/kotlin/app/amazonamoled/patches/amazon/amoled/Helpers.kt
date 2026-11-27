package app.amazonamoled.patches.amazon.amoled

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.decode
import app.morphe.patcher.patch.document
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val FORCE_DARK_ALLOWED = "android:forceDarkAllowed"

internal val MutableMethod.isStatic: Boolean
    get() = (accessFlags and AccessFlags.STATIC.value) != 0

internal fun MutableClass.findMethod(name: String, parameters: List<String>): MutableMethod? =
    methods.firstOrNull { method ->
        method.name == name &&
            method.returnType == "V" &&
            method.parameterTypes.map { it.toString() } == parameters
    }

/**
 * Adds a void method with the given smali body. The method has no local registers: the body
 * may only use the parameter registers (p0 is `this`).
 */
internal fun MutableClass.addVoidMethod(
    name: String,
    parameters: List<String>,
    smali: String,
    isProtected: Boolean = false,
) {
    val access = if (isProtected) AccessFlags.PROTECTED.value else AccessFlags.PUBLIC.value
    val registers = 1 + parameters.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val method = ImmutableMethod(
        type,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        "V",
        access,
        null,
        null,
        MutableMethodImplementation(registers),
    ).toMutable()
    method.addInstructions(0, smali)
    methods.add(method)
}

private class ManifestInfo(val applicationClass: String?, val themes: Set<String>)

private fun readManifest(): ManifestInfo = runCatching {
    document("AndroidManifest.xml").use { doc ->
        val packageName = doc.documentElement.getAttribute("package")
        var applicationClass: String? = null
        val themes = HashSet<String>()

        val application = doc.getElementsByTagName("application").item(0) as? Element
        if (application != null) {
            var name = application.getAttribute("android:name").trim()
            if (name.isNotEmpty()) {
                if (name.startsWith(".")) {
                    name = packageName + name
                } else if (!name.contains('.')) {
                    name = "$packageName.$name"
                }
                applicationClass = "L" + name.replace('.', '/') + ";"
            }
        }

        for (tag in listOf("application", "activity", "activity-alias")) {
            val nodes = doc.getElementsByTagName(tag)
            for (i in 0 until nodes.length) {
                val theme = (nodes.item(i) as? Element)?.getAttribute("android:theme") ?: continue
                if (theme.startsWith("@style/")) themes += theme.removePrefix("@style/")
            }
        }
        ManifestInfo(applicationClass, themes)
    }
}.getOrElse {
    log.warning("Could not read the manifest: ${it.message}")
    ManifestInfo(null, emptySet())
}

/** The type of the app's Application class, such as Lcom/example/App;, or null. */
internal fun readApplicationClassType(): String? = readManifest().applicationClass

/**
 * Sets android:forceDarkAllowed to true on the app themes, so Android darkens what the
 * extension does not repaint itself (custom drawn views, Jetpack Compose screens). Amazon
 * explicitly sets it to false. Never fails the patch: without it, web pages and regular
 * views are still dark.
 */
internal fun enableForceDark() {
    var flipped = 0
    var added = 0
    try {
        val manifestThemes = readManifest().themes
        for (path in decode("res/values*/styles.xml")) {
            runCatching {
                document(path).use { doc ->
                    val styles = doc.getElementsByTagName("style")
                    for (i in 0 until styles.length) {
                        val style = styles.item(i) as? Element ?: continue
                        val item = style.childElements().firstOrNull {
                            it.tagName == "item" && it.getAttribute("name") == FORCE_DARK_ALLOWED
                        }
                        if (item != null) {
                            if (item.textContent.trim() != "true") {
                                item.textContent = "true"
                                flipped++
                            }
                        } else if (style.getAttribute("name") in manifestThemes) {
                            style.appendChild(
                                doc.createElement("item").apply {
                                    setAttribute("name", FORCE_DARK_ALLOWED)
                                    textContent = "true"
                                },
                            )
                            added++
                        }
                    }
                }
            }.onFailure { log.warning("Skipping $path: ${it.message}") }
        }
    } catch (t: Throwable) {
        log.warning("Could not enable Android's darkening: ${t.message}")
    }
    log.info("android:forceDarkAllowed: $flipped item(s) set to true, $added theme(s) given the item.")
}

private fun Element.childElements(): List<Element> {
    val result = ArrayList<Element>()
    val children = childNodes
    for (i in 0 until children.length) {
        (children.item(i) as? Element)?.let(result::add)
    }
    return result
}
