package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import java.security.MessageDigest

private fun nativeQuadFarSha256(bytes: ByteArray, offset: Int, length: Int): String {
    val digest = MessageDigest.getInstance("SHA-256")
    digest.update(bytes, offset, length)
    return digest.digest().joinToString("") { "%02x".format(it) }
}

private fun nativeQuadFarHexBytes(hex: String): ByteArray {
    val out = ByteArray(hex.length / 2)
    for (i in out.indices) out[i] = hex.substring(i * 2, i * 2 + 2).toInt(16).toByte()
    return out
}

private enum class NativeQuadFarSiteState { STOCK, PATCHED }

/**
 * Replaces the legacy projection construction of the exact Steam Link 2.0.20/5001712 scene library
 * with the direct native far-plane quad path (hooks into libgxr_quad_native.so, loaded with an
 * explicit dlopen from the renderer destructor/constructor path). Every mutation is validated before
 * the copy is written:
 *
 *  - the (versionName, versionCode) pair must be the single registered exact base;
 *  - the file must be an AArch64 ELF of the stock size for that base;
 *  - every owned site must be either the exact stock bytes (pinned by SHA-256) or the exact replacement;
 *    a mixed state, or any other bytes, is rejected (the layout is unknown or half patched).
 *
 * An already patched library is returned unchanged (idempotent). Only owned sites are inspected so the
 * result composes with the other native patches in any order; sites never overlap each other.
 */
internal fun applyNativeQuadFarPlaneScene(bytes: ByteArray, versionName: String, versionCode: String): ByteArray {
    val layout = NATIVE_QUAD_FAR_LAYOUTS[versionCode]
        ?: throw PatchException("Native quad far plane: unsupported Steam Link build $versionName/$versionCode")
    if (layout.versionName != versionName) {
        throw PatchException("Native quad far plane: $versionName/$versionCode is not the registered exact base")
    }
    return applyNativeQuadFarLayout(bytes, layout)
}

/** Layout-parameterised core of [applyNativeQuadFarPlaneScene] (separately testable with synthetic layouts). */
internal fun applyNativeQuadFarLayout(bytes: ByteArray, layout: NativeQuadFarLayout): ByteArray {
    val versionCode = layout.versionCode
    if (bytes.size != layout.size) {
        throw PatchException(
            "Native quad far plane: scene library size ${bytes.size} does not match base $versionCode (${layout.size})",
        )
    }
    if (bytes.size < 64 || bytes[0] != 0x7f.toByte() || bytes[1] != 'E'.code.toByte() ||
        bytes[2] != 'L'.code.toByte() || bytes[3] != 'F'.code.toByte() || bytes[4] != 2.toByte() ||
        (bytes[18].toInt() and 0xff) != 0xb7 || bytes[19].toInt() != 0
    ) {
        throw PatchException("Native quad far plane: scene library is not an AArch64 ELF64")
    }
    val sorted = layout.sites.sortedBy { it.offset }
    for (i in 1 until sorted.size) {
        if (sorted[i - 1].offset + sorted[i - 1].length > sorted[i].offset) {
            throw PatchException("Native quad far plane: overlapping owned sites in layout $versionCode")
        }
    }
    val states = layout.sites.map { site ->
        val patched = nativeQuadFarHexBytes(site.patched)
        if (patched.size != site.length) {
            throw PatchException("Native quad far plane: corrupt layout table for ${site.name}")
        }
        if (site.offset < 0 || site.offset + site.length > bytes.size || site.offset % 4 != 0 || site.length % 4 != 0) {
            throw PatchException("Native quad far plane: site ${site.name} is outside the scene library")
        }
        val matchesPatched = (0 until site.length).all { bytes[site.offset + it] == patched[it] }
        when {
            matchesPatched -> NativeQuadFarSiteState.PATCHED
            nativeQuadFarSha256(bytes, site.offset, site.length) == site.stockSha256 -> NativeQuadFarSiteState.STOCK
            else -> throw PatchException("Native quad far plane: unexpected bytes at ${site.name} for base $versionCode")
        }
    }
    if (states.all { it == NativeQuadFarSiteState.PATCHED }) return bytes
    if (states.any { it == NativeQuadFarSiteState.PATCHED }) {
        throw PatchException("Native quad far plane: scene library is partially patched for base $versionCode")
    }
    val result = bytes.copyOf()
    for (site in layout.sites) {
        val patched = nativeQuadFarHexBytes(site.patched)
        System.arraycopy(patched, 0, result, site.offset, patched.size)
    }
    return result
}

/** True when every owned site of [layout] holds the replacement bytes. */
internal fun isNativeQuadFarPlanePatched(bytes: ByteArray, layout: NativeQuadFarLayout): Boolean {
    if (bytes.size != layout.size) return false
    return layout.sites.all { site ->
        val patched = nativeQuadFarHexBytes(site.patched)
        site.offset + site.length <= bytes.size && (0 until site.length).all { bytes[site.offset + it] == patched[it] }
    }
}

/** True when every owned site holds the replacement bytes (used by status checks and tests). */
internal fun isNativeQuadFarPlanePatched(bytes: ByteArray, versionCode: String): Boolean =
    NATIVE_QUAD_FAR_LAYOUTS[versionCode]?.let { isNativeQuadFarPlanePatched(bytes, it) } ?: false
