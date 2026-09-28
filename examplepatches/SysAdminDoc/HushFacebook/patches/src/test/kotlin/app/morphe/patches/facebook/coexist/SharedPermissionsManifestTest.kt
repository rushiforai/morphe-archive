/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.coexist

import app.morphe.ExtensionDex
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import java.io.StringReader
import java.io.StringWriter
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.xml.sax.InputSource

/**
 * The manifest half of Install beside Meta's apps, on manifests written the way Morphe decodes
 * Facebook's: the two shared permissions renamed everywhere they're named, nothing else touched,
 * and a manifest that isn't what the rename expects left exactly as it was.
 */
class SharedPermissionsManifestTest {
    private fun manifest(body: String): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
        InputSource(
            StringReader(
                """<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.facebook.katana">""" +
                    body + "</manifest>",
            ),
        ),
    )

    private fun Document.text(): String = StringWriter().also {
        TransformerFactory.newInstance().newTransformer().transform(DOMSource(this), StreamResult(it))
    }.toString()

    private fun Document.values(): List<String> {
        val found = mutableListOf<String>()
        val elements = getElementsByTagName("*")
        for (index in 0 until elements.length) {
            val attributes = (elements.item(index) as Element).attributes
            for (at in 0 until attributes.length) found += (attributes.item(at) as Attr).value
        }
        return found
    }

    /** Facebook's own shape: both declared, both requested, components guarded, plus what must stay. */
    private val facebookLike = """
        <uses-permission android:name="com.facebook.katana.provider.ACCESS"/>
        <permission android:name="com.facebook.katana.provider.ACCESS" android:protectionLevel="signature"/>
        <permission android:name="$APP_COMMUNICATION" android:protectionLevel="signature"/>
        <uses-permission android:name="$APP_COMMUNICATION"/>
        <permission android:name="$RECEIVER_ACCESS" android:protectionLevel="signature"/>
        <uses-permission android:name="$RECEIVER_ACCESS"/>
        <uses-permission-sdk-23 android:name="$APP_COMMUNICATION"/>
        <application>
            <activity android:name="com.facebook.katana.dbl.activity.FacebookLoginActivity" android:exported="true"
                android:permission="$APP_COMMUNICATION"/>
            <receiver android:name="com.facebook.device_id.UniqueIdSupplier" android:exported="true"
                android:permission="$RECEIVER_ACCESS"/>
            <provider android:name="com.facebook.katana.provider.CacheProvider" android:exported="true"
                android:permission="com.facebook.katana.provider.ACCESS"
                android:readPermission="$APP_COMMUNICATION" android:writePermission="$APP_COMMUNICATION">
                <path-permission android:pathPrefix="/x" android:permission="$APP_COMMUNICATION"/>
            </provider>
            <meta-data android:name="$APP_COMMUNICATION.note" android:value="$APP_COMMUNICATION"/>
            <activity android:name="com.facebook.katana.Plain" android:permission="${APP_COMMUNICATION}X"/>
        </application>
    """.trimIndent()

    @Test
    fun everyMentionIsRenamedAndNothingElse() {
        val document = manifest(facebookLike)

        val moved = document.renameSharedPermissions()

        // The activity, the provider's read and write guards, its path, and a value naming it.
        assertEquals(Mentions(declared = 1, requested = 2, guards = 5), moved[APP_COMMUNICATION])
        assertEquals(Mentions(declared = 1, requested = 1, guards = 1), moved[RECEIVER_ACCESS])
        val values = document.values()
        assertEquals("a shared name is still in the manifest", emptyList<String>(), values.filter { it in SHARED_PERMISSIONS })
        assertEquals(8, values.count { it == "app.hushfacebook.permission.prod.FB_APP_COMMUNICATION" })
        assertEquals(3, values.count { it == "app.hushfacebook.receiver.permission.ACCESS" })
        // Facebook's own package-scoped permission, and names that only start or end like a shared
        // one, stay as they were: only an exact match is a mention.
        assertEquals(3, values.count { it == "com.facebook.katana.provider.ACCESS" })
        assertTrue(values.contains("$APP_COMMUNICATION.note"))
        assertTrue(values.contains("${APP_COMMUNICATION}X"))
        // A rename keeps the guard it was: signature, as Facebook declared it.
        val declarations = document.getElementsByTagName("permission")
        for (index in 0 until declarations.length) {
            assertEquals("signature", (declarations.item(index) as Element).getAttribute("android:protectionLevel"))
        }
    }

    /** The whole-app rename is two names under one new prefix, so the extension can say the same. */
    @Test
    fun theRenameIsThePrefixOnly() {
        assertEquals("app.hushfacebook.permission.prod.FB_APP_COMMUNICATION", renamed(APP_COMMUNICATION))
        assertEquals("app.hushfacebook.receiver.permission.ACCESS", renamed(RECEIVER_ACCESS))
        assertEquals("app.hushfacebook.permission.%s.FB_APP_COMMUNICATION", renamed(APP_COMMUNICATION_FORMAT))
        assertEquals(renamed(APP_COMMUNICATION), String.format(renamed(APP_COMMUNICATION_FORMAT), "prod"))
        assertThrows(IllegalArgumentException::class.java) { renamed("android.permission.INTERNET") }
    }

    /** A Facebook that stops declaring one of them has changed in a way somebody has to read. */
    @Test
    fun aManifestMissingADeclarationIsLeftAlone() {
        val document = manifest(facebookLike.replace("""<permission android:name="$RECEIVER_ACCESS" android:protectionLevel="signature"/>""", ""))
        val before = document.text()

        val refused = assertThrows(PatchException::class.java) { document.renameSharedPermissions() }

        assertTrue(refused.message, refused.message!!.contains("declares $RECEIVER_ACCESS 0 times"))
        assertTrue(refused.message, refused.message!!.contains("Nothing was renamed"))
        assertEquals("the refused manifest was changed", before, document.text())
    }

    @Test
    fun aManifestDeclaringOneTwiceIsLeftAlone() {
        val twice = """<permission android:name="$APP_COMMUNICATION" android:protectionLevel="signature"/>"""
        val document = manifest(twice + facebookLike)
        val before = document.text()

        val refused = assertThrows(PatchException::class.java) { document.renameSharedPermissions() }

        assertTrue(refused.message, refused.message!!.contains("declares $APP_COMMUNICATION 2 times"))
        assertEquals(before, document.text())
    }

    /** An APK patched before already carries the new names, and a second rename would half-apply. */
    @Test
    fun aManifestHoldingANewNameAlreadyIsLeftAlone() {
        val document = manifest(facebookLike + """<uses-permission android:name="${renamed(RECEIVER_ACCESS)}"/>""")
        val before = document.text()

        val refused = assertThrows(PatchException::class.java) { document.renameSharedPermissions() }

        assertTrue(refused.message, refused.message!!.contains("${renamed(RECEIVER_ACCESS)} is in the manifest already"))
        assertEquals(before, document.text())
    }

    /**
     * The extension answers the same renamed names, from the constants the bundle ships: the
     * compiled payload, not the Java source. The literals it compares against are the ones the patch
     * routes, and the call the patch writes is a public static method with that exact descriptor.
     */
    @Test
    fun theExtensionSaysTheSameNames() {
        val type = NAME_CALL.substringBefore("->")
        assertEquals(FACEBOOK_PREFIX, ExtensionDex.stringConstant(type, "FACEBOOK_PREFIX"))
        assertEquals(RENAMED_PREFIX, ExtensionDex.stringConstant(type, "RENAMED_PREFIX"))
        assertEquals(APP_COMMUNICATION, ExtensionDex.stringConstant(type, "APP_COMMUNICATION"))
        assertEquals(APP_COMMUNICATION_FORMAT, ExtensionDex.stringConstant(type, "APP_COMMUNICATION_FORMAT"))
        assertEquals(RECEIVER_ACCESS, ExtensionDex.stringConstant(type, "RECEIVER_ACCESS"))

        val call = NAME_CALL.substringAfter("->")
        val declared = ExtensionDex.classDef(type).methods.filter {
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
        }.map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("the extension declares no public static $call: $declared", call in declared)
        assertFalse(SHARED_LITERALS.any { it.startsWith(RENAMED_PREFIX) })
    }
}
