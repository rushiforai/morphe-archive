/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.interaction.sensitivewarnings

import app.morphe.Fixtures
import app.morphe.util.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.takes
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

private const val CAUTION = "Lcom/ss/android/ugc/aweme/feed/assem/caution/"
private const val SLOT = "${CAUTION}VideoTopCautionAssem;"
private const val TRIGGER = "${CAUTION}VideoTopCautionTrigger;"
private const val SERVICE = "Lcom/ss/android/ugc/aweme/compliance/api/services/share/IShareWarningInfoService;"
private const val CONTROLS = "Lapp/morphe/extension/pinedrama/feed/SensitiveWarnings;"
private const val UPLOAD_STRUCT = "Lcom/ss/android/ugc/aweme/shortvideo/AVUploadMiscInfoStruct;"

/**
 * What Hide Check your sources warnings hooks, held to each declared build. The banner (PineDrama's
 * Know the facts top caution, "Check your sources before sharing") is decided by one static
 * (Aweme)Z that reads KtfInfo.showWarning, which the slot that draws it, its trigger and the
 * slot's view model observer ask first. The share prompt is the compliance service's check that
 * reads KtfInfo.showMessageOnShare, and every share package treats its false as "go ahead".
 */
class KnowTheFactsAnchorsTest {
    @Test
    fun `the guard goes in front of the real gate and the real share prompt and leaves their bodies as they were`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val natives = mutableListOf<Method>()
            walk(apk) { classDef, method ->
                if (KnowTheFactsBannerGateFingerprint.takes(method, classDef) ||
                    KnowTheFactsSharePromptFingerprint.takes(method, classDef)
                ) natives += method
            }
            assertEquals("$version: ${natives.map { it.definingClass + "->" + it.name }}", 2, natives.size)
            for (native in natives) {
                val before = native.implementation!!.instructions.toList()
                val guarded = MutableMethod(native)
                guarded.hideKnowTheFacts("Skip content warnings")
                val after = guarded.implementation!!.instructions.toList()
                val where = "$version ${native.definingClass}->${native.name}"

                assertEquals(
                    "$where: the guard",
                    listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN),
                    after.take(5).map { it.opcode },
                )
                val call = after[0].getReference<MethodReference>()!!
                assertEquals(CONTROLS, call.definingClass)
                assertEquals("hideCheckYourSources", call.name)
                assertEquals("Z", call.returnType)
                assertTrue(call.parameterTypes.isEmpty())
                // The answer is read from and returned out of the same local, never a parameter.
                val firstParameter = native.implementation!!.registerCount -
                    native.parameterTypes.size - (if (AccessFlags.STATIC.isSet(native.accessFlags)) 0 else 1)
                assertEquals(0, (after[1] as OneRegisterInstruction).registerA)
                assertEquals(0, (after[4] as OneRegisterInstruction).registerA)
                assertTrue("$where: v0 is a parameter", firstParameter > 0)
                // PineDrama's own instructions follow the guard, in their own order.
                assertEquals(before.map { it.opcode }, after.takeLast(before.size).map { it.opcode })
            }
        }
    }

    @Test
    fun `the share prompt is the Know the facts check, and a false from it lets every share go ahead`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val checks = mutableListOf<Method>()
            val taken = mutableListOf<Method>()
            val shares = mutableListOf<Pair<String, List<Opcode>>>()
            var prompt: Method? = null
            walk(apk) { classDef, method ->
                if (classDef.type == KTF_SHARE_WARNINGS && method.returnType == "Z" &&
                    method.parameterTypes.map(CharSequence::toString) == KTF_SHARE_PARAMETERS
                ) checks += method
                if (KnowTheFactsSharePromptFingerprint.takes(method, classDef)) {
                    taken += method
                    prompt = method
                }
            }
            // The service has a second check of the same shape (election and synthetic media
            // prompts); only the one that reads KtfInfo is taken.
            assertEquals("$version: the service's checks ${checks.map { it.name }}", 2, checks.size)
            assertEquals("$version: taken ${taken.map { it.name }}", 1, taken.size)
            val name = prompt!!.name

            walk(apk) { classDef, method ->
                val body = method.implementation?.instructions?.toList() ?: return@walk
                body.forEachIndexed { at, instruction ->
                    val ref = instruction.getReference<MethodReference>() ?: return@forEachIndexed
                    if (ref.definingClass != SERVICE || ref.name != name ||
                        ref.parameterTypes.map(CharSequence::toString) != KTF_SHARE_PARAMETERS
                    ) return@forEachIndexed
                    shares += "${classDef.type}->${method.name}" to body.drop(at + 1).take(5).map { it.opcode }
                    assertEquals("$version ${classDef.type}->${method.name}", Opcode.MOVE_RESULT, body[at + 1].opcode)
                    val result = (body[at + 1] as OneRegisterInstruction).registerA
                    // A branch on the answer within the next two instructions (a const may come
                    // first), whose fall-through returns: true stops the share, false carries on.
                    val branch = (at + 2..at + 3).firstOrNull { index ->
                        val candidate = body[index]
                        (candidate.opcode == Opcode.IF_NE || candidate.opcode == Opcode.IF_EQZ) &&
                            ((candidate as? TwoRegisterInstruction)?.registerA == result ||
                                (candidate as? OneRegisterInstruction)?.registerA == result)
                    }
                    assertTrue("$version ${classDef.type}->${method.name}: no branch on the answer", branch != null)
                    assertEquals(
                        "$version ${classDef.type}->${method.name}: true doesn't return",
                        Opcode.RETURN_VOID,
                        body[branch!! + 1].opcode,
                    )
                }
            }
            assertTrue("$version: share packages that ask $shares", shares.size >= 2)
            assertTrue(
                "$version: the share package isn't among them $shares",
                shares.any { it.first.startsWith("Lcom/ss/android/ugc/aweme/share/improve/pkg/AwemeSharePackage;") },
            )
        }
    }

    @Test
    fun `only a static gate on an Aweme that reads KtfInfo showWarning is taken`() {
        val static = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
        val readsStruct = listOf(
            "invoke-static {p0}, Lcom/ss/android/ugc/aweme/feed/model/AwemeExtKt;->getUploadMiscInfoStruct($KTF_AWEME)$UPLOAD_STRUCT",
            "move-result-object v0",
            "iget-object v0, v0, $UPLOAD_STRUCT->ktfInfo:$KTF_INFO",
        )
        val readsWarning = listOf("iget-boolean v1, v0, $KTF_INFO->showWarning:Z")
        val readsShareFlag = listOf("iget-boolean v1, v0, $KTF_INFO->showMessageOnShare:Z")
        fun gate(
            lines: List<String>,
            flags: Int = static,
            parameters: List<String> = listOf(KTF_AWEME),
            returns: String = "Z",
        ) = MutableMethod(
            ImmutableMethod(
                "Lfixture/Gate;", "LJIIIZ", parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags,
                null, null, ImmutableMethodImplementation(7, emptyList(), null, null),
            ),
        ).apply {
            addInstructions(0, (lines + "const/4 v2, 0x0" + "return v2").joinToString("\n"))
        }

        assertTrue(isKnowTheFactsBannerGate(gate(readsStruct + readsWarning)))
        // Another KtfInfo flag is another question.
        assertFalse(isKnowTheFactsBannerGate(gate(readsStruct + readsShareFlag)))
        assertFalse(isKnowTheFactsBannerGate(gate(readsStruct)))
        // And the signature: static, answering Z, taking the one Aweme.
        assertFalse(isKnowTheFactsBannerGate(gate(readsStruct + readsWarning, flags = AccessFlags.PUBLIC.value)))
        assertFalse(isKnowTheFactsBannerGate(gate(readsStruct + readsWarning, returns = "V")))
        assertFalse(isKnowTheFactsBannerGate(gate(readsStruct + readsWarning, parameters = listOf("Ljava/lang/Object;"))))
        assertFalse(isKnowTheFactsBannerGate(gate(readsStruct + readsWarning, parameters = listOf(KTF_AWEME, "I"))))
        assertFalse(isKnowTheFactsBannerGate(ImmutableMethod(
            "Lfixture/Gate;", "LIZ", listOf(ImmutableMethodParameter(KTF_AWEME, null, null)), "Z", static, null, null, null,
        )))
    }

    @Test
    fun `only the service's check that reads the share flag and logs the KTF popout is taken`() {
        val readsShareFlag = listOf("iget-boolean v1, v0, $KTF_INFO->showMessageOnShare:Z")
        val logsPopout = listOf("const-string v2, \"tns_share_warning_popout_ktf\"")
        val logsElection = listOf("const-string v2, \"tns_br_election_share_prompt\"")
        fun check(lines: List<String>, owner: String = KTF_SHARE_WARNINGS, parameters: List<String> = KTF_SHARE_PARAMETERS) =
            MutableMethod(
                ImmutableMethod(
                    owner, "LIZJ", parameters.map { ImmutableMethodParameter(it, null, null) }, "Z",
                    AccessFlags.PUBLIC.value, null, null, ImmutableMethodImplementation(15, emptyList(), null, null),
                ),
            ).apply {
                addInstructions(0, (lines + "const/4 v3, 0x0" + "return v3").joinToString("\n"))
            }

        assertTrue(isKnowTheFactsSharePrompt(check(readsShareFlag + logsPopout)))
        assertFalse(isKnowTheFactsSharePrompt(check(readsShareFlag)))
        assertFalse(isKnowTheFactsSharePrompt(check(logsPopout)))
        assertFalse(isKnowTheFactsSharePrompt(check(logsElection)))
        assertFalse(isKnowTheFactsSharePrompt(check(readsShareFlag + logsPopout, owner = "Lfixture/Other;")))
        assertFalse(isKnowTheFactsSharePrompt(check(readsShareFlag + logsPopout, parameters = KTF_SHARE_PARAMETERS.dropLast(1))))
    }

    @Test
    fun `a gate with no local register for the answer stops the patch`() {
        val tight = MutableMethod(
            ImmutableMethod(
                "Lfixture/Gate;", "LIZ", listOf(ImmutableMethodParameter(KTF_AWEME, null, null)), "Z",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                ImmutableMethodImplementation(1, listOf(ImmutableInstruction11x(Opcode.RETURN, 0)), null, null),
            ),
        )
        val before = tight.implementation!!.instructions.toList()
        assertThrows(PatchException::class.java) { tight.hideKnowTheFacts("Skip content warnings") }
        assertEquals(before, tight.implementation!!.instructions.toList())
    }

    /** Every method of one build, walked once and never held (the dex has millions). */
    private fun walk(apk: File, visit: (ClassDef, Method) -> Unit) {
        val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
        for (entry in container.dexEntryNames) {
            for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                for (method in classDef.methods) visit(classDef, method)
            }
        }
    }
}
