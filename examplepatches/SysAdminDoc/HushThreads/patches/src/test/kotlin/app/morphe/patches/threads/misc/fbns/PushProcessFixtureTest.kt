/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.fbns

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.settings.settingsPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Document

/**
 * On each declared build the push service's delegate tells the extension first thing when the
 * service is created and destroyed, the hooks land in the delegate methods Meta's service base
 * forwards onCreate and onDestroy to, and the manifest check refuses a push process that runs
 * anything else.
 */
class PushProcessFixtureTest {
    private val delegateV2 = "Lcom/facebook/rti/pushv2/service/FbnsServiceDelegateV2;"

    @Test
    fun `each declared build's push service reports its create and destroy`() {
        val builds = Fixtures.declaredBuilds()
        val declaredBuilds = AppCompatibilities.THREADS_TARGET_VERSION_CODES.size
        assertEquals("one build of each declared version and ABI", declaredBuilds, builds.size)
        for (build in builds) {
            val classes = withSuperclasses(build, setOf(PUSH_SERVICE, "Lcom/facebook/rti/pushv2/inapp/InappFbnsServiceDelegate;"))
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val (created, destroyed) = with(context) { pushServiceLifecycle() }
            assertEquals(build.name, delegateV2, created.definingClass)
            assertEquals(build.name, delegateV2, destroyed.definingClass)

            // The base's own onCreate and onDestroy are what call them.
            val base = classes.single { it.methods.any { m -> m.name == "onDestroy" && m.implementation != null } }
            assertEquals(build.name, listOf(created.name), base.delegateCalls("onCreate"))
            assertEquals(build.name, listOf(destroyed.name), base.delegateCalls("onDestroy"))

            val stockCreate = created.body()
            val stockDestroy = destroyed.body()
            with(context) { reportPushServiceLifecycle() }
            for ((method, stock, call) in listOf(
                Triple(created, stockCreate, "serviceCreated"),
                Triple(destroyed, stockDestroy, "serviceDestroyed"),
            )) {
                val body = method.body()
                assertEquals("${build.name}: $call", Opcode.INVOKE_STATIC, body[0].opcode)
                assertEquals("${build.name}: $call", "$FBNS_PROCESS->$call()V", (body[0] as ReferenceInstruction).reference.toString())
                assertEquals("${build.name}: nothing else moved in $call", stock.map { it.opcode }, body.drop(1).map { it.opcode })
            }
        }
    }

    @Test
    fun `the extension has both calls the hooks make`() {
        val extension = ExtensionDex.classDef(FBNS_PROCESS)
        for (name in listOf("serviceCreated", "serviceDestroyed")) {
            val method = extension.methods.single { it.name == name }
            assertTrue(name, AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags))
            assertEquals(name, "V", method.returnType)
            assertTrue(name, method.parameterTypes.isEmpty())
        }
    }

    @Test
    fun `the push process may run the push service alone`() {
        requirePushServiceAlone(manifest("""<service android:name="$PUSH_SERVICE_NAME" android:process=":fbns"/>"""))
        // A process named in full counts as the same process.
        requirePushServiceAlone(manifest("""<service android:name="$PUSH_SERVICE_NAME" android:process="com.instagram.barcelona:fbns"/>"""))

        val refusals = mapOf(
            "a receiver beside it" to """<service android:name="$PUSH_SERVICE_NAME" android:process=":fbns"/>
                <receiver android:name="com.example.Other" android:process=":fbns"/>""",
            "the service moved to another process" to """<service android:name="$PUSH_SERVICE_NAME" android:process=":push"/>""",
            "another service in its place" to """<service android:name="com.example.Other" android:process=":fbns"/>""",
        )
        for ((what, components) in refusals) {
            val failure = assertThrows(what, PatchException::class.java) { requirePushServiceAlone(manifest(components)) }
            assertTrue(what, failure.message!!.contains("could stop something else"))
        }
    }

    @Test
    fun `every build carries the push process fix through the settings patch`() {
        assertNull("a named patch can be deselected", pushProcessPatch.name)
        assertTrue(settingsPatch.dependencies.any { it === pushProcessPatch })
        assertTrue(pushProcessPatch.dependencies.any { it === pushProcessManifestPatch })
    }

    /** [types] and every superclass of theirs the build carries. */
    private fun withSuperclasses(build: File, types: Set<String>): List<ClassDef> {
        val wanted = types.toMutableSet()
        while (true) {
            val found = FixtureDex.classes(build, wanted)
            val more = found.values.mapNotNull { it.superclass }.filter { it !in wanted && !it.startsWith("Landroid/") && !it.startsWith("Ljava/") }
            if (more.isEmpty()) {
                assertEquals("the build lacks some of $types", types, types intersect found.keys)
                return found.values.toList()
            }
            wanted += more
        }
    }

    /** The names of the no-argument void calls [lifecycle] makes on another object. */
    private fun ClassDef.delegateCalls(lifecycle: String): List<String> =
        methods.single { it.name == lifecycle && it.parameterTypes.isEmpty() }.body()
            .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
            .map { (it as ReferenceInstruction).reference as MethodReference }
            .filter { it.parameterTypes.isEmpty() && it.returnType == "V" }
            .map { it.name }

    private fun manifest(components: String): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
        """<manifest xmlns:android="http://schemas.android.com/apk/res/android"><application>$components</application></manifest>"""
            .byteInputStream(),
    )

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
}
