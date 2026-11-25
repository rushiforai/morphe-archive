package dev.materialtidal.player

import java.io.File
import java.net.URLClassLoader
import kotlin.math.abs

fun main(args: Array<String>) {
    require(args.isNotEmpty()) { "Usage: VerifyTabletPlayerLayoutKt <extensionsTidalClassesDir>" }
    val classesDir = File(args[0])
    require(classesDir.isDirectory) { "Missing compiled extension classes dir: $classesDir" }

    val loader = URLClassLoader(arrayOf(classesDir.toURI().toURL()), object {}.javaClass.classLoader)

    testResolveLayoutMode(loader)
    testDesktopLandscapeGeometry(loader)
    testTabletPortraitMetrics(loader)
    testAudioSpecAndDurationFormatting(loader)

    println("ALL TABLET PLAYER LAYOUT TESTS PASSED.")
}

private fun testResolveLayoutMode(loader: ClassLoader) {
    val solverCls = loader.loadClass("dev.materialtidal.extension.tidal.player.PlayerDesktopLayoutSolver")
    val resolveMethod = solverCls.getMethod(
        "resolveLayoutMode",
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Boolean::class.javaPrimitiveType,
    )

    val phoneMode = 0
    val desktopMode = 1
    val tabletPortraitMode = 2

    check(resolveMethod.invoke(null, 412f, 915f, true) == phoneMode) { "Expected phone portrait for 412x915" }
    check(resolveMethod.invoke(null, 580f, 900f, true) == phoneMode) { "Expected phone portrait for 580x900" }
    check(resolveMethod.invoke(null, 1280f, 800f, false) == phoneMode) { "Expected phone fallback when disabled" }
    check(resolveMethod.invoke(null, 800f, 1280f, false) == phoneMode) { "Expected phone fallback when disabled" }

    check(resolveMethod.invoke(null, 600f, 960f, true) == tabletPortraitMode) { "Expected tablet portrait for 600x960" }
    check(resolveMethod.invoke(null, 768f, 1024f, true) == tabletPortraitMode) { "Expected tablet portrait for 768x1024" }
    check(resolveMethod.invoke(null, 800f, 1280f, true) == tabletPortraitMode) { "Expected tablet portrait for 800x1280" }
    check(resolveMethod.invoke(null, 840f, 1180f, true) == tabletPortraitMode) { "Expected tablet portrait for 840x1180" }

    check(resolveMethod.invoke(null, 600f, 420f, true) == desktopMode) { "Expected desktop landscape for 600x420" }
    check(resolveMethod.invoke(null, 915f, 412f, true) == desktopMode) { "Expected desktop landscape for 915x412" }
    check(resolveMethod.invoke(null, 840f, 700f, true) == desktopMode) { "Expected desktop landscape for 840x700" }
    check(resolveMethod.invoke(null, 960f, 600f, true) == desktopMode) { "Expected desktop landscape for 960x600" }
    check(resolveMethod.invoke(null, 1024f, 640f, true) == desktopMode) { "Expected desktop landscape for 1024x640" }
    check(resolveMethod.invoke(null, 1280f, 800f, true) == desktopMode) { "Expected desktop landscape for 1280x800" }
    check(resolveMethod.invoke(null, 1600f, 900f, true) == desktopMode) { "Expected desktop landscape for 1600x900" }
}

private data class BoxBounds(val left: Float, val top: Float, val right: Float, val bottom: Float) {
    val width: Float get() = right - left
    val height: Float get() = bottom - top
    val centerX: Float get() = (left + right) * 0.5f
    val isEmpty: Boolean get() = right <= left || bottom <= top
}

private fun readBox(resultObj: Any, fieldName: String): BoxBounds {
    val rectObj = resultObj.javaClass.getField(fieldName).get(resultObj)
    val cls = rectObj.javaClass
    return BoxBounds(
        cls.getField("left").getFloat(rectObj),
        cls.getField("top").getFloat(rectObj),
        cls.getField("right").getFloat(rectObj),
        cls.getField("bottom").getFloat(rectObj),
    )
}

private fun overlaps(a: BoxBounds, b: BoxBounds): Boolean {
    if (a.isEmpty || b.isEmpty) return false
    val eps = 0.25f
    return a.left < b.right - eps && a.right > b.left + eps &&
        a.top < b.bottom - eps && a.bottom > b.top + eps
}

private fun testDesktopLandscapeGeometry(loader: ClassLoader) {
    val solverCls = loader.loadClass("dev.materialtidal.extension.tidal.player.PlayerDesktopLayoutSolver")
    val resultCls = loader.loadClass("dev.materialtidal.extension.tidal.player.PlayerDesktopLayoutSolver\$DesktopLayoutResult")
    val rectCls = loader.loadClass("dev.materialtidal.extension.tidal.player.PlayerDesktopLayoutSolver\$RectBox")
    val computeMethod = solverCls.getMethod(
        "computeDesktopLandscape",
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Boolean::class.javaPrimitiveType,
        Boolean::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        resultCls,
    )

    data class ViewportCase(
        val wDp: Float,
        val hDp: Float,
        val density: Float,
        val inL: Float,
        val inT: Float,
        val inR: Float,
        val inB: Float,
    )

    val viewports = listOf(
        ViewportCase(600f, 420f, 2.0f, 0f, 0f, 0f, 0f),
        ViewportCase(600f, 420f, 2.0f, 36f, 20f, 36f, 16f),
        ViewportCase(840f, 700f, 2.0f, 0f, 24f, 0f, 16f),
        ViewportCase(915f, 412f, 2.625f, 42f, 24f, 18f, 16f),
        ViewportCase(960f, 600f, 2.0f, 0f, 24f, 0f, 16f),
        ViewportCase(1024f, 640f, 2.0f, 0f, 24f, 0f, 20f),
        ViewportCase(1280f, 800f, 2.0f, 0f, 28f, 0f, 24f),
        ViewportCase(1480f, 920f, 2.5f, 24f, 32f, 24f, 24f),
        ViewportCase(1600f, 900f, 1.5f, 0f, 0f, 0f, 0f),
        ViewportCase(1920f, 1080f, 1.0f, 0f, 0f, 0f, 0f),
    )

    val allBoxFields = resultCls.fields.filter { it.type == rectCls }.map { it.name }

    for (vp in viewports) {
        val d = vp.density
        val w = vp.wDp * d
        val h = vp.hDp * d
        val iL = vp.inL * d
        val iT = vp.inT * d
        val iR = vp.inR * d
        val iB = vp.inB * d

        for (panelReveal in listOf(0f, 0.5f, 1f)) {
            for (showLyrics in listOf(true, false)) {
                for (hasSource in listOf(true, false)) {
                    val out = resultCls.getDeclaredConstructor().newInstance()
                    computeMethod.invoke(
                        null,
                        w, h, d, iL, iT, iR, iB,
                        panelReveal, showLyrics, hasSource,
                        160f * d, 180f * d, 94f * d,
                        out,
                    )

                    val tag = "${vp.wDp}x${vp.hDp} rev=$panelReveal lyr=$showLyrics src=$hasSource"

                    // 1. Safe viewport bounds for every non-empty box
                    for (name in allBoxFields) {
                        val b = readBox(out, name)
                        if (b.isEmpty) continue
                        check(b.left >= iL - 0.5f && b.right <= w - iR + 0.5f &&
                            b.top >= iT - 0.5f && b.bottom <= h - iB + 0.5f) {
                            "[$tag] Box $name out of safe bounds: $b (safe=[$iL..${w - iR}, $iT..${h - iB}])"
                        }
                    }

                    val collapse = readBox(out, "collapseBox")
                    val sourceChip = readBox(out, "sourceChipBox")
                    val panelToggle = readBox(out, "panelToggleBox")
                    val more = readBox(out, "moreBox")
                    val cover = readBox(out, "coverBox")
                    val panel = readBox(out, "panelBox")
                    val panelHeader = readBox(out, "panelHeaderBox")
                    val tabQueue = readBox(out, "tabQueueBox")
                    val tabLyrics = readBox(out, "tabLyricsBox")
                    val openFullQueue = readBox(out, "openFullQueueBox")
                    val panelBody = readBox(out, "panelBodyBox")
                    val dock = readBox(out, "dockBox")
                    val titleArea = readBox(out, "titleAreaBox")
                    val favorite = readBox(out, "favoriteBox")
                    val shuffle = readBox(out, "shuffleBox")
                    val prev = readBox(out, "prevBox")
                    val play = readBox(out, "playBox")
                    val next = readBox(out, "nextBox")
                    val repeat = readBox(out, "repeatBox")
                    val elapsed = readBox(out, "elapsedTimeBox")
                    val seek = readBox(out, "seekBarTrackBox")
                    val duration = readBox(out, "durationTimeBox")
                    val badge = readBox(out, "badgeBox")
                    val lyricsBtn = readBox(out, "lyricsBtnBox")
                    val queueBtn = readBox(out, "queueBtnBox")
                    val castBtn = readBox(out, "castBtnBox")
                    val volIcon = readBox(out, "volumeIconBox")
                    val volSlider = readBox(out, "volumeSliderBox")

                    // 2. Hero cover square & centered when panel closed
                    check(abs(cover.width - cover.height) < 0.5f) { "[$tag] Cover not square: $cover" }
                    check(cover.width >= 80f * d) { "[$tag] Cover too small: $cover" }
                    if (panelReveal == 0f && abs(iL - iR) < 0.1f) {
                        check(abs(cover.centerX - w * 0.5f) < 1.0f) {
                            "[$tag] Cover not centered when panel closed: cx=${cover.centerX}, w/2=${w * 0.5f}"
                        }
                    }

                    // 3. Header controls non-overlapping
                    val headerItems = listOf(collapse, sourceChip, panelToggle, more).filter { !it.isEmpty }
                    for (i in headerItems.indices) {
                        for (j in i + 1 until headerItems.size) {
                            check(!overlaps(headerItems[i], headerItems[j])) {
                                "[$tag] Header overlap between $i and $j"
                            }
                        }
                    }

                    // 4. Stage below header and above dock
                    check(cover.top >= collapse.bottom - 0.5f && cover.bottom <= dock.top + 0.5f) {
                        "[$tag] Cover vertical overlap with header/dock"
                    }
                    check(panel.top >= collapse.bottom - 0.5f && panel.bottom <= dock.top + 0.5f) {
                        "[$tag] Panel vertical overlap with header/dock"
                    }
                    if (panelReveal > 0.99f) {
                        check(!overlaps(cover, panel)) { "[$tag] Cover overlaps panel when open: cover=$cover panel=$panel" }
                    }

                    // 5. Panel internal geometry
                    check(!overlaps(panelHeader, panelBody)) { "[$tag] Panel header overlaps body" }
                    val panelHeaderItems = listOf(tabQueue, tabLyrics, openFullQueue)
                    for (i in panelHeaderItems.indices) {
                        for (j in i + 1 until panelHeaderItems.size) {
                            check(!overlaps(panelHeaderItems[i], panelHeaderItems[j])) {
                                "[$tag] Panel header control overlap between $i and $j"
                            }
                        }
                    }

                    // 6. Dock 3-zone geometry (zero overlaps)
                    check(!overlaps(titleArea, favorite)) { "[$tag] Dock title overlaps favorite" }
                    check(favorite.right <= shuffle.left + 0.5f) { "[$tag] Left zone crosses into center zone" }

                    val centerUpper = listOf(shuffle, prev, play, next, repeat)
                    for (i in centerUpper.indices) {
                        for (j in i + 1 until centerUpper.size) {
                            check(!overlaps(centerUpper[i], centerUpper[j])) {
                                "[$tag] Transport overlap between $i and $j"
                            }
                        }
                    }
                    check(elapsed.right <= seek.left + 0.5f && seek.right <= duration.left + 0.5f) {
                        "[$tag] Seek row ordering broken: elapsed=$elapsed seek=$seek dur=$duration"
                    }
                    check(play.bottom <= seek.top + 0.5f) { "[$tag] Transport overlaps seek row" }

                    val rightUpper = listOf(lyricsBtn, queueBtn, castBtn, volIcon, volSlider).filter { !it.isEmpty }
                    for (i in rightUpper.indices) {
                        check(rightUpper[i].left >= repeat.right - 0.5f) {
                            "[$tag] Right zone upper item $i crosses into center zone"
                        }
                        if (!badge.isEmpty) {
                            check(!overlaps(rightUpper[i], badge)) {
                                "[$tag] Right zone upper item $i overlaps quality badge"
                            }
                        }
                        for (j in i + 1 until rightUpper.size) {
                            check(!overlaps(rightUpper[i], rightUpper[j])) {
                                "[$tag] Right zone upper overlap between $i and $j"
                            }
                        }
                    }
                    if (!badge.isEmpty) {
                        check(badge.left >= duration.right - 0.5f) { "[$tag] Quality badge overlaps duration time" }
                    }

                    // 7. Minimum comfortable touch sizes
                    check(collapse.height >= 36f * d) { "[$tag] Collapse button too small: $collapse" }
                    check(play.width >= 44f * d && play.height >= 34f * d) { "[$tag] Play button too small: $play" }
                }
            }
        }
    }
}

private fun testTabletPortraitMetrics(loader: ClassLoader) {
    val solverCls = loader.loadClass("dev.materialtidal.extension.tidal.player.PlayerDesktopLayoutSolver")
    val metricsCls = loader.loadClass("dev.materialtidal.extension.tidal.player.PlayerDesktopLayoutSolver\$TabletPortraitMetrics")
    val method = solverCls.getMethod(
        "computeTabletPortraitMetrics",
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        Float::class.javaPrimitiveType,
        metricsCls,
    )

    val cases = listOf(
        Triple(600f, 960f, 2.0f),
        Triple(768f, 1024f, 2.0f),
        Triple(800f, 1280f, 2.0f),
        Triple(900f, 1400f, 2.5f),
    )

    for ((wDp, hDp, d) in cases) {
        val m = metricsCls.getDeclaredConstructor().newInstance()
        method.invoke(null, wDp * d, hDp * d, d, 0f, 24f * d, 0f, 18f * d, m)
        val hL = metricsCls.getField("headerLeft").getFloat(m)
        val hR = metricsCls.getField("headerRight").getFloat(m)
        val cL = metricsCls.getField("contentLeft").getFloat(m)
        val cR = metricsCls.getField("contentRight").getFloat(m)
        val capL = metricsCls.getField("capsuleLeft").getFloat(m)
        val capR = metricsCls.getField("capsuleRight").getFloat(m)
        val maxCover = metricsCls.getField("maxCoverSize").getFloat(m)
        val lyrL = metricsCls.getField("lyricsColLeft").getFloat(m)
        val lyrR = metricsCls.getField("lyricsColRight").getFloat(m)

        check(hL >= 0f && hR <= wDp * d && (hR - hL) <= 720f * d + 0.5f) { "Header bounds failed for $wDp" }
        check((cR - cL) <= 540f * d + 0.5f && cL >= hL - 0.5f && cR <= hR + 0.5f) { "Content bounds failed for $wDp" }
        check((capR - capL) <= 440f * d + 0.5f) { "Capsule width cap failed for $wDp" }
        check(maxCover <= 440f * d + 0.5f) { "Cover max cap failed for $wDp" }
        check((lyrR - lyrL) <= 620f * d + 0.5f) { "Lyrics column cap failed for $wDp" }
    }
}

private fun testAudioSpecAndDurationFormatting(loader: ClassLoader) {
    val solverCls = loader.loadClass("dev.materialtidal.extension.tidal.player.PlayerDesktopLayoutSolver")
    val fmtSpec = solverCls.getMethod("formatAudioStreamSpec", String::class.java)
    val fmtDur = solverCls.getMethod("formatDurationSec", Int::class.javaPrimitiveType)

    check(fmtSpec.invoke(null, "24|192000|flac") == "24-BIT · 192 kHz FLAC")
    check(fmtSpec.invoke(null, "16|44100|flac") == "16-BIT · 44.1 kHz FLAC")
    check(fmtSpec.invoke(null, "|48000|aac") == "48 kHz AAC")
    check(fmtSpec.invoke(null, "null|null|null") == "")
    check(fmtSpec.invoke(null, "") == "")
    check(fmtSpec.invoke(null, null) == "")

    check(fmtDur.invoke(null, 0) == "0:00")
    check(fmtDur.invoke(null, -5) == "0:00")
    check(fmtDur.invoke(null, 65) == "1:05")
    check(fmtDur.invoke(null, 3661) == "1:01:01")
}
