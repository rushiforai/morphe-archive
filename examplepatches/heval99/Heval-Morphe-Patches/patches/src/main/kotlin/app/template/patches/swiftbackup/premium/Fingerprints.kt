package app.template.patches.swiftbackup.premium

import app.morphe.patcher.Fingerprint

// Swift Backup stores its premium entitlement in encrypted preferences under an obfuscated
// key. common.V is the singleton every premium gate reads; its getA() boolean first consults
// a verification path and then the encrypted pref, so forcing the getter covers both.
object PremiumStateFingerprint : Fingerprint(
    definingClass = "Lorg/swiftapps/swiftbackup/common/V;",
    name = "getA",
)
