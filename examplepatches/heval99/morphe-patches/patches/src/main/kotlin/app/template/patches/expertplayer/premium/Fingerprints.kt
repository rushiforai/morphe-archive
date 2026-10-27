package app.template.patches.expertplayer.premium

import app.morphe.patcher.Fingerprint

// RevenueCat's EntitlementInfo. R8 renames the class, its fields and the model types in its
// constructor every release (G5.M in 11.2.0, d6.J in 11.3.0), so the class is found by its
// library toString, which starts with the literal "EntitlementInfo(identifier='". The patch then
// takes the class's only constructor, which takes isActive as the second argument and stores it in
// a field. The purchases_flutter bridge serialises that field for Dart (isActive key in the
// entitlement map), and EntitlementInfos builds the active map from it.
internal const val ENTITLEMENT_INFO_TO_STRING = "EntitlementInfo(identifier='"

object EntitlementInfoToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf(ENTITLEMENT_INFO_TO_STRING),
)
