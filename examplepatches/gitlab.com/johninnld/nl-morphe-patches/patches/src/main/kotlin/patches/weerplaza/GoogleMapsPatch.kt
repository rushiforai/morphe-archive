package patches.weerplaza

import app.morphe.patcher.patch.resourcePatch
import patches.buienalarm.CommunityMapsKey

@Suppress("unused")
val googleMapsCompatibility = resourcePatch(
    name = "Fix Google Maps",
    description = "Supplies the authorized community Google Maps key after re-signing, leaving Firebase configuration unchanged.",
) {
    dependsOn(originalInput)
    compatibleWith(weerplaza)
    execute {
        val key = CommunityMapsKey.value
        check(Regex("AIza[0-9A-Za-z_-]{35}").matches(key)) { "Missing authorized community Maps key" }
        // This app stores its Maps credential directly in the manifest. Its
        // separate google_api_key resource belongs to Firebase and stays intact.
        document("AndroidManifest.xml").use { doc ->
            doc.one("android:name", "com.google.android.geo.API_KEY")
                .setAttributeNS(ANDROID, "android:value", key)
        }
    }
}
