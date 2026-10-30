package app.hushmessenger.patches.misc

import app.hushmessenger.patches.MessengerTarget
import app.hushmessenger.patches.controls.fixtureClass
import app.hushmessenger.patches.controls.fixtureMethod
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.xml.sax.InputSource
import java.io.ByteArrayInputStream
import java.io.RandomAccessFile
import java.io.StringReader
import java.io.StringWriter
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.file.Files
import java.nio.file.Path
import java.security.MessageDigest
import java.security.cert.CertificateFactory
import java.security.cert.X509Certificate
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNull
import kotlin.test.assertTrue

private const val AVAILABILITY = "LX/1qi;->A01(Landroid/content/Context;I)I"
private const val PROVIDER = "LX/btj;"

/** 585's availability check cut down to the three texts it's found by. */
private fun availabilityMethod(id: String = AVAILABILITY, version: String = "MetadataValueReader") = fixtureMethod(id, """
    const-string v0, "com.google.android.gms"
    const-string v0, "$version"
    const-string v0, "This should never happen."
    const/4 v0, 0x0
    return v0
""".trimIndent(), 4, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)

/** androidx's framework provider: true on Android 14 and later when Android hands it a CredentialManager. */
private fun providerClass(type: String = PROVIDER) = fixtureClass(type, listOf(fixtureMethod("$type->isAvailableOnDevice()Z", """
    sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
    const/16 v1, 0x22
    if-lt v0, v1, :no
    iget-object v0, p0, $type->A00:Landroid/credentials/CredentialManager;
    if-eqz v0, :no
    const/4 v0, 0x1
    return v0
    :no
    const/4 v0, 0x0
    return v0
""".trimIndent(), 3)), extraFields = listOf(ImmutableField(type, "A00", "Landroid/credentials/CredentialManager;",
    AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, null, null, null)))

/** The two ways 585 asks for a Cloud Messaging token, and an Instance ID static field. */
private fun registrationClass(owner: String = "LX/3Ua;", texts: List<String> = listOf("com.google.android.c2dm.intent.REGISTER",
    "com.google.iid.TOKEN_REQUEST")) = fixtureClass(owner, listOf(fixtureMethod("$owner->A00(Landroid/content/Context;)V",
    texts.joinToString("\n") { "const-string v0, \"$it\"" } + "\nreturn-void", 2)),
    extraFields = listOf(ImmutableField(owner, "A01", "Ljava/lang/String;", AccessFlags.STATIC.value,
        ImmutableStringEncodedValue("com.google.android.gms"), null, null)))

private fun supportedClasses(): List<ClassDef> =
    listOf(fixtureClass("LX/1qi;", listOf(availabilityMethod())), providerClass(), registrationClass())

private fun xml(text: String): Document =
    DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(InputSource(StringReader(text.trimIndent())))

private fun Document.text(): String = StringWriter().also {
    TransformerFactory.newInstance().newTransformer().transform(DOMSource(this), StreamResult(it))
}.toString()

private fun Document.elements(tag: String) = getElementsByTagName(tag).let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

/** 585's manifest cut down to the Cloud Messaging parts and a query block. */
private val MANIFEST = """
    <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.facebook.orca">
      <uses-permission android:name="com.google.android.c2dm.permission.RECEIVE"/>
      <uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
      <queries><package android:name="com.facebook.katana"/></queries>
      <application>
        <meta-data android:name="com.google.android.gms.version" android:value="@integer/google_play_services_version"/>
        <receiver android:name="com.google.firebase.iid.FirebaseInstanceIdReceiver" android:permission="com.google.android.c2dm.permission.SEND">
          <intent-filter><action android:name="com.google.android.c2dm.intent.RECEIVE"/></intent-filter>
        </receiver>
      </application>
    </manifest>
"""

class GmsCoreSupportTest {
    @Test fun namesMoveToMicrogsVendorAndEverythingElseStays() {
        assertEquals("app.revanced.android.gms", gmsCoreText("com.google.android.gms"))
        assertEquals("app.revanced", gmsCoreText("com.google"))
        assertEquals("app.revanced.android.c2dm.intent.REGISTER", gmsCoreText("com.google.android.c2dm.intent.REGISTER"))
        assertEquals("app.revanced.iid.TOKEN_REQUEST", gmsCoreText("com.google.iid.TOKEN_REQUEST"))
        assertEquals("app.revanced.android.c2dm.permission.RECEIVE", gmsCoreText("com.google.android.c2dm.permission.RECEIVE"))
        assertEquals("content://app.revanced.android.gsf.gservices/prefix", gmsCoreText("content://com.google.android.gsf.gservices/prefix"))
        assertEquals("content://app.revanced.settings", gmsCoreText("content://com.google.settings"))
        // The version key and the ad ID service keep Google's names: microG-RE answers to both as they are.
        for (kept in listOf("com.google.android.gms.version", "com.google.android.gms.ads.identifier.service.START",
            "com.google.android.gms.ads.identifier.internal.IAdvertisingIdService", "content://com.google.settingsx",
            "com.google.android.gmsx", "com.facebook.orca")) assertNull(gmsCoreText(kept), kept)
    }

    @Test fun planFindsTheTwoChecksAndEveryRewrittenText() {
        val plan = planGmsCore(supportedClasses())
        assertEquals(AVAILABILITY, "${plan.availability.definingClass}->${plan.availability.name}(Landroid/content/Context;I)I")
        assertEquals(PROVIDER, plan.frameworkProvider.definingClass)
        assertEquals(listOf("app.revanced.android.gms", "app.revanced.android.c2dm.intent.REGISTER", "app.revanced.iid.TOKEN_REQUEST"),
            plan.texts.map { it.text })
        assertEquals(listOf(GmsCoreField("LX/3Ua;", "A01", "app.revanced.android.gms")), plan.fields)
    }

    @Test fun hushMessengersOwnClassesKeepGooglesNames() {
        val extension = fixtureClass("Lapp/hushmessenger/extension/Probe;", listOf(fixtureMethod(
            "Lapp/hushmessenger/extension/Probe;->A00()V", "const-string v0, \"com.google.android.gms\"\nreturn-void", 1)))
        val plan = planGmsCore(supportedClasses() + extension)
        assertTrue(plan.texts.none { it.method.definingClass.startsWith("Lapp/hushmessenger/") })
    }

    @Test fun refusesWhenACheckIsMissingOrDoubled() {
        val noAvailability = assertFailsWith<PatchException> { planGmsCore(listOf(providerClass(), registrationClass())) }
        assertContains(noAvailability.message!!, "availability check has 0 matches")
        val twoAvailability = assertFailsWith<PatchException> {
            planGmsCore(supportedClasses() + fixtureClass("LX/1qj;", listOf(availabilityMethod("LX/1qj;->A01(Landroid/content/Context;I)I"))))
        }
        assertContains(twoAvailability.message!!, "availability check has 2 matches")
        // Without the version metadata read it's some other method that names Play services.
        val other = assertFailsWith<PatchException> {
            planGmsCore(listOf(fixtureClass("LX/1qi;", listOf(availabilityMethod(version = "MetadataReader"))), providerClass(), registrationClass()))
        }
        assertContains(other.message!!, "availability check has 0 matches")
        val twoProviders = assertFailsWith<PatchException> { planGmsCore(supportedClasses() + providerClass("LX/btk;")) }
        assertContains(twoProviders.message!!, "framework provider has 2 matches")
    }

    @Test fun refusesWhenMessengerStopsAskingForATokenTheOldWay() {
        for (gone in listOf("com.google.android.c2dm.intent.REGISTER", "com.google.iid.TOKEN_REQUEST")) {
            val classes = listOf(fixtureClass("LX/1qi;", listOf(availabilityMethod())), providerClass(),
                registrationClass(texts = listOf("com.google.android.c2dm.intent.REGISTER", "com.google.iid.TOKEN_REQUEST") - gone))
            assertContains(assertFailsWith<PatchException> { planGmsCore(classes) }.message!!, "no longer names $gone")
        }
    }

    @Test fun manifestSendsCloudMessagingToMicrogAndNamesMessengersCertificate() {
        val document = xml(MANIFEST)
        rerouteManifestToGmsCore(document)
        val names = document.elements("*").flatMap { element -> (0 until element.attributes.length).map { element.attributes.item(it).nodeValue } }
        assertTrue(names.none { it.startsWith("com.google.android.c2dm.") }, document.text())
        assertContains(names, "app.revanced.android.c2dm.permission.RECEIVE")
        assertContains(names, "app.revanced.android.c2dm.permission.SEND")
        assertContains(names, "app.revanced.android.c2dm.intent.RECEIVE")
        // Only Cloud Messaging's names move in the manifest: microG-RE reads the version key and AD_ID as Google's.
        assertContains(names, "com.google.android.gms.version")
        assertContains(names, "com.google.android.gms.permission.AD_ID")
        assertEquals(listOf("com.facebook.katana", GMS_CORE_PACKAGE),
            document.elements("queries").single().let { q -> document.elements("package").filter { it.parentNode === q } }.map { it.getAttribute("android:name") })
        val spoof = document.elements("meta-data").single { it.getAttribute("android:name") == SPOOFED_SIGNATURE_METADATA }
        assertEquals("8a3c4b262d721acd49a4bf97d5213199c86fa2b9", spoof.getAttribute("android:value"))
        assertEquals("application", (spoof.parentNode as Element).tagName)
    }

    @Test fun aManifestWithoutQueriesGetsOneBeforeTheApplication() {
        val document = xml(MANIFEST.replace("""<queries><package android:name="com.facebook.katana"/></queries>""", ""))
        rerouteManifestToGmsCore(document)
        val queries = document.elements("queries").single()
        assertEquals("application", (queries.nextSibling as Element).tagName)
        assertEquals(GMS_CORE_PACKAGE, (queries.firstChild as Element).getAttribute("android:name"))
    }

    @Test fun manifestRefusesUnchangedWhenItCantBeRerouted() {
        val cases = mapOf(
            "doesn't ask for Cloud Messaging's receive permission" to MANIFEST.replace(
                """<uses-permission android:name="com.google.android.c2dm.permission.RECEIVE"/>""", ""),
            "already names app.revanced.android.gms" to MANIFEST.replace("com.facebook.katana", GMS_CORE_PACKAGE),
            "already names $SPOOFED_SIGNATURE_METADATA" to MANIFEST.replace("<application>",
                """<application><meta-data android:name="$SPOOFED_SIGNATURE_METADATA" android:value="00"/>"""),
            "already names app.revanced.android.c2dm.intent.RECEIVE" to MANIFEST.replace(
                "</intent-filter>", """<action android:name="app.revanced.android.c2dm.intent.RECEIVE"/></intent-filter>"""),
        )
        for ((reason, text) in cases) {
            val document = xml(text)
            val before = document.text()
            assertContains(assertFailsWith<PatchException> { rerouteManifestToGmsCore(document) }.message!!, reason)
            assertEquals(before, document.text(), reason)
        }
    }

    /** Every supported stock build has exactly one of each check and still asks for a token both ways. */
    @Test fun everyStockBuildPlansTheSameReroute() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(MessengerTarget.VERSION_CODES.size, apks.size)
        val problems = mutableListOf<String>()
        for (apk in apks) {
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val plan = runCatching { planGmsCore(classes) }.getOrElse { problems += "${apk.fileName}: ${it.message}"; continue }
            val rewritten = plan.texts.map { it.text }.toSet()
            for (text in GMS_CORE_REQUIRED_TEXTS) if (gmsCoreText(text) !in rewritten) problems += "${apk.fileName}: $text kept"
        }
        assertEquals(emptyList(), problems)
    }

    /**
     * The certificate microG-RE shows Google is the first of Messenger's signing lineage. 585 carries only v3 and v3.1
     * signatures, so the certificates are read out of the APK signing block: the oldest of them is the one pinned.
     */
    @Test fun everyStockBuildIsSignedFirstWithThePinnedCertificate() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(MessengerTarget.VERSION_CODES.size, apks.size)
        for (apk in apks) {
            val certificates = signingBlockCertificates(apk)
            assertTrue(certificates.size >= 2, "${apk.fileName}: ${certificates.size} certificates")
            val oldest = certificates.minBy { it.notBefore }
            assertEquals(MESSENGER_CERTIFICATE_SHA1, sha1(oldest), "${apk.fileName}: ${oldest.subjectX500Principal}")
        }
    }

    private fun sha1(certificate: X509Certificate) = MessageDigest.getInstance("SHA-1").digest(certificate.encoded).joinToString("") { "%02x".format(it) }

    /** Every DER certificate in the APK signing block, the block that sits right before the central directory. */
    private fun signingBlockCertificates(apk: Path): List<X509Certificate> = RandomAccessFile(apk.toFile(), "r").use { file ->
        val tailSize = minOf(file.length(), 65_557L).toInt()
        val tail = ByteArray(tailSize).also { file.seek(file.length() - tailSize); file.readFully(it) }
        val eocd = (tailSize - 22 downTo 0).first { ByteBuffer.wrap(tail, it, 4).order(ByteOrder.LITTLE_ENDIAN).int == 0x06054b50 }
        val centralDirectory = ByteBuffer.wrap(tail, eocd + 16, 4).order(ByteOrder.LITTLE_ENDIAN).int.toLong() and 0xffffffffL
        val footer = ByteArray(24).also { file.seek(centralDirectory - 24); file.readFully(it) }
        assertEquals("APK Sig Block 42", String(footer, 8, 16, Charsets.US_ASCII))
        val size = ByteBuffer.wrap(footer, 0, 8).order(ByteOrder.LITTLE_ENDIAN).long
        val block = ByteArray(size.toInt()).also { file.seek(centralDirectory - size); file.readFully(it) }
        val factory = CertificateFactory.getInstance("X.509")
        val found = linkedMapOf<String, X509Certificate>()
        for (start in 0 until block.size - 4) {
            if (block[start] != 0x30.toByte() || block[start + 1] != 0x82.toByte()) continue
            val length = 4 + ((block[start + 2].toInt() and 0xff) shl 8 or (block[start + 3].toInt() and 0xff))
            if (start + length > block.size) continue
            val certificate = runCatching {
                factory.generateCertificate(ByteArrayInputStream(block, start, length)) as X509Certificate
            }.getOrNull() ?: continue
            found.putIfAbsent(sha1(certificate), certificate)
        }
        found.values.toList()
    }
}
