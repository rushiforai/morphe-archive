package app.template.patches.anydesk.premium

import app.morphe.patcher.Fingerprint

// JniAdExt.r3() → jniIsFreeLicense() — returns true when the current license
// is a free (unpaid) license. AnyDesk gates premium features behind this check:
// account registration, address book, removing the license banner, etc.
// Forcing it to return false makes the app treat the license as a paid one.
object IsFreeLicenseFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type == "Lcom/anydesk/jni/JniAdExt;" && method.name == "r3"
    }
)

// JniAdExt.a2() → jniDoesLicenseAllowAccountRegistration() — returns true when
// the license allows creating an AnyDesk account. Free licenses disallow this.
object LicenseAllowsAccountRegistrationFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type == "Lcom/anydesk/jni/JniAdExt;" && method.name == "a2"
    }
)

// JniAdExt.b2() → jniDoesLicenseAllowAddressBook() — returns true when the
// license allows using the address book (roster). Free licenses disallow this.
object LicenseAllowsAddressBookFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type == "Lcom/anydesk/jni/JniAdExt;" && method.name == "b2"
    }
)

// JniAdExt.Q1() → jniCanRemoveLicense() — returns true when the license can be
// removed from the app. Forcing it true ensures the remove-license option is
// available in settings.
object CanRemoveLicenseFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type == "Lcom/anydesk/jni/JniAdExt;" && method.name == "Q1"
    }
)