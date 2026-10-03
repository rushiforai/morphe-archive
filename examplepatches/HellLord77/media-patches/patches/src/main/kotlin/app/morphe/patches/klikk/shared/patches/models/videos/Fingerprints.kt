package app.morphe.patches.klikk.shared.patches.models.videos

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

internal object IsPaidFingerprint : Fingerprint(
    definingClass = "Lcom/angel/klikk/models/Videos;",
    name = "isPaid",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.BOOLEAN,
    parameters = emptyList(),
)

internal object IsSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/angel/klikk/models/Videos;",
    name = "isSubscribed",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.BOOLEAN,
    parameters = emptyList(),
)