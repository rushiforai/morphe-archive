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
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.io.ByteArrayInputStream
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * The two manifest edits on the declared Pinterest builds, compared element by element with the
 * stock manifest, and the ad tracking patch's refusals and build flag.
 */
@Category(FixtureTests::class)
class AdTrackingManifestTest {
    @Test
    fun `each declared build changes only the ad declarations and the collection switches`() {
        for (build in Fixtures.declaredBuilds()) {
            val stock = decode(build)
            val before = declarations(stock)
            for (permission in AD_TRACKING_PERMISSIONS) {
                assertEquals("${build.name} asks for $permission once", listOf("manifest/uses-permission{android:name=$permission}"),
                    before.filter { it.contains("android:name=$permission}") || it.contains("android:name=$permission,") })
            }
            for (name in ANALYTICS_MANIFEST_FLAGS.keys.filter { it.startsWith("google_analytics_default_allow_") }) {
                assertEquals("${build.name} ships $name granted", listOf("manifest/application/meta-data{android:name=$name,android:value=true}"),
                    before.filter { it.contains("{android:name=$name,") })
            }

            val patched = decode(build)
            deactivateFirebaseAnalytics(patched)
            removeAdTrackingDeclarations(patched)
            val after = declarations(patched)

            val config = before.filter { it.startsWith("manifest/application/property{android:name=$AD_SERVICES_CONFIG,") }
            assertEquals("${build.name} has one ad services property", 1, config.size)
            val removed = AD_TRACKING_PERMISSIONS.map { "manifest/uses-permission{android:name=$it}" } + config +
                ANALYTICS_MANIFEST_FLAGS.keys.filter { it.startsWith("google_analytics_default_allow_") }
                    .map { "manifest/application/meta-data{android:name=$it,android:value=true}" }
            val added = ANALYTICS_MANIFEST_FLAGS.map { (name, value) -> "manifest/application/meta-data{android:name=$name,android:value=$value}" }
            // Everything else, Firebase Messaging, Installations and sign-in included, compares equal.
            assertEquals("${build.name}: removed", removed.sorted(), before.withoutEach(after).sorted())
            assertEquals("${build.name}: added", added.sorted(), after.withoutEach(before).sorted())
            assertTrue("${build.name} lost another application property",
                after.any { it.startsWith("manifest/application/property{android:name=android.window.PROPERTY_COMPAT_ALLOW_RESTRICTED_RESIZABILITY,") })
        }
    }

    @Test
    fun `a build already without the ad declarations refuses before any edit`() {
        val build = Fixtures.declaredBuilds().last()
        val document = decode(build)
        removeAdTrackingDeclarations(document)
        val removed = declarations(document)
        assertThrows(PatchException::class.java) { removeAdTrackingDeclarations(document) }
        assertEquals("a refused edit changed the manifest", removed, declarations(document))

        val granted = decode(build)
        val application = granted.getElementsByTagName("application").item(0) as Element
        val consent = (0 until application.childNodes.length).map { application.childNodes.item(it) }
            .filterIsInstance<Element>().single { it.getAttribute("android:name") == "google_analytics_default_allow_ad_user_data" }
        application.appendChild(consent.cloneNode(true))
        val repeated = declarations(granted)
        assertThrows(PatchException::class.java) { deactivateFirebaseAnalytics(granted) }
        assertEquals("a refused analytics edit changed the manifest", repeated, declarations(granted))
    }

    @Test
    fun `each declaration goes on its own and other permissions and properties stay`() {
        for (left in AD_TRACKING_PERMISSIONS + AD_SERVICES_CONFIG) {
            val permissions = AD_TRACKING_PERMISSIONS.filter { it == left }
            val document = parse("""
                <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.pinterest">
                    <uses-permission android:name="android.permission.INTERNET"/>
                    ${permissions.joinToString("") { "<uses-permission android:name=\"$it\"/>" }}
                    ${permissions.joinToString("") { "<uses-permission-sdk-23 android:name=\"$it\"/>" }}
                    <uses-permission android:name="com.google.android.c2dm.permission.RECEIVE"/>
                    <application>
                        <property android:name="android.window.PROPERTY_COMPAT_ALLOW_RESTRICTED_RESIZABILITY" android:value="true"/>
                        ${if (left == AD_SERVICES_CONFIG) "<property android:name=\"$AD_SERVICES_CONFIG\" android:resource=\"@xml/ga_ad_services_config\"/>" else ""}
                        <activity android:name="com.pinterest.activity.PinterestActivity" android:exported="true">
                            <property android:name="$AD_SERVICES_CONFIG" android:value="activity-level"/>
                        </activity>
                    </application>
                </manifest>
            """)
            removeAdTrackingDeclarations(document)
            assertEquals(left, listOf(
                "manifest/application/activity{android:exported=true,android:name=com.pinterest.activity.PinterestActivity}",
                "manifest/application/activity/property{android:name=$AD_SERVICES_CONFIG,android:value=activity-level}",
                "manifest/application/property{android:name=android.window.PROPERTY_COMPAT_ALLOW_RESTRICTED_RESIZABILITY,android:value=true}",
                "manifest/application{}",
                "manifest/uses-permission{android:name=android.permission.INTERNET}",
                "manifest/uses-permission{android:name=com.google.android.c2dm.permission.RECEIVE}",
                "manifest{package=com.pinterest}",
            ).sorted(), declarations(document).sorted())
        }
    }

    @Test
    fun `the manifest edit waits for the status check and the patch sets only its flag`() {
        assertTrue(removeAdTrackingPermissionsPatch.dependencies.contains(removeAdTrackingManifestPatch))
        assertTrue(removeAdTrackingManifestPatch.dependencies.contains(adTrackingPreflightPatch))
        assertTrue("on by default", removeAdTrackingPermissionsPatch.default)

        val context = PatchContexts.of(ExtensionDex.classes())
        adTrackingPreflightPatch.execute(context)
        removeAdTrackingPermissionsPatch.execute(context)
        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods
        assertEquals(1, (status.single { it.name == "removeAdTrackingPermissions" }.implementation!!.instructions.first()
            as NarrowLiteralInstruction).narrowLiteral)
        assertEquals("another flag was set", 0, (status.single { it.name == "hideAdvertisingId" }.implementation!!.instructions.first()
            as NarrowLiteralInstruction).narrowLiteral)

        val missing = ExtensionDex.classes().map { owner -> if (owner.type != SETTINGS_STATUS) owner else ImmutableClassDef(owner.type,
            owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile, owner.annotations, owner.fields,
            owner.methods.filterNot { it.name == "removeAdTrackingPermissions" }) }
        assertThrows(PatchException::class.java) { adTrackingPreflightPatch.execute(PatchContexts.of(missing)) }
    }

    /** The decoded manifest of [apk], as the resource patch reads it. */
    private fun decode(apk: File): Document = parse(Fixtures.manifest(apk))

    private fun parse(xml: String): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
        .parse(ByteArrayInputStream(xml.trimIndent().toByteArray()))

    /**
     * Every element as its path of tags and its own attributes in name order, children left out,
     * so two manifests compare as multisets of declarations.
     */
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
