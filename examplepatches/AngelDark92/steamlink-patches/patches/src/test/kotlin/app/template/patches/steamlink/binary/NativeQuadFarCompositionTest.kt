package app.template.patches.steamlink.binary

import app.template.patches.shared.Constants.isLegacyXrFoundationSteamLinkBuild
import org.junit.Assume.assumeTrue
import java.io.File
import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * Real-input composition of the far-plane scene replacement with the other native scene patches, on the
 * single exact 2.0.20/5001712 base, using the production helpers (no synthetic substitutes). The decoded
 * library is not a tracked input: when absent the test is skipped, which is not compatibility proof.
 */
class NativeQuadFarCompositionTest {
    private class Step(val name: String, val apply: (ByteArray) -> ByteArray)

    private val bases = listOf("2.0.20" to "5001712")

    private fun sha(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    private fun withDecoded(action: (String, String, ByteArray) -> Unit) {
        val working = File(System.getProperty("user.dir")).canonicalFile
        val root = generateSequence(working) { it.parentFile }.firstOrNull { File(it, "patches/src/main/kotlin").isDirectory }
        assumeTrue("BLOCKED: repository workspace not found", root != null)
        // The exact decoded libraries live in the repository workspace or in the external build root.
        val lib = "lib/arm64-v8a/libvrlink_scene.so"
        fun candidates(v: String, c: String) = listOf(
            File(root, "decoded-apk-android-steamlinkvr-release-base-$v-$c/$lib"),
            File(root, "android-steamlinkvr-release-base-$v-$c/$lib"),
            File(root, "../builds/steamlink-patches/build/adapt-5002527-render/tree/steamlink-patches/" +
                "android-steamlinkvr-release-base-$v-$c/$lib").canonicalFile,
        )
        val inputs = bases.map { (v, c) -> Triple(v, c, candidates(v, c).firstOrNull { it.isFile }) }
        val missing = inputs.filter { it.third == null }.map { it.second }
        assumeTrue("BLOCKED: decoded scene libraries absent: $missing", missing.isEmpty())
        inputs.forEach { (v, c, found) ->
            val f = found!!
            val before = f.readBytes()
            assertEquals(NATIVE_QUAD_FAR_LAYOUTS.getValue(c).size, before.size, "present decoded input $c has the wrong size")
            action(v, c, before)
            assertEquals(sha(before), sha(f.readBytes()), "decoded input $c changed")
        }
    }

    /** Production helpers of every other patch that edits libvrlink_scene.so for this exact base. */
    private fun steps(v: String, c: String): List<Step> = buildList {
        add(Step("visual-delay-250") { patchVisualDelay(it, 250L, v, c) })
        VideoOutputPrecision.entries.forEach { p -> add(Step("oled-format-$p") { b -> setProjectionSwapchainFormat(b, p, v, c) }) }
        if (isLegacyXrFoundationSteamLinkBuild(v, c)) {
            add(Step("hmd-init-gates") { patchHmdInitializationGates(it, v, c) })
            add(Step("lobby-permission-gate") { patchLobbyPermissionStateGate(it, v, c) })
            add(Step("stream-xr-gates") { patchStreamXrGates(it, v, c) })
            add(Step("native-permission-names") { patchNativePermissionNames(it, v, c) })
        }
        if (isNetworkOptimizationsTarget("com.valvesoftware.steamlinkvr", v, c)) {
            add(Step("network-optimizations") { applyNetworkOptimizationsScene(it, v, c) })
        }
        add(Step("dither-on") { setDitherState(it, true) })
        add(Step("microphone-preset") { patchNativeMicrophonePreset(it, "unprocessed", v, c) })
        FoveaMode.entries.forEach { m ->
            add(Step("vd-sdr-fovea-$m") { applyVdSdrFovea(it, v, c, m) })
            add(Step("blue-noise-fovea-$m") { applyFovealBlueNoise(it, v, c, m).scene })
            add(Step("blue-noise-background-$m") { applyBlueNoiseLayer(it, v, c, m, BlueNoiseLayer.BACKGROUND).scene })
        }
    }

    private fun changed(a: ByteArray, b: ByteArray): List<Int> {
        assertEquals(a.size, b.size)
        return a.indices.filter { a[it] != b[it] }
    }

    private fun owned(c: String): List<IntRange> =
        NATIVE_QUAD_FAR_LAYOUTS.getValue(c).sites.map { it.offset until it.offset + it.length }

    @Test
    fun farPlaneChangesOnlyOwnedSitesOnTheExactBase() = withDecoded { _, c, stock ->
        val v = NATIVE_QUAD_FAR_LAYOUTS.getValue(c).versionName
        val ours = applyNativeQuadFarPlaneScene(stock, v, c)
        assertTrue(isNativeQuadFarPlanePatched(ours, c))
        assertContentEquals(ours, applyNativeQuadFarPlaneScene(ours, v, c), "idempotent $c")
        val ranges = owned(c)
        changed(stock, ours).forEach { i -> assertTrue(ranges.any { i in it }, "unowned byte $i changed on $c") }
    }

    @Test
    fun otherPatchesNeverTouchOwnedSitesAndOwnedSitesNeverBreakThem() = withDecoded { v, c, stock ->
        val ranges = owned(c)
        val ours = applyNativeQuadFarPlaneScene(stock, v, c)
        val steps = steps(v, c)
        assertTrue(steps.any { it.name == "visual-delay-250" }, "Visual Delay must stay applicable on $c")
        assertTrue(steps.count { it.name.startsWith("oled-format") } == 3, "OLED formats must stay applicable on $c")
        steps.forEach { step ->
            val other = step.apply(stock)
            changed(stock, other).forEach { i -> assertTrue(ranges.none { r -> i in r }, "${step.name} writes owned byte $i on $c") }
            // both orders reach identical bytes
            val ourThenOther = step.apply(ours)
            val otherThenOurs = applyNativeQuadFarPlaneScene(other, v, c)
            assertContentEquals(ourThenOther, otherThenOurs, "${step.name} order on $c")
            // the other patch is idempotent on our output
            assertContentEquals(ourThenOther, step.apply(ourThenOther), "${step.name} idempotent on $c")
        }
        // Regression: the bypassed underside format/context is still owned by OLED.
        // Switching precision on an already native-patched image must work in every order.
        VideoOutputPrecision.entries.forEach { from ->
            VideoOutputPrecision.entries.forEach { to ->
                val transitioned = setProjectionSwapchainFormat(
                    setProjectionSwapchainFormat(ours, from, v, c), to, v, c,
                )
                val expected = applyNativeQuadFarPlaneScene(setProjectionSwapchainFormat(stock, to, v, c), v, c)
                assertContentEquals(expected, transitioned, "OLED $from->$to with far plane on $c")
            }
        }
    }

    @Test
    fun farPlaneComposesWithEveryOtherPatchInAnyPositionOfTheChain() = withDecoded { v, c, stock ->
        // Steps that edit the same video shader (OLED precision variants, blue-noise, VD-SDR fovea) are mutually
        // exclusive with each other by design and are covered one at a time above; the chain keeps one of each
        // independent family so that any rejection can only come from the native quad edits.
        val independent = listOf("visual-delay-250", "oled-format-RGB10_A2_EXPERIMENTAL", "hmd-init-gates",
            "lobby-permission-gate", "stream-xr-gates", "native-permission-names", "network-optimizations",
            "dither-on", "microphone-preset")
        val steps = steps(v, c).filter { it.name in independent }
        assertTrue(steps.size >= 3, "chain too short on $c: ${steps.map { it.name }}")
        val reference = steps.fold(stock) { b, s -> s.apply(b) }.let { applyNativeQuadFarPlaneScene(it, v, c) }
        for (position in 0..steps.size) {
            var b = stock
            steps.forEachIndexed { i, s ->
                if (i == position) b = applyNativeQuadFarPlaneScene(b, v, c)
                b = s.apply(b)
            }
            if (position == steps.size) b = applyNativeQuadFarPlaneScene(b, v, c)
            assertContentEquals(reference, b, "far plane inserted at chain position $position on $c")
        }
        assertEquals(sha(reference), sha(applyNativeQuadFarPlaneScene(reference, v, c)), "idempotent on full chain $c")
    }

    @Test
    fun visualDelayCanonicalOffsetTransitionsWorkOnFarPlaneOutput() = withDecoded { v, c, stock ->
        // Only the independently audited transition layouts accept a changed offset on an already patched
        // library (HmdOnlyPatch.guardedTransitions); the other two bases only support a fresh application.
        val transitions = c in setOf("5001812", "5001968", "5002363", "5002395")
        val offsets = if (transitions) listOf(0L, 250L, 4000L, 7L) else listOf(250L)
        val ours = applyNativeQuadFarPlaneScene(stock, v, c)
        offsets.forEach { from ->
            offsets.filter { transitions || it == from }.forEach { to ->
                val direct = patchVisualDelay(stock, to, v, c)
                val viaOurs = patchVisualDelay(patchVisualDelay(ours, from, v, c), to, v, c)
                assertContentEquals(applyNativeQuadFarPlaneScene(direct, v, c), viaOurs, "delay $from->$to with far plane on $c")
                val oursLast = applyNativeQuadFarPlaneScene(patchVisualDelay(patchVisualDelay(stock, from, v, c), to, v, c), v, c)
                assertContentEquals(viaOurs, oursLast, "far plane last, delay $from->$to on $c")
            }
        }
    }
}
