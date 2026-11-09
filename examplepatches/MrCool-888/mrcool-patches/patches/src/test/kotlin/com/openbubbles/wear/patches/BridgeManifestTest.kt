package com.openbubbles.wear.patches

import app.morphe.patcher.patch.PatchException
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class BridgeManifestTest {
    private fun manifest(queries: String = "") = DocumentBuilderFactory.newInstance().apply {
        isNamespaceAware = true
    }.newDocumentBuilder().parse(
        """
        <manifest xmlns:android="$ANDROID_NS" package="com.openbubbles.messaging"
            android:versionName="2.0.0" android:versionCode="20002293">
            $queries
            <application android:name="com.localob.messaging.shell.ShellApplication">
                <receiver android:name="private.Receiver" android:exported="false"/>
                <service android:name="private.Service" android:exported="false"/>
            </application>
        </manifest>
        """.trimIndent().byteInputStream(),
    )

    @Test fun `adds embedded Wear service and private settings and media without changing native components`() {
        val document = manifest("""<queries><package android:name="another.app"/></queries>""")
        addSettingsToManifest(document)
        addBridgeToManifest(document)
        val xpath = javax.xml.xpath.XPathFactory.newInstance().newXPath()
        fun evaluate(expression: String) = xpath.evaluate(expression, document)
        assertEquals("2", evaluate("count(/manifest/application/service)"))
        assertEquals("false", evaluate("string(/manifest/application/receiver/@*[local-name()='exported'])"))
        assertEquals("false", evaluate("string(/manifest/application/service[@*[local-name()='name']='private.Service']/@*[local-name()='exported'])"))
        val settings = "/manifest/application/activity[@*[local-name()='name']='$SETTINGS_ACTIVITY']"
        assertEquals("1", evaluate("count($settings)"))
        assertEquals("false", evaluate("string($settings/@*[local-name()='exported'])"))
        assertEquals("0", evaluate("count($settings/intent-filter)"))
        val restart = "/manifest/application/activity[@*[local-name()='name']='$RESTART_ACTIVITY']"
        assertEquals("false", evaluate("string($restart/@*[local-name()='exported'])"))
        assertEquals(":morphe_restart", evaluate("string($restart/@*[local-name()='process'])"))
        assertEquals("0", evaluate("count($restart/intent-filter)"))
        val bridge = "/manifest/application/service[@*[local-name()='name']='$SERVICE_NAME']"
        assertEquals("true", evaluate("string($bridge/@*[local-name()='exported'])"))
        assertEquals("com.google.android.gms.wearable.MESSAGE_RECEIVED", evaluate("string($bridge/intent-filter/action/@*[local-name()='name'])"))
        assertEquals("0", evaluate("count($bridge/@*[local-name()='permission'])"))
        assertEquals("1", evaluate("count($bridge/intent-filter/action[@*[local-name()='name']='com.google.android.gms.wearable.DATA_CHANGED'])"))
        assertEquals("false", evaluate("string(/manifest/application/receiver[@*[local-name()='name']='$NOTIFICATION_RECEIVER']/@*[local-name()='exported'])"))
        assertEquals("false", evaluate("string(/manifest/application/activity[@*[local-name()='name']='$NOTIFICATION_OPEN_ACTIVITY']/@*[local-name()='exported'])"))
        assertEquals("true", evaluate("string(/manifest/application/activity[@*[local-name()='name']='$NOTIFICATION_OPEN_ACTIVITY']/@*[local-name()='noHistory'])"))
        assertEquals("", evaluate("string(/manifest/application/activity[@*[local-name()='name']='$NOTIFICATION_OPEN_ACTIVITY']/@*[local-name()='taskAffinity'])"))
        val provider = "/manifest/application/provider[@*[local-name()='name']='$MEDIA_PROVIDER_NAME']"
        assertEquals("1", evaluate("count($provider)"))
        assertEquals(MEDIA_AUTHORITY, evaluate("string($provider/@*[local-name()='authorities'])"))
        assertEquals("false", evaluate("string($provider/@*[local-name()='exported'])"))
        assertEquals("false", evaluate("string($provider/@*[local-name()='grantUriPermissions'])"))
        assertEquals("0", evaluate("count($provider/grant-uri-permission | $provider/path-permission | $provider/intent-filter)"))
        assertEquals("0", evaluate("count($provider/@*[local-name()='permission' or local-name()='readPermission' or local-name()='writePermission'])"))
        assertEquals("1", evaluate("count(/manifest/queries)"))
        assertEquals("1", evaluate("count(/manifest/queries/package)"))
        assertEquals("com.openbubbles.messaging", document.documentElement.getAttribute("package"))
        assertFailsWith<PatchException> { addBridgeToManifest(document) }
    }

    @Test fun `notification settings add no bridge components and coexist with bridge`() {
        val document = manifest()
        addSettingsToManifest(document)
        assertEquals(2, document.getElementsByTagName("activity").length)
        assertEquals(1, document.getElementsByTagName("service").length)
        assertEquals(0, document.getElementsByTagName("provider").length)
        addBridgeToManifest(document)
        assertEquals(3, document.getElementsByTagName("activity").length)
        assertEquals(2, document.getElementsByTagName("service").length)
        assertEquals(1, document.getElementsByTagName("provider").length)
        assertFailsWith<PatchException> { addSettingsToManifest(document) }
    }

    @Test fun `keeps the shell application and rejects an unexpected startup class`() {
        val document = manifest()
        addBridgeToManifest(document)
        val application = document.getElementsByTagName("application").item(0) as org.w3c.dom.Element
        assertEquals("com.localob.messaging.shell.ShellApplication", application.getAttributeNS(ANDROID_NS, "name"))
        val wrong = manifest()
        (wrong.getElementsByTagName("application").item(0) as org.w3c.dom.Element)
            .setAttributeNS(ANDROID_NS, "android:name", "com.localob.messaging.app.LocalObApplication")
        assertFailsWith<PatchException> { addBridgeToManifest(wrong) }
        assertEquals(1, wrong.getElementsByTagName("service").length)
    }

    @Test fun `rejects provider class or authority conflicts before altering the manifest`() {
        listOf(
            MEDIA_PROVIDER_NAME to "another.authority",
            "another.Provider" to MEDIA_AUTHORITY,
            "another.Provider" to "another.authority;$MEDIA_AUTHORITY",
        ).forEach { (name, authority) ->
            val document = manifest()
            val provider = document.createElement("provider").apply {
                setAttributeNS(ANDROID_NS, "android:name", name)
                setAttributeNS(ANDROID_NS, "android:authorities", authority)
            }
            document.getElementsByTagName("application").item(0).appendChild(provider)
            assertFailsWith<PatchException> { addBridgeToManifest(document) }
            assertEquals(1, document.getElementsByTagName("service").length)
            assertEquals(1, document.getElementsByTagName("provider").length)
            assertEquals(0, document.getElementsByTagName("queries").length)
        }
    }

    @Test fun `preserves existing provider privacy`() {
        val document = manifest()
        document.getElementsByTagName("application").item(0).appendChild(document.createElement("provider").apply {
            setAttributeNS(ANDROID_NS, "android:name", "private.Provider")
            setAttributeNS(ANDROID_NS, "android:authorities", "private.authority")
            setAttributeNS(ANDROID_NS, "android:exported", "false")
        })
        addBridgeToManifest(document)
        assertEquals(2, document.getElementsByTagName("provider").length)
        assertEquals("false", (document.getElementsByTagName("provider").item(0) as org.w3c.dom.Element)
            .getAttributeNS(ANDROID_NS, "exported"))
    }

    @Test fun `does not add visibility for the retired companion`() {
        val document = manifest()
        addBridgeToManifest(document)
        assertEquals(0, document.getElementsByTagName("queries").length)
        assertEquals(0, document.getElementsByTagName("package").length)
    }

    @Test fun `rejects wrong package version and version code even if compatibility is forced`() {
        requireSupportedVersion("com.openbubbles.messaging", "2.0.0", "20002293")
        listOf(
            Triple("com.example.other", "2.0.0", "20002293"),
            Triple("com.openbubbles.messaging", "2.0.1", "20002293"),
            Triple("com.openbubbles.messaging", "2.0.0", "20002289"),
            Triple("com.openbubbles.messaging", "2.0.0", "020002293"),
            Triple("com.openbubbles.messaging", "2.0.0 ", "20002293"),
        ).forEach { (name, version, code) ->
            assertFailsWith<PatchException> { requireSupportedVersion(name, version, code) }
        }
        val document = manifest()
        document.documentElement.setAttributeNS(ANDROID_NS, "android:versionCode", "1")
        assertFailsWith<PatchException> { addBridgeToManifest(document) }
        assertEquals(1, document.getElementsByTagName("service").length)
        assertEquals(0, document.getElementsByTagName("provider").length)
        assertFalse(document.documentElement.hasAttribute("android:sharedUserId"))
    }

    @Test fun `requires exact GUID accessor and content constructors not similar overloads`() {
        listOf(
            "Lcom/localob/messaging/backend/domain/Message;" to "getGuid()Ljava/lang/String;",
            "Lcom/localob/messaging/backend/db/Message;" to "getGuid()Ljava/lang/String;",
            "Lcom/localob/messaging/backend/db/Attachment;" to "getGuid()Ljava/lang/String;",
            "Lcom/localob/messaging/backend/domain/ContentRun\$Text;" to
                "<init>(Ljava/lang/String;Lcom/localob/messaging/backend/domain/RunFormat;)V",
            "Lcom/localob/messaging/backend/domain/MessageContent;" to
                "<init>(Ljava/util/List;Ljava/util/List;Lcom/localob/messaging/backend/domain/BalloonContent;Lcom/localob/messaging/backend/domain/MessageRef;Lcom/localob/messaging/backend/domain/MessageEffect;Ljava/lang/String;Z)V",
        ).forEach { (type, signature) ->
            val required = REQUIRED_BACKEND_METHODS.getValue(type)
            assertTrue(signature in required)
            requireExactMethods(type, required, required.toSet())
            val wrongOverloads = required.toSet() - signature + signature.replace("(", "(I")
            assertFailsWith<PatchException> { requireExactMethods(type, required, wrongOverloads) }
        }
    }
}
