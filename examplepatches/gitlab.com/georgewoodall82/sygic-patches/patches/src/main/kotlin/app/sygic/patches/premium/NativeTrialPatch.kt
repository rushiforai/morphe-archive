package app.sygic.patches.premium

import app.morphe.patcher.patch.rawResourcePatch
import app.sygic.patches.shared.Constants.COMPATIBILITY_SYGIC

/**
 * Removes the 7/14-day trial clock at the native level.
 *
 * ## Where the trial is enforced
 *
 * Verified by disassembling lib/arm64-v8a/libAura.so 26.1.9
 * (symbols are exported, so this is readable):
 *
 *   CLicenseInterface::CheckLicenses()  @ 0xf32e78
 *
 *   loop over CProductRecordSet::GetProductAt(i):
 *     0xf32ee4  ldr  w25, [x0, #0x88]   ; record validity timestamp
 *     0xf32ef0  bl   CLowTime::TimeGetCurrentTime
 *     0xf32ef4  cmp  w25, #0x1
 *     0xf32ef8  str  xzr, [x23, #0xb0]  ; valid = 0
 *     0xf32efc  ccmp w25, w0, #0x0, ge
 *     0xf32f00  b.gt 0xf32ebc           ; if validity > 1 && validity > now -> valid
 *     0xf32f04  ldr  w8, [x23, #0xa4]   ; else: status
 *     0xf32f08  str  w24, [x23, #0xb4]  ; expired = 1
 *     ...
 *     0xf32ebc  str  w24, [x23, #0xb0]  ; valid = 1
 *
 * i.e. every product (the trial licence included) stops counting as valid
 * the moment its validity timestamp falls behind the wall clock. That is
 * what the "Premium: N days left" sidebar text and the expiry lock follow.
 *
 * ## What this patch does
 *
 * Replaces the comparison at 0xf32ef4 with an unconditional branch straight
 * to the "valid = 1" block:
 *
 *     0x7100073f  cmp  w25, #1        ->  0x17fffff2  b 0xf32ebc
 *
 * Result: the time check is skipped entirely, so a record that exists stays
 * valid forever and "expired" is never set. The trial product record the
 * server issues keeps unlocking premium features after its date passes.
 *
 * This is a single 4-byte ARM64 instruction replacement, pinned to 26.1.9
 * (offset 0xf32ef4). Other versions fail loudly on the byte comparison
 * instead of corrupting the library.
 *
 * Limitation: only arm64-v8a is shipped in this APK and patched here.
 * Map downloads / activation still go through Sygic's servers, so features
 * that need a live server entitlement are unaffected by this patch.
 */
@Suppress("unused")
val nativeTrialBypassPatch = rawResourcePatch(
    name = "Remove Trial Expiry (native)",
    description = "Patches libAura.so CLicenseInterface::CheckLicenses so licence records never expire, and strips the 'Premium: N days left' countdown text from every language file.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SYGIC)

    execute {
        val libPath = "lib/arm64-v8a/libAura.so"
        val lib = get(libPath)
        val bytes = lib.readBytes()

        // cmp w25, #0x1  ->  b 0xf32ebc  (skip the time comparison)
        val original = byteArrayOf(0x3f, 0x07, 0x00, 0x71)
        val patched = byteArrayOf(0xf2.toByte(), 0xff.toByte(), 0xff.toByte(), 0x17)
        val offset = 0xf32ef4

        if (offset + original.size > bytes.size) {
            throw IllegalStateException("libAura.so too small for patch offset 0x${offset.toString(16)}")
        }
        val current = bytes.copyOfRange(offset, offset + original.size)
        if (!current.contentEquals(original)) {
            throw IllegalStateException(
                "libAura.so mismatch at 0x${offset.toString(16)}: " +
                    "expected ${original.joinToString(" ") { "%02x".format(it) }}, " +
                    "got ${current.joinToString(" ") { "%02x".format(it) }}. " +
                    "This bundle is pinned to Sygic 26.1.9.",
            )
        }
        patched.copyInto(bytes, offset)
        lib.writeBytes(bytes)

        // Kill the sidebar countdown text in every language file.
        listApkEntries("assets/resmin/Res/skin/langs").forEach { path ->
            if (!path.endsWith(".lang")) return@forEach
            val f = get(path)
            var text = f.readText()
            var changed = false
            for (key in listOf("sidebar.trial.text", "sidebar.trial.textHours")) {
                val regex = Regex("(<lang id=\"${Regex.escape(key)}\" text=\")[^\"]*(\")")
                if (regex.containsMatchIn(text)) {
                    text = regex.replace(text) { m -> "${m.groupValues[1]}Premium${m.groupValues[2]}" }
                    changed = true
                }
            }
            if (changed) f.writeText(text)
        }
    }
}
