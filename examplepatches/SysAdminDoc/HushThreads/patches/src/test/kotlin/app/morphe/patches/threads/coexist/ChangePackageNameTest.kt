/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * The literal routing cases are forked from https://github.com/SysAdminDoc/Hushfacebook at
 * c21b570b (GPL-3.0), modified for HushThreads (Threads), 2026.
 */
package app.morphe.patches.threads.coexist

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patches.shared.compat.AppCompatibilities.THREADS_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import java.io.StringReader
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.xml.sax.InputSource

/**
 * Change package name and Change app name on a manifest shaped like Threads' own, and the code half
 * that hands Threads' spelled-out provider addresses to the extension.
 */
class ChangePackageNameTest {
    private val copy = "com.instagram.barcelona.hushthreads"
    private val lite = "$THREADS_PACKAGE.liteprovider.BarcelonaLiteContentProvider"
    private val usdid = "$THREADS_PACKAGE.liteprovider.usdid.UsdidValuesProvider"

    private fun manifest(body: String): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
        InputSource(
            StringReader(
                """<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="$THREADS_PACKAGE">""" +
                    body + "</manifest>",
            ),
        ),
    )

    /** Threads 450's shape: its own signature permissions, the components that require them, its providers. */
    private val threadsLike = """
        <permission android:name="$THREADS_PACKAGE.permission.SYSTEM_ONLY" android:protectionLevel="signature"/>
        <permission android:name="$THREADS_PACKAGE.permission.CROSS_PROCESS_BROADCAST_MANAGER" android:protectionLevel="signature"/>
        <permission android:name="$THREADS_PACKAGE.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION" android:protectionLevel="signature"/>
        <permission android:name=".permission.RECEIVE_ADM_MESSAGE" android:protectionLevel="signature"/>
        <uses-permission android:name="$THREADS_PACKAGE.permission.CROSS_PROCESS_BROADCAST_MANAGER"/>
        <uses-permission android:name="$THREADS_PACKAGE.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"/>
        <uses-permission android:name="com.facebook.katana.fbpermission.LITE_PROVIDER_ACCESS"/>
        <uses-permission android:name="android.permission.INTERNET"/>
        <application android:label="@string/app_name" android:name="com.instagram.barcelona.app.BarcelonaAppShell">
            <activity android:name="com.instagram.barcelona.mainactivity.BarcelonaActivity" android:exported="true">
                <intent-filter>
                    <action android:name="android.intent.action.MAIN"/>
                    <category android:name="android.intent.category.LAUNCHER"/>
                </intent-filter>
            </activity>
            <activity-alias android:name="com.instagram.barcelona.InternalLauncher" android:label="@string/app_name"
                android:enabled="false" android:targetActivity="com.instagram.barcelona.mainactivity.BarcelonaActivity">
                <intent-filter>
                    <action android:name="android.intent.action.MAIN"/>
                    <category android:name="android.intent.category.LAUNCHER"/>
                </intent-filter>
            </activity-alias>
            <activity-alias android:name="app.morphe.extension.hushthreads.settings.OpenSettings"
                android:targetActivity="com.instagram.barcelona.mainactivity.BarcelonaActivity" android:exported="true">
                <intent-filter>
                    <action android:name="android.intent.action.APPLICATION_PREFERENCES"/>
                    <category android:name="android.intent.category.DEFAULT"/>
                </intent-filter>
            </activity-alias>
            <activity android:name="com.instagram.settings.activity.NotificationSettingsHandlerActivity"
                android:permission="$THREADS_PACKAGE.permission.SYSTEM_ONLY" android:exported="true"/>
            <receiver android:name="com.instagram.barcelona.appiconswitcher.BirthdayShortcutCreatedReceiver"
                android:permission="$THREADS_PACKAGE.permission.CREATE_SHORTCUT"/>
            <provider android:name="androidx.core.content.FileProvider" android:exported="false"
                android:authorities="$THREADS_PACKAGE.fileprovider"/>
            <provider android:name="$lite" android:exported="true" android:authorities="$lite"/>
            <provider android:name="$usdid" android:exported="true" android:authorities="$usdid"/>
            <provider android:name="androidx.startup.InitializationProvider" android:exported="false"
                android:authorities="$THREADS_PACKAGE.androidx-startup"/>
            <provider android:name="com.example.Other" android:authorities="com.instagram.android.provider.x"/>
        </application>
        <queries><provider android:authorities="$THREADS_PACKAGE.feed.crossapp.contentprovider.ThreadsContentProvider"/></queries>
    """

    private fun Document.attributeValues(): List<String> = elements("*").flatMap { element ->
        (0 until element.attributes.length).map { (element.attributes.item(it) as Attr).value }
    }

    private fun Document.renamed(): Followed {
        documentElement.setAttribute("package", copy)
        return followRenamedPackage(THREADS_PACKAGE, ownAuthorities(THREADS_PACKAGE).also { assertEquals(4, it.size) },
            ownPermissions(THREADS_PACKAGE).also { assertEquals(3, it.size) })!!
    }

    @Test
    fun everyOwnPermissionAndAuthorityMovesUnderTheNewPackage() {
        val document = manifest(threadsLike)
        val stockAuthorities = document.ownAuthorities(THREADS_PACKAGE)
        val followed = document.renamed()

        assertEquals("declarations", 3, followed.declarations)
        // Two requests and the activity that requires SYSTEM_ONLY.
        assertEquals("mentions", 3, followed.permissions)
        assertEquals("authorities", 4, followed.authorities)
        assertEquals(stockAuthorities.map { copy + it.removePrefix(THREADS_PACKAGE) }.toSet(), document.ownAuthorities(copy))
        val declared = document.ownPermissions(copy)
        assertEquals(3, declared.size)
        assertTrue(document.elements("activity").single { it.getAttribute("android:name").endsWith("HandlerActivity") }
            .getAttribute("android:permission") in declared)
    }

    /**
     * What's left under Threads' name names something the copy doesn't own: component classes, the
     * Instagram provider it queries, and a permission nothing declares. The relative declaration
     * follows the package by itself, and permissions of other apps stay as they were.
     */
    @Test
    fun onlyWhatThreadsOwnsMoves() {
        val document = manifest(threadsLike)
        document.renamed()
        val left = document.attributeValues()
            .filter { it.startsWith("$THREADS_PACKAGE.") && it != copy && !it.startsWith("$copy.") }
            .toSet()
        assertEquals(
            setOf(
                "$THREADS_PACKAGE.mainactivity.BarcelonaActivity",
                "$THREADS_PACKAGE.InternalLauncher",
                "$THREADS_PACKAGE.app.BarcelonaAppShell",
                "$THREADS_PACKAGE.appiconswitcher.BirthdayShortcutCreatedReceiver",
                "$THREADS_PACKAGE.permission.CREATE_SHORTCUT",
                "$THREADS_PACKAGE.feed.crossapp.contentprovider.ThreadsContentProvider",
                // Provider class names that read like their authorities.
                lite, usdid,
            ),
            left,
        )
        val values = document.attributeValues()
        assertTrue(".permission.RECEIVE_ADM_MESSAGE" in values)
        assertTrue("com.facebook.katana.fbpermission.LITE_PROVIDER_ACCESS" in values)
        assertTrue("com.instagram.android.provider.x" in values)
    }

    @Test
    fun aManifestStillUnderThreadsIsLeftAlone() {
        val document = manifest(threadsLike)
        assertNull(document.followRenamedPackage(THREADS_PACKAGE, document.ownAuthorities(THREADS_PACKAGE), document.ownPermissions(THREADS_PACKAGE)))
        assertTrue(document.ownAuthorities(copy).isEmpty())
    }

    @Test
    fun aCopyPackageIsAValidNameThatIsntThreads() {
        assertTrue(isCopyPackage(DEFAULT_PACKAGE))
        assertTrue(isCopyPackage("org.example.threads2"))
        assertTrue(isCopyPackage("a.b_c.D9"))
        assertFalse(isCopyPackage(THREADS_PACKAGE))
        assertFalse(isCopyPackage("threads"))
        assertFalse(isCopyPackage("com.instagram..x"))
        assertFalse(isCopyPackage("com.9instagram.x"))
        assertFalse(isCopyPackage("com.instagram.barcelona-2"))
        assertFalse(isCopyPackage(""))
        assertFalse(isCopyPackage(null))
    }

    /** The application and both launcher entries take the name; the settings alias and other activities keep theirs. */
    @Test
    fun theNameGoesWhereALauncherReadsIt() {
        val document = manifest(threadsLike)
        assertEquals(3, document.renameApp("Threads Two"))
        assertEquals("Threads Two", document.elements("application").single().getAttribute("android:label"))
        val labels = (document.elements("activity") + document.elements("activity-alias"))
            .associate { it.getAttribute("android:name").substringAfterLast('.') to it.getAttribute("android:label") }
        assertEquals(
            mapOf("BarcelonaActivity" to "Threads Two", "InternalLauncher" to "Threads Two", "OpenSettings" to "",
                "NotificationSettingsHandlerActivity" to ""),
            labels,
        )
    }

    @Test
    fun anAppNameIsShortTextThatIsntAReference() {
        assertTrue(isAppName(DEFAULT_APP_NAME))
        assertTrue(isAppName("  Threads 2 "))
        assertTrue(isAppName("x".repeat(APP_NAME_LIMIT)))
        assertFalse(isAppName("x".repeat(APP_NAME_LIMIT + 1)))
        assertFalse(isAppName("   "))
        assertFalse(isAppName("@string/app_name"))
        assertFalse(isAppName("?attr/x"))
        assertFalse(isAppName(null))
    }

    private fun load(register: Int, literal: String): Instruction =
        ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(literal))

    private fun method(type: String, registers: Int, vararg instructions: Instruction) = ImmutableMethod(
        type, "uris", emptyList(), "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
        ImmutableMethodImplementation(registers, instructions.toList(), null, null),
    )

    private fun classDef(type: String, method: Method): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, listOf(method))

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.literal() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    @Test
    fun anAuthorityOrAnAddressOnOneIsOwn() {
        val authorities = setOf(lite, usdid)
        assertEquals(lite, lite.ownAuthority(authorities))
        assertEquals(lite, "content://$lite".ownAuthority(authorities))
        assertEquals(usdid, "content://$usdid/values".ownAuthority(authorities))
        assertEquals(usdid, "content://$usdid?x=1".ownAuthority(authorities))
        // The debug build's, a longer name, a class under it, the package, and an authority not at the start.
        assertNull("content://$THREADS_PACKAGE.debug.liteprovider.usdid.UsdidValuesProvider".ownAuthority(authorities))
        assertNull("content://${lite}2".ownAuthority(authorities))
        assertNull("$lite.Impl".ownAuthority(authorities))
        assertNull(THREADS_PACKAGE.ownAuthority(authorities))
        assertNull("vnd.android.cursor.item/vnd.$lite".ownAuthority(authorities))
    }

    /**
     * Threads' code is routed, into the register each load wrote, a jumbo load and a register above
     * v15 included, and the extension's own classes are left alone.
     */
    @Test
    fun ownAuthoritiesInThreadsCodeGoThroughTheExtension() {
        val tables = "LX/AQs;"
        val extension = AUTHORITY_CALL.substringBefore("->")
        val context = PatchContexts.of(
            listOf(
                classDef(tables, method(tables, 40,
                    load(0, "content://$lite"),
                    ImmutableInstruction31c(Opcode.CONST_STRING_JUMBO, 33, ImmutableStringReference(usdid)),
                    load(1, "content://$THREADS_PACKAGE.debug.liteprovider.usdid.UsdidValuesProvider"),
                    load(2, "$THREADS_PACKAGE.mainactivity.BarcelonaActivity"),
                    ImmutableInstruction10x(Opcode.RETURN_VOID))),
                classDef(extension, method(extension, 1, load(0, lite), ImmutableInstruction10x(Opcode.RETURN_VOID))),
            ),
        )

        assertEquals(2, context.routeOwnAuthorities("test", THREADS_PACKAGE, setOf(lite, usdid)))

        val routed = context.mutableClassDefBy(tables).methods.single().instructions()
        assertEquals(9, routed.size)
        for (index in listOf(0, 3)) {
            val register = (routed[index] as OneRegisterInstruction).registerA
            val call = routed[index + 1]
            assertEquals(AUTHORITY_CALL, (call as ReferenceInstruction).reference.toString())
            assertEquals(register to 1, (call as RegisterRangeInstruction).startRegister to call.registerCount)
            assertEquals(register, (routed[index + 2] as OneRegisterInstruction).registerA)
        }
        assertEquals(listOf("content://$THREADS_PACKAGE.debug.liteprovider.usdid.UsdidValuesProvider",
            "$THREADS_PACKAGE.mainactivity.BarcelonaActivity"), routed.drop(6).mapNotNull { it.literal() })
        assertEquals("the extension's literal was routed", 2,
            context.mutableClassDefBy(extension).methods.single().instructions().size)
    }

    /** The call the patch writes is a public static method of the payload, moving names under Threads' package. */
    @Test
    fun theExtensionDeclaresTheCall() {
        val type = AUTHORITY_CALL.substringBefore("->")
        val call = AUTHORITY_CALL.substringAfter("->")
        val declared = ExtensionDex.classDef(type).methods.filter {
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
        }.map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("the extension declares no public static $call: $declared", call in declared)
        assertEquals(THREADS_PACKAGE, ExtensionDex.stringConstant(type, "THREADS"))
    }
}
