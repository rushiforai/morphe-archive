package app.morphe.patches.bongobd.shared.moprhe.com.bongo.bongobd.view.model.pages

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

object PageModelExtensionsKt {
    override fun toString() = "Lcom/bongo/bongobd/view/model/pages/PageModelExtensionsKt;"

    object IsPaidFingerprint : Fingerprint(
        definingClass = PageModelExtensionsKt.toString(),
        name = "isPaid",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
        returnType = Type.boolean,
        parameters = listOf(ContentItem.toString()),
    )
}
