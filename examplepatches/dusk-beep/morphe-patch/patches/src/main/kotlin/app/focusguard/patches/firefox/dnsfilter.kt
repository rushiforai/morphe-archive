package app.focusguard.patches.firefox

import app.focusguard.patches.firefox.dns.dnsFilterOptions
import app.focusguard.patches.firefox.dns.forceGeckoViewDns
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch

private const val DOH_SETTINGS_MODE = "Lmozilla/components/concept/engine/Engine\$DohSettingsMode;"

// IMPORTANT: Replace this with the exact SETTINGS descriptor
// used by your Firefox 160.0 source if it differs.
private const val SETTINGS = "Lorg/mozilla/fenix/utils/Settings;"

private val getDohSettingsModeFingerprint =
    Fingerprint(
        definingClass = SETTINGS,
        name = "getDohSettingsMode",
        returnType = DOH_SETTINGS_MODE,
        parameters = emptyList(),
    )

val dnsFilterPatch =
    patch(
        name = "DNS filter",
        description = "Forces a custom DNS-over-HTTPS resolver in strict mode.",
        default = false,
    ) {
      compatibleWith(
          Compatibility(
              packageName = "org.mozilla.firefox",
              name = "Firefox",
              targets = listOf(AppTarget(version = null)),
          ),
      )

      val options = dnsFilterOptions()

      execute {
        val url = options.url

        // Force GeckoView to use the custom resolver exclusively.
        forceGeckoViewDns(url)

        // Make Firefox report maximum DNS protection.
        val getMode = getDohSettingsModeFingerprint.method

        getMode.addInstructions(
            0,
            """
                sget-object v0, $DOH_SETTINGS_MODE->MAX:$DOH_SETTINGS_MODE
                return-object v0
                """
                .trimIndent(),
        )
      }
    }
