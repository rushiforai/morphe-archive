package app.morphe.patches.shadhin.content

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

object IsPaidGetterFingerprint : Fingerprint(
    definingClass = "Lcom/gm/shadhin/data/remote/api/model/MainContentModel;",
    name = "isPaid",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = Type.boolean,
    parameters = emptyList(),
)

object FetchStreamingUrlFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.ABSTRACT),
    returnType = Type.OBJECT,
    parameters = listOf(Type.STRING, Type.STRING, Type.STRING, "L"),
    custom = { method, _ ->
        method.annotations.flatMap { it.elements }
            .any { it.value.toString().endsWith("/streamings/url\"") }
    }
)