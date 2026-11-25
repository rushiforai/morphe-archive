package patches.candysoda

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.originalInput

internal val candySoda = Compatibility(
    name = "Candy Crush Soda Saga", packageName = "com.king.candycrushsodasaga",
    apkFileType = ApkFileType.APKM,
    signatures = setOf("ac7f3b3537e8e6797be7270fa4f9f6a2414e660f51a86efd47c75f00603bc328"),
    targets = listOf(AppTarget(version = "1.330.1", versionCode = 13300010, minSdk = 32)),
)

internal val originalInput = originalInput(candySoda)
