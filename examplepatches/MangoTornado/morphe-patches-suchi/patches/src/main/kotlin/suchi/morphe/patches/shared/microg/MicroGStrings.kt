package suchi.morphe.patches.shared.microg

internal const val MICROG_PACKAGE = "app.revanced.android.gms"
internal const val MICROG_VENDOR = "app.revanced"

private val protocolStrings = setOf(
    "com.google",
    "com.google.android.gms",
    "com.google.android.c2dm.intent.RECEIVE",
    "com.google.android.c2dm.intent.REGISTER",
    "com.google.android.c2dm.intent.REGISTRATION",
    "com.google.android.c2dm.intent.UNREGISTER",
    "com.google.android.c2dm.permission.RECEIVE",
    "com.google.android.c2dm.permission.SEND",
    "com.google.android.gcm.intent.SEND",
    "com.google.android.gms.auth.GOOGLE_SIGN_IN",
    "com.google.android.gms.common.account.CHOOSE_ACCOUNT",
    "com.google.android.gms.auth.api.phone.permission.SEND",
    "com.google.android.gms.permission.AD_ID",
    "com.google.android.googleapps.permission.GOOGLE_AUTH",
    "com.google.android.googleapps.permission.GOOGLE_AUTH.cp",
    "com.google.android.googleapps.permission.GOOGLE_AUTH.local",
    "com.google.android.googleapps.permission.GOOGLE_AUTH.mail",
    "com.google.android.googleapps.permission.GOOGLE_AUTH.writely",
    "com.google.android.gsf.action.GET_GLS",
    "com.google.android.providers.gsf.permission.READ_GSERVICES",
    "com.google.iid.TOKEN_REQUEST",
)

private val providerAuthorities = setOf(
    "com.google.android.gms.auth.accounts",
    "com.google.android.gms.chimera",
    "com.google.android.gms.fonts",
    "com.google.android.gms.phenotype",
    "com.google.android.gsf.gservices",
)

private val serviceActions = setOf(
    "com.google.android.gms.auth.account.authapi.START",
    "com.google.android.gms.auth.account.workaccount.START",
    "com.google.android.gms.auth.api.credentials.service.START",
    "com.google.android.gms.auth.api.identity.service.authorization.START",
    "com.google.android.gms.auth.api.identity.service.credentialsaving.START",
    "com.google.android.gms.auth.api.identity.service.signin.START",
    "com.google.android.gms.auth.api.phone.service.SmsRetrieverApiService.START",
    "com.google.android.gms.auth.api.signin.service.START",
    "com.google.android.gms.auth.service.START",
    "com.google.android.gms.chimera.container.moduleinstall.ModuleInstallService.START",
    "com.google.android.gms.common.service.START",
    "com.google.android.gms.common.telemetry.service.START",
    "com.google.android.gms.fido.fido2.privileged.START",
    "com.google.android.gms.fido.fido2.regular.START",
    "com.google.android.gms.fido.u2f.thirdparty.START",
    "com.google.android.gms.fido.u2f.zeroparty.START",
    "com.google.android.gms.signin.service.START",
    "com.google.android.location.internal.GoogleLocationManagerService.START",
)

internal fun microGStringReplacement(value: String): String? {
    if (value in protocolStrings || value in providerAuthorities || value in serviceActions) {
        return value.replaceFirst("com.google", MICROG_VENDOR)
    }

    for (authority in providerAuthorities) {
        val prefix = "content://$authority"
        if (value == prefix || value.startsWith("$prefix/") ||
            value.startsWith("$prefix?") || value.startsWith("$prefix#")
        ) {
            return value.replaceFirst(prefix, prefix.replaceFirst("com.google", MICROG_VENDOR))
        }
    }
    return null
}

internal fun microGManifestReplacement(value: String): String? =
    if (value.startsWith("com.google.android.c2dm.") ||
        value == "com.google.android.providers.gsf.permission.READ_GSERVICES"
    ) {
        microGStringReplacement(value)
    } else {
        null
    }
