/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.coexist

import app.morphe.patches.facebook.misc.extension.PatchLogCapture
import java.io.StringReader
import java.io.StringWriter
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.xml.sax.InputSource

/**
 * A Facebook renamed by Morphe's Clone app, after Install beside Meta's apps renamed the shared
 * permissions: every component guarded by a permission the stock app declared names the clone's
 * own declaration of it, and no provider authority is the stock app's, with each of Clone app's
 * options on or off. A Facebook nobody renamed is left exactly as it was.
 */
class ClonedPackageManifestTest {
    private val facebook = "com.facebook.katana"
    private val clone = "com.facebook.katana.morphe"

    private fun manifest(body: String): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
        InputSource(
            StringReader(
                """<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="$facebook">""" +
                    body + "</manifest>",
            ),
        ),
    )

    private fun Document.text(): String = StringWriter().also {
        TransformerFactory.newInstance().newTransformer().transform(DOMSource(this), StreamResult(it))
    }.toString()

    private fun Document.elements(tag: String): List<Element> {
        val nodes = getElementsByTagName(tag)
        return (0 until nodes.length).map { nodes.item(it) as Element }
    }

    private fun Document.declared() = elements("permission").map { it.getAttribute("android:name") }.toSet()

    /** Every attribute value but a declaration's own name, with where it is. */
    private fun Document.mentions(): List<Pair<String, String>> = elements("*").flatMap { element ->
        (0 until element.attributes.length).map { element.attributes.item(it) as Attr }
            .filterNot { element.tagName == "permission" && it.name == "android:name" }
            .map { "<${element.tagName} ${it.name}>" to it.value }
    }

    private fun Document.authorities(): List<String> =
        elements("provider").flatMap { it.getAttribute("android:authorities").split(';') }

    /** Facebook's shape: its own permissions and the two shared ones, guards of each kind, three providers. */
    private val facebookLike = """
        <permission android:name="com.facebook.katana.provider.ACCESS" android:protectionLevel="signature"/>
        <uses-permission android:name="com.facebook.katana.provider.ACCESS"/>
        <permission android:name="$APP_COMMUNICATION" android:protectionLevel="signature"/>
        <uses-permission android:name="$APP_COMMUNICATION"/>
        <uses-permission-sdk-23 android:name="$APP_COMMUNICATION"/>
        <permission android:name="$RECEIVER_ACCESS" android:protectionLevel="signature"/>
        <uses-permission android:name="$RECEIVER_ACCESS"/>
        <permission android:name="com.facebook.katana.permission.CREATE_SHORTCUT" android:protectionLevel="signature"/>
        <uses-permission android:name="com.facebook.katana.permission.CREATE_SHORTCUT"/>
        <uses-permission android:name="android.permission.INTERNET"/>
        <application>
            <provider android:name="com.facebook.messaging.push.dedup.provider.ClientMessagePushDedupInfoProvider"
                android:authorities="com.facebook.katana.ClientMessagePushDedupInfoProvider"
                android:exported="true" android:permission="$APP_COMMUNICATION"/>
            <provider android:name="com.facebook.contacts.provider.ContactsConnectionsProvider"
                android:authorities="com.facebook.katana.provider.ContactsConnectionsProvider"
                android:exported="true" android:permission="com.facebook.katana.provider.ACCESS"
                android:readPermission="$APP_COMMUNICATION" android:writePermission="$APP_COMMUNICATION">
                <path-permission android:pathPrefix="/x" android:permission="com.facebook.katana.provider.ACCESS"/>
            </provider>
            <provider android:name="androidx.core.content.FileProvider"
                android:authorities="com.facebook.katana.quicksilver.fileprovider; com.facebook.katana.apkfileprovider"
                android:exported="false"/>
            <receiver android:name="com.facebook.device_id.UniqueIdSupplier" android:exported="true"
                android:permission="$RECEIVER_ACCESS"/>
            <receiver android:name="com.facebook.quicksilver.ShortcutMadeIntentReceiver" android:exported="true"
                android:permission="com.facebook.katana.permission.CREATE_SHORTCUT"/>
            <service android:name="com.facebook.Jobs" android:permission="android.permission.BIND_JOB_SERVICE"/>
            <provider android:name="com.facebook.oxygen.AppManagerSsoProvider" android:exported="true"
                android:authorities="com.facebook.katana.integration.appmanager.sso"
                android:permission="com.facebook.appmanager.ACCESS"/>
        </application>
    """.trimIndent()

    /** The manifest as Hushfacebook's default patches leave it: the shared two renamed. */
    private fun patched(): Document = manifest(facebookLike).also { it.renameSharedPermissions() }

    /** The stock app's permissions, after the rename, as the stock app declares them. */
    private val stockDeclared = patched().declared()
    private val stockAuthorities = setOf(
        "com.facebook.katana.ClientMessagePushDedupInfoProvider",
        "com.facebook.katana.provider.ContactsConnectionsProvider",
        "com.facebook.katana.quicksilver.fileprovider",
        "com.facebook.katana.apkfileprovider",
        "com.facebook.katana.integration.appmanager.sso",
    )

    /**
     * The acceptance, on one manifest: each mention of a permission the stock app declared names
     * one this manifest declares, and no authority is one the stock app claims.
     */
    private fun assertSelfConsistent(document: Document, where: String) {
        val declared = document.declared()
        val strays = document.mentions().filter { (_, value) -> value in stockDeclared && value !in declared }
        assertEquals("$where: mentions of a permission only the stock app declares", emptyList<Pair<String, String>>(), strays)
        val claimed = document.authorities().map { it.trim() }.filter { it in stockAuthorities }
        assertEquals("$where: authorities the stock app claims", emptyList<String>(), claimed)
    }

    @Test
    fun theStockAuthoritiesAreEveryEntryUnderThePackage() {
        val document = manifest(facebookLike + """<provider android:authorities="@string/x;org.other.provider"/>""")
        assertEquals(stockAuthorities, document.ownAuthorities(facebook))
    }

    @Test
    fun aCloneWithEachOptionIsSelfConsistent() {
        for (permissions in listOf(true, false)) {
            for (providers in listOf(true, false)) {
                val where = "Update permissions $permissions, Update providers $providers"
                val document = patched()
                document.cloneApp(clone, permissions, providers)

                document.followRenamedPackage(facebook, stockAuthorities)

                assertSelfConsistent(document, where)
                assertEquals(where, clone, document.documentElement.getAttribute("package"))
            }
        }
    }

    /**
     * Update permissions on: the declarations moved, so every guard follows them. The ones Clone app
     * missed are the components', the path's and the second request of FB_APP_COMMUNICATION.
     */
    @Test
    fun guardsFollowTheClonesDeclarations() {
        val document = patched()
        document.cloneApp(clone, updatePermissions = true, updateProviders = true)

        val followed = document.followRenamedPackage(facebook, stockAuthorities)

        assertEquals(Followed(permissions = 8, authorities = 0), followed)
        val values = document.mentions().map { it.second }
        assertEquals(5, values.count { it == "${clone}_app.hushfacebook.permission.prod.FB_APP_COMMUNICATION" })
        assertEquals(2, values.count { it == "${clone}_app.hushfacebook.receiver.permission.ACCESS" })
        assertEquals(3, values.count { it == "$clone.provider.ACCESS" })
        assertEquals(2, values.count { it == "$clone.permission.CREATE_SHORTCUT" })
        // Android's own and another app's permissions stay: the clone holds those as the stock app does.
        assertEquals(1, values.count { it == "android.permission.BIND_JOB_SERVICE" })
        assertEquals(1, values.count { it == "com.facebook.appmanager.ACCESS" })
        assertEquals(1, values.count { it == "android.permission.INTERNET" })
    }

    /** Update providers off: every stock authority moves under the clone, the way the option would have. */
    @Test
    fun authoritiesMoveWhenCloneAppLeftThem() {
        val document = patched()
        document.cloneApp(clone, updatePermissions = false, updateProviders = false)

        val followed = document.followRenamedPackage(facebook, stockAuthorities)

        assertEquals(Followed(permissions = 0, authorities = 5), followed)
        assertEquals(
            listOf(
                "$clone.ClientMessagePushDedupInfoProvider",
                "$clone.provider.ContactsConnectionsProvider",
                "$clone.quicksilver.fileprovider",
                // Facebook's list has a space after the semicolon, and it stays where it was.
                " $clone.apkfileprovider",
                "$clone.integration.appmanager.sso",
            ),
            document.authorities(),
        )
    }

    /** Update providers on: Clone app already moved them, its own way, and nothing moves twice. */
    @Test
    fun authoritiesCloneAppMovedStay() {
        val document = patched()
        document.cloneApp(clone, updatePermissions = false, updateProviders = true)
        val before = document.authorities()

        assertEquals(Followed(permissions = 0, authorities = 0), document.followRenamedPackage(facebook, stockAuthorities))
        assertEquals(before, document.authorities())
    }

    /** Any name the reader chooses in Clone app, not only the default suffix. */
    @Test
    fun anyNewPackageNameIsFollowed() {
        val document = patched()
        document.cloneApp("org.example.fb", updatePermissions = true, updateProviders = false)

        document.followRenamedPackage(facebook, stockAuthorities)

        val values = document.mentions().map { it.second }
        assertEquals(5, values.count { it == "org.example.fb_app.hushfacebook.permission.prod.FB_APP_COMMUNICATION" })
        assertEquals("org.example.fb.ClientMessagePushDedupInfoProvider", document.authorities().first())
    }

    /** A Facebook nobody renamed, which is every install but a clone, isn't touched. */
    @Test
    fun anUnrenamedManifestIsLeftExactlyAsItWas() {
        val document = patched()
        val before = document.text()

        assertNull(document.followRenamedPackage(facebook, stockAuthorities))
        assertEquals(before, document.text())
    }

    /**
     * Nothing here can tell a plain install apart from a clone whose "Clone app" hasn't finalized
     * yet (Morphe gives patches no way to see what else was selected), so a selection holding only
     * patches whose names sort after "Clone app" leaves this step silent and the manifest as Clone
     * app wrote it (ClonedPackageOrderTest.aSelectionOfOnlyLaterNamedPatchesRunsCloneAppFirst). The
     * fine message is this step's only way to say what to do about it, without claiming a clone is
     * actually in play on every ordinary build.
     */
    @Test
    fun aStillStockPackageExplainsWhatToAddForAClone() {
        val document = patched()

        val messages = PatchLogCapture.fine { document.followRenamedPackage(facebook, stockAuthorities) }

        assertEquals(1, messages.size)
        assertTrue(messages[0], messages[0].contains("Clone app"))
        assertTrue(messages[0], messages[0].contains("Block ad telemetry"))
    }
}
