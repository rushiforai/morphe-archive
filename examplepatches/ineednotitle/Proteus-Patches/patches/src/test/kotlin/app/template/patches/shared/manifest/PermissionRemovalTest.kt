package app.template.patches.shared.manifest

import java.io.StringReader
import javax.xml.parsers.DocumentBuilderFactory
import org.xml.sax.InputSource

/** Run by the testPermissionRemoval Gradle task; no Android device is needed. */
object PermissionRemovalTest {
    @JvmStatic
    fun main(args: Array<String>) {
        val defaults = policy()
        check(defaults.shouldRemove("android.permission.CAMERA"))
        check(defaults.shouldRemove("android.permission.NEARBY_WIFI_DEVICES"))
        check(!defaults.shouldRemove("android.permission.NEARBY_WIFI"))
        check(!defaults.shouldRemove("android.permission.INTERNET"))

        val disabled = policy(selections = mapOf("camera" to false, "notifications" to false))
        check(!disabled.shouldRemove("android.permission.CAMERA"))
        check(!disabled.shouldRemove("android.permission.POST_NOTIFICATIONS"))
        check(disabled.shouldRemove("android.permission.RECORD_AUDIO"))

        val custom = policy(
            keep = "CAMERA; POST_NOTIFICATIONS, AD_ID\nACCESS_ADSERVICES_TOPICS",
            extra = "CAMERA, com.example.permission.CUSTOM;\nREAD_CALL_LOG,",
        )
        check(!custom.shouldRemove("android.permission.CAMERA")) // keep beats extra and categories
        check(!custom.shouldRemove("com.google.android.gms.permission.AD_ID"))
        check(!custom.shouldRemove("android.permission.ACCESS_ADSERVICES_TOPICS"))
        check(custom.shouldRemove("android.permission.ACCESS_ADSERVICES_ATTRIBUTION"))
        check(custom.shouldRemove("android.permission.READ_CALL_LOG"))
        check(custom.shouldRemove("com.example.permission.CUSTOM"))

        val legacy = policy(legacy = "READ_CONTACTS", extra = "CAMERA", removeAdServices = true)
        check(legacy.usesLegacyList)
        check(legacy.shouldRemove("android.permission.READ_CONTACTS"))
        check(!legacy.shouldRemove("android.permission.RECORD_AUDIO"))
        check(legacy.shouldRemove("android.permission.CAMERA"))
        // The old 2.2.1 patch always removed AdServices, even with a custom list.
        check(legacy.shouldRemove("android.permission.ACCESS_ADSERVICES_TOPICS"))
        check(!policy(legacy = "READ_CONTACTS", removeAdServices = false)
            .shouldRemove("android.permission.ACCESS_ADSERVICES_TOPICS"))
        check(!policy(legacy = " , ; \n").usesLegacyList)

        check(isPermissionListValid("CAMERA, ; com.example.permission.FOO\nAD_ID"))
        check(!isPermissionListValid("CAMERA POST_NOTIFICATIONS"))
        check(!isPermissionListValid("android.permission."))
        check(runCatching { policy(keep = "CAMERA POST_NOTIFICATIONS") }.isFailure)

        val xml = """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android"
                xmlns:a="http://schemas.android.com/apk/res/android">
                <uses-permission android:name="android.permission.CAMERA"/>
                <uses-permission-sdk-23 android:name="android.permission.CAMERA"/>
                <uses-permission-sdk-m android:name="android.permission.RECORD_AUDIO"/>
                <uses-permission android:name="android.permission.INTERNET"/>
                <queries><uses-permission android:name="android.permission.CAMERA"/></queries>
                <application/>
            </manifest>
        """.trimIndent()
        for (namespaceAware in listOf(false, true)) {
            val doc = parse(xml, namespaceAware)
            val removed = removeRequestedPermissions(doc, policy(keep = "RECORD_AUDIO"))
            check(removed == listOf("android.permission.CAMERA", "android.permission.CAMERA"))
            check(doc.getElementsByTagName("uses-permission").length == 2) // INTERNET and nested query
            check(doc.getElementsByTagName("uses-permission-sdk-23").length == 0)
            check(doc.getElementsByTagName("uses-permission-sdk-m").length == 1)
            check(removeRequestedPermissions(doc, policy(keep = "RECORD_AUDIO")).isEmpty())
        }
        // A valid Android namespace with a nonstandard prefix also works.
        val alternatePrefix = parse(xml.replace("android:name", "a:name"), true)
        check(removeRequestedPermissions(alternatePrefix, policy()).size == 3)
        println("Permission removal policy and manifest tests passed")
    }

    private fun policy(
        selections: Map<String, Boolean?> = emptyMap(),
        removeAdServices: Boolean = true,
        keep: String? = null,
        extra: String? = null,
        legacy: String? = null,
    ) = PermissionRemovalPolicy.fromOptions(selections, removeAdServices, keep, extra, legacy)

    private fun parse(xml: String, namespaceAware: Boolean) = DocumentBuilderFactory.newInstance().apply {
        isNamespaceAware = namespaceAware
    }.newDocumentBuilder().parse(InputSource(StringReader(xml)))
}
