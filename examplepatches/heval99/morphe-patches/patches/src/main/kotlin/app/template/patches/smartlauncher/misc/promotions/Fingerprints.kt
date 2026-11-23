package app.template.patches.smartlauncher.misc.promotions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// The remote-config data class (R8 renamed it). Its generated toString starts with this stable
// text and prints every property as ", name=value", in field order. The patch reads the property
// names from it, so the constructor parameters are found by name and not by position.
internal object ConfigToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("SLConfig(isDefaultConfig=", StringComparisonType.STARTS_WITH),
    ),
)
