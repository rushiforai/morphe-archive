package app.morphe.patches.gradle

import org.gradle.api.services.BuildService
import org.gradle.api.services.BuildServiceParameters

abstract class SettingsExtensionProvider :
    BuildService<SettingsExtensionProvider.Params>,
    BuildServiceParameters {
    interface Params : BuildServiceParameters {
        var defaultNamespace: String?
        var proguardFiles: Set<String>
    }
}
