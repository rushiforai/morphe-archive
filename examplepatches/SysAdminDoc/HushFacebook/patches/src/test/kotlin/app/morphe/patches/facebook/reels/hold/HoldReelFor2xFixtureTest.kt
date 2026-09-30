/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels.hold

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.media.reelspeed.speedSetters
import app.morphe.patches.facebook.media.taptoplay.FRAGMENT_ACTIVITY
import app.morphe.patches.facebook.media.taptoplay.GROOT_PLAY
import app.morphe.patches.facebook.media.taptoplay.grootPlays
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Hold a reel for 2x's anchors on every Facebook build the bundle declares: two long-press
 * handlers holding "speed_up", which ask the immersive player config one flag and load the log name
 * once each, after they take the flag's answer; two release
 * listeners, which ask a second flag straight before that one; the overlay's one check of the
 * speed-up flag before it gives a reel its release listener; the one edge check of the build, which
 * a handler calls; and nothing else in the build asking either flag but three places the patch
 * leaves alone, none of which makes a handler or a listener; and the two speed-ups, one in each of
 * FbShortsVideoControlComponent and UddPlayerControlComponent, setting FbGrootPlayer's speed from
 * one read of the config; and both release listeners reading the player's speed with one public
 * getter. Then the patch itself, run on those
 * classes: every flag call's answer through the extension in the same register before its branch,
 * every return of the edge check and of the hold speed through the extension, the hold's start
 * straight after each "speed_up" load, the touch dispatch handing the event over first, the speed
 * setter handing the player and the speed over first and going on with the speed it gets back, and
 * the extension's speed stub calling the getter. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class HoldReelFor2xFixtureTest {
    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    private fun key(method: Method) =
        method.definingClass + "->" + method.name + method.parameterTypes.joinToString("", "(", ")") + method.returnType

    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    @Test
    fun `each declared build has every anchor, and the patch goes in on its own classes`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name
                val handlers = FixtureDex.classesHolding(bundle, SPEED_UP_LOG).filter(::isLongPressHandler)
                assertEquals("$name: long-press handlers", 2, handlers.size)
                val config = handlers.mapNotNull(::configType).toSet().single()
                val speedUp = handlers.flatMap { h -> h.methods.flatMap { flagCalls(it, config).values } }.toSet().single()

                val listenerTypes = mutableSetOf<String>()
                FixtureDex.forEach(bundle) { dex ->
                    dex.classes.filter { isReleaseListener(it) && configType(it) == config }.forEach { listenerTypes += it.type }
                }
                assertEquals("$name: release listeners", 2, listenerTypes.size)
                val listeners = FixtureDex.classes(bundle, listenerTypes).values.toList()
                val release = listeners.flatMap { l -> l.methods.flatMap { flagsBefore(it, config, speedUp) } }.toSet().single()
                assertTrue("$name: the release flag is the speed-up flag", release != speedUp)
                for (listener in listeners) {
                    val asks = listener.methods.flatMap { flagsBefore(it, config, speedUp) }
                    assertEquals("$name: ${listener.type} asks the release flag before the speed-up flag", listOf(release), asks)
                }

                val lambdas = (handlers + listeners).map { it.type }.toSet()
                val components = CONTROL_COMPONENTS.flatMap { FixtureDex.classesHolding(bundle, it) }.distinctBy { it.type }
                val builders = components.flatMap { c -> c.methods.filter { makesOneOf(it, lambdas) } }
                val flags = setOf(speedUp, release)
                val checks = builders.filter { flagCalls(it, config).values.any { flag -> flag in flags } }
                assertEquals("$name: component renders asking either flag", 1, checks.size)
                assertEquals("$name: the render's calls of either flag", listOf(speedUp),
                    flagCalls(checks.single(), config).values.filter { it in flags })

                // Everything else in the build that asks either flag, left alone: none of it makes a
                // handler or a listener, and there are three.
                val flagKeys = setOf("$config->$speedUp()Z", "$config->$release()Z")
                val askers = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
                    dex.methodSection.any { it.definingClass == config && (it.name == speedUp || it.name == release) }
                }) { method -> method.implementation?.instructions?.any { it.call?.toString() in flagKeys } == true }
                val patched = (handlers + listeners).map { it.type }.toSet()
                val others = askers.filter { it.definingClass !in patched && checks.none { c -> key(c) == key(it) } }
                assertEquals("$name: other methods asking the flags: ${others.map(::key)}", 3, others.size)
                assertTrue("$name: another method makes a handler or a listener", others.none { makesOneOf(it, lambdas) })
                assertTrue("$name: the release flag is asked outside the release listeners",
                    others.none { m -> m.code().any { it.call?.toString() == "$config->$release()Z" } })

                val edgeCalls = handlers.flatMap { h -> h.methods.flatMap { edgeChecksCalled(it, config) } }.distinctBy { it.toString() }
                assertEquals("$name: edge checks the handlers call", 1, edgeCalls.size)
                val shaped = FixtureDex.methodsWhere(bundle, dexFilter = { dex -> dex.typeSection.any { it == config } }) {
                    isEdgeCheckShape(it.parameterTypes.map(CharSequence::toString), it.returnType, config)
                }
                assertEquals("$name: methods of the edge check's shape", 1, shaped.size)
                val edgeClass = FixtureDex.classes(bundle, setOf(edgeCalls.single().definingClass)).values.single()
                val edge = edgeClass.methods.single { isMethod(it, edgeCalls.single()) }

                // The speed-ups set FbGrootPlayer's speed from one double read of the config's answer.
                val playerHolders = FixtureDex.classesHolding(bundle, GROOT_PLAY).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val play = playerHolders.flatMap(::grootPlays).single()
                val player = playerHolders.single { it.type == play.definingClass }
                val setter = speedSetters(player).single()
                val configClass = FixtureDex.classes(bundle, setOf(config)).values.single()
                val configAnswers = configClass.methods.filter { it.parameterTypes.isEmpty() }.map { it.returnType }.toSet()
                val speedUpClasses = SPEED_UP_COMPONENTS.flatMap { FixtureDex.classesHolding(bundle, it) }.distinctBy { it.type }
                val reads = speedUpClasses.flatMap { c ->
                    c.methods.flatMap { m -> holdSpeedReads(m, "${player.type}->${setter.name}(F)V", configAnswers).map { m to it } }
                }
                assertEquals("$name: speed-ups setting the speed from a read of the config: ${reads.map { key(it.first) }}", 2, reads.size)
                assertEquals("$name: the speed-ups' components", 2, reads.map { it.first.definingClass }.toSet().size)
                val speedRead = reads.map { it.second.toString() }.toSet().single()
                val speedClass = FixtureDex.classes(bundle, setOf(reads.first().second.definingClass)).values.single()
                val holdSpeed = speedClass.methods.single { isMethod(it, reads.first().second) }

                // Each release listener reads the player's speed with the same one getter.
                for (listener in listeners) {
                    val getters = listener.methods.flatMap { speedGettersCalled(it, player.type) }.map { it.toString() }.toSet()
                    assertEquals("$name: ${listener.type}'s reads of ${player.type}'s speed", 1, getters.size)
                }
                val getterCall = listeners.flatMap { l -> l.methods.flatMap { speedGettersCalled(it, player.type) } }
                    .distinctBy { it.toString() }.single()
                val speedGetter = player.methods.single { isMethod(it, getterCall) }
                assertTrue("$name: ${key(speedGetter)} isn't public", AccessFlags.PUBLIC.isSet(speedGetter.accessFlags))

                val activity = FixtureDex.classes(bundle, setOf(FRAGMENT_ACTIVITY)).values.single()
                val componentClasses = components.filter { c -> checks.any { it.definingClass == c.type } }
                val classes: List<ClassDef> = (handlers + listeners + componentClasses + edgeClass + activity + player + configClass +
                    speedUpClasses + speedClass + ExtensionDex.classDef(REEL_HOLD) + ExtensionDex.classDef(SETTINGS_STATUS))
                    .distinctBy { it.type }
                val context = PatchContexts.of(classes)
                holdReelFor2xPatch.execute(context)

                fun patched(method: Method): List<Instruction> = context.mutableClassDefBy(method.definingClass).methods.single {
                    key(it) == key(method)
                }.code()

                fun assertAnswers(method: Method, hook: String, flags: Set<String>) {
                    val before = method.code()
                    val after = patched(method)
                    val calls = flagCalls(method, config).filterValues { it in flags }.keys
                        .filter { answerTakenAt(method, it) != null }.sorted()
                    assertTrue("$name: ${key(method)} asks none of $flags", calls.isNotEmpty())
                    calls.forEachIndexed { hooked, call ->
                        val at = call + 2 * hooked
                        val register = (before[call + 1] as OneRegisterInstruction).registerA
                        assertEquals("$name: ${key(method)} lost its flag call", before[call].call.toString(), after[at].call.toString())
                        assertEquals("$name: ${key(method)} after the flag's answer", hook, after[at + 2].call.toString())
                        assertEquals("$name: ${key(method)} hands over another register", listOf(register), after[at + 2].registers())
                        assertEquals("$name: ${key(method)} takes the answer back", register,
                            (after[at + 3] as OneRegisterInstruction).registerA)
                        assertEquals("$name: ${key(method)} lost what came after the answer", before[call + 2].opcode, after[at + 4].opcode)
                    }
                    assertEquals("$name: ${key(method)} hooks", calls.size, after.count { it.call?.toString() == hook })
                }
                handlers.flatMap { it.methods }.filter { flagCalls(it, config).isNotEmpty() }
                    .forEach { assertAnswers(it, LONG_PRESS, setOf(speedUp)) }
                listeners.flatMap { it.methods }.filter { flagCalls(it, config).isNotEmpty() }
                    .forEach { assertAnswers(it, RELEASE, setOf(speedUp, release)) }
                assertAnswers(checks.single(), SPEED_UP, setOf(speedUp, release))

                // Each handler loads its log name once, only past the flag, and the hold starts right after.
                for (handler in handlers) {
                    val loading = handler.methods.filter { speedUpLoads(it).isNotEmpty() }
                    assertEquals("$name: ${handler.type}'s methods loading \"$SPEED_UP_LOG\"", 1, loading.size)
                    val method = loading.single()
                    val load = speedUpLoads(method).single()
                    val flag = flagCalls(method, config).filterValues { it == speedUp }.keys.filter { answerTakenAt(method, it) != null }
                    assertTrue("$name: ${key(method)} loads \"$SPEED_UP_LOG\" before it takes the speed-up flag's answer",
                        flag.isNotEmpty() && flag.all { it < load })
                    val before = method.code()
                    val after = patched(method)
                    val at = speedUpLoads(context.mutableClassDefBy(method.definingClass).methods.single { key(it) == key(method) }).single()
                    assertEquals("$name: ${key(method)} after its \"$SPEED_UP_LOG\" load", HELD, after[at + 1].call.toString())
                    assertEquals("$name: ${key(method)} hands the hold a register", emptyList<Int>(), after[at + 1].registers())
                    assertEquals("$name: ${key(method)} lost what came after the load", before[load + 1].opcode, after[at + 2].opcode)
                    assertEquals("$name: ${key(method)} holds", 1, after.count { it.call?.toString() == HELD })
                }

                val edgeBefore = edge.code()
                val edgeAfter = patched(edge)
                val returns = edgeAfter.withIndex().filter { it.value.opcode == Opcode.RETURN }
                assertEquals("$name: the edge check's returns", edgeBefore.count { it.opcode == Opcode.RETURN }, returns.size)
                for ((index, instruction) in returns) {
                    val register = (instruction as OneRegisterInstruction).registerA
                    assertEquals("$name: before the edge check's return at $index", ANYWHERE, edgeAfter[index - 2].call.toString())
                    assertEquals("$name: the register the edge check hands over", listOf(register), edgeAfter[index - 2].registers())
                    assertEquals("$name: the edge check takes the answer back", register,
                        (edgeAfter[index - 1] as OneRegisterInstruction).registerA)
                }

                val speedBefore = holdSpeed.code()
                val speedAfter = patched(holdSpeed)
                val wideReturns = speedAfter.withIndex().filter { it.value.opcode == Opcode.RETURN_WIDE }
                assertEquals("$name: $speedRead's returns", speedBefore.count { it.opcode == Opcode.RETURN_WIDE }, wideReturns.size)
                for ((index, instruction) in wideReturns) {
                    val register = (instruction as OneRegisterInstruction).registerA
                    assertEquals("$name: before the hold speed's return at $index", HOLD_SPEED, speedAfter[index - 2].call.toString())
                    assertEquals("$name: the register pair the hold speed hands over", listOf(register, register + 1),
                        speedAfter[index - 2].registers())
                    assertEquals("$name: the hold speed takes the answer back", Opcode.MOVE_RESULT_WIDE, speedAfter[index - 1].opcode)
                    assertEquals("$name: the hold speed's answer register", register, (speedAfter[index - 1] as OneRegisterInstruction).registerA)
                }
                val setterAfter = patched(setter)
                val self = setter.localRegisterCount()
                assertEquals("$name: the speed setter's first call", SPEED_SET, setterAfter[0].call.toString())
                assertEquals("$name: the player and speed the setter hands over", listOf(self, self + 1), setterAfter[0].registers())
                assertEquals("$name: the setter takes the speed back", Opcode.MOVE_RESULT, setterAfter[1].opcode)
                assertEquals("$name: the register the setter's speed comes back to", self + 1,
                    (setterAfter[1] as OneRegisterInstruction).registerA)
                assertEquals("$name: the setter lost its own first instruction", setter.code()[0].opcode, setterAfter[2].opcode)

                val stubMethod = context.mutableClassDefBy(REEL_HOLD).methods.single { it.name == PLAYER_SPEED_STUB }
                val stub = stubMethod.code()
                assertEquals("$name: the speed stub's cast", player.type, ((stub[0] as ReferenceInstruction).reference as TypeReference).type)
                assertEquals("$name: the speed stub's call", key(speedGetter), stub[1].call.toString())
                assertEquals("$name: the speed stub's register", listOf(stubMethod.localRegisterCount()), stub[1].registers())
                assertEquals("$name: the speed stub's answer", Opcode.RETURN, stub[3].opcode)

                val dispatch = activity.methods.single { it.name == "dispatchTouchEvent" && it.implementation != null }
                val first = patched(dispatch)[0]
                assertEquals("$name: the touch dispatch's first call", TOUCH, first.call.toString())
                assertEquals("$name: the event the dispatch hands over", listOf(dispatch.localRegisterCount() + 1), first.registers())

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "reelHold" }
                assertEquals("$name: SettingsStatus.reelHold() isn't switched on", 1,
                    (status.code()[0] as NarrowLiteralInstruction).narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }
}
