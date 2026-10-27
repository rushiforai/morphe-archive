package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

internal const val SYNTHETIC_AD_BANNER_GATE = "LX/Hb1;->A00()Z"

private val BANNER = pluginGates.getValue(AD_CONTEXT_BANNER).anchors.single()

/** The banner's name without the plugins package, as the socket's other methods log it. It isn't an anchor. */
private val BANNER_LOG_NAME = BANNER.removePrefix("com.facebook.").replace(".plugins.", ".")

private fun Method.code() = implementation!!.instructions.toList()

class AdContextBannerTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(vararg methods: MutableMethod) =
        mirroredControls(methods.groupBy { it.definingClass }.map { (type, group) -> fixtureClass(type, group) })

    @Test fun theBannerGateIsFoundByTheBannerItBuilds() {
        val controls = found(fixtureMethod(SYNTHETIC_AD_BANNER_GATE, pluginBody(BANNER)))
        assertEquals(listOf(SYNTHETIC_AD_BANNER_GATE), controls.getValue(AD_CONTEXT_BANNER).map { it.hookId() })
        validateControls(controls, setOf(AD_CONTEXT_BANNER))
        // The chat promotion gates are a different plugin and stay out of it.
        assertTrue(controls.getValue("chat_promotions").isEmpty())
    }

    @Test fun eachMappingHooksItsOneBannerGate() {
        assertEquals(setOf("LX/LfI;->A00()Z"), BASE_PROFILE.hooks.getValue(AD_CONTEXT_BANNER))
        assertEquals(setOf(SYNTHETIC_AD_BANNER_GATE), SYNTHETIC_PROFILE.hooks.getValue(AD_CONTEXT_BANNER))
    }

    @Test fun theBannersLogNameAndItsOtherMethodsAreNotGates() {
        val cases = mapOf(
            "log name only" to fixtureMethod(SYNTHETIC_AD_BANNER_GATE, pluginBody(BANNER_LOG_NAME)),
            "banner callback" to fixtureMethod("LX/Hb1;->Dft(Ljava/lang/String;)V",
                "const-string v0, \"$BANNER\"\nreturn-void"),
        )
        for ((case, method) in cases) {
            val controls = found(method)
            assertTrue(controls.getValue(AD_CONTEXT_BANNER).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(controls, setOf(AD_CONTEXT_BANNER)) }
        }
    }

    @Test fun anOnSwitchCachesMessengersOwnDisabledMarkerBeforeTheGateRuns() {
        val method = fixtureMethod(SYNTHETIC_AD_BANNER_GATE, pluginBody(BANNER))
        val before = method.code()
        injectControl(AD_CONTEXT_BANNER, mapOf(AD_CONTEXT_BANNER to listOf(method)))
        val code = method.code()
        assertEquals(Opcode.IGET_OBJECT, code[0].opcode)
        assertEquals(Opcode.IF_NEZ, code[1].opcode)
        assertEquals(AD_CONTEXT_BANNER, ((code[2] as ReferenceInstruction).reference as StringReference).string)
        assertEquals("$SETTINGS->enabled(Ljava/lang/String;)Z", (code[3] as ReferenceInstruction).reference.toString())
        assertEquals("LX/1dj;->A03:Ljava/lang/Object;", (code[6] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.IPUT_OBJECT, code[7].opcode)
        assertEquals(Opcode.RETURN, code[9].opcode)
        // A cached answer, Off, Pause and safe mode reach Messenger's own gate, unchanged.
        assertEquals(before, code.drop(10))
    }

    @Test fun aGateThatLostItsCacheContractRefusesTheSwitchBeforeAnyEdit() {
        val inverted = fixtureMethod(SYNTHETIC_AD_BANNER_GATE, pluginBody(BANNER, "if-ne"))
        val before = inverted.code()
        assertFailsWith<PatchException> {
            injectControl(AD_CONTEXT_BANNER, mapOf(AD_CONTEXT_BANNER to listOf(inverted)))
        }
        assertEquals(before, inverted.code())
    }

    @Test fun everySupportedBuildGatesTheBannerAtItsOneSocket() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            // Every class, so a gate that names the banner through a Redex string table counts too.
            val classes: List<ClassDef> = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val gates = mirroredControls(classes).getValue(AD_CONTEXT_BANNER)
            assertEquals(activeProfile.hooks.getValue(AD_CONTEXT_BANNER), gates.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(AD_CONTEXT_BANNER to gates), setOf(AD_CONTEXT_BANNER))
            val method = MutableMethod(gates.single())
            val before = method.code()
            method.injectPluginGate(AD_CONTEXT_BANNER)
            val after = method.code()
            assertEquals(AD_CONTEXT_BANNER, ((after[2] as ReferenceInstruction).reference as StringReference).string, code)
            assertEquals(activeProfile.pluginSentinel, (after[6] as ReferenceInstruction).reference.toString(), code)
            assertEquals(before.map { it.opcode }, after.drop(10).map { it.opcode }, code)
        }
    }
}
