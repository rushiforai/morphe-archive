import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.hevalcontrols.HEVAL_SETTINGS_CLASS
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.HevalRegistryCodec
import app.template.patches.shared.hevalcontrols.addHevalControlsComponents
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.hevalReturnEarly
import app.template.patches.shared.hevalcontrols.hevalReturnNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.assertThrows
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

/**
 * Heval Controls patch-side helpers: the registry encoder against the fixture shared with the Java
 * decoder, the manifest components and the runtime gate. No APK needed.
 */
class HevalControlsTest {
    private val fixtureFeatures = listOf(
        HevalFeature("demo.hide_ads", "Hide ads", "Removes banner and feed ads.", "Ads"),
        HevalFeature(
            "demo.read_receipts", "Hide read receipts",
            "Chats stay unread for the sender.\nApplies to new chats.", "Privacy",
            default = false, restartRequired = true, dependencies = listOf("demo.hide_ads"),
        ),
        HevalFeature(
            "demo.telemetry", "Block telemetry",
            "Removed at patch time: analytics provider and meta-data.", "Privacy", buildTimeOnly = true,
        ),
        HevalFeature(
            "demo.rtl_text", "إخفاء القصص",
            "Tab\there, backslash \\ and émoji ✓", "Feed",
            dependencies = listOf("demo.hide_ads", "demo.telemetry"),
        ),
    )

    @Test
    fun encoderMatchesTheFixtureSharedWithTheJavaDecoder() {
        val fixture = File(repoRoot(), "extensions/hevalcontrols/core/src/test/resources/registry-v1.txt")
        assertTrue(fixture.isFile, "missing ${fixture.path}")
        // core.autocrlf may check the fixture out with CRLF; the encoder (and the dex) use LF.
        assertEquals(fixture.readText(Charsets.UTF_8).replace("\r\n", "\n"), HevalRegistryCodec.encode(fixtureFeatures))
    }

    @Test
    fun emptyRegistryIsJustTheHeader() {
        assertEquals("hevalcontrols-registry:1\n", HevalRegistryCodec.encode(emptyList()))
    }

    @Test
    fun encoderRejectsDuplicateIds() {
        val feature = HevalFeature("demo.a", "A", "", "X")
        assertThrows<IllegalArgumentException> { HevalRegistryCodec.encode(listOf(feature, feature.copy(name = "B"))) }
    }

    @Test
    fun featureValidation() {
        listOf("", "Upper", "1st", "with-dash", "with,comma", "a".repeat(65)).forEach { id ->
            assertThrows<IllegalArgumentException>(id) { HevalFeature(id, "Name", "", "X") }
        }
        assertThrows<IllegalArgumentException> { HevalFeature("demo.a", " ", "", "X") }
        assertThrows<IllegalArgumentException> { HevalFeature("demo.a", "A", "", "") }
        assertThrows<IllegalArgumentException> { HevalFeature("demo.a", "A", "", "X", dependencies = listOf("demo.a")) }
        assertThrows<IllegalArgumentException> { HevalFeature("demo.a", "A", "", "X", dependencies = listOf("Bad")) }
        assertThrows<IllegalArgumentException> {
            HevalFeature("demo.a", "A", "", "X", dependencies = listOf("demo.b", "demo.b"))
        }
    }

    @Test
    fun manifestGetsANonExportedProviderAndActivity() {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
            """
                <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.example.app">
                    <application android:name="com.example.App">
                        <provider android:name="androidx.startup.InitializationProvider"
                            android:authorities="com.example.app.androidx-startup" android:exported="false"/>
                    </application>
                </manifest>
            """.trimIndent().byteInputStream(),
        )
        document.addHevalControlsComponents()

        val providers = document.getElementsByTagName("provider")
        val provider = (0 until providers.length).map { providers.item(it) as Element }
            .single { it.getAttribute("android:name") == "app.template.extension.hevalcontrols.InitProvider" }
        assertEquals("com.example.app.hevalcontrols", provider.getAttribute("android:authorities"))
        assertEquals("false", provider.getAttribute("android:exported"))
        assertEquals("1000", provider.getAttribute("android:initOrder"))

        val activity = document.getElementsByTagName("activity").item(0) as Element
        assertEquals("app.template.extension.hevalcontrols.ui.HevalControlsActivity", activity.getAttribute("android:name"))
        assertEquals("false", activity.getAttribute("android:exported"))
        assertEquals(0, document.getElementsByTagName("activity-alias").length)
        assertEquals(0, document.getElementsByTagName("intent-filter").length)

        // Patching an already patched APK is refused.
        assertThrows<PatchException> { document.addHevalControlsComponents() }
    }

    @Test
    fun booleanGateKeepsTheOriginalCodeReachable() {
        // public boolean isPromotedVisible() { return true; }   .registers 2 (v0, p0)
        val method = method(
            "Z", registers = 2,
            ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
            ImmutableInstruction11x(Opcode.RETURN, 0),
        )
        method.hevalReturnEarly("demo.hide_promoted", false)

        val instructions = method.implementation!!.instructions.toList()
        assertEquals(
            listOf(
                Opcode.CONST_STRING, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN,
            ),
            instructions.map { it.opcode },
        )
        assertEquals("demo.hide_promoted", ((instructions[0] as ReferenceInstruction).reference as StringReference).string)
        val call = (instructions[1] as ReferenceInstruction).reference as MethodReference
        assertEquals(HEVAL_SETTINGS_CLASS, call.definingClass)
        assertEquals("isEnabled", call.name)
        assertEquals(listOf("Ljava/lang/String;"), call.parameterTypes.map { it.toString() })
        assertEquals("Z", call.returnType)
        assertEquals(0, (instructions[1] as RegisterRangeInstruction).startRegister)
        assertEquals(0, (instructions[2] as OneRegisterInstruction).registerA)
        // The patched path answers false; the stock path is the untouched original.
        assertEquals(0, (instructions[4] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(1, (instructions[6] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(instructions[6], branchTarget(method, 3))
    }

    @Test
    fun voidAndObjectGates() {
        val void = method("V", registers = 2, ImmutableInstruction10x(Opcode.RETURN_VOID))
        void.hevalReturnEarly("demo.no_upload")
        assertEquals(
            listOf(Opcode.CONST_STRING, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.RETURN_VOID),
            void.implementation!!.instructions.map { it.opcode },
        )

        val obj = method(
            "Ljava/lang/Object;", registers = 2,
            ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 1),
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
        )
        obj.hevalReturnNull("demo.no_banner")
        assertEquals(
            listOf(Opcode.CONST_STRING, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4,
                Opcode.RETURN_OBJECT, Opcode.MOVE_OBJECT, Opcode.RETURN_OBJECT),
            obj.implementation!!.instructions.map { it.opcode },
        )
    }

    @Test
    fun customGateUsesTheGivenRegister() {
        val method = method(
            "Z", registers = 20,
            ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
            ImmutableInstruction11x(Opcode.RETURN, 0),
        )
        method.addHevalGate("demo.custom", register = 17) { v -> "const/16 $v, 0x0\nreturn $v" }
        val instructions = method.implementation!!.instructions.toList()
        assertEquals(17, (instructions[1] as RegisterRangeInstruction).startRegister)
        assertEquals(17, (instructions[3] as OneRegisterInstruction).registerA)
    }

    @Test
    fun gateRefusesUnsafeRegistersAndAnchors() {
        // Only p0 (this): no local for the scratch register.
        val noLocals = method("Z", registers = 1, ImmutableInstruction11x(Opcode.RETURN, 0))
        assertThrows<PatchException> { noLocals.hevalReturnEarly("demo.x", true) }

        // A parameter register is never used as scratch.
        val method = method("Z", registers = 2, ImmutableInstruction11n(Opcode.CONST_4, 0, 1), ImmutableInstruction11x(Opcode.RETURN, 0))
        assertThrows<PatchException> { method.addHevalGate("demo.x", register = 1) { "" } }
        assertThrows<PatchException> { method.addHevalGate("demo.x", index = 5) { "" } }
        assertThrows<IllegalArgumentException> { method.addHevalGate("Bad Id") { "" } }
        assertThrows<PatchException> { method.hevalReturnEarly("demo.x") } // not void
        assertThrows<PatchException> { method.hevalReturnNull("demo.x") } // not an object
    }

    @Test
    fun gateRefusesToSplitAResultOrExceptionMove() {
        // static int value() { invoke-static {}, Lcom/example/Feed;->f()X; move-result* v0; ... }
        listOf(
            Opcode.MOVE_RESULT to "I",
            Opcode.MOVE_RESULT_OBJECT to "Ljava/lang/Object;",
            Opcode.MOVE_RESULT_WIDE to "J",
            Opcode.MOVE_EXCEPTION to "V",
        ).forEach { (move, type) ->
            val method = method("V", registers = 4, invoke(type), ImmutableInstruction11x(move, 0), ImmutableInstruction10x(Opcode.RETURN_VOID))
            val e = assertThrows<PatchException>(move.name) { method.addHevalGate("demo.x", index = 1, register = 2) { "" } }
            assertTrue(e.message!!.contains("cannot be inserted before"), e.message)
            assertEquals(listOf(Opcode.INVOKE_STATIC, move, Opcode.RETURN_VOID), method.implementation!!.instructions.map { it.opcode })
        }
    }

    @Test
    fun gateAtMethodEntryBeforeAnInvokeStillWorks() {
        val method = method("V", registers = 2, invoke("I"), ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), ImmutableInstruction10x(Opcode.RETURN_VOID))
        method.hevalReturnEarly("demo.entry")
        assertEquals(
            listOf(
                Opcode.CONST_STRING, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID,
                Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.RETURN_VOID,
            ),
            method.implementation!!.instructions.map { it.opcode },
        )
    }

    /** `invoke-static {}, Lcom/example/Feed;->f()<returnType>`. */
    private fun invoke(returnType: String) = ImmutableInstruction35c(
        Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
        ImmutableMethodReference("Lcom/example/Feed;", "f", emptyList(), returnType),
    )

    private fun method(returnType: String, registers: Int, vararg instructions: com.android.tools.smali.dexlib2.iface.instruction.Instruction) =
        MutableMethod(
            ImmutableMethod(
                "Lcom/example/Feed;",
                "gated",
                emptyList<ImmutableMethodParameter>(),
                returnType,
                AccessFlags.PUBLIC.value,
                null,
                null,
                ImmutableMethodImplementation(registers, instructions.toList(), null, null),
            ),
        )

    /** The instruction an [OffsetInstruction] at [index] jumps to. */
    private fun branchTarget(method: MutableMethod, index: Int): com.android.tools.smali.dexlib2.iface.instruction.Instruction {
        val instructions = method.implementation!!.instructions.toList()
        val offsets = instructions.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        val target = offsets[index] + (instructions[index] as OffsetInstruction).codeOffset
        return instructions[offsets.indexOf(target)]
    }
}
