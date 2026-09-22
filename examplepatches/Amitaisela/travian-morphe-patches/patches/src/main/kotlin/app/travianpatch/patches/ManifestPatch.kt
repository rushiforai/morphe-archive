package app.travianpatch.patches

import app.morphe.patcher.patch.resourcePatch

/**
 * Adds the manifest entries the notifier needs: the REQUEST_IGNORE_BATTERY_OPTIMIZATIONS permission,
 * so NotifierBootstrap can fire the system "ignore battery optimizations?" dialog, and the
 * Travian Tools screens (see TOOLS_ACTIVITIES below). Everything else (WorkManager's own components) is already merged in from the app's own bundled copy.
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
    description = "Adds the permission needed to ask for a battery optimization exemption, and the " +
        "Travian Tools screens.",
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

        val closing = "</application>"
        check(sanitized.contains(closing)) { "Could not find </application> in AndroidManifest.xml" }

        val patched = sanitized
            .replaceFirst(marker, permission + marker)
            .replaceFirst(closing, TOOLS_ACTIVITIES + closing)
        manifestFile.writeText(patched)

        // The Travian Tools icon: the game's own icon layers plus a bell badge, written as text
        // resources so no copy of the game's artwork is shipped here. Both folders already exist.
        get("res/drawable-anydpi/travian_tools_bell.xml").writeText(BELL_BADGE)
        get("res/mipmap-anydpi/travian_tools_icon.xml").writeText(TOOLS_ICON)
    }
}

/** Numeric character references, hex (group 1) or decimal (group 2). */
private val NUMERIC_CHAR_REF = Regex("&#(?:[xX]([0-9a-fA-F]+)|([0-9]+));")

/**
 * The Travian Tools screens. HubActivity is the second launcher icon (labelled "Travian Tools", with
 * the bell icon); the other two are reached from it or from a notification's settings button. All
 * share a task affinity of their own so opening them never gets stacked onto the running game.
 */
private val TOOLS_ACTIVITIES = """
        <activity
            android:name="com.travianpatch.notifier.HubActivity"
            android:exported="true"
            android:icon="@mipmap/travian_tools_icon"
            android:label="Travian Tools"
            android:taskAffinity="com.traviangames.travianlegendsmobile.tools"
            android:theme="@android:style/Theme.DeviceDefault.Light.NoActionBar">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <activity
            android:name="com.travianpatch.notifier.NotificationSettingsActivity"
            android:exported="false"
            android:label="Travian Tools"
            android:taskAffinity="com.traviangames.travianlegendsmobile.tools"
            android:theme="@android:style/Theme.DeviceDefault.Light.NoActionBar"/>
        <activity
            android:name="com.travianpatch.notifier.QueuesActivity"
            android:exported="false"
            android:label="Travian Tools"
            android:taskAffinity="com.traviangames.travianlegendsmobile.tools"
            android:theme="@android:style/Theme.DeviceDefault.Light.NoActionBar"/>
        <activity
            android:name="com.travianpatch.notifier.RecentActivity"
            android:exported="false"
            android:label="Travian Tools"
            android:taskAffinity="com.traviangames.travianlegendsmobile.tools"
            android:theme="@android:style/Theme.DeviceDefault.Light.NoActionBar"/>
    """.trimIndent() + "\n"

/**
 * The Travian Tools icon: the game's own adaptive-icon layers (referenced by name from the app being
 * patched) with the bell badge on top.
 */
private val TOOLS_ICON = """
    <?xml version="1.0" encoding="utf-8"?>
    <adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
        <background android:drawable="@mipmap/ic_launcher_background"/>
        <foreground>
            <layer-list>
                <item android:drawable="@mipmap/ic_launcher_foreground"/>
                <item android:drawable="@drawable/travian_tools_bell"/>
            </layer-list>
        </foreground>
    </adaptive-icon>
""".trimIndent() + "\n"

/**
 * A red badge with a white ring and a white bell, in the upper left of the icon, kept inside the
 * central area that round launcher masks never cut off.
 */
private val BELL_BADGE = """
    <?xml version="1.0" encoding="utf-8"?>
    <vector xmlns:android="http://schemas.android.com/apk/res/android"
        android:width="108dp"
        android:height="108dp"
        android:viewportWidth="108"
        android:viewportHeight="108">
        <path
            android:fillColor="#FFFFFFFF"
            android:pathData="M40,40m-14,0a14,14 0 1,0 28,0a14,14 0 1,0 -28,0"/>
        <path
            android:fillColor="#FFD32F2F"
            android:pathData="M40,40m-12,0a12,12 0 1,0 24,0a12,12 0 1,0 -24,0"/>
        <group
            android:translateX="32.8"
            android:translateY="32.8"
            android:scaleX="0.6"
            android:scaleY="0.6">
            <path
                android:fillColor="#FFFFFFFF"
                android:pathData="M12,3C8.7,3 6.5,5.6 6.5,9L6.5,13.5L4.5,17L19.5,17L17.5,13.5L17.5,9C17.5,5.6 15.3,3 12,3Z"/>
            <path
                android:fillColor="#FFFFFFFF"
                android:pathData="M12,18.6m-2,0a2,2 0 1,0 4,0a2,2 0 1,0 -4,0"/>
        </group>
    </vector>
""".trimIndent() + "\n"
