package app.fluffy.patches.waypoint.paywall

import app.fluffy.patches.shared.Constants.COMPATIBILITY_WAYPOINT
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

@Suppress("unused")
val skipOnboardingPaywallPatch = rawResourcePatch(
    name = "Skip Waypoint onboarding paywall",
    description = "Skips the paywall after the tutorial: it runs the app's own free-choice " +
        "handler (completeOnboarding, then home) and renders nothing. Fails cleanly when " +
        "the bundle changes.",) {
    compatibleWith(COMPATIBILITY_WAYPOINT)

    execute {
        val bundle = get("assets/index.android.bundle")
            ?: throw PatchException("assets/index.android.bundle not found in APK")
        val bytes = bundle.readBytes()

        // PaywallScreen (route component of /(onboarding)/paywall):
        // CreateClosure of the completeOnboarding selector, useAppStore(selector) call,
        // StoreToEnvironment binding, then the start of the PaywallSheet render path.
        val pattern = byteArrayOf(
            0x64, 0x00, 0x01, 0x43, 0x4d, 0x53, 0x00, 0x02, 0x03, 0x00,
            0x2a, 0x01, 0x01, 0x00, 0x2e, 0x00, 0x04, 0x00, 0x37, 0x00, 0x00, 0x04,
            0xd8.toByte(), 0xaa.toByte(),
        )
        // Replaces the last 10 bytes: LoadConstUndefined r3; Call1 r0,r7,r3
        // (invoke handleDone - the first CreateClosure of this function, dst r7);
        // LoadConstNull r0; Ret r0. If a rebuild changes either constant, re-derive
        // with scripts/derive-paywall-pattern.py.
        var occurrences = 0
        var index = -1
        var i = indexOf(bytes, pattern)
        while (i >= 0) {
            index = i
            occurrences++
            i = indexOf(bytes, pattern, i + 1)
        }
        if (occurrences != 1) {
            throw PatchException(
                "PaywallScreen window not found uniquely in index.android.bundle " +
                    "(found $occurrences matches). The bundle layout changed; re-derive the pattern.",
            )
        }

        val replacement = byteArrayOf(
            0x76, 0x03, 0x51, 0x00, 0x07, 0x03, 0x77, 0x00, 0x5c, 0x00,
        )

        val patched = bytes.copyOf()
        System.arraycopy(
            replacement, 0,
            patched, index + pattern.size - replacement.size,
            replacement.size,
        )

        // The bundle carries a SHA-1 trailer over everything before it; keep it consistent.
        val digest = MessageDigest.getInstance("SHA-1")
            .digest(patched.copyOfRange(0, patched.size - 20))
        System.arraycopy(digest, 0, patched, patched.size - 20, 20)

        bundle.writeBytes(patched)
        println("Waypoint paywall skip: patched PaywallScreen at 0x" + Integer.toHexString(index))
    }
}

private fun indexOf(haystack: ByteArray, needle: ByteArray, fromIndex: Int = 0): Int {
    if (needle.isEmpty() || needle.size > haystack.size) return -1
    outer@ for (i in fromIndex..haystack.size - needle.size) {
        for (j in needle.indices) {
            if (haystack[i + j] != needle[j]) continue@outer
        }
        return i
    }
    return -1
}
