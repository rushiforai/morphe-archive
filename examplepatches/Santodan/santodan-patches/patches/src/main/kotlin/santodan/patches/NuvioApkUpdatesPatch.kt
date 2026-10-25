package santodan.patches

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import software.santodan.nuvio.NuvioNative

@Suppress("unused")
val nuvioApkUpdatesPatch = bytecodePatch(
    name = "NuvioTV - GitHub APK updates",
    description = "Checks GitHub APK releases, shares native download progress and opens Android's APK installer for foreground install progress. Defaults to this bundle's version.",
    default = false,
) {
    compatibleWith(NuvioSideBySideCompatibility.create())
    extendWith { NuvioStreamPreloadPatch.extension("nuvio-apk-updates") }
    val repository = stringOption(
        key = "repository", default = "Santodan/santodan-patches",
        title = "GitHub repository", description = "Public repository in owner/name format containing APK release assets.", required = true,
    ) { it != null && it.matches(Regex("[A-Za-z0-9-]+/[A-Za-z0-9_.-]+")) }
    val releaseVersion = stringOption(
        key = "releaseVersion", default = PatchBundleVersion.VERSION,
        title = "Installed APK release version",
        description = "Version of THIS APK, matching its GitHub release tag without v. Defaults to the patch bundle version; override only if publishing the APK under a different version.",
        required = true,
    ) { it != null && NuvioApkUpdates.validVersion(it) }
    execute {
        check(packageMetadata.packageName == NuvioNative.PACKAGE_NAME && packageMetadata.versionName == NuvioNative.VERSION)
        val repo = requireNotNull(repository.value).split('/')
        NuvioApkUpdates.apply(NuvioApkUpdates.TYPES.associateWith { mutableClassDefBy(it) }, repo[0], repo[1], requireNotNull(releaseVersion.value))
        NuvioUpdateInstaller.disableMetadata(mutableClassDefBy(NuvioUpdateInstaller.INSTALLER), mutableClassDefBy(NuvioUpdateInstaller.RECEIVER))
        NuvioUpdateFlowPatch.install(
            mutableClassDefBy("Lkb/q;"), mutableClassDefBy("Lkb/b;"),
            mutableClassDefBy(NuvioUpdateInstaller.INSTALLER),
            mutableClassDefBy(NuvioUpdateFlowPatch.INSTALL_UI),
            mutableClassDefBy("Landroidx/core/content/FileProvider;"), mutableClassDefBy("Lb4/a;"),
            mutableClassDefBy("Llb/a;"),
        )
    }
}
