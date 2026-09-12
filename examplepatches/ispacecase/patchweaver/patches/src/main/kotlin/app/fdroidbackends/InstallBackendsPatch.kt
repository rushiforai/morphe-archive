package app.fdroidbackends

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// org.fdroid.fdroid 1.23.2 (versionCode 1023052), sha256
// 985f5181d48bb6bafd54083a048b391271e0ab28385881cc41294fb01a222762 — re-verified against the
// actual APK with apktool for this patch (see evidence/).
private val COMPATIBILITY_FDROID = Compatibility(
    name = "F-Droid",
    packageName = "org.fdroid.fdroid",
    targets = listOf(
        AppTarget(version = "1.23.2"),
    ),
)

/**
 * `InstallerFactory.create(Context, App, Apk)` is the single point where F-Droid picks which
 * `Installer` subclass to use (FileInstaller / PrivilegedInstaller / SessionInstaller /
 * DefaultInstaller — verified directly against InstallerFactory.smali in the target APK).
 * `SessionInstaller` in particular calls Android's `PackageInstaller` session APIs directly,
 * which bypasses any external install-intent handler entirely, so patching only the intent
 * built further downstream (e.g. inside `DefaultInstallerActivity`) cannot reliably override the
 * install backend — the override has to happen here, before that selection runs at all.
 */
private val installerFactoryCreateFingerprint = Fingerprint(
    definingClass = "Lorg/fdroid/fdroid/installer/InstallerFactory;",
    name = "create",
    returnType = "Lorg/fdroid/fdroid/installer/Installer;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lorg/fdroid/fdroid/data/App;",
        "Lorg/fdroid/fdroid/data/Apk;",
    ),
)

/**
 * Registers the extension's activities and the Shizuku user service/provider (the extension only
 * supplies compiled classes — the manifest still has to declare them), and adds a single
 * preference entry to open the backend chooser.
 */
private val installBackendsResourcePatch = resourcePatch(
    name = "Selectable install backend resources",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FDROID)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifestRoot = document.documentElement
            val application = document.getElementsByTagName("application").item(0) as Element

            fun element(tag: String, attributes: Map<String, String>) =
                document.createElement(tag).apply {
                    attributes.forEach { (name, value) -> setAttributeNS(ANDROID_NS, name, value) }
                }

            // Required for the Shizuku daemon to recognize and hand its binder to this app —
            // verified against the AndroidManifest.xml bundled in the dev.rikka.shizuku:provider
            // AAR itself, not just Shizuku's own docs. Without both of these, ShizukuProvider
            // initializes (logs "Initialize Sui: false") but never actually receives a binder.
            manifestRoot.insertBefore(
                element("uses-permission", mapOf("android:name" to "moe.shizuku.manager.permission.API_V23")),
                application,
            )
            application.appendChild(
                element(
                    "meta-data",
                    mapOf(
                        "android:name" to "moe.shizuku.client.V3_SUPPORT",
                        "android:value" to "true",
                    ),
                ),
            )

            application.appendChild(
                element(
                    "activity",
                    mapOf(
                        "android:name" to "org.fdroid.fdroid.installer.ExternalInstallerActivity",
                        "android:exported" to "false",
                        "android:theme" to "@android:style/Theme.Translucent.NoTitleBar",
                        "android:excludeFromRecents" to "true",
                    ),
                ),
            )

            application.appendChild(
                element(
                    "activity",
                    mapOf(
                        "android:name" to "app.fdroidbackends.settings.InstallBackendSettingsActivity",
                        "android:exported" to "false",
                        "android:label" to "Install backend",
                    ),
                ),
            )

            application.appendChild(
                element(
                    "provider",
                    mapOf(
                        "android:name" to "rikka.shizuku.ShizukuProvider",
                        "android:authorities" to "org.fdroid.fdroid.shizuku",
                        "android:multiprocess" to "false",
                        "android:enabled" to "true",
                        "android:exported" to "true",
                        "android:permission" to "android.permission.INTERACT_ACROSS_USERS_FULL",
                    ),
                ),
            )
        }

        // Placed as a top-level item (mirrors the existing top-level "pref_about"
        // PreferenceScreen entry) so it's visible without needing "expert" mode enabled.
        document("res/xml/preferences.xml").use { document ->
            val root = document.documentElement

            val preference = document.createElement("Preference").apply {
                setAttributeNS(ANDROID_NS, "android:title", "Install backend")
                setAttributeNS(ANDROID_NS, "android:key", "installBackend")
                setAttributeNS(
                    ANDROID_NS,
                    "android:summary",
                    "Choose how APKs are installed: system default, Shizuku, InstallerX, or a custom installer",
                )
            }

            val intent = document.createElement("intent").apply {
                setAttributeNS(ANDROID_NS, "android:targetPackage", "org.fdroid.fdroid")
                setAttributeNS(
                    ANDROID_NS,
                    "android:targetClass",
                    "app.fdroidbackends.settings.InstallBackendSettingsActivity",
                )
            }
            preference.appendChild(intent)

            root.insertBefore(preference, root.firstChild)
        }
    }
}

val installBackendsPatch = bytecodePatch(
    name = "Selectable install backend",
    description = "Adds a setting to choose how F-Droid installs APKs: system default, " +
        "Shizuku, InstallerX, or a custom installer package.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FDROID)

    dependsOn(installBackendsResourcePatch)
    // Matches the actual bundled resource path in the .mpp (extensions/<module-name>.mpe),
    // not just the module's own file name.
    extendWith("extensions/extension.mpe")

    execute {
        // Route install-backend selection through the extension before F-Droid's own
        // privileged/session/default selection logic runs. p0 = Context, p1 = App, p2 = Apk;
        // registers v0-v2 are free at index 0, before any of the method's own instructions run.
        installerFactoryCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0, p1, p2}, Lorg/fdroid/fdroid/installer/InstallBackendRouter;->maybeCreate(Landroid/content/Context;Lorg/fdroid/fdroid/data/App;Lorg/fdroid/fdroid/data/Apk;)Lorg/fdroid/fdroid/installer/Installer;
                move-result-object v0
                if-eqz v0, :useDefaultSelection
                return-object v0
                :useDefaultSelection
            """,
        )
    }
}

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
