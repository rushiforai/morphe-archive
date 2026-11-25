package dev.materialtidal.patches.tidal.settings

import app.morphe.patcher.Fingerprint

internal object MainSettingsItemsBuildFingerprint : Fingerprint(
    parameters = emptyList(),
    returnType = "Ljava/util/List;",
    custom = { _, classDef ->
        classDef.fields.any {
            it.type == "Lcom/aspiro/wamp/settings/items/profile/SettingsItemOfflineMode;"
        } && classDef.methods.any {
            it.returnType == "Lio/reactivex/Observable;" && it.parameterTypes.isEmpty()
        }
    },
)

internal object PatchSettingsAppOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/App;",
    name = "onCreate",
    parameters = emptyList(),
    returnType = "V",
)
