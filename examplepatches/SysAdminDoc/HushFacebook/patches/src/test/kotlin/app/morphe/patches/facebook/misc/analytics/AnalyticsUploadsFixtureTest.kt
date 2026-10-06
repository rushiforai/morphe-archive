/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.analytics

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.reels.watchhistory.callRegisters
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findFreeRegister
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Every anchor of Hold back analytics uploads, on every declared Facebook build, and the facts the
 * hooks rest on: each XAnalytics upload call is the only one in the app, nothing jumps onto it past
 * the check, and the Papaya gate's off path is the one that returns false without starting a job.
 */
class AnalyticsUploadsFixtureTest {
    @Test
    fun `each declared build has every anchor once`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                checkPapaya(bundle)
                checkXAnalytics(bundle)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun checkPapaya(bundle: File) {
        // The job's start is the most derived onStartJob along FBPapayaJobService's superclasses.
        var type: String? = PAPAYA_SERVICE
        var start: Method? = null
        while (type != null && start == null) {
            val classDef = FixtureDex.classes(bundle, setOf(type))[type] ?: break
            start = classDef.methods.singleOrNull(::isJobStart)
            type = classDef.superclass
        }
        assertNotNull("${bundle.name}: no Papaya job start", start)
        val job = start!!
        assertTrue("${bundle.name}: the job start isn't synchronized", AccessFlags.DECLARED_SYNCHRONIZED.isSet(job.accessFlags))
        val gate = papayaGate(job)
        assertNotNull("${bundle.name}: no Papaya gate in ${job.definingClass}->onStartJob", gate)
        val instructions = job.implementation!!.instructions.toList()
        // Nothing is started before the gate: no job is handed to an executor ahead of the answer.
        assertTrue(
            "${bundle.name}: the job start runs work before the gate",
            instructions.take(gate!!).none { executes(it) },
        )
        assertTrue("${bundle.name}: the job start hands nothing to an executor after the gate", instructions.drop(gate).any { executes(it) })
        assertEquals("${bundle.name}: methods loading \"$PAPAYA_CONFIG\"", 1,
            FixtureDex.classesHolding(bundle, PAPAYA_CONFIG).sumOf { c -> c.methods.count { m -> holds(m, PAPAYA_CONFIG) } })
    }

    private fun checkXAnalytics(bundle: File) {
        val kept = FixtureDex.classes(bundle, setOf(APP_JOB_HANDLER, LOW_PRIORITY_INIT))
        val handler = kept[APP_JOB_HANDLER]
        val init = kept[LOW_PRIORITY_INIT]
        assertNotNull("${bundle.name}: no $APP_JOB_HANDLER", handler)
        assertNotNull("${bundle.name}: no $LOW_PRIORITY_INIT", init)
        val built = handler!!.methods.flatMap { method ->
            method.implementation?.instructions?.toList().orEmpty().filter { it.opcode == Opcode.NEW_INSTANCE }
                .map { ((it as ReferenceInstruction).reference as TypeReference).type }
        }.toSet()
        val runnables = FixtureDex.classes(bundle, built)
        val uploads = kickOffUploads(handler) { runnables[it] }
        assertEquals("${bundle.name}: foreground uploads", 1, uploads.size)
        val resumes = resumeUploads(init!!)
        assertEquals("${bundle.name}: uploader resumes", 1, resumes.size)

        for ((method, index) in uploads + resumes) {
            val call = method.implementation!!.instructions.elementAt(index)
            val free = method.findFreeRegister(index, call.callRegisters())
            assertFalse("${bundle.name}: ${method.name} borrows a register its call reads", free in call.callRegisters())
            assertFalse("${bundle.name}: a branch in ${method.definingClass}->${method.name} lands on the call", branchedTo(method, index))
        }

        // The two calls are the only ones in the app: the hooks cover every upload Java starts.
        for (name in listOf(KICK_OFF_UPLOAD, RESUME_UPLOADING)) {
            val callers = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
                dex.methodSection.any { it.definingClass == XANALYTICS && it.name == name }
            }) { method ->
                method.implementation?.instructions?.any { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == XANALYTICS && ref.name == name
                } == true
            }
            assertEquals("${bundle.name}: callers of $name", 1, callers.size)
        }
    }

    /** Whether [instruction] hands a runnable to an executor. */
    private fun executes(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction): Boolean {
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
        return call.name == "execute" && call.parameterTypes.map { it.toString() } == listOf(RUNNABLE)
    }

    private fun holds(method: Method, literal: String): Boolean =
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference)
                ?.string == literal
        } == true

    /** Whether a goto or an if in [method] lands on the instruction at [index]. */
    private fun branchedTo(method: Method, index: Int): Boolean {
        val instructions = method.implementation!!.instructions.toList()
        val addresses = instructions.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        return instructions.indices.any { at ->
            val branch = instructions[at] as? OffsetInstruction ?: return@any false
            instructions[at].opcode.name.let { it.startsWith("GOTO") || it.startsWith("IF_") } &&
                addresses[at] + branch.codeOffset == addresses[index]
        }
    }
}
