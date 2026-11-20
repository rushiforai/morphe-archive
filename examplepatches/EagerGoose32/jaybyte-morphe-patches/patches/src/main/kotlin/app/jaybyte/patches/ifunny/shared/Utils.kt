package app.jaybyte.patches.ifunny.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

/**
 * Neutralise every overload of [names] declared in [classType].
 * Void methods return immediately, boolean/int-like methods return false/0, and when
 * [returnThis] is set, object-returning instance methods return `this` (builder/fluent APIs).
 * A class that does not exist in the APK is skipped, so SDK removals upstream don't break patching.
 */
internal fun stubAll(classType: String, vararg names: String, returnThis: Boolean = false): Int {
    val clazz = mutableClassDefByOrNull(classType) ?: return 0
    var count = 0
    clazz.methods
        .filter { method ->
            (names.isEmpty() || method.name in names) &&
                method.implementation != null &&
                method.name != "<init>" && method.name != "<clinit>" &&
                !AccessFlags.BRIDGE.isSet(method.accessFlags)
        }
        .forEach { method ->
            when (method.returnType.first()) {
                'V' -> method.returnEarly()
                'Z' -> method.returnEarly(false)
                'B', 'S', 'C', 'I' -> method.returnEarly(0)
                'L' -> if (returnThis && !AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, "return-object p0")
                } else return@forEach
                else -> return@forEach
            }
            count++
        }
    return count
}

/** Stub only the void methods of a class (used for SDKs with obfuscated method names). */
internal fun stubVoidMethods(classType: String): Int {
    val clazz = mutableClassDefByOrNull(classType) ?: return 0
    var count = 0
    clazz.methods
        .filter {
            it.returnType == "V" && it.implementation != null &&
                it.name != "<init>" && it.name != "<clinit>"
        }
        .forEach { it.returnEarly(); count++ }
    return count
}

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/** Edit AndroidManifest.xml with a few small helpers. */
internal fun editManifest(block: ManifestEditor.() -> Unit) {
    document("AndroidManifest.xml").use { doc -> ManifestEditor(doc).block() }
}

internal class ManifestEditor(private val doc: org.w3c.dom.Document) {
    private fun Element.androidName() =
        getAttributeNS(ANDROID_NS, "name").ifEmpty { getAttribute("android:name") }

    private fun elements(tag: String): List<Element> {
        val list = doc.getElementsByTagName(tag)
        return (0 until list.length).map { list.item(it) as Element }
    }

    fun removePermissions(vararg names: String) {
        elements("uses-permission").filter { it.androidName() in names }
            .forEach { it.parentNode.removeChild(it) }
    }

    fun removeQueriedPackages(vararg names: String) {
        elements("package").filter { it.parentNode?.nodeName == "queries" && it.androidName() in names }
            .forEach { it.parentNode.removeChild(it) }
    }

    fun disableComponents(vararg names: String) {
        listOf("provider", "service", "receiver", "activity")
            .flatMap { elements(it) }
            .filter { it.androidName() in names }
            .forEach { it.setAttribute("android:enabled", "false") }
    }

    fun removeMetaData(vararg names: String) {
        elements("meta-data").filter { it.androidName() in names }
            .forEach { it.parentNode.removeChild(it) }
    }

    /** Set (or add) an application-level meta-data value. */
    fun setAppMetaData(name: String, value: String) {
        val application = elements("application").first()
        val existing = elements("meta-data").firstOrNull {
            it.parentNode == application && it.androidName() == name
        }
        val element = existing ?: doc.createElement("meta-data").also {
            it.setAttribute("android:name", name)
            application.appendChild(it)
        }
        element.setAttribute("android:value", value)
    }
}
