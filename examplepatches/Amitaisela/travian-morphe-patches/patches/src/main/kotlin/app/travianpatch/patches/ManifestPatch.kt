package app.travianpatch.patches

import app.morphe.patcher.patch.resourcePatch

/**
 * Adds the one manifest permission the notifier needs: REQUEST_IGNORE_BATTERY_OPTIMIZATIONS,
 * so NotifierBootstrap can fire the system "ignore battery optimizations?" dialog. Everything
 * else (WorkManager's own components) is already merged in from the app's own bundled copy.
 *
 * Uses raw text editing rather than the document()/DOM API: this app's original (unmodified)
 * manifest contains a raw control byte in an unrelated Play Games meta-data value, which a
 * strict XML DOM parser rejects outright. Plain string manipulation sidesteps that entirely.
 *
 * default = true (not just dependsOn(manifestPatch) on the parent patch): a default=false
 * dependency isn't reliably pulled in by every patch host — verified against morphe-desktop's
 * CLI, which silently skipped this patch until enabled explicitly. Since it was never meant to
 * be user-toggleable anyway, making it default-on avoids relying on that resolution at all.
 * Requires compatibleWith(): the patcher forces default=false on "universal" (any-app) patches
 * as a safety guard, which silently overrode this until it was scoped to Travian specifically.
 */
val manifestPatch = resourcePatch(
    name = "Travian notifier manifest entry",
    description = "Adds the permission needed to ask for a battery optimization exemption.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_TRAVIAN_LEGENDS)

    execute {
        val manifestFile = get("AndroidManifest.xml", true)
        val original = manifestFile.readText()

        val permission = "    <uses-permission android:name=\"android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS\"/>\n"

        val marker = "<application"
        check(original.contains(marker)) { "Could not find <application in AndroidManifest.xml" }

        // The official manifest's Play Games APP_ID is "" (a stray control character). The
        // patcher's own later step parses this file as XML and fails on it ("&#3" is invalid), even
        // with no manifest patch enabled. Blank any such character reference so patching the
        // untouched official APK works; the game ran fine with that value blank.
        val sanitized = original.replace(NUMERIC_CHAR_REF) { match ->
            val code = match.groupValues[1].takeIf { it.isNotEmpty() }?.toIntOrNull(16)
                ?: match.groupValues[2].toIntOrNull()
            if (code != null && code < 0x20 && code != 0x9 && code != 0xA && code != 0xD) "" else match.value
        }

        val patched = sanitized.replaceFirst(marker, permission + marker)
        manifestFile.writeText(patched)
    }
}

/** Numeric character references, hex (group 1) or decimal (group 2). */
private val NUMERIC_CHAR_REF = Regex("&#(?:[xX]([0-9a-fA-F]+)|([0-9]+));")
