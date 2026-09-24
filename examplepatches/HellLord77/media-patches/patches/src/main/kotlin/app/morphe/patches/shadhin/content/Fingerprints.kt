package app.morphe.patches.shadhin.content

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object IsPaidGetterFingerprint : Fingerprint(
    definingClass = "Lcom/gm/shadhin/data/remote/api/model/MainContentModel;",
    name = "isPaid",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
)

object FetchStreamingUrlFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.ABSTRACT),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "L",
    ),
    custom = { method, _ ->
        method.annotations.flatMap { it.elements }
            .any { it.value.toString().endsWith("/streamings/url\"") }
    }
)