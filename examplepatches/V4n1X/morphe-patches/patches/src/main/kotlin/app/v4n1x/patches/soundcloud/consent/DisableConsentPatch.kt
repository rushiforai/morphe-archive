package app.v4n1x.patches.soundcloud.consent

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.v4n1x.patches.soundcloud.shared.Constants.COMPATIBILITY_SOUNDCLOUD

private val disableConsentBytecodePatch = bytecodePatch {
    execute {
        // The Kotlin `object` singleton field is R8-obfuscated (e.g. `a`, `f66551a`,
        // `f68059a` depending on the build), so resolve it by type instead of hardcoding.
        val noopClassDef = mutableClassDefBy(
            "Lcom/soundcloud/android/privacy/consent/base/NoopPrivacyConsentController;",
        )
        val singletonField = noopClassDef.staticFields.singleOrNull { field ->
            field.type == "Lcom/soundcloud/android/privacy/consent/base/NoopPrivacyConsentController;"
        }
            ?: error("NoopPrivacyConsentController singleton field not found")

        PrivacyConsentControllerProviderFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, ${noopClassDef.type}->${singletonField.name}:${singletonField.type}
                return-object v0
            """,
        )
    }
}

@Suppress("unused")
val disableConsentPatch = resourcePatch(
    name = "Disable consent popup",
    description = "Disables the OneTrust consent/cookies popup and collapses banner views.",
) {
    compatibleWith(COMPATIBILITY_SOUNDCLOUD)

    dependsOn(disableConsentBytecodePatch)

    execute {
        document("res/layout/fragment_ot_banner.xml").use { document ->
            val root = document.documentElement
            root.setAttribute("android:layout_width", "0dp")
            root.setAttribute("android:layout_height", "0dp")
            root.setAttribute("android:visibility", "gone")
        }
    }
}
