package app.travianpatch.patches

import app.morphe.patcher.patch.resourcePatch

/**
 * Declares the injected NotifierService in AndroidManifest.xml so Android
 * will allow starting it as a foreground service (dataSync type, matching
 * the FOREGROUND_SERVICE_DATA_SYNC permission the app already requests).
 *
 * Uses raw text editing rather than the document()/DOM API: this app's
 * original (unmodified) manifest contains a raw control byte in an
 * unrelated Play Games meta-data value, which a strict XML DOM parser
 * rejects outright. Plain string manipulation sidesteps that entirely.
 */
val manifestPatch = resourcePatch(
    name = "Travian notifier manifest entry",
    description = "Adds the NotifierService and LoginActivity declarations.",
    default = false, // pulled in automatically via dependsOn(); not user-toggleable
) {
    execute {
        val manifestFile = get("AndroidManifest.xml", true)
        val original = manifestFile.readText()

        val entries = """    <service android:name="com.travianpatch.notifier.NotifierService" android:enabled="true" android:exported="false" android:foregroundServiceType="dataSync"/>
    <activity android:name="com.travianpatch.notifier.LoginActivity" android:enabled="true" android:exported="false" android:theme="@android:style/Theme.DeviceDefault.Light.Dialog"/>
"""

        val marker = "</application>"
        check(original.contains(marker)) { "Could not find </application> in AndroidManifest.xml" }

        val patched = original.replaceFirst(marker, entries + marker)
        manifestFile.writeText(patched)
    }
}
