package patches.monet

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef

private val monet = Compatibility(
    name = "Monet Android TV", packageName = "com.klevico.monet", apkFileType = ApkFileType.APK,
    formFactor = FormFactor.TV,
    signatures = setOf("4bec386a6baae56f0694d3be54f67e0625b973109e0dbb947df2a5d0254975e0"),
    targets = listOf(AppTarget(version = "1.1.0", versionCode = 134, minSdk = 26)),
)
private val originalInput = patches.shared.originalInput(monet)

@Suppress("unused")
val wuplayCatalogRows = bytecodePatch(
    name = "Individual Wuplay catalog rows",
    description = "Choose individual published Wuplay catalogs in Monet's Content picker, with Wuplay icons " +
        "and refresh independent of Recommendations. Requires Wuplay's catalog publisher.",
    default = false,
) {
    compatibleWith(monet)
    dependsOn(originalInput)
    extendWith("extensions/monet-wuplay.mpe")
    execute {
        val classes = mutableListOf<ClassDef>()
        classDefForEach { classes.add(it) }
        val contracts = MonetWuplayHooks.validate(classes)
        for (signature in MonetWuplayHooks.TARGETS) {
            val original = contracts.getValue(signature)
            val method = mutableClassDefBy(original.definingClass).methods.single { it == original }
            MonetWuplayHooks.apply(method)
        }
    }
}
