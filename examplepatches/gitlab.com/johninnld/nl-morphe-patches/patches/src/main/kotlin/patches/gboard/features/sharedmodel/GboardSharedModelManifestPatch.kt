package patches.gboard.features.sharedmodel

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.Constants.COMPATIBILITY_GBOARD
import patches.gboard.shared.*

internal val gboardSharedModelManifestPatch=resourcePatch(description="Add private provider installation UI and grant-only APK transport.") {
    compatibleWith(COMPATIBILITY_GBOARD)
    finalize {
        document("AndroidManifest.xml").use{document->
            val manifest=document.documentElement
            val application=manifest.childElements("application").single()
            ensureManifestMetaData(document,application,"dev.jason.gboardpatches.feature.shared_local_model","true")
            ensureManifestUsesPermission(document,manifest,"android.permission.REQUEST_INSTALL_PACKAGES")
            ensureManifestUsesPermission(document,manifest,"android.permission.FOREGROUND_SERVICE")
            ensureManifestUsesPermission(document,manifest,"android.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION")
            val capture=ensureManifestComponent(document,application,"activity","dev.jason.gboardpatches.extension.sharedmodel.SharedScreenCaptureActivity")
            capture.setManifestAndroidAttribute("exported","false")
            val captureService=ensureManifestComponent(document,application,"service","dev.jason.gboardpatches.extension.sharedmodel.SharedScreenCaptureActivity\$CaptureService")
            captureService.setManifestAndroidAttribute("exported","false")
            captureService.setManifestAndroidAttribute("foregroundServiceType","mediaProjection")
            val activity=ensureManifestComponent(document,application,"activity","dev.jason.gboardpatches.extension.sharedmodel.SharedModelSetupActivity")
            activity.setManifestAndroidAttribute("exported","false")
            ensureManifestComponent(document,application,"activity","dev.jason.gboardpatches.extension.sharedmodel.SharedWritingContextActivity").setManifestAndroidAttribute("exported","false")
            ensureManifestComponent(document,application,"activity","dev.jason.gboardpatches.extension.sharedmodel.SharedImageInputActivity").setManifestAndroidAttribute("exported","false")
            val provider=ensureManifestComponent(document,application,"provider","app.johninnl.modelhost.api.ProviderApkProvider")
            provider.setManifestAndroidAttribute("authorities",manifest.getAttribute("package")+".local-model-host-apks")
            provider.setManifestAndroidAttribute("exported","false")
            provider.setManifestAndroidAttribute("grantUriPermissions","true")
            val queries=manifest.childElements("queries").firstOrNull()?:document.createElement("queries").also{manifest.insertBefore(it,application)}
            val existing=queries.childElements("package").any{it.manifestAndroidAttribute("name")=="app.johninnl.modelhost"}
            if(!existing)document.createElement("package").apply{setManifestAndroidAttribute("name","app.johninnl.modelhost");queries.appendChild(this)}
        }
        // Populate only from a sealed, real signed provider artifact. Missing metadata keeps install UI explicitly unavailable.
        val release=object {}.javaClass.classLoader.getResourceAsStream("gboard/model-host-release.json")?.use{it.readBytes()}
        if(release!=null){val file=this["assets/morphe/model-host-release.json",false];file.parentFile.mkdirs();file.writeBytes(release)}
    }
}
