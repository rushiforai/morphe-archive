/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.privacy

import app.morphe.ExtensionDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.apksig.ApkVerifier
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.io.ByteArrayInputStream
import java.io.File
import java.security.MessageDigest
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * The signature spoofing metadata: its two constants against the certificate each declared build
 * is signed with, the manifest edit on each declared build, its refusals and the build flag.
 */
@Category(FixtureTests::class)
class GoogleSignInSpoofManifestTest {
    @Test
    fun `both constants are the certificate each declared build is signed with`() {
        assertEquals("the certificate hashes to the SHA-1 beside it", PINTEREST_CERTIFICATE_SHA1, sha1OfHex(PINTEREST_CERTIFICATE_DER))
        for (build in Fixtures.declaredBuilds()) {
            val result = ApkVerifier.Builder(build).build().verify()
            assertTrue("${build.name} does not verify: ${result.errors}", result.isVerified)
            // Every scheme's signers, so a build signed differently under one of them can't pass.
            val certificates = (result.signerCertificates +
                result.v2SchemeSigners.flatMap { it.certificates } +
                result.v3SchemeSigners.flatMap { it.certificates } +
                result.v31SchemeSigners.flatMap { it.certificates })
                .map { it.encoded.joinToString("") { byte -> "%02x".format(byte) } }.toSet()
            assertEquals("${build.name}: the certificate in its signing block", setOf(PINTEREST_CERTIFICATE_DER), certificates)
            val sha1 = MessageDigest.getInstance("SHA-1").digest(result.signerCertificates.single().encoded)
                .joinToString("") { "%02x".format(it) }
            assertEquals("${build.name}: its certificate's SHA-1", PINTEREST_CERTIFICATE_SHA1, sha1)
        }
    }

    @Test
    fun `each declared build gains only the two metadata entries and no permission`() {
        for (build in Fixtures.declaredBuilds()) {
            val stock = decode(build)
            val before = declarations(stock)
            val patched = decode(build)
            addSignatureSpoofMetadata(patched)
            val after = declarations(patched)
            val added = listOf(
                "manifest/application/meta-data{android:name=$SPOOFED_SIGNATURE_METADATA,android:value=$PINTEREST_CERTIFICATE_SHA1}",
                "manifest/application/meta-data{android:name=$FAKE_SIGNATURE_METADATA,android:value=$PINTEREST_CERTIFICATE_DER}",
            )
            assertEquals("${build.name}: removed", emptyList<String>(), before.withoutEach(after))
            assertEquals("${build.name}: added", added.sorted(), after.withoutEach(before).sorted())
            assertFalse("${build.name} names the spoofing permission", after.any { "FAKE_PACKAGE_SIGNATURE" in it })
        }
    }

    @Test
    fun `a manifest already naming either key or without an application refuses before any edit`() {
        for (name in listOf(SPOOFED_SIGNATURE_METADATA, FAKE_SIGNATURE_METADATA)) {
            val document = parse("""
                <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.pinterest">
                    <application>
                        <meta-data android:name="firebase_messaging_auto_init_enabled" android:value="true"/>
                        <meta-data android:name="$name" android:value="already"/>
                    </application>
                </manifest>
            """)
            val before = declarations(document)
            val refusal = assertThrows(name, PatchException::class.java) { addSignatureSpoofMetadata(document) }
            assertTrue(name, refusal.message.orEmpty().contains("already declares $name"))
            assertEquals("a refused edit changed the manifest", before, declarations(document))
        }
        val bare = parse("""<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.pinterest"/>""")
        assertThrows(PatchException::class.java) { addSignatureSpoofMetadata(bare) }
        assertEquals(listOf("manifest{package=com.pinterest}"), declarations(bare))
    }

    @Test
    fun `the manifest edit waits for the status check and the patch sets only its flag`() {
        assertTrue(googleSignInSpoofPatch.dependencies.contains(signatureSpoofManifestPatch))
        assertTrue(signatureSpoofManifestPatch.dependencies.contains(signatureSpoofPreflightPatch))
        assertFalse("off by default", googleSignInSpoofPatch.default)

        val context = PatchContexts.of(ExtensionDex.classes())
        signatureSpoofPreflightPatch.execute(context)
        googleSignInSpoofPatch.execute(context)
        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods
        assertEquals(1, (status.single { it.name == "spoofSignature" }.implementation!!.instructions.first()
            as NarrowLiteralInstruction).narrowLiteral)
        assertEquals("another flag was set", 0, (status.single { it.name == "removeAdTrackingPermissions" }.implementation!!
            .instructions.first() as NarrowLiteralInstruction).narrowLiteral)

        val missing = ExtensionDex.classes().map { owner -> if (owner.type != SETTINGS_STATUS) owner else ImmutableClassDef(owner.type,
            owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile, owner.annotations, owner.fields,
            owner.methods.filterNot { it.name == "spoofSignature" }) }
        assertThrows(PatchException::class.java) { signatureSpoofPreflightPatch.execute(PatchContexts.of(missing)) }
    }

    /** The decoded manifest of [apk], as the resource patch reads it. */
    private fun decode(apk: File): Document = parse(Fixtures.manifest(apk))

    private fun parse(xml: String): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
        .parse(ByteArrayInputStream(xml.trimIndent().toByteArray()))

    /** Every element as its path of tags and its own attributes in name order, children left out. */
    private fun declarations(document: Document): List<String> {
        val result = mutableListOf<String>()
        fun walk(element: Element, path: String) {
            val here = if (path.isEmpty()) element.tagName else "$path/${element.tagName}"
            val attributes = (0 until element.attributes.length).map { element.attributes.item(it) }
                .filterNot { it.nodeName.startsWith("xmlns") }
                .sortedBy { it.nodeName }.joinToString(",") { "${it.nodeName}=${it.nodeValue}" }
            result += "$here{$attributes}"
            (0 until element.childNodes.length).map { element.childNodes.item(it) }.filterIsInstance<Element>().forEach { walk(it, here) }
        }
        walk(document.documentElement, "")
        return result
    }

    /** This list less one occurrence of each entry in [other]: a multiset difference. */
    private fun List<String>.withoutEach(other: List<String>): List<String> {
        val left = other.groupingBy { it }.eachCount().toMutableMap()
        return filter { value -> (left[value] ?: 0).let { if (it > 0) { left[value] = it - 1; false } else true } }
    }
}
