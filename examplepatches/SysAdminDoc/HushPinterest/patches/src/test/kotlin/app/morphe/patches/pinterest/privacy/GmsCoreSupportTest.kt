/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.privacy

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import java.io.ByteArrayInputStream
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * GmsCore support: the names it rewrites, the bytecode edits on each declared build, the manifest
 * reroute, and the refusals that leave both untouched.
 */
@Category(FixtureTests::class)
class GmsCoreSupportTest {
    @Test
    fun `names microG-RE serves under its own vendor are rewritten and the rest stay`() {
        assertEquals("app.revanced", gmsCoreText("com.google"))
        assertEquals(GMS_CORE_PACKAGE, gmsCoreText("com.google.android.gms"))
        assertEquals("app.revanced.android.c2dm.intent.REGISTER", gmsCoreText("com.google.android.c2dm.intent.REGISTER"))
        assertEquals("app.revanced.iid.TOKEN_REQUEST", gmsCoreText("com.google.iid.TOKEN_REQUEST"))
        assertEquals("app.revanced.android.gms.identitycredentials.service.START",
            gmsCoreText("com.google.android.gms.identitycredentials.service.START"))
        assertEquals("content://app.revanced.android.gsf.gservices", gmsCoreText("content://com.google.android.gsf.gservices"))
        assertEquals("content://app.revanced.android.gsf.gservices/prefix", gmsCoreText("content://com.google.android.gsf.gservices/prefix"))
        // microG-RE answers these under Google's own names, and the version key is metadata, not a service.
        assertNull(gmsCoreText("com.google.android.gms.ads.identifier.service.START"))
        assertNull(gmsCoreText("com.google.android.gms.version"))
        assertNull(gmsCoreText("content://com.google.android.gsf.gservicesx"))
        assertNull(gmsCoreText("com.google.android.gms.auth.api.signin.internal.SIGN_IN"))
        for ((from, to) in GMS_CORE_TEXTS) {
            assertTrue(from, from.startsWith("com.google"))
            assertEquals(from, GMS_CORE_VENDOR + from.removePrefix("com.google"), to)
        }
    }

    @Test
    fun `each declared build rewrites every Play services name and answers both checks`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = rerouted(build)
            val context = PatchContexts.of(ExtensionDex.classes() + fixture)
            gmsCorePreflightPatch.execute(context)
            gmsCoreSupportPatch.execute(context)

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods
            assertEquals("${build.name}: its flag", 1, status.flag("gmsCoreSupport"))
            assertEquals("${build.name}: the signature flag belongs to its own patch", 0, status.flag("spoofSignature"))

            var rewritten = 0
            for (original in fixture) {
                val patched = context.mutableClassDefBy(original.type)
                for (method in original.methods) {
                    val before = method.texts()
                    val after = patched.methods.single { it.same(method) }.texts()
                    if (method.isAvailabilityCheck() || method.isFrameworkProviderCheck(original) || method.isProviderChoice() ||
                        method.isSignInFailureListener()) continue
                    assertEquals("${build.name}: ${method.definingClass}->${method.name} kept its shape", before.size, after.size)
                    before.zip(after).forEach { (old, new) ->
                        val expected = old?.let { gmsCoreText(it) ?: it }
                        assertEquals("${build.name}: ${method.definingClass}->${method.name}", expected, new)
                        if (old != new) rewritten++
                    }
                }
            }
            assertTrue("${build.name}: only $rewritten names rewritten", rewritten >= GMS_CORE_REQUIRED_TEXTS.size)

            val checks = fixture.flatMap { owner -> owner.methods.filter { it.isAvailabilityCheck() || it.isFrameworkProviderCheck(owner) } }
            assertEquals("${build.name}: the two checks", 2, checks.size)
            val availability = checks.single { it.isAvailabilityCheck() }
            val answer = context.mutableClassDefBy(availability.definingClass).methods.single { it.same(availability) }.implementation!!.instructions.toList()
            assertEquals("${build.name}: the availability check answers success first", 0, (answer[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("${build.name}: and returns at once", Opcode.RETURN, answer[1].opcode)

            val provider = checks.single { it !== availability }
            val guarded = context.mutableClassDefBy(provider.definingClass).methods.single { it.same(provider) }.implementation!!.instructions.toList()
            assertEquals("${build.name}: the provider asks the extension first",
                listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN), guarded.take(5).map { it.opcode })
            assertEquals("${build.name}: the provider's hook", CREDENTIAL_PROVIDER_HOOK, (guarded[0] as ReferenceInstruction).reference.toString())
            assertEquals("${build.name}: a local holds the answer", listOf(0, 0, 0, 0), guarded.subList(1, 5).map { (it as OneRegisterInstruction).registerA })
            assertEquals("${build.name}: true answers unavailable", 0, (guarded[3] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("${build.name}: false runs the provider's own body", 5, (guarded[2] as BuilderOffsetInstruction).target.location.index)
            assertEquals("${build.name}: the provider's own body stays", provider.implementation!!.instructions.map { it.opcode }, guarded.drop(5).map { it.opcode })

            val choice = fixture.flatMap { it.methods }.single { it.isProviderChoice() }
            val own = choice.implementation!!.instructions.toList()
            val chosen = context.mutableClassDefBy(choice.definingClass).methods.single { it.same(choice) }.implementation!!.instructions.toList()
            val added = chosen.size - own.size
            assertEquals("${build.name}: the choice asks about each option first", listOf(
                Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.MOVE_OBJECT, Opcode.CHECK_CAST, Opcode.IGET_OBJECT,
                Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT,
                Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT,
                Opcode.CHECK_CAST, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.GOTO,
                Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT,
            ), chosen.take(added).map { it.opcode })
            assertEquals("${build.name}: the choice's own body stays", own.map { it.opcode }, chosen.drop(added).map { it.opcode })
            assertEquals("${build.name}: the option hook", GOOGLE_ID_OPTION_HOOK, chosen[17].referenceText())
            val request = choice.implementation!!.registerCount - 1
            assertEquals("${build.name}: it tests the request itself", request, (chosen[0] as TwoRegisterInstruction).registerB)
            assertEquals("${build.name}: and copies it rather than casting it", request, (chosen[2] as TwoRegisterInstruction).registerB)
            assertEquals("${build.name}: only v0 and v1 change", setOf(0, 1),
                listOf(0, 2, 3, 4, 6, 9, 11, 14, 15, 16, 18, 22).map { (chosen[it] as OneRegisterInstruction).registerA }.toSet())
            // The stock body walks the same list and casts each option to the same class, and its
            // restore credential arm makes the same Play services lookup.
            val ownList = own.first { it.opcode == Opcode.IGET_OBJECT }
            assertEquals("${build.name}: the request the stock body casts to", (own[own.indexOf(ownList) - 1]).referenceText(), chosen[3].referenceText())
            assertEquals("${build.name}: the stock body's option list", ownList.referenceText(), chosen[4].referenceText())
            val ownCast = own.first { it.opcode == Opcode.CHECK_CAST && it !== own[own.indexOf(ownList) - 1] }
            assertEquals("${build.name}: the stock body's option class", ownCast.referenceText(), chosen[15].referenceText())
            val typeField = (chosen[16] as ReferenceInstruction).reference as FieldReference
            assertEquals("${build.name}: the option's type", listOf(ownCast.referenceText(), "Ljava/lang/String;"), listOf(typeField.definingClass, typeField.type))
            assertEquals("${build.name}: the stock body's Play services lookup", own.first { it.opcode == Opcode.INVOKE_VIRTUAL &&
                (it as ReferenceInstruction).reference.let { r -> r is MethodReference && r.definingClass == choice.definingClass } }.referenceText(),
                chosen[21].referenceText())
            assertEquals("${build.name}: on p0", request - 1, (chosen[21] as FiveRegisterInstruction).registerC)
            for ((at, target) in listOf(1 to added, 7 to added, 19 to added, 12 to 21, 20 to 10))
                assertEquals("${build.name}: branch $at", target, (chosen[at] as BuilderOffsetInstruction).target.location.index)

            val listener = fixture.flatMap { it.methods }.single { it.isSignInFailureListener() }
            val stock = listener.implementation!!.instructions.toList()
            val hooked = context.mutableClassDefBy(HIDDEN_ACTIVITY).methods.single { it.same(listener) }.implementation!!.instructions.toList()
            val hook = hooked.first()
            assertEquals("${build.name}: the listener starts with the hook", Opcode.INVOKE_STATIC_RANGE, hook.opcode)
            assertEquals("${build.name}: the hook", SIGN_IN_FAILURE_HOOK, (hook as ReferenceInstruction).reference.toString())
            assertEquals("${build.name}: one argument", 1, (hook as RegisterRangeInstruction).registerCount)
            assertEquals("${build.name}: the exception, the last parameter", listener.implementation!!.registerCount - 1, hook.startRegister)
            assertEquals("${build.name}: the rest stays", stock.map { it.opcode }, hooked.drop(1).map { it.opcode })
            assertEquals("${build.name}: the listener's flag", 1, status.flag("signInFailure"))

            val extension = context.classDefByOrNull("Lapp/hushpinterest/extension/pinterest/settings/PushReadiness;")!!
            assertTrue("the extension's own names stay", extension.methods.any { "com.google.android.c2dm.intent.RECEIVE" in it.texts() })
        }
    }

    /** A const-string rewrite never reaches a static field's value, so those get their own. */
    @Test
    fun `play services names held in static fields are rewritten too`() {
        for (build in Fixtures.declaredBuilds()) {
            val held = mutableSetOf<String>()
            FixtureDex.forEach(build) { dex ->
                for (owner in dex.classes) {
                    if (owner.type.startsWith(EXTENSION_ROOT)) continue
                    val names = owner.staticFields.any { (it.initialValue as? StringEncodedValue)?.value?.let(::gmsCoreText) != null }
                    if (names) held += owner.type
                }
            }
            // 14.43.0 keeps Firebase messaging's receive action in one. A build with none can drop this.
            assertTrue("${build.name}: no static field to prove the rewrite on", held.isNotEmpty())
            val fixture = rerouted(build)
            val classes = fixture + FixtureDex.classes(build, held - fixture.map { it.type }.toSet()).values
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            gmsCorePreflightPatch.execute(context)
            gmsCoreSupportPatch.execute(context)
            for (type in held) {
                val original = classes.single { it.type == type }
                for (field in context.mutableClassDefBy(type).staticFields) {
                    val before = (original.staticFields.single { it.name == field.name }.initialValue as? StringEncodedValue)?.value
                    val after = (field.initialValue as? StringEncodedValue)?.value
                    assertEquals("${build.name}: $type->${field.name}", before?.let { gmsCoreText(it) ?: it }, after)
                }
            }
        }
    }

    @Test
    fun `a build missing a check or the listener refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = rerouted(build)
            for (left in listOf("availability check", "framework provider", "provider choice", "sign-in failure listener")) {
                val kept = fixture.filterNot { owner -> owner.methods.any {
                    when (left) {
                        "availability check" -> it.isAvailabilityCheck()
                        "framework provider" -> it.isFrameworkProviderCheck(owner)
                        "provider choice" -> it.isProviderChoice()
                        else -> it.isSignInFailureListener()
                    }
                } }
                val context = PatchContexts.of(ExtensionDex.classes() + kept)
                val refusal = assertThrows(left, PatchException::class.java) { gmsCorePreflightPatch.execute(context) }
                assertTrue(refusal.message, refusal.message.orEmpty().contains("refuses before any edit"))
                assertEquals("${build.name}: the flag stayed off", 0, context.mutableClassDefBy(SETTINGS_STATUS).methods.flag("gmsCoreSupport"))
            }
        }
    }

    @Test
    fun `a second sign-in failure listener refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val doubled = rerouted(build).map { owner ->
                val listener = owner.methods.singleOrNull { it.isSignInFailureListener() } ?: return@map owner
                val copy = ImmutableMethod(owner.type, "${listener.name}Again", listener.parameters, listener.returnType,
                    listener.accessFlags, listener.annotations, listener.hiddenApiRestrictions, listener.implementation)
                ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                    owner.annotations, owner.fields, owner.methods + copy)
            }
            val context = PatchContexts.of(ExtensionDex.classes() + doubled)
            val refusal = assertThrows(PatchException::class.java) { gmsCorePreflightPatch.execute(context) }
            assertTrue(refusal.message, refusal.message.orEmpty().contains("sign-in failure listener has 2 matches"))
        }
    }

    @Test
    fun `a framework provider with no local register refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val bare = rerouted(build).map { owner ->
                val provider = owner.methods.singleOrNull { it.isFrameworkProviderCheck(owner) } ?: return@map owner
                // `this` is its only register: const/4 p0, 0x1 then return p0.
                val body = ImmutableMethodImplementation(1, listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
                    ImmutableInstruction11x(Opcode.RETURN, 0)), null, null)
                val copy = ImmutableMethod(owner.type, provider.name, provider.parameters, provider.returnType,
                    provider.accessFlags, provider.annotations, provider.hiddenApiRestrictions, body)
                ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                    owner.annotations, owner.fields, owner.methods.filterNot { it === provider } + copy)
            }
            val context = PatchContexts.of(ExtensionDex.classes() + bare)
            val refusal = assertThrows(PatchException::class.java) { gmsCorePreflightPatch.execute(context) }
            assertTrue(refusal.message, refusal.message.orEmpty().contains("framework provider has no local register"))
            assertEquals("${build.name}: the flag stayed off", 0, context.mutableClassDefBy(SETTINGS_STATUS).methods.flag("gmsCoreSupport"))
        }
    }

    @Test
    fun `a provider choice the hook can't read safely refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = rerouted(build)
            val choice = fixture.flatMap { it.methods }.single { it.isProviderChoice() }
            val implementation = choice.implementation!!
            val request = implementation.instructions.filter { it.opcode == Opcode.INSTANCE_OF }.map { it.typeText() }.toSet()
            val options = implementation.instructions.filter { it.opcode == Opcode.CHECK_CAST }.map { it.typeText() }.toSet() - request
            // The hook reads the option's one String field as its type; with a second, it can't know which.
            val twoTypes = fixture.map { owner ->
                if (owner.type !in options) return@map owner
                val second = ImmutableField(owner.type, "hushSecondType", "Ljava/lang/String;", AccessFlags.PUBLIC.value, null, null, null)
                ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                    owner.annotations, owner.fields + second, owner.methods)
            }
            // The hook names p0 and p1 in four-bit register forms, so a frame past v15 can't take it.
            val wide = fixture.map { owner ->
                if (owner.type != choice.definingClass) return@map owner
                val body = ImmutableMethodImplementation(17, implementation.instructions, implementation.tryBlocks, implementation.debugItems)
                val copy = ImmutableMethod(owner.type, choice.name, choice.parameters, choice.returnType,
                    choice.accessFlags, choice.annotations, choice.hiddenApiRestrictions, body)
                ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                    owner.annotations, owner.fields, owner.methods.filterNot { it.same(choice) } + copy)
            }
            for ((classes, reason) in listOf(twoTypes to "credential option has 2 String fields",
                    wide to "more registers than the hook can name")) {
                val context = PatchContexts.of(ExtensionDex.classes() + classes)
                val refusal = assertThrows(reason, PatchException::class.java) { gmsCorePreflightPatch.execute(context) }
                assertTrue(refusal.message, refusal.message.orEmpty().contains(reason))
                assertEquals("${build.name}: the flag stayed off", 0, context.mutableClassDefBy(SETTINGS_STATUS).methods.flag("gmsCoreSupport"))
            }
        }
    }

    @Test
    fun `each declared manifest moves Firebase messaging to microG-RE and can see it`() {
        for (build in Fixtures.declaredBuilds()) {
            val stock = parse(Fixtures.manifest(build))
            val before = declarations(stock)
            val patched = parse(Fixtures.manifest(build))
            rerouteManifestToGmsCore(patched)
            val after = declarations(patched)
            val removed = before.withoutEach(after)
            val added = after.withoutEach(before)
            assertEquals("${build.name}: removed", removed.map { it.replace(GOOGLE_C2DM, GMS_CORE_C2DM) }.sorted(),
                added.filterNot { "queries" in it }.sorted())
            assertTrue("${build.name}: the receive permission", removed.any {
                it.startsWith("manifest/uses-permission{") && "com.google.android.c2dm.permission.RECEIVE" in it })
            assertTrue("${build.name}: the receiver's sender permission", removed.any { "com.google.android.c2dm.permission.SEND" in it })
            assertTrue("${build.name}: the receive action", removed.any { it.endsWith("action{android:name=com.google.android.c2dm.intent.RECEIVE}") })
            assertEquals("${build.name}: added queries", listOf("manifest/queries/package{android:name=$GMS_CORE_PACKAGE}"),
                added.filter { "queries" in it })
            assertFalse("${build.name}: a c2dm name was left", after.any { GOOGLE_C2DM in it })
        }
    }

    @Test
    fun `a manifest without queries gets one before the application`() {
        val document = parse("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.pinterest">
                <uses-permission android:name="com.google.android.c2dm.permission.RECEIVE"/>
                <application/>
            </manifest>
        """)
        rerouteManifestToGmsCore(document)
        assertEquals(listOf(
            "manifest{package=com.pinterest}",
            "manifest/uses-permission{android:name=app.revanced.android.c2dm.permission.RECEIVE}",
            "manifest/queries{}",
            "manifest/queries/package{android:name=$GMS_CORE_PACKAGE}",
            "manifest/application{}",
        ), declarations(document))
    }

    @Test
    fun `a manifest already rerouted or not asking for push refuses unchanged`() {
        val manifests = listOf(
            "doesn't ask" to """<uses-permission android:name="android.permission.INTERNET"/>""",
            "already names" to """<uses-permission android:name="com.google.android.c2dm.permission.RECEIVE"/>
                <uses-permission android:name="app.revanced.android.c2dm.permission.RECEIVE"/>""",
            "already names" to """<uses-permission android:name="com.google.android.c2dm.permission.RECEIVE"/>
                <queries><package android:name="$GMS_CORE_PACKAGE"/></queries>""",
        )
        for ((reason, body) in manifests) {
            val document = parse("""
                <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.pinterest">
                    $body
                    <application/>
                </manifest>
            """)
            val before = declarations(document)
            val refusal = assertThrows(body, PatchException::class.java) { rerouteManifestToGmsCore(document) }
            assertTrue(refusal.message, refusal.message.orEmpty().contains(reason))
            assertEquals("a refused edit changed the manifest", before, declarations(document))
        }
    }

    @Test
    fun `the manifest waits for every bytecode check and the patch carries the signature`() {
        assertTrue(gmsCoreSupportPatch.dependencies.contains(gmsCoreManifestPatch))
        assertTrue(gmsCoreSupportPatch.dependencies.contains(signatureSpoofManifestPatch))
        assertTrue(gmsCoreManifestPatch.dependencies.contains(gmsCorePreflightPatch))
        assertFalse("off by default", gmsCoreSupportPatch.default)
        assertEquals("GmsCore support", gmsCoreSupportPatch.name)
    }

    /**
     * The classes the patch reads in [build]: every method naming a rewritten text, both checks, the
     * provider choice and the classes it casts to (the option class holds the type the hook reads), and the listener.
     */
    private fun rerouted(build: File): List<ClassDef> {
        val found = FixtureDex.classesWhere(build, { true }) { method ->
            !method.definingClass.startsWith(EXTENSION_ROOT) && (method.texts().any { it != null && gmsCoreText(it) != null } ||
                method.isAvailabilityCheck() || (method.name == "isAvailableOnDevice" && method.returnType == "Z") ||
                method.isProviderChoice() || method.isSignInFailureListener())
        }
        val casts = found.flatMap { it.methods }.filter { it.isProviderChoice() }.flatMap { it.implementation!!.instructions }
            .filter { it.opcode == Opcode.CHECK_CAST }.map { ((it as ReferenceInstruction).reference as TypeReference).type }.toSet()
        return found + FixtureDex.classes(build, casts - found.map { it.type }.toSet()).values
    }

    /** androidx's provider choice: static, taking its own class and the request, with the restore credential arm. */
    private fun Method.isProviderChoice() = AccessFlags.STATIC.isSet(accessFlags) &&
        parameterTypes.map(CharSequence::toString) == listOf(definingClass, "Ljava/lang/Object;") &&
        "androidx.credentials.TYPE_CLEAR_RESTORE_CREDENTIAL" in texts()

    private fun Instruction.referenceText() = (this as ReferenceInstruction).reference.toString()

    private fun Instruction.typeText() = ((this as ReferenceInstruction).reference as TypeReference).type

    private fun Method.isAvailabilityCheck() = returnType == "I" &&
        parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "I") &&
        texts().containsAll(listOf("MetadataValueReader", "This should never happen.", "com.google.android.gms"))

    private fun Method.isFrameworkProviderCheck(owner: ClassDef) = name == "isAvailableOnDevice" && returnType == "Z" &&
        parameterTypes.isEmpty() && owner.instanceFields.any { it.type == "Landroid/credentials/CredentialManager;" }

    private fun Method.isSignInFailureListener() = definingClass == HIDDEN_ACTIVITY && returnType == "V" &&
        parameterTypes.map(CharSequence::toString) == listOf(HIDDEN_ACTIVITY, "Ljava/lang/Exception;") && SIGN_IN_FAILURE_TEXT in texts()

    private fun Method.texts(): List<String?> = implementation?.instructions?.map {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }.orEmpty()

    private fun Method.same(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)

    private fun Iterable<Method>.flag(name: String) =
        (single { it.name == name }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

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
