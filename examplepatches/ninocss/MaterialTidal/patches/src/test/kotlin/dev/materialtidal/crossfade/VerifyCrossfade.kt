package dev.materialtidal.crossfade

import java.io.File
import java.net.URLClassLoader
import kotlin.math.abs

fun main(args: Array<String>) {
    require(args.isNotEmpty()) { "Usage: VerifyCrossfadeKt <extensionsTidalClassesDir>" }
    val classesDir = File(args[0])
    require(classesDir.isDirectory) { "Missing compiled extension classes dir: $classesDir" }

    val loader = URLClassLoader(arrayOf(classesDir.toURI().toURL()), object {}.javaClass.classLoader)

    testCurveBoundariesAndOutOfBounds(loader)
    testEqualPowerConstantLoudness(loader)
    testStrengthShapingOrdering(loader)
    testStrictMonotonicityAllCurves(loader)
    testTargetVolumeScalingAndClamping(loader)
    testGaplessAlbumSuppressionState(loader)
    testCopyAndBadgeHelpers(loader)

    println("ALL CROSSFADE UNIT TESTS PASSED.")
}

private fun testCurveBoundariesAndOutOfBounds(loader: ClassLoader) {
    val engineCls = loader.loadClass("dev.materialtidal.extension.tidal.crossfade.CrossfadeEngine")
    val outMethod = engineCls.getMethod(
        "computeFadeOutGain",
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
    )
    val inMethod = engineCls.getMethod(
        "computeFadeInGain",
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
    )

    for (curve in 0..3) {
        for (strength in listOf(0, 25, 50, 75, 100)) {
            val out0 = outMethod.invoke(null, 0f, 1f, curve, strength) as Float
            val out1 = outMethod.invoke(null, 1f, 1f, curve, strength) as Float
            val in0 = inMethod.invoke(null, 0f, 1f, curve, strength) as Float
            val in1 = inMethod.invoke(null, 1f, 1f, curve, strength) as Float

            check(abs(out0 - 1f) < 1e-5f) { "Expected out(0)=1 for curve=$curve strength=$strength, got $out0" }
            check(abs(out1 - 0f) < 1e-5f) { "Expected out(1)=0 for curve=$curve strength=$strength, got $out1" }
            check(abs(in0 - 0f) < 1e-5f) { "Expected in(0)=0 for curve=$curve strength=$strength, got $in0" }
            check(abs(in1 - 1f) < 1e-5f) { "Expected in(1)=1 for curve=$curve strength=$strength, got $in1" }

            // Out-of-range progress (-0.5f, 1.5f, NaN)
            val outNeg = outMethod.invoke(null, -0.5f, 1f, curve, strength) as Float
            val outOver = outMethod.invoke(null, 1.5f, 1f, curve, strength) as Float
            val outNan = outMethod.invoke(null, Float.NaN, 1f, curve, strength) as Float
            val inNeg = inMethod.invoke(null, -0.5f, 1f, curve, strength) as Float
            val inOver = inMethod.invoke(null, 1.5f, 1f, curve, strength) as Float
            val inNan = inMethod.invoke(null, Float.NaN, 1f, curve, strength) as Float

            check(abs(outNeg - 1f) < 1e-5f) { "Expected out(-0.5)=1, got $outNeg" }
            check(abs(outOver - 0f) < 1e-5f) { "Expected out(1.5)=0, got $outOver" }
            check(abs(outNan - 1f) < 1e-5f) { "Expected out(NaN)=1, got $outNan" }
            check(abs(inNeg - 0f) < 1e-5f) { "Expected in(-0.5)=0, got $inNeg" }
            check(abs(inOver - 1f) < 1e-5f) { "Expected in(1.5)=1, got $inOver" }
            check(abs(inNan - 0f) < 1e-5f) { "Expected in(NaN)=0, got $inNan" }
        }
    }
}

private fun testEqualPowerConstantLoudness(loader: ClassLoader) {
    val engineCls = loader.loadClass("dev.materialtidal.extension.tidal.crossfade.CrossfadeEngine")
    val outMethod = engineCls.getMethod(
        "computeFadeOutGain",
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
    )
    val inMethod = engineCls.getMethod(
        "computeFadeInGain",
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
    )

    for (step in 0..20) {
        val t = step / 20f
        val gOut = outMethod.invoke(null, t, 1f, 0, 50) as Float
        val gIn = inMethod.invoke(null, t, 1f, 0, 50) as Float
        val powerSum = gOut * gOut + gIn * gIn
        check(abs(powerSum - 1f) < 1e-3f) {
            "Expected Equal Power out^2 + in^2 ≈ 1.0 at t=$t, got $powerSum (out=$gOut, in=$gIn)"
        }
    }
}

private fun testStrengthShapingOrdering(loader: ClassLoader) {
    val engineCls = loader.loadClass("dev.materialtidal.extension.tidal.crossfade.CrossfadeEngine")
    val outMethod = engineCls.getMethod(
        "computeFadeOutGain",
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
    )
    val inMethod = engineCls.getMethod(
        "computeFadeInGain",
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
    )

    for (curve in listOf(0, 1, 2)) {
        val outSoft = outMethod.invoke(null, 0.5f, 1f, curve, 0) as Float
        val outMid = outMethod.invoke(null, 0.5f, 1f, curve, 50) as Float
        val outStrong = outMethod.invoke(null, 0.5f, 1f, curve, 100) as Float
        check(outSoft < outMid && outMid < outStrong) {
            "Expected out(0%) < out(50%) < out(100%) at t=0.5 for curve=$curve, got $outSoft / $outMid / $outStrong"
        }

        val inSoft = inMethod.invoke(null, 0.5f, 1f, curve, 0) as Float
        val inMid = inMethod.invoke(null, 0.5f, 1f, curve, 50) as Float
        val inStrong = inMethod.invoke(null, 0.5f, 1f, curve, 100) as Float
        check(inSoft < inMid && inMid < inStrong) {
            "Expected in(0%) < in(50%) < in(100%) at t=0.5 for curve=$curve, got $inSoft / $inMid / $inStrong"
        }
    }
}

private fun testStrictMonotonicityAllCurves(loader: ClassLoader) {
    val engineCls = loader.loadClass("dev.materialtidal.extension.tidal.crossfade.CrossfadeEngine")
    val outMethod = engineCls.getMethod(
        "computeFadeOutGain",
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
    )
    val inMethod = engineCls.getMethod(
        "computeFadeInGain",
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
    )

    for (curve in 0..3) {
        for (strength in listOf(0, 25, 50, 75, 100)) {
            var prevOut = 1f
            var prevIn = 0f
            for (step in 0..100) {
                val t = step / 100f
                val curOut = outMethod.invoke(null, t, 1f, curve, strength) as Float
                val curIn = inMethod.invoke(null, t, 1f, curve, strength) as Float
                check(curOut <= prevOut + 1e-5f) {
                    "Non-monotonic fadeOut at curve=$curve strength=$strength t=$t: $curOut > $prevOut"
                }
                check(curIn >= prevIn - 1e-5f) {
                    "Non-monotonic fadeIn at curve=$curve strength=$strength t=$t: $curIn < $prevIn"
                }
                prevOut = curOut
                prevIn = curIn
            }
        }
    }
}

private fun testTargetVolumeScalingAndClamping(loader: ClassLoader) {
    val engineCls = loader.loadClass("dev.materialtidal.extension.tidal.crossfade.CrossfadeEngine")
    val outMethod = engineCls.getMethod(
        "computeFadeOutGain",
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
        Int::class.javaPrimitiveType,
    )

    val gFull = outMethod.invoke(null, 0.35f, 1.0f, 0, 50) as Float
    val gScaled = outMethod.invoke(null, 0.35f, 0.6f, 0, 50) as Float
    val gClampedHigh = outMethod.invoke(null, 0.35f, 1.45f, 0, 50) as Float
    val gClampedLow = outMethod.invoke(null, 0.35f, -0.3f, 0, 50) as Float

    check(abs(gScaled - gFull * 0.6f) < 1e-5f) { "Expected ReplayGain scaling 0.6x, got $gScaled vs ${gFull * 0.6f}" }
    check(abs(gClampedHigh - gFull) < 1e-5f) { "Expected targetVolume > 1.0 to clamp to 1.0, got $gClampedHigh vs $gFull" }
    check(abs(gClampedLow - 0f) < 1e-5f) { "Expected negative targetVolume to clamp to 0.0, got $gClampedLow" }
}

private fun testGaplessAlbumSuppressionState(loader: ClassLoader) {
    val engineCls = loader.loadClass("dev.materialtidal.extension.tidal.crossfade.CrossfadeEngine")
    val prefsCls = loader.loadClass("dev.materialtidal.extension.tidal.crossfade.CrossfadePrefs")
    val setSameAlbum = engineCls.getMethod("setSameAlbumNextTrackId", String::class.java)
    val shouldSkip = engineCls.getMethod("shouldSkipForGaplessAlbum", String::class.java)
    val setPreserve = prefsCls.getMethod("setPreserveGaplessAlbums", Boolean::class.javaPrimitiveType)

    setSameAlbum.invoke(null, "987654")
    setPreserve.invoke(null, false)
    check(!(shouldSkip.invoke(null, "987654") as Boolean)) {
        "Expected shouldSkipForGaplessAlbum=false when preserveGaplessAlbums is disabled"
    }

    setPreserve.invoke(null, true)
    check(shouldSkip.invoke(null, "987654") as Boolean) {
        "Expected shouldSkipForGaplessAlbum=true for matching consecutive album track ID"
    }
    check(!(shouldSkip.invoke(null, "111222") as Boolean)) {
        "Expected shouldSkipForGaplessAlbum=false for different track ID"
    }
    check(!(shouldSkip.invoke(null, null as String?) as Boolean)) {
        "Expected shouldSkipForGaplessAlbum=false for null track ID"
    }

    setSameAlbum.invoke(null, null as String?)
    setPreserve.invoke(null, false)
}

private fun testCopyAndBadgeHelpers(loader: ClassLoader) {
    val engineCls = loader.loadClass("dev.materialtidal.extension.tidal.crossfade.CrossfadeEngine")
    val getBadge = engineCls.getMethod("getDurationBadgeText", Int::class.javaPrimitiveType)
    val getMenuTitle = engineCls.getMethod("getPlayerContextMenuTitle", Int::class.javaPrimitiveType)

    val badge5 = getBadge.invoke(null, 5) as String
    val badge0 = getBadge.invoke(null, 0) as String
    val menu6 = getMenuTitle.invoke(null, 6) as String

    check(badge5 == "5 s") { "Expected '5 s', got '$badge5'" }
    check(badge0 == "Aus" || badge0 == "Off") { "Expected 'Aus' or 'Off', got '$badge0'" }
    check(menu6 == "Crossfade · 6 s") { "Expected 'Crossfade · 6 s', got '$menu6'" }
}
