package lab.minigore.patches

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import java.io.File
import java.security.MessageDigest
import org.w3c.dom.Element

/**
 * Minigore 2 1.28 (28), ARMv7 and x86.
 * The score multiplier can be set from 1 to 1000.
 * ARM values > 255 use the verified Thumb trampoline and a 12-byte code cave.
 * Keeps the original app identifier. Includes Android 17 screen and debug compatibility.
 * Does not modify saved progress or app signing.
 */
private const val PACKAGE_NAME = "net.mountainsheep.minigore2zombies"
private const val ARM_PATH = "lib/armeabi-v7a/libminigore2.so"
private const val X86_PATH = "lib/x86/libminigore2.so"
private const val ARM_SITE = 0xE46EE
private const val ARM_CAVE = 0x20538C
private const val X86_SITE = 0x112AD0

private const val ARM_MASKED_SHA256 =
    "98ca87c7e46334b8bb3dff5fd586c09713830169d641af01f8e5d523d3af832e"
private const val X86_MASKED_SHA256 =
    "29970a58c877e08c4f11973bb562ad6bf13c92f511c9b7a1c7804d947518c061"

private fun String.bytes(): ByteArray =
    chunked(2).map { it.toInt(16).toByte() }.toByteArray()

private fun ByteArray.matchesAt(offset: Int, expected: ByteArray): Boolean =
    offset >= 0 && offset + expected.size <= size &&
        expected.indices.all { this[offset + it] == expected[it] }

private fun ByteArray.maskedHash(vararg ranges: IntRange): String {
    val copy = copyOf()
    ranges.forEach { range ->
        java.util.Arrays.fill(copy, range.first, range.last + 1, 0.toByte())
    }
    return MessageDigest.getInstance("SHA-256").digest(copy)
        .joinToString("") { "%02x".format(it.toInt() and 0xff) }
}

/** Thumb-2 MOVW R2, #unsigned16, validated against clang ARMv7 assembler. */
private fun movwR2(value: Int): ByteArray {
    require(value in 0..65535)
    val first = 0xF240 or (((value shr 11) and 1) shl 10) or ((value shr 12) and 15)
    val second = (((value shr 8) and 7) shl 12) or 0x0200 or (value and 255)
    return byteArrayOf(
        first.toByte(), (first shr 8).toByte(),
        second.toByte(), (second shr 8).toByte()
    )
}

private fun patchArm(source: ByteArray, multiplier: Int): ByteArray {
    require(source.size == 2518520 &&
        source.maskedHash(ARM_SITE until ARM_SITE + 6, ARM_CAVE until ARM_CAVE + 12) ==
            ARM_MASKED_SHA256) {
        "Minigore 2: ARMv7 native library differs from the verified v1.28."
    }

    val originalBody = "02fb00f5".bytes()
    val originalSite = "8a5802fb00f5".bytes()
    val trampoline = "20f14dfe00bf".bytes()
    val siteIsShort = source.matchesAt(ARM_SITE, originalSite) ||
        (source[ARM_SITE + 1] == 0x22.toByte() &&
            source.matchesAt(ARM_SITE + 2, originalBody))
    val siteIsLong = source.matchesAt(ARM_SITE, trampoline)

    val cave = source.copyOfRange(ARM_CAVE, ARM_CAVE + 12)
    val caveIsEmpty = cave.all { it == 0.toByte() }
    val caveIsLong = cave[0] == 0x40.toByte() &&
        cave[1] == 0xF2.toByte() &&
        cave.copyOfRange(4, 12).contentEquals("02fb00f5dff6aeb9".bytes())
    require((siteIsShort && caveIsEmpty) || (siteIsLong && caveIsLong)) {
        "Minigore 2: unexpected ARM trampoline or code cave; refusing to patch."
    }

    val result = source.copyOf()
    if (multiplier <= 255) {
        byteArrayOf(multiplier.toByte(), 0x22).copyInto(result, ARM_SITE)
        originalBody.copyInto(result, ARM_SITE + 2)
        java.util.Arrays.fill(result, ARM_CAVE, ARM_CAVE + 12, 0.toByte())
    } else {
        trampoline.copyInto(result, ARM_SITE)
        val replacement = movwR2(multiplier) + "02fb00f5dff6aeb9".bytes()
        require(replacement.size == 12)
        replacement.copyInto(result, ARM_CAVE)
    }
    require(result.maskedHash(ARM_SITE until ARM_SITE + 6, ARM_CAVE until ARM_CAVE + 12) ==
        ARM_MASKED_SHA256)
    return result
}

private fun patchX86(source: ByteArray, multiplier: Int): ByteArray {
    require(source.size == 3767904 &&
        source.maskedHash(X86_SITE until X86_SITE + 6) == X86_MASKED_SHA256) {
        "Minigore 2: x86 native library differs from the verified v1.28."
    }
    val original = "8bb88c601f00".bytes()
    val patched = source[X86_SITE] == 0xBF.toByte() &&
        source[X86_SITE + 5] == 0x90.toByte()
    require(source.matchesAt(X86_SITE, original) || patched) {
        "Minigore 2: unexpected x86 score instructions."
    }
    val result = source.copyOf()
    byteArrayOf(
        0xBF.toByte(), multiplier.toByte(), (multiplier shr 8).toByte(),
        (multiplier shr 16).toByte(), (multiplier shr 24).toByte(), 0x90.toByte()
    ).copyInto(result, X86_SITE)
    require(result.maskedHash(X86_SITE until X86_SITE + 6) == X86_MASKED_SHA256)
    return result
}

/**
 * Mirror the tested Android 17 compatibility settings of the parallel Morphe APK:
 * target SDK 25, debuggable app for run-as restore, non-resizeable game activity.
 * Do not change the original Android package name or the game activity class.
 */
private val minigoreAndroid17CompatibilityPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val ns = "http://schemas.android.com/apk/res/android"
            val root = document.documentElement
            require(root.getAttribute("package") == PACKAGE_NAME) {
                "Minigore 2: unexpected manifest package."
            }
            val usesSdk = document.getElementsByTagName("uses-sdk")
            require(usesSdk.length == 1) {
                "Minigore 2: expected one uses-sdk manifest element."
            }
            (usesSdk.item(0) as Element).setAttributeNS(
                ns, "android:targetSdkVersion", "25"
            )
            val apps = document.getElementsByTagName("application")
            require(apps.length == 1) {
                "Minigore 2: expected one application element."
            }
            val app = apps.item(0) as Element
            app.setAttributeNS(ns, "android:debuggable", "true")

            val activities = document.getElementsByTagName("activity")
            val game = (0 until activities.length)
                .map { activities.item(it) as Element }
                .singleOrNull {
                    it.getAttributeNS(ns, "name") == "$PACKAGE_NAME.xtPlay"
                } ?: error("Minigore 2: original xtPlay activity missing.")
            game.setAttributeNS(ns, "android:resizeableActivity", "false")
        }
    }
}

@Suppress("unused")
val minigoreCoinMultiplierPatch = rawResourcePatch(
    name = "Minigore 2 - Moltiplicatore monete",
    description = "Imposta il moltiplicatore delle monete guadagnate (x1-x1000) senza modificare prezzi o salvataggi. Include fix schermo Android 17 e debug per ripristino tramite ADB. Solo Minigore 2 v1.28 (28).",
    default = false
) {
    dependsOn(minigoreAndroid17CompatibilityPatch)

    // A single entry in Morphe's app catalog; no duplicate Morphe package.
    compatibleWith(
        Compatibility(
            name = "Minigore 2",
            packageName = PACKAGE_NAME,
            targets = listOf(AppTarget(version = "1.28"))
        )
    )

    val coinMultiplier by intOption(
        key = "coinMultiplier",
        default = 1000,
        title = "Moltiplicatore monete",
        description = "Inserisci un intero da 1 a 1000. Richiede la rigenerazione dell'APK.",
        required = true,
        validator = { it != null && it in 1..1000 }
    )

    execute {
        val factor = requireNotNull(coinMultiplier)
        require(factor in 1..1000)
        require(packageMetadata.packageName == PACKAGE_NAME &&
            packageMetadata.versionName == "1.28" &&
            packageMetadata.versionCode == "28") {
            "Minigore 2 1.28 (28) originale richiesto."
        }

        // Compute and validate both native outputs before changing either file.
        val armFile: File = get(ARM_PATH)
        val x86File: File = get(X86_PATH)
        require(armFile.isFile && x86File.isFile) {
            "Minigore 2: ARMv7 and x86 libraries must both be present."
        }
        val armOutput = patchArm(armFile.readBytes(), factor)
        val x86Output = patchX86(x86File.readBytes(), factor)
        armFile.writeBytes(armOutput)
        x86File.writeBytes(x86Output)
        println("Minigore 2: score multiplier x$factor patched on ARMv7 and x86.")
    }
}
