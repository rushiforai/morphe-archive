/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at 2cb2182 (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 * The literal routing cases came there from https://github.com/SysAdminDoc/Hushfacebook at c21b570b.
 *
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.pinterest.coexist

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patches.shared.compat.AppCompatibilities.PINTEREST_PACKAGE
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
 * Change package name on a manifest shaped like Pinterest 14.44's own, and the code half that hands
 * Pinterest's spelled-out FileProvider address to the extension.
 */
class ChangePackageNameTest {
    private val copy = "org.example.pinboard"
    private val credentials = "$PINTEREST_PACKAGE.account.Credentials"
    private val dynamicReceiver = "$PINTEREST_PACKAGE.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"
    private val fileProvider = "$PINTEREST_PACKAGE.provider"
    private val sharePreview = "$PINTEREST_PACKAGE.hushpinterest.share"

    private fun manifest(body: String): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
        InputSource(
            StringReader(
                """<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="$PINTEREST_PACKAGE">""" +
                    body + "</manifest>",
            ),
        ),
    )

    /**
     * Pinterest 14.44's shape: its two signature permissions, the provider that requires one, its
     * own providers, the launcher activity and the share provider Download pins declares.
     */
    private val pinterestLike = """
        <uses-permission android:name="$credentials"/>
        <permission android:name="$credentials" android:protectionLevel="signature"/>
        <permission android:name="$dynamicReceiver" android:protectionLevel="signature"/>
        <uses-permission android:name="$dynamicReceiver"/>
        <uses-permission android:name="com.google.android.c2dm.permission.RECEIVE"/>
        <application android:label="@string/app_name" android:name="$PINTEREST_PACKAGE.ReleaseHiltApplication">
            <provider android:name="$PINTEREST_PACKAGE.account.CredentialsContentProvider" android:permission="$credentials"
                android:exported="true" android:authorities="$PINTEREST_PACKAGE.CredentialsProvider"/>
            <provider android:name="androidx.startup.InitializationProvider" android:exported="false"
                android:authorities="$PINTEREST_PACKAGE.androidx-startup"/>
            <provider android:name="androidx.core.content.FileProvider" android:exported="false"
                android:authorities="$fileProvider" android:grantUriPermissions="true"/>
            <provider android:name="app.hushpinterest.extension.pinterest.actions.SharePreviewProvider"
                android:exported="false" android:authorities="$sharePreview" android:grantUriPermissions="true"/>
            <activity android:name="$PINTEREST_PACKAGE.activity.PinterestActivity" android:exported="true">
                <intent-filter>
                    <action android:name="android.intent.action.MAIN"/>
                    <category android:name="android.intent.category.LAUNCHER"/>
                </intent-filter>
            </activity>
            <activity android:name="$PINTEREST_PACKAGE.account.AuthenticatorActivity"/>
            <receiver android:name="$PINTEREST_PACKAGE.accountTransfer.AccountTransferBroadcastReceiver" android:exported="true"/>
        </application>
        <queries>
            <package android:name="$PINTEREST_PACKAGE.shuffles"/>
            <provider android:authorities="$PINTEREST_PACKAGE.shuffles.provider"/>
        </queries>
    """

    private fun Document.attributeValues(): List<String> = elements("*").flatMap { element ->
        (0 until element.attributes.length).map { (element.attributes.item(it) as Attr).value }
    }

    @Test
    fun everyOwnPermissionAndAuthorityMovesUnderTheNewPackage() {
        val document = manifest(pinterestLike)
        val stockAuthorities = document.ownAuthorities(PINTEREST_PACKAGE)
        assertEquals(4, stockAuthorities.size)
        assertEquals(setOf(credentials, dynamicReceiver), document.ownPermissions(PINTEREST_PACKAGE))

        assertEquals(copy, document.renameCopy(copy, DEFAULT_APP_NAME, emptySet(), emptySet()))

        assertEquals(copy, document.documentElement.getAttribute("package"))
        assertEquals(stockAuthorities.map { copy + it.removePrefix(PINTEREST_PACKAGE) }.toSet(), document.ownAuthorities(copy))
        assertTrue(document.ownAuthorities(PINTEREST_PACKAGE).none { it in stockAuthorities })
        val declared = document.ownPermissions(copy)
        assertEquals(setOf("$copy.account.Credentials", "$copy.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"), declared)
        val requests = document.elements("uses-permission").map { it.getAttribute("android:name") }.toSet()
        assertTrue(requests.containsAll(declared))
        val credentialsProvider = document.declaredProviders().single { it.getAttribute("android:name").endsWith("CredentialsContentProvider") }
        assertEquals("$copy.account.Credentials", credentialsProvider.getAttribute("android:permission"))
    }

    /**
     * What's left under Pinterest's name names something the copy doesn't own: component classes
     * and the Shuffles app and provider it looks up.
     */
    @Test
    fun onlyWhatPinterestOwnsMoves() {
        val document = manifest(pinterestLike)
        document.renameCopy(copy, DEFAULT_APP_NAME, document.ownAuthorities(PINTEREST_PACKAGE), document.ownPermissions(PINTEREST_PACKAGE))
        val left = document.attributeValues()
            .filter { it.startsWith("$PINTEREST_PACKAGE.") && it != copy && !it.startsWith("$copy.") }
            .toSet()
        assertEquals(
            setOf(
                "$PINTEREST_PACKAGE.ReleaseHiltApplication",
                "$PINTEREST_PACKAGE.account.CredentialsContentProvider",
                "$PINTEREST_PACKAGE.activity.PinterestActivity",
                "$PINTEREST_PACKAGE.account.AuthenticatorActivity",
                "$PINTEREST_PACKAGE.accountTransfer.AccountTransferBroadcastReceiver",
                "$PINTEREST_PACKAGE.shuffles.provider",
                "$PINTEREST_PACKAGE.shuffles",
            ),
            left,
        )
        assertTrue("com.google.android.c2dm.permission.RECEIVE" in document.attributeValues())
    }

    /** Another patch renamed the package first: its name stays, and Pinterest's own names still move under it. */
    @Test
    fun aPackageRenamedElsewhereKeepsItsName() {
        val document = manifest(pinterestLike)
        val stockAuthorities = document.ownAuthorities(PINTEREST_PACKAGE)
        val stockPermissions = document.ownPermissions(PINTEREST_PACKAGE)
        document.documentElement.setAttribute("package", "org.example.clone")
        assertEquals("org.example.clone", document.renameCopy(copy, "Clone", stockAuthorities, stockPermissions))
        assertEquals(stockAuthorities.map { "org.example.clone" + it.removePrefix(PINTEREST_PACKAGE) }.toSet(),
            document.ownAuthorities("org.example.clone"))
        assertEquals(2, document.ownPermissions("org.example.clone").size)
        assertTrue(document.ownAuthorities(copy).isEmpty())
    }

    @Test
    fun aManifestStillUnderPinterestIsLeftAlone() {
        val document = manifest(pinterestLike)
        assertNull(document.followRenamedPackage(PINTEREST_PACKAGE, document.ownAuthorities(PINTEREST_PACKAGE), document.ownPermissions(PINTEREST_PACKAGE)))
        assertTrue(document.ownAuthorities(copy).isEmpty())
    }

    @Test
    fun aCopyPackageIsAValidNameThatIsntPinterest() {
        assertTrue(isCopyPackage(DEFAULT_PACKAGE))
        assertTrue(isCopyPackage("org.example.pinterest2"))
        assertTrue(isCopyPackage("a.b_c.D9"))
        assertFalse(isCopyPackage(PINTEREST_PACKAGE))
        assertFalse(isCopyPackage("pinterest"))
        assertFalse(isCopyPackage("com..pinterest"))
        assertFalse(isCopyPackage("com.9pinterest"))
        assertFalse(isCopyPackage("com.pinterest-2"))
        assertFalse(isCopyPackage(""))
        assertFalse(isCopyPackage(null))
    }

    /** The application and the launcher activity take the name; other activities keep theirs. */
    @Test
    fun theNameGoesWhereALauncherReadsIt() {
        val document = manifest(pinterestLike)
        assertEquals(2, document.renameApp("Pinterest Two"))
        assertEquals("Pinterest Two", document.elements("application").single().getAttribute("android:label"))
        val labels = document.elements("activity")
            .associate { it.getAttribute("android:name").substringAfterLast('.') to it.getAttribute("android:label") }
        assertEquals(mapOf("PinterestActivity" to "Pinterest Two", "AuthenticatorActivity" to ""), labels)
    }

    @Test
    fun anAppNameIsShortTextThatIsntAReference() {
        assertTrue(isAppName(DEFAULT_APP_NAME))
        assertTrue(isAppName("  Pinterest 2 "))
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
        val authorities = setOf(fileProvider, "$PINTEREST_PACKAGE.CredentialsProvider")
        assertEquals(fileProvider, fileProvider.ownAuthority(authorities))
        assertEquals(fileProvider, "content://$fileProvider".ownAuthority(authorities))
        assertEquals(fileProvider, "content://$fileProvider/cache/x.jpg".ownAuthority(authorities))
        assertEquals(fileProvider, "content://$fileProvider?x=1".ownAuthority(authorities))
        // A longer name, a class under it, the package, and an authority not at the start.
        assertNull("content://${fileProvider}2".ownAuthority(authorities))
        assertNull("$fileProvider.Impl".ownAuthority(authorities))
        assertNull(PINTEREST_PACKAGE.ownAuthority(authorities))
        assertNull("vnd.android.cursor.item/vnd.$fileProvider".ownAuthority(authorities))
    }

    /**
     * Pinterest's code is routed, into the register each load wrote, a jumbo load and a register
     * above v15 included, and the extension's own classes are left alone.
     */
    @Test
    fun ownAuthoritiesInPinterestCodeGoThroughTheExtension() {
        val sharer = "Ln93/x;"
        val credentialsProvider = "$PINTEREST_PACKAGE.CredentialsProvider"
        val extension = AUTHORITY_CALL.substringBefore("->")
        val context = PatchContexts.of(
            listOf(
                classDef(sharer, method(sharer, 40,
                    load(0, fileProvider),
                    ImmutableInstruction31c(Opcode.CONST_STRING_JUMBO, 33, ImmutableStringReference("content://$credentialsProvider")),
                    load(1, "content://$PINTEREST_PACKAGE.debug.provider"),
                    load(2, "$PINTEREST_PACKAGE.activity.PinterestActivity"),
                    ImmutableInstruction10x(Opcode.RETURN_VOID))),
                classDef(extension, method(extension, 1, load(0, fileProvider), ImmutableInstruction10x(Opcode.RETURN_VOID))),
            ),
        )

        assertEquals(2, context.routeOwnAuthorities("test", PINTEREST_PACKAGE, setOf(fileProvider, credentialsProvider)))

        val routed = context.mutableClassDefBy(sharer).methods.single().instructions()
        assertEquals(9, routed.size)
        for (index in listOf(0, 3)) {
            val register = (routed[index] as OneRegisterInstruction).registerA
            val call = routed[index + 1]
            assertEquals(AUTHORITY_CALL, (call as ReferenceInstruction).reference.toString())
            assertEquals(register to 1, (call as RegisterRangeInstruction).startRegister to call.registerCount)
            assertEquals(register, (routed[index + 2] as OneRegisterInstruction).registerA)
        }
        assertEquals(listOf("content://$PINTEREST_PACKAGE.debug.provider", "$PINTEREST_PACKAGE.activity.PinterestActivity"),
            routed.drop(6).mapNotNull { it.literal() })
        assertEquals("the extension's literal was routed", 2,
            context.mutableClassDefBy(extension).methods.single().instructions().size)
    }

    /** The call the patch writes is a public static method of the payload, moving names under Pinterest's package. */
    @Test
    fun theExtensionDeclaresTheCall() {
        val type = AUTHORITY_CALL.substringBefore("->")
        val call = AUTHORITY_CALL.substringAfter("->")
        val declared = ExtensionDex.classDef(type).methods.filter {
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
        }.map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("the extension declares no public static $call: $declared", call in declared)
        assertEquals(PINTEREST_PACKAGE, ExtensionDex.stringConstant(type, "PINTEREST"))
    }
}
