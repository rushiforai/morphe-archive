/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.reelspeed

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.media.resume.TRACK_START
import app.morphe.patches.facebook.media.resume.VIDEO_PLAYER_PARAMS
import app.morphe.patches.facebook.media.resume.paramsGetters
import app.morphe.patches.facebook.media.resume.reportedValues
import app.morphe.patches.facebook.media.resume.trackers
import app.morphe.patches.facebook.media.taptoplay.GROOT_PLAY
import app.morphe.patches.facebook.media.taptoplay.grootPlays
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.facebook.reels.hold.hookSpeedSetter
import app.morphe.patches.facebook.reels.hold.SPEED_SET as GUARD_SPEED_SET
import app.morphe.patches.facebook.shared.redexOriginalName
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Keep the reel speed's anchors on every Facebook build the bundle declares: FbGrootPlayer's speed
 * setter, PlayerOrigin getter, maybeTrackVideoStart and VideoPlayerParams getter, each there once;
 * the params' one debug dump reporting isFbShorts, isSponsored and isLiveNow, each a public boolean;
 * and the Reels menu's speed toast, the only method
 * holding its selector's name, which only FbShortsInlinePlaybackSpeedUtil's two pickers call. The
 * gear menu's speed sheet sets its pick with the same setter. Then the patch itself, run on those
 * classes: each hook first in its method, reading the method's own arguments, and each stub calling
 * the method or reading the field it stands for. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class KeepReelSpeedFixtureTest {
    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    private fun key(method: MethodReference) =
        method.definingClass + "->" + method.name + method.parameterTypes.joinToString("", "(", ")") + method.returnType

    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    @Test
    fun `each declared build has every anchor once, and the patch goes in on its own classes`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name
                val holders = FixtureDex.classesHolding(bundle, GROOT_PLAY).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val plays = holders.flatMap(::grootPlays)
                assertEquals("$name: players' plays holding \"$GROOT_PLAY\"", 1, plays.size)
                val play = plays.single()
                val owner = holders.single { it.type == play.definingClass }
                val trigger = play.parameterTypes.single().toString()
                assertTrue("$name: ${owner.type} isn't public", AccessFlags.PUBLIC.isSet(owner.accessFlags))

                val setters = speedSetters(owner)
                assertEquals("$name: speed setters reading the speed cache switch", 1, setters.size)
                val origins = originGetters(owner)
                assertEquals("$name: PlayerOrigin getters", 1, origins.size)
                val starts = trackers(owner, TRACK_START, trigger)
                assertEquals("$name: $TRACK_START", 1, starts.size)
                val paramsGetter = paramsGetters(owner)
                assertEquals("$name: VideoPlayerParams getters", 1, paramsGetter.size)
                val setter = setters.single()
                val origin = origins.single()
                for (method in listOf(setter, origin, paramsGetter.single())) {
                    assertTrue("$name: ${method.name} isn't public", AccessFlags.PUBLIC.isSet(method.accessFlags))
                }

                // The params' debug dump names the three booleans the rule reads.
                val paramsClass = FixtureDex.classes(bundle, setOf(VIDEO_PLAYER_PARAMS)).values.single()
                assertTrue("$name: $VIDEO_PLAYER_PARAMS isn't public", AccessFlags.PUBLIC.isSet(paramsClass.accessFlags))
                val dumps = paramsClass.methods.filter { m -> REEL_PARAM_STUBS.keys.all { holdsString(m, it) } }
                assertEquals("$name: methods reporting ${REEL_PARAM_STUBS.keys}", 1, dumps.size)
                val reported = reportedValues(dumps.single())
                val flagFields = REEL_PARAM_STUBS.entries.associate { (reportedName, stub) ->
                    val field = reported[reportedName]
                    assertTrue("$name: the dump doesn't report $reportedName", field != null)
                    val declared = paramsClass.fields.singleOrNull { it.name == field!!.name && it.type == "Z" }
                    assertTrue("$name: $reportedName, ${field!!.name}, isn't a public boolean",
                        declared != null && AccessFlags.PUBLIC.isSet(declared.accessFlags) && !AccessFlags.STATIC.isSet(declared.accessFlags))
                    stub to field.name
                }
                assertEquals("$name: the fields reported as ${REEL_PARAM_STUBS.keys}", 3, flagFields.values.toSet().size)

                // The only method of the build holding the selector's name, and the Reels pickers' runnables
                // are all that call it.
                val toastHolders = FixtureDex.classesHolding(bundle, SPEED_TOAST)
                val holding = toastHolders.flatMap { it.methods }.filter { holdsString(it, SPEED_TOAST) }
                assertEquals("$name: methods holding \"$SPEED_TOAST\"", 1, holding.size)
                val toast = holding.single()
                assertTrue("$name: ${toast.definingClass}->${toast.name} isn't the static (Context, float) toast", isSpeedToast(toast))
                val toastKey = toast.definingClass + "->" + toast.name
                val callers = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
                    dex.methodSection.any { it.definingClass == toast.definingClass && it.name == toast.name }
                }) { method -> method.implementation?.instructions?.any { it.call?.let { c -> c.definingClass + "->" + c.name } == toastKey } == true }
                val callerClasses = FixtureDex.classes(bundle, callers.map { it.definingClass }.toSet()).values
                assertEquals("$name: the toast's callers", 2, callers.size)
                assertTrue("$name: a caller of the toast isn't one of FbShortsInlinePlaybackSpeedUtil's pickers: " +
                    callerClasses.map { it.type + " " + redexOriginalName(it) },
                    callerClasses.all { redexOriginalName(it)?.startsWith("FbShortsInlinePlaybackSpeedUtil\$") == true })

                // The gear menu's speed sheet sets a pick through the same setter, and shows no toast.
                val gearHolders = FixtureDex.classesHolding(bundle, GEAR_PICK)
                val gear = gearHolders.flatMap { it.methods }.filter { holdsString(it, GEAR_PICK) }
                assertTrue("$name: the gear menu's speed pick doesn't set the speed with ${setter.name}", gear.any { method ->
                    method.code().any { it.call?.let(::key) == "${owner.type}->${setter.name}(F)V" }
                })
                val gearPick = gear.single { setterCalls(it, owner.type, setter).isNotEmpty() }
                val gearCalls = setterCalls(gearPick, owner.type, setter)
                val gearClass = gearHolders.single { it.type == gearPick.definingClass }

                val toastClass = toastHolders.single { it.type == toast.definingClass }
                val context = PatchContexts.of(listOf(owner, toastClass, gearClass, paramsClass,
                    ExtensionDex.classDef(REEL_SPEED), ExtensionDex.classDef(SETTINGS_STATUS)))
                keepReelSpeedPatch.execute(context)

                fun patched(type: String, method: Method): List<Instruction> = context.mutableClassDefBy(type).methods.single {
                    it.name == method.name && it.returnType == method.returnType &&
                        it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
                }.code()

                fun assertFirst(what: String, method: Method, hook: String, registers: List<Int>) {
                    val first = patched(method.definingClass, method)[0]
                    assertEquals("$name: the $what's first instruction", Opcode.INVOKE_STATIC_RANGE, first.opcode)
                    assertEquals("$name: the $what's first call", hook, first.call.toString())
                    assertEquals("$name: the registers the $what hands over", registers, first.registers())
                }
                val self = setter.localRegisterCount()
                assertFirst("speed setter", setter, SPEED_SET, listOf(self, self + 1))
                assertFirst("start", starts.single(), STARTED, listOf(starts.single().localRegisterCount()))
                assertFirst("toast", toast, PICKED, listOf(toast.localRegisterCount() + 1))

                // Straight after each of the gear pick's setter calls, the pick, with the speed that call handed over.
                val gearCode = patched(gearPick.definingClass, gearPick)
                val hooked = gearCode.withIndex().filter { it.value.call?.toString() == GEAR_PICKED }
                assertEquals("$name: the gear pick's hooks", gearCalls.size, hooked.size)
                for ((index, instruction) in hooked) {
                    assertEquals("$name: the gear pick's hook doesn't follow a setter call",
                        "${owner.type}->${setter.name}(F)V", gearCode[index - 1].call?.let(::key))
                    assertEquals("$name: the speed the gear pick's hook gets", gearCode[index - 1].registers().last(),
                        instruction.registers().single())
                }

                val stubs = context.mutableClassDefBy(REEL_SPEED)
                val setStub = stubs.methods.single { it.name == SET_SPEED_STUB }.code()
                assertEquals("$name: the setter stub's cast", owner.type, ((setStub[0] as ReferenceInstruction).reference as TypeReference).type)
                assertEquals("$name: the setter stub's call", "${owner.type}->${setter.name}(F)V", setStub[1].call.toString())
                assertEquals("$name: the setter stub's registers", listOf(0, 1), setStub[1].registers())
                val originStub = stubs.methods.single { it.name == ORIGIN_STUB }.code()
                assertEquals("$name: the origin stub's call", "${owner.type}->${origin.name}()$PLAYER_ORIGIN",
                    originStub[1].call.toString())
                assertEquals("$name: the origin stub's answer", Opcode.RETURN_OBJECT, originStub[3].opcode)
                val paramsStub = stubs.methods.single { it.name == REEL_PARAMS_STUB }.code()
                assertEquals("$name: the params stub's call", "${owner.type}->${paramsGetter.single().name}()$VIDEO_PLAYER_PARAMS",
                    paramsStub[1].call.toString())
                assertEquals("$name: the params stub's answer", Opcode.RETURN_OBJECT, paramsStub[3].opcode)
                for ((stub, field) in flagFields) {
                    val code = stubs.methods.single { it.name == stub }.code()
                    assertEquals("$name: the $stub stub's cast", VIDEO_PLAYER_PARAMS, ((code[0] as ReferenceInstruction).reference as TypeReference).type)
                    assertEquals("$name: the $stub stub's read", Opcode.IGET_BOOLEAN, code[1].opcode)
                    assertEquals("$name: the $stub stub's field", "$VIDEO_PLAYER_PARAMS->$field:Z",
                        ((code[1] as ReferenceInstruction).reference as FieldReference).toString())
                    assertEquals("$name: the $stub stub reads its argument", 0, (code[1] as TwoRegisterInstruction).registerB)
                    assertEquals("$name: the $stub stub's answer", Opcode.RETURN, code[2].opcode)
                }

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "keepReelSpeed" }
                assertEquals("$name: SettingsStatus.keepReelSpeed() isn't switched on", 1,
                    (status.code()[0] as NarrowLiteralInstruction).narrowLiteral)

                // As the patcher runs it, after the release guard it brings: the guard's answer stays
                // first in the setter, and the hook after it reads the speed the player gets.
                val guarded = PatchContexts.of(listOf(owner, toastClass, gearClass, paramsClass,
                    ExtensionDex.classDef(REEL_SPEED), ExtensionDex.classDef(SETTINGS_STATUS)))
                guarded.hookSpeedSetter(setter)
                keepReelSpeedPatch.execute(guarded)
                val chain = guarded.mutableClassDefBy(owner.type).methods.single {
                    it.name == setter.name && it.parameterTypes.map(CharSequence::toString) == listOf("F")
                }.code()
                assertEquals("$name: the guard's hook isn't first in the setter", GUARD_SPEED_SET, chain[0].call.toString())
                assertEquals("$name: the guard's answer isn't taken", Opcode.MOVE_RESULT, chain[1].opcode)
                assertEquals("$name: the hook after the guard's answer", SPEED_SET, chain[2].call.toString())
                assertEquals("$name: the registers the hook after the guard hands over", listOf(self, self + 1), chain[2].registers())
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }
}
