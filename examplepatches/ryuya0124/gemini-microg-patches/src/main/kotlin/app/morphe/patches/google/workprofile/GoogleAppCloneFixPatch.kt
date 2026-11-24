package app.morphe.patches.google.workprofile

import app.morphe.patches.google.common.googleClonePermissionSupport
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.replaceStrings
import app.morphe.patcher.string
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry

/**
 * Google アプリ内のハードコードされたパッケージ名をクローン版（.morphe）へ置換するパッチ
 * （※プロセス名は switch 文のコンパイル時 hashCode と整合性を保つため ProcessNameSanitizePatch で正規化されます）
 */
val googleAppCloneFixPatch = bytecodePatch(
    name = "Google App Package Clone Support",
    description = "Redirects Google package and owned permission references to .morphe. Automatic Clone Setup handles package, permission and provider isolation with the default selection.",
    default = true
) {
    compatibleWith(*VersionHookRegistry.compatibility("com.google.android.googlequicksearchbox"))
    dependsOn(googleClonePermissionSupport)

    execute {
        val originalPackage = VersionHookRegistry.target(HookId.PACKAGE_CLONE_REDIRECT, packageMetadata).anchorStrings.single()
        val clonedPackage = "com.google.android.googlequicksearchbox.morphe"

        // Exact package only; process names such as ":search" keep their original values.
        // One indexed pass; only classes with a matching const-string become mutable.
        val packageReplacements = replaceStrings(string(originalPackage) to clonedPackage)

        VersionHookRegistry.logHook(
            HookId.PROCESS_NAME_REDIRECT,
            "Package",
            "SUCCESS",
            "Replaced $packageReplacements exact package occurrences"
        )
    }
}
