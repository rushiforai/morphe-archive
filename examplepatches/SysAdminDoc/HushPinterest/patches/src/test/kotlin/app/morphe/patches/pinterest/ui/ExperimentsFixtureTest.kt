/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** Every flag the three experiment patches turn on. */
private val FLAGS = listOf("swipeToClosePins", "pullToDismiss", "fullSizeProfilePhotos", "profilePhotoSheet", "bestVideoQuality", "videoSizeCap")

/** #48: Pinterest's experiment group lookup, and the experiments HushPinterest switches answer for. */
@Category(FixtureTests::class)
class ExperimentsFixtureTest {
    private fun Method.names(text: String) = instructions().any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == text
    }

    /** The lookup's class and every class that names one of the two experiments. */
    private fun read(build: File): List<ClassDef> = FixtureDex.classesWhere(build, { true }) { method ->
        method.names(EXPERIMENT_ACTIVATED) || method.names(PULL_TO_DISMISS_EXPERIMENT) || method.names(PROFILE_PHOTO_EXPERIMENT) ||
            method.names(VIDEO_SIZE_EXPERIMENT)
    }

    private fun lookupOf(classes: List<ClassDef>) = classes.flatMap { it.methods }.single { it.names(EXPERIMENT_ACTIVATED) }

    @Test
    fun `each declared APK asks the extension first in its experiment group lookup`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val clean = lookupOf(classes)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            assertEquals("${build.name}: the lookup", clean.toString(), context.experimentGroupLookup().toString())

            // The patcher runs the shared hook once, ahead of both patches that depend on it.
            experimentHookPatch.execute(context)
            swipeToClosePinsPatch.execute(context)
            fullSizeProfilePhotosPatch.execute(context)
            bestVideoQualityPatch.execute(context)
            for (flag in FLAGS) {
                assertEquals("${build.name}: $flag", 1, PinPageKit.flag(context, flag))
            }

            val body = PinPageKit.patched(context, clean)
            val hooks = body.filter { PinPageKit.target(it) == EXPERIMENT_HOOK }
            assertEquals("${build.name}: one ask, however many patches use it", 1, hooks.size)
            val ask = body[0] as RegisterRangeInstruction
            assertEquals(build.name, EXPERIMENT_HOOK, PinPageKit.target(ask))
            val registers = clean.implementation!!.registerCount
            assertEquals("${build.name}: the experiment's name goes in", listOf(registers - 3, 1), listOf(ask.startRegister, ask.registerCount))
            val answer = (body[1] as OneRegisterInstruction).registerA
            assertEquals(build.name, Opcode.MOVE_RESULT_OBJECT, body[1].opcode)
            assertEquals(build.name, Opcode.IF_EQZ, body[2].opcode)
            assertEquals(build.name, answer, (body[2] as OneRegisterInstruction).registerA)
            assertEquals(build.name, Opcode.RETURN_OBJECT, body[3].opcode)
            assertEquals(build.name, answer, (body[3] as OneRegisterInstruction).registerA)
            val method = context.mutableClassDefBy(clean.definingClass).methods.single { it.name == clean.name && it.parameters() == clean.parameters() } as MutableMethod
            val branch = method.implementation!!.instructions[2] as BuilderOffsetInstruction
            assertEquals("${build.name}: no answer runs Pinterest's own lookup", 4, branch.target.location.index)
            assertEquals("${build.name}: Pinterest's lookup follows", PinPageKit.kinds(clean.instructions()), PinPageKit.kinds(body.drop(4)))
        }
    }

    @Test
    fun `an experiment Pinterest stopped reading or a missing stub refuses its patch`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val lookupOnly = classes.filter { owner -> owner.methods.any { it.names(EXPERIMENT_ACTIVATED) } }
        val cases = linkedMapOf(
            "no pull-down reader" to Triple(ExtensionDex.classes() + lookupOnly, swipeToClosePinsPatch, PULL_TO_DISMISS_EXPERIMENT),
            "no profile photo reader" to Triple(ExtensionDex.classes() + lookupOnly, fullSizeProfilePhotosPatch, PROFILE_PHOTO_EXPERIMENT),
            "no video size reader" to Triple(ExtensionDex.classes() + lookupOnly, bestVideoQualityPatch, VIDEO_SIZE_EXPERIMENT),
            "no swipeToClosePins stub" to Triple(PinPageKit.extensionWithout("swipeToClosePins") + classes, swipeToClosePinsPatch, "swipeToClosePins"),
            "no pullToDismiss stub" to Triple(PinPageKit.extensionWithout("pullToDismiss") + classes, swipeToClosePinsPatch, "pullToDismiss"),
            "no fullSizeProfilePhotos stub" to Triple(PinPageKit.extensionWithout("fullSizeProfilePhotos") + classes, fullSizeProfilePhotosPatch, "fullSizeProfilePhotos"),
            "no profilePhotoSheet stub" to Triple(PinPageKit.extensionWithout("profilePhotoSheet") + classes, fullSizeProfilePhotosPatch, "profilePhotoSheet"),
            "no bestVideoQuality stub" to Triple(PinPageKit.extensionWithout("bestVideoQuality") + classes, bestVideoQualityPatch, "bestVideoQuality"),
            "no videoSizeCap stub" to Triple(PinPageKit.extensionWithout("videoSizeCap") + classes, bestVideoQualityPatch, "videoSizeCap"),
        )
        for ((reason, case) in cases) {
            val context = PatchContexts.of(case.first)
            val thrown = assertThrows(reason, PatchException::class.java) { case.second.execute(context) }
            assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(case.third))
            for (flag in FLAGS) {
                assertEquals("$reason: $flag", 0, PinPageKit.flagOrZero(context, flag))
            }
        }
    }

    @Test
    fun `a build without the lookup stops the shared hook`() {
        val context = PatchContexts.of(ExtensionDex.classes())
        val thrown = assertThrows(PatchException::class.java) { experimentHookPatch.execute(context) }
        assertTrue(thrown.message, thrown.message.orEmpty().contains("experiment group lookup"))
    }
}
