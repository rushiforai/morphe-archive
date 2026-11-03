package app.consumerclarity.patches.talabat

@Suppress("unused")
val disablePlayLicensePatch = consumerBytecodePatch(
    name = "Disable Play license gate",
    description = "Skips the pairip license check and its repeated scheduler so the modified app can start " +
        "without Google Play licensing. Other Google-dependent features are unchanged.",
    category = "Compatibility",
    key = "disable_license_gate",
    default = true,
) {

    execute {
        mutableClassDefBy("Lcom/pairip/licensecheck/LicenseClient;").methods.apply {
            single { it.name == "checkLicense" }.skipWhen("disableLicenseGate", "p0")
            single { it.name == "scheduleRepeatedLicenseCheck" }.skipWhen("disableLicenseGate")
        }
    }
}
