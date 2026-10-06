/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.pip

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.media.taptoplay.GROOT_PLAY
import app.morphe.patches.facebook.media.taptoplay.grootPauses
import app.morphe.patches.facebook.media.taptoplay.grootPlays
import app.morphe.patches.facebook.media.taptoplay.innerPause
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Picture-in-picture's anchors on every Facebook build the bundle declares: ReelsPipUtil, the one
 * class loading the Reels viewer's picture-in-picture surface, with its one (Activity) -> boolean
 * check asking for the phone's feature; and the Reels viewer's arming step, which calls that check,
 * with the surface gate it asks first. Then the patch on both: the extension first, its yes
 * returning true and anything else jumping to Facebook's own first instruction. Reads the fixture
 * bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it. Also the hold's hooks: ReelsPipUtil's arming and
 * disarms, and FbGrootPlayer's pause and play; the helpers that hand the arming over and arm again,
 * and the stub calling the second; the runnable whose change is set aside; and the viewer's new view
 * id going through the extension.
 */
class PictureInPictureFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun Method.shape() = parameterTypes.map(CharSequence::toString)

    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    /** The index a branch at [index] lands on. */
    private fun List<Instruction>.target(index: Int): Int {
        var address = 0
        val addresses = map { instruction -> address.also { address += instruction.codeUnits } }
        return addresses.indexOf(addresses[index] + (this[index] as OffsetInstruction).codeOffset)
    }

    @Test
    fun `each declared build has the check and the gate once, and the extension goes first in both`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name
                val utils = FixtureDex.classesHolding(bundle, PIP_SURFACE).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                assertEquals("$name: classes loading \"$PIP_SURFACE\"", 1, utils.size)
                val util = utils.single()
                val checks = util.methods.filter(::isPipCheck)
                assertEquals("$name: ${util.type}'s (Activity) -> boolean checks asking for the feature", 1, checks.size)
                val check = checks.single()

                val holders = FixtureDex.classesHolding(bundle, AI_STYLES_DRAFTS).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val steps = holders.flatMap { holder -> holder.methods.filter { isArmingStep(it, check) } }
                assertEquals("$name: arming steps calling the check", 1, steps.size)
                val arming = steps.single()
                val call = surfaceGateCall(arming)
                assertNotNull("$name: ${arming.definingClass}->${arming.name} asks no gate first", call)
                val holder = holders.single { it.type == arming.definingClass }
                val gate = holder.methods.single {
                    it.name == call!!.name && it.shape() == call.parameterTypes.map(CharSequence::toString) && it.returnType == "Z"
                }
                assertTrue("$name: the gate isn't static", AccessFlags.STATIC.isSet(gate.accessFlags))
                val armingCode = arming.code()
                val gateAt = armingCode.indexOfFirst { it.call?.name == gate.name && it.call?.definingClass == gate.definingClass }
                val checkAt = armingCode.indexOfFirst { it.call?.name == check.name && it.call?.definingClass == check.definingClass }
                assertTrue("$name: the arming step asks the gate after the check", gateAt in 0 until checkAt)

                val owners = FixtureDex.classesHolding(bundle, GROOT_PLAY).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val plays = owners.flatMap(::grootPlays)
                assertEquals("$name: player plays", 1, plays.size)
                val play = plays.single()
                val owner = owners.single { it.type == play.definingClass }
                val pause = innerPause(grootPauses(owner, play.parameterTypes.single().toString()))
                assertNotNull("$name: the player's inner pause", pause)
                val armings = util.methods.filter { isArming(it, play.definingClass) }
                assertEquals("$name: ${util.type}'s armings for ${play.definingClass}", 1, armings.size)
                val disarms = util.methods.filter(::isDisarm)
                assertTrue("$name: ${util.type} has no disarm", disarms.isNotEmpty())
                val arm = armings.single()
                assertTrue("$name: ${arm.name} isn't static", AccessFlags.STATIC.isSet(arm.accessFlags))
                val videoParams = videoParamsCall(arming, arm, play.definingClass)
                assertNotNull("$name: ${arming.name} asks the player for none of ${arm.name}'s arguments", videoParams)
                val runnables = stateRunnables(util)
                assertEquals("$name: ${util.type}'s (Activity, boolean) runnables", 1, runnables.size)
                val runnable = FixtureDex.classes(bundle, runnables).values.single()
                val run = runnable.methods.single { isStateChange(it, util.type) }
                val viewers = FixtureDex.classesHolding(bundle, VIEWER_CONTAINER).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val openings = viewers.flatMap { viewer -> viewer.methods.filter(::isViewerOpening) }
                assertEquals("$name: viewer openings", 1, openings.size)
                val opening = openings.single()

                val originalCheck = check.code()
                val originalGate = gate.code()
                val originalPlay = play.code()
                val originalRun = run.code()
                val originalOpening = opening.code()
                val context = PatchContexts.of((listOf(util, holder, owner, runnable) + viewers + listOf(
                    ExtensionDex.classDef(PICTURE_IN_PICTURE), ExtensionDex.classDef(SETTINGS_STATUS))).distinctBy { it.type })
                pictureInPicturePatch.execute(context)

                val patched = context.mutableClassDefBy(check.definingClass).methods.single {
                    it.name == check.name && isPipCheck(it)
                }.code()
                val first = patched[0]
                assertEquals("$name: the check's first instruction", Opcode.INVOKE_STATIC_RANGE, first.opcode)
                assertEquals("$name: the check's first call", ALLOWED, first.call.toString())
                val activity = check.localRegisterCount() + if (AccessFlags.STATIC.isSet(check.accessFlags)) 0 else 1
                assertEquals("$name: the register handed over is the activity", activity, (first as RegisterRangeInstruction).startRegister)
                assertEquals("$name: one register handed over", 1, first.registerCount)
                assertEquals("$name: the yes branch", Opcode.IF_EQZ, patched[2].opcode)
                assertEquals("$name: a no runs Facebook's first instruction", 5, patched.target(2))
                assertEquals("$name: Facebook's first instruction moved", originalCheck[0].opcode, patched[5].opcode)
                assertEquals("$name: the yes answers true", 1, (patched[3] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals("$name: the yes returns", Opcode.RETURN, patched[4].opcode)
                assertEquals("$name: the rest of Facebook's check", originalCheck.size + 5, patched.size)

                val gated = context.mutableClassDefBy(gate.definingClass).methods.single {
                    it.name == gate.name && it.shape() == gate.shape() && it.returnType == "Z"
                }.code()
                assertEquals("$name: the gate's first call", SURFACE_ALLOWED, gated[0].call.toString())
                assertEquals("$name: the gate's yes branch", Opcode.IF_EQZ, gated[2].opcode)
                assertEquals("$name: a no runs Facebook's gate", 4, gated.target(2))
                assertEquals("$name: the gate's yes returns", Opcode.RETURN, gated[3].opcode)
                assertEquals("$name: Facebook's first instruction of the gate moved", originalGate[0].opcode, gated[4].opcode)
                assertEquals("$name: the rest of Facebook's gate", originalGate.size + 4, gated.size)

                fun patchedOf(method: Method) = context.mutableClassDefBy(method.definingClass).methods.single {
                    it.name == method.name && it.shape() == method.shape() && it.returnType == method.returnType
                }
                val armed = patchedOf(arm).code()
                val parameters = arm.shape().joinToString("")
                val handOver = armed[0] as RegisterRangeInstruction
                assertEquals("$name: the arming's first call", "${util.type}->$ARMING_HELPER($parameters)V", armed[0].call.toString())
                assertEquals("$name: the arming hands over all its arguments", listOf(arm.localRegisterCount(), arm.shape().size),
                    listOf(handOver.startRegister, handOver.registerCount))
                assertEquals("$name: the arming's own code follows", arm.code().size + 1, armed.size)
                val helpers = context.mutableClassDefBy(util.type).methods
                val capture = helpers.single { it.name == ARMING_HELPER }
                assertEquals("$name: $ARMING_HELPER takes the arming's arguments", arm.shape(), capture.shape())
                assertTrue("$name: $ARMING_HELPER isn't static", AccessFlags.STATIC.isSet(capture.accessFlags))
                assertTrue("$name: $ARMING_HELPER doesn't hand them to the extension", capture.code().any { it.call.toString() == ARMED })
                val replay = helpers.single { it.name == REARM_HELPER }
                val replayCalls = replay.code().mapNotNull { it.call?.toString() }
                assertTrue("$name: $REARM_HELPER asks no player for its video", videoParams!!.call.toString() in replayCalls)
                assertEquals("$name: $REARM_HELPER's last call arms again", "${util.type}->${arm.name}($parameters)V", replayCalls.last())
                val stub = context.mutableClassDefBy(PICTURE_IN_PICTURE).methods.single { it.name == REARM_STUB }.code()
                assertEquals("$name: the stub's first call", "${util.type}->$REARM_HELPER([Ljava/lang/Object;Ljava/lang/Object;)V",
                    stub[0].call.toString())
                assertEquals("$name: the stub answers true", 1, (stub[1] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals("$name: the stub returns it", Opcode.RETURN, stub[2].opcode)
                for (disarm in disarms) {
                    assertEquals("$name: ${disarm.name}'s first call", DISARMED, patchedOf(disarm).code()[0].call.toString())
                }
                val paused = patchedOf(pause!!).code()[0]
                assertEquals("$name: the pause's first call", PLAYER_PAUSED, paused.call.toString())
                assertEquals("$name: the pause hands over this", pause.localRegisterCount(), (paused as RegisterRangeInstruction).startRegister)
                val played = patchedOf(play).code()
                val trace = originalPlay.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == GROOT_PLAY }
                assertEquals("$name: the play's call after its trace", PLAYER_PLAYING, played[trace + 1].call.toString())
                assertEquals("$name: the play hands over this", play.localRegisterCount(),
                    (played[trace + 1] as RegisterRangeInstruction).startRegister)
                assertEquals("$name: the play's own code around it", originalPlay.size + 1, played.size)

                val ran = patchedOf(run).code()
                assertEquals("$name: the runnable's first call", SET_ASIDE, ran[0].call.toString())
                assertEquals("$name: the runnable's yes branch", Opcode.IF_EQZ, ran[2].opcode)
                assertEquals("$name: a no runs Facebook's runnable", 4, ran.target(2))
                assertEquals("$name: a yes sets nothing", Opcode.RETURN_VOID, ran[3].opcode)
                assertEquals("$name: the rest of Facebook's runnable", originalRun.size + 4, ran.size)

                val opened = patchedOf(opening).code()
                val newId = originalOpening.indexOfFirst { it.call?.name == "generateViewId" }
                val idRegister = (originalOpening[newId + 1] as OneRegisterInstruction).registerA
                val swap = opened[newId + 2] as FiveRegisterInstruction
                assertEquals("$name: the call after the new view id", VIEWER_ID, opened[newId + 2].call.toString())
                assertEquals("$name: the activity and the id handed over", listOf(opening.localRegisterCount(), idRegister),
                    listOf(swap.registerC, swap.registerD))
                assertEquals("$name: the answer is the id", idRegister, (opened[newId + 3] as OneRegisterInstruction).registerA)
                assertEquals("$name: the rest of Facebook's opening", originalOpening.size + 2, opened.size)

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "pictureInPicture" }
                assertEquals("$name: SettingsStatus.pictureInPicture() isn't switched on", 1,
                    (status.code()[0] as NarrowLiteralInstruction).narrowLiteral)
                println("$name: check ${check.definingClass}->${check.name}, gate ${gate.definingClass}->${gate.name} " +
                    "asked by ${arming.name}, armed in ${arm.name}, disarmed in ${disarms.joinToString { it.name }}, " +
                    "player ${play.definingClass}->${play.name}/${pause.name}, video ${videoParams.call.name}, " +
                    "set aside in ${runnable.type}, viewer ${opening.definingClass}->${opening.name}")
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }
}
