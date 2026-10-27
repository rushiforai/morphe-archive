package app.template.patches.boxbox.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

object EntitlementInfoIsActiveFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/revenuecat/purchases/EntitlementInfo;" &&
                method.name == "isActive" &&
                method.returnType == "Z" &&
                method.parameters.isEmpty()
    }
)

// The plan enum (Free, Pro). Constant names are the Enum.name() strings, so they survive R8.
object PlanEnumClinitFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf(string("Free", StringComparisonType.CONTAINS), string("Pro", StringComparisonType.CONTAINS)),
    custom = { _, classDef -> classDef.superclass == "Ljava/lang/Enum;" },
)

// PlanDataStore: the DataStore file name and its preference key. Renaming either would lose
// every user's stored plan, so both are stable.
object PlanDataStoreClinitFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf(
        string("plans_data_store", StringComparisonType.CONTAINS),
        string("plan_type", StringComparisonType.CONTAINS),
    ),
)
