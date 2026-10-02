/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.analytics

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class MqttAnalyticsEndpointTest {
    private val endpoint = "Lapp/hushgram/extension/instagram/misc/Analytics;->endpoint(Ljava/lang/String;)Ljava/lang/String;"
    private val settings = "Lfixture/MqttSettings;"
    private val optString = "Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"

    /** The value read under analytics_endpoint goes through endpoint() before the field keeps it; the host doesn't. */
    @Test
    fun theAnalyticsAddressGoesThroughTheExtension() {
        val context = PatchContexts.of(listOf(settingsClass()))

        assertNull(context.wrapMqttAnalyticsEndpoint(endpoint))

        val code = context.constructor().code()
        val calls = code.indices.filter { code[it].referenceText() == endpoint }
        assertEquals("endpoint() calls", 1, calls.size)
        val call = calls.single()
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[call - 1].opcode)
        val read = code[call - 2]
        assertEquals(optString, read.referenceText())
        val register = (code[call - 1] as OneRegisterInstruction).registerA
        assertEquals("endpoint()'s argument", register, (code[call] as RegisterRangeInstruction).startRegister)
        assertEquals(register, (code[call + 1] as OneRegisterInstruction).registerA)
        assertEquals("the field keeps the answer", Opcode.IPUT_OBJECT, code[call + 2].opcode)
    }

    /** A build whose settings read no analytics_endpoint says so, and nothing changes. */
    @Test
    fun noKeyNoChange() {
        val context = PatchContexts.of(listOf(settingsClass(key = "something_else")))

        val reason = context.wrapMqttAnalyticsEndpoint(endpoint)

        assertTrue(reason, reason!!.contains(ANALYTICS_KEY))
        assertTrue(context.constructor().code().none { it.referenceText() == endpoint })
    }

    /** In each declared build, the key comes from the pool of shared strings, and the value goes through endpoint(). */
    @Test
    fun eachDeclaredBuildWrapsTheMqttAnalyticsAddress() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                // The constructor first, then every class it calls a static method on, which takes in the string pools.
                val classes = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    if (MQTT_SETTINGS_STRINGS.any { it !in dex.stringSection }) return@forEach
                    for (classDef in dex.classes) {
                        if (classDef.methods.any { method -> method.name == "<init>" && MQTT_SETTINGS_STRINGS.all { it in method.strings() } }) {
                            classes += ImmutableClassDef.of(classDef)
                        }
                    }
                }
                val called = classes.flatMap { it.methods }.flatMap { it.code() }
                    .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
                    .mapNotNull { ((it as ReferenceInstruction).reference as? MethodReference)?.definingClass }
                    .toSet() - classes.map { it.type }.toSet()
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) if (classDef.type in called) classes += ImmutableClassDef.of(classDef)
                }
                val context = PatchContexts.of(classes)

                assertNull(bundle.name, context.wrapMqttAnalyticsEndpoint(endpoint))

                val constructor = classes.flatMap { it.methods }.single { method ->
                    method.name == "<init>" && MQTT_SETTINGS_STRINGS.all { it in method.strings() }
                }
                val code = context.classDefBy(constructor.definingClass).methods.single { it.name == "<init>" && it.parameterTypes.map(Any::toString) == constructor.parameterTypes.map(Any::toString) }.code()
                val call = code.indices.single { code[it].referenceText() == endpoint }
                assertEquals("${bundle.name}: endpoint() follows optString()", optString, code[call - 2].referenceText())
                assertTrue("${bundle.name}: the key isn't loaded in place", constructor.strings().none { it == ANALYTICS_KEY })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun BytecodePatchContext.constructor(): Method = classDefBy(settings).methods.single { it.name == "<init>" }

    private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.strings(): List<String> = code().mapNotNull {
        if (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) ((it as ReferenceInstruction).reference as StringReference).string else null
    }

    private fun Instruction.referenceText(): String? = (this as? ReferenceInstruction)?.reference?.toString()

    /** The MQTT client's settings: the host, then the analytics address with Graph's as the fallback. */
    private fun settingsClass(key: String = ANALYTICS_KEY): ClassDef {
        val mutable = MutableMethod(
            ImmutableMethod(
                settings, "<init>", listOf(ImmutableMethodParameter("Lorg/json/JSONObject;", null, null)), "V",
                AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value, null, null,
                ImmutableMethodImplementation(5, emptyList(), null, null),
            ),
        )
        mutable.addInstructionsWithLabels(
            0,
            """
                const-string v1, "php_sandbox_host_name"
                const-string v2, "mqtt-mini.facebook.com"
                invoke-virtual { p1, v1, v2 }, $optString
                move-result-object v0
                iput-object v0, p0, $settings->host:Ljava/lang/String;
                const-string v1, "$key"
                const-string v2, "https://graph.facebook.com/logging_client_events"
                invoke-virtual { p1, v1, v2 }, $optString
                move-result-object v0
                iput-object v0, p0, $settings->analytics:Ljava/lang/String;
                return-void
            """.trimIndent(),
        )
        return ImmutableClassDef(
            settings, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null,
            listOf("host", "analytics").map { ImmutableField(settings, it, "Ljava/lang/String;", AccessFlags.PUBLIC.value, null, null, null) },
            listOf(ImmutableMethod.of(mutable)),
        )
    }
}
