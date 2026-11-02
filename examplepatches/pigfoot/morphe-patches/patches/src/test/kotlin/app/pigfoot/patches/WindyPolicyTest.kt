package app.pigfoot.patches

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.pigfoot.patches.windy.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.immutable.reference.*
import java.io.File
import java.util.concurrent.TimeUnit
import org.junit.Assert.*
import org.junit.Test

class WindyPolicyTest {
    private fun resource(name: String) = javaClass.getResourceAsStream("/windy/$name")!!.use { it.readBytes() }

    @Test fun onlyTheQualifiedVersionAndBuildAreEligible() {
        requireWindyTarget(WINDY_PACKAGE, WINDY_VERSION, WINDY_CODE)
        for ((pkg, version, code) in listOf(Triple("other", WINDY_VERSION, WINDY_CODE),
            Triple(WINDY_PACKAGE, "51.0.1", WINDY_CODE), Triple(WINDY_PACKAGE, WINDY_VERSION, "5100010"),
            Triple(WINDY_PACKAGE, WINDY_VERSION, null))) {
            assertThrows(IllegalArgumentException::class.java) { requireWindyTarget(pkg, version, code) }
        }
    }

    @Test fun assetPinRejectsWrongPathAndChangedBytes() {
        assertThrows(IllegalArgumentException::class.java) { requireWindyAsset(WINDY_ASSET, resource("policy-fixture.js")) }
        assertThrows(IllegalArgumentException::class.java) { requireWindyAsset("other/mobile.js", byteArrayOf()) }
    }

    @Test fun fiveExactSitesChangeAndEverythingElseRoundtrips() {
        val original = resource("policy-fixture.js")
        val result = patchWindyJavaScript(original).toString(Charsets.UTF_8)
        assertFalse(original.contentEquals(result.toByteArray()))
        var inverse = result
        for (edit in windyEdits) {
            assertEquals(1, Regex(Regex.escape(edit.after)).findAll(result).count())
            inverse = inverse.replace(edit.after, edit.before)
        }
        assertArrayEquals(original, inverse.toByteArray())
        assertTrue(result.contains("N.set(`subscriptionInfo`,null)"))
        assertTrue(result.contains("account.user=null;account.token=null"))
    }

    @Test fun missingAmbiguousAndPartialOverridesRejectWithoutChangingInput() {
        val original = resource("policy-fixture.js").toString(Charsets.UTF_8)
        for (edit in windyEdits) for (bad in listOf(original.replace(edit.before, "changed"),
            original + edit.before, original.replace(edit.before, edit.after))) {
            val bytes = bad.toByteArray();val before = bytes.copyOf()
            assertThrows(IllegalArgumentException::class.java) { patchWindyJavaScript(bytes) }
            assertArrayEquals(before, bytes)
        }
        val patched = patchWindyJavaScript(original.toByteArray())
        assertThrows(IllegalArgumentException::class.java) { patchWindyJavaScript(patched) }
    }

    @Test fun malformedUtf8IsNotSilentlyReencoded() {
        assertThrows(java.nio.charset.CharacterCodingException::class.java) {
            patchWindyJavaScript(resource("policy-fixture.js") + byteArrayOf(0xc3.toByte(), 0x28))
        }
    }

    @Test fun actualKotlinOutputPassesNodeStateAndLogoutReplay() {
        val original = resource("policy-fixture.js").toString(Charsets.UTF_8)
        val patched = patchWindyJavaScript(original.toByteArray()).toString(Charsets.UTF_8)
        fun json(s: String) = "\"" + s.replace("\\", "\\\\").replace("\"", "\\\"")
            .replace("\n", "\\n").replace("\r", "\\r").replace("\t", "\\t") + "\""
        val process = ProcessBuilder("node", "-e", resource("assert-policy.cjs").toString(Charsets.UTF_8))
            .redirectErrorStream(true).start()
        process.outputStream.bufferedWriter().use { it.write("{\"original\":${json(original)},\"patched\":${json(patched)}}") }
        assertTrue("Node semantic replay timed out", process.waitFor(20, TimeUnit.SECONDS))
        val log = process.inputStream.bufferedReader().readText()
        assertEquals(log, 0, process.exitValue());assertTrue(log.contains("PASS: 16"));println(log.trim())
    }

    private fun widget(owner: String = WINDY_WIDGET_OWNER): MutableMethod {
        fun call(op: Opcode, regs: List<Int>, type: String, name: String, params: List<String>, returns: String) =
            ImmutableInstruction35c(op, regs.size, regs.getOrElse(0){0}, regs.getOrElse(1){0}, regs.getOrElse(2){0},
                regs.getOrElse(3){0}, regs.getOrElse(4){0}, ImmutableMethodReference(type, name, params, returns))
        fun string(register: Int, text: String) = ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(text))
        val code = listOf(ImmutableInstruction22c(Opcode.IGET_OBJECT, 2, 2, ImmutableFieldReference(WINDY_WIDGET_OWNER, "a", "Lvt3;")),
            call(Opcode.INVOKE_VIRTUAL,listOf(2),"Lvt3;","b",emptyList(),"Landroid/content/SharedPreferences;"),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT,2),
            call(Opcode.INVOKE_VIRTUAL,listOf(2),"Ljava/lang/Object;","getClass",emptyList(),"Ljava/lang/Class;"),
            string(0,"subscription"),string(1,""),
            call(Opcode.INVOKE_STATIC,listOf(2,0,1),"Lm30;","r",listOf("Landroid/content/SharedPreferences;","Ljava/lang/String;","Ljava/lang/String;"),"Ljava/lang/String;"),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT,2),string(0,"premium"),
            call(Opcode.INVOKE_VIRTUAL,listOf(2,0),"Ljava/lang/Object;","equals",listOf("Ljava/lang/Object;"),"Z"),
            ImmutableInstruction11x(Opcode.MOVE_RESULT,2),ImmutableInstruction11x(Opcode.RETURN,2))
        return MutableMethod(ImmutableMethod(owner,"b",emptyList(),"Z",17,emptySet(),emptySet(),
            ImmutableMethodImplementation(3,code,emptyList(),emptyList())))
    }

    @Test fun widgetOnlyAddsAnEarlyBooleanAndKeepsOriginalInstructions() {
        val m = widget();val before = m.implementation!!.instructions.map { it.opcode }
        enableWindyWidgetPredicate(m)
        val after = m.implementation!!.instructions.toList()
        assertEquals(1,(after[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN,after[1].opcode)
        assertEquals(before,after.drop(2).map { it.opcode });assertEquals(3,m.implementation!!.registerCount)
        assertThrows(IllegalArgumentException::class.java) { enableWindyWidgetPredicate(m) }
    }

    @Test fun unrelatedOrChangedWidgetBodyRejectsAtomically() {
        val other = widget("Lother/Widget;")
        assertThrows(IllegalArgumentException::class.java) { enableWindyWidgetPredicate(other) }
        val changed = widget();changed.implementation!!.removeInstruction(0)
        val before = changed.implementation!!.instructions.map { it.opcode }
        assertThrows(IllegalArgumentException::class.java) { enableWindyWidgetPredicate(changed) }
        assertEquals(before,changed.implementation!!.instructions.map { it.opcode })
    }

    @Test fun selectionHasOnePublicPolicyAndNoExistingAppDependencies() {
        assertTrue(windyLocalFeaturesPatch.default)
        assertEquals("Windy local premium features",windyLocalFeaturesPatch.name)
        assertTrue(windyInputPatch.dependencies.isEmpty())
        assertTrue(windyLocalFeaturesPatch.dependencies.contains(windyInputPatch))
        assertEquals(setOf(WINDY_PACKAGE),windyLocalFeaturesPatch.compatibility!!.map { it.packageName }.toSet())
    }
}
