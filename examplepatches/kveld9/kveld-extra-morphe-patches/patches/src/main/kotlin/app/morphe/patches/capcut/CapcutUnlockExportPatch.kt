package app.morphe.patches.capcut

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.replaceWithReturnBoolean
import com.android.tools.smali.dexlib2.AccessFlags

private object TemplateExportUltraHdUtilsCFingerprint : Fingerprint(
    definingClass = "Lcom/vega/edit/base/utils/TemplateExportUltraHdUtils;",
    name = "c",
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

private object TemplateExportUltraHdUtilsDFingerprint : Fingerprint(
    definingClass = "Lcom/vega/edit/base/utils/TemplateExportUltraHdUtils;",
    name = "d",
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

private object TemplateExportUltraHdUtilsEFingerprint : Fingerprint(
    definingClass = "Lcom/vega/edit/base/utils/TemplateExportUltraHdUtils;",
    name = "e",
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

private object TemplateExportUltraHdUtilsJFingerprint : Fingerprint(
    definingClass = "Lcom/vega/edit/base/utils/TemplateExportUltraHdUtils;",
    name = "j",
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

private object TemplateExportUltraHdUtilsQFingerprint : Fingerprint(
    definingClass = "Lcom/vega/edit/base/utils/TemplateExportUltraHdUtils;",
    name = "q",
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

@Suppress("unused")
val capcutUnlockExportPatch = bytecodePatch(
    name = "Unlock Ultra HD Export",
    description = "Forces CapCut Ultra HD / high-resolution export gates to unlocked so 4K export options stay available.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_CAPCUT)

    execute {
        var patched = 0

        TemplateExportUltraHdUtilsCFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        TemplateExportUltraHdUtilsDFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        TemplateExportUltraHdUtilsEFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        TemplateExportUltraHdUtilsJFingerprint.method.replaceWithReturnBoolean(true)
        patched++
        TemplateExportUltraHdUtilsQFingerprint.method.replaceWithReturnBoolean(true)
        patched++

        println("[Unlock Ultra HD Export] Applied $patched hooks -> ultra HD export gates forced to unlocked.")
    }
}
