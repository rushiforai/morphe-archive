package suchi.morphe.patches.shared.microg

fun main() {
    val replacements = mapOf(
        "com.google" to "app.revanced",
        "com.google.android.gms" to "app.revanced.android.gms",
        "com.google.android.gms.auth.api.signin.service.START" to
            "app.revanced.android.gms.auth.api.signin.service.START",
        "com.google.android.c2dm.intent.REGISTER" to "app.revanced.android.c2dm.intent.REGISTER",
        "content://com.google.android.gsf.gservices/prefix" to
            "content://app.revanced.android.gsf.gservices/prefix",
        "content://com.google.android.gms.phenotype?key=test" to
            "content://app.revanced.android.gms.phenotype?key=test",
    )
    for ((input, expected) in replacements) {
        check(microGStringReplacement(input) == expected) { "Incorrect routing: $input" }
    }
    for (input in listOf(
        "com.android.vending",
        "com.android.vending.billing.InAppBillingService.BIND",
        "com.google.android.gms.common.internal.IGmsServiceBroker",
        "com.google.android.gms.auth.api.signin.internal.ISignInService",
        "com.google.firebase.MESSAGING_EVENT",
        "com.google.firebase.auth.api.gms.service.START",
        "com.google.android.gms.ads.identifier.service.START",
        "com.google.android.gms.auth.api.accounttransfer.service.START",
        "com.google.android.gms.chimera.GmsIntentOperationService",
        "content://com.google.android.gsf.gservices.evil/prefix",
        "https://example.test/content://com.google.android.gsf.gservices",
    )) {
        check(microGStringReplacement(input) == null) { "Unexpected rewrite: $input" }
    }
    check(microGManifestReplacement("com.google.android.c2dm.intent.RECEIVE") ==
        "app.revanced.android.c2dm.intent.RECEIVE")
    check(microGManifestReplacement("com.google.android.c2dm.permission.SEND") ==
        "app.revanced.android.c2dm.permission.SEND")
    check(microGManifestReplacement("com.google.android.gms.chimera.GmsIntentOperationService") == null)
    check(microGManifestReplacement("com.google.firebase.MESSAGING_EVENT") == null)
    println("MicroG routing checks passed")
}
