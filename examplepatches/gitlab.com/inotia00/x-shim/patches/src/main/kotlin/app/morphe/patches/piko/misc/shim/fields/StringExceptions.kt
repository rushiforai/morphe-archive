package app.morphe.patches.piko.misc.shim.fields

internal enum class StringExceptions(
    val versionName: String,
    val versionCode: Int,
    val exceptions: List<String>
) {
    X_11_88_0(
        "11.88.0-release.0",
        311880000,
        listOf("android_compose_fab_menu_enabled")
    ),
    X_11_95_1(
        "11.95.1-release.0",
        311951000,
        listOf("arg_is_unlimited_timeline")
    ),
    X_12_1_0(
        "12.1.0-release.0",
        312010000,
        listOf("conversational_replies_android_pinned_replies_creation_enabled")
    ),
    X_12_1_1(
        "12.1.1-release.0",
        312011000,
        listOf("0")
    ),
    X_12_2_0(
        "12.2.0-release.0",
        312020000,
        listOf("currentSelectedElements")
    ),
    X_12_3_1(
        "12.3.1-release.0",
        312031000,
        listOf("https://x.com/i/status/")
    ),
    X_12_4_1(
        "12.4.1-release.0",
        312041000,
        listOf("query_id")
    )
}