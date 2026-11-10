@file:Suppress("PackageNaming", "ktlint:standard:package-name")

package app.morphe.patches.bongobd.shared.moprhe.com.bongo.bongobd.view.model2.version_chek

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

object VersionCheckRsp {
    override fun toString() = "Lcom/bongo/bongobd/view/model2/version_chek/VersionCheckRsp;"

    object GetForceUpdateFingerprint : Fingerprint(
        definingClass = VersionCheckRsp.toString(),
        name = "getForceUpdate",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = Type.boolean,
        parameters = emptyList(),
    )
}
