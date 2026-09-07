package app.morphe.patches.google.common

import app.morphe.patcher.PackageMetadata
import app.morphe.patches.google.common.versions.google175418
import app.morphe.patches.google.common.versions.gemini10958859967
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

enum class HookId(val displayName: String) {
    WORK_PROFILE_BYPASS("Work Profile 制限バイパス"),
    WORK_PROFILE_ELIGIBILITY("Work Profile 利用資格"),
    MICROG_RUNTIME_PERMISSIONS("microG 初回権限要求"),
    GMS_CORE_REDIRECT("GMS 接続先リダイレクト"),
    GMS_SIGNATURE_BYPASS("GMS 可用性検証"),
    GMS_CERTIFICATE_VERIFIER("GMS 証明書検証"),
    GEMINI_TARGET_REDIRECT("Gemini 連携先"),
    SPLIT_RESTRICTION_REMOVAL("Split 制約解除"),
    APP_LABEL_UPDATE("アプリ表示名"),
    PROCESS_NAME_REDIRECT("プロセス名正規化"),
    MAIN_PROCESS_CHECK("アカウントストアのプロセス判定"),
    PACKAGE_CLONE_REDIRECT("クローンパッケージ参照"),
    ACCOUNT_SWITCH_LOCK_BYPASS("無効: アカウントロック省略"),
    ACCOUNT_SYNC_LOOP_FIX("無効: Binder 成功偽装"),
    ACCOUNT_CONVERT_FALLBACK("無効: 固定 AccountId")
}

/** Version-sensitive targets and observed constraints. Algorithms stay in patch files. */
data class TargetSpec(
    val className: String? = null,
    val methodName: String? = null,
    val methodDescriptor: String? = null,
    val fieldName: String? = null,
    val fieldType: String? = null,
    val anchorStrings: List<String> = emptyList(),
    val methodSignatures: List<String> = emptyList(),
    val expectedMatches: Int? = null,
    val integers: Map<String, Int> = emptyMap(),
    val values: Map<String, String> = emptyMap(),
    val enabled: Boolean = true,
    val description: String = ""
) {
    fun int(name: String): Int = integers.getValue(name)
    fun value(name: String): String = values.getValue(name)
    fun matches(method: MethodReference): Boolean =
        (className == null || method.definingClass == className) &&
        (methodName == null || method.name == methodName) &&
        (methodDescriptor == null || "(${method.parameterTypes.joinToString("")})${method.returnType}" == methodDescriptor)
}

data class AppVersionProfile(
    val appName: String,
    val packageName: String,
    val versionName: String,
    val versionCode: String,
    val inputSha256: Map<String, String>,
    val validation: List<String>,
    val hooks: Map<HookId, TargetSpec>
)

object VersionHookRegistry {
    // Add a new version file and register it here. Never widen a verified version to .*.
    val profiles: List<AppVersionProfile> = listOf(google175418, gemini10958859967)

    init {
        check(profiles.map { it.packageName to it.versionName }.distinct().size == profiles.size)
    }

    fun findProfile(packageName: String, versionName: String): AppVersionProfile? =
        profiles.singleOrNull { it.packageName == packageName && it.versionName == versionName }

    fun requireProfile(packageName: String, versionName: String, versionCode: String? = null): AppVersionProfile =
        (findProfile(packageName, versionName)
            ?: error("No verified hook profile for $packageName $versionName. Add a version file before patching."))
            .also {
                check(versionCode == null || it.versionCode == versionCode) {
                    "Unsupported versionCode $versionCode; expected ${it.versionCode} for ${it.versionName}"
                }
            }

    fun requireProfile(metadata: PackageMetadata): AppVersionProfile =
        requireProfile(metadata.packageName, metadata.versionName, metadata.versionCode)

    fun getTargetSpec(hookId: HookId, packageName: String, versionName: String): TargetSpec =
        requireProfile(packageName, versionName).hooks.getValue(hookId)

    fun target(hookId: HookId, metadata: PackageMetadata): TargetSpec =
        requireProfile(metadata).hooks.getValue(hookId)

    fun logHook(hookId: HookId, tier: String, status: String, detail: String = "") {
        val detailPart = if (detail.isNotEmpty()) " - $detail" else ""
        println("[HookRegistry] [${hookId.displayName}] [$tier] $status$detailPart")
    }
}
