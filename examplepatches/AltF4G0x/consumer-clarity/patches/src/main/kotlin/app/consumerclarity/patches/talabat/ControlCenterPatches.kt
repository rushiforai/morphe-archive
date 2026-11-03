package app.consumerclarity.patches.talabat

@Suppress("unused")
val settingsSearchPatch = consumerResourcePatch(
    "Settings search",
    "Adds a search field to filter patch controls by name, description, or category.",
    "Control center",
    key = "settings_search",
) {}

@Suppress("unused")
val settingsBackupPatch = consumerResourcePatch(
    "Settings backup and restore",
    "Adds JSON export and import for patch preferences without account or order data.",
    "Control center",
    key = "settings_backup",
) {}
