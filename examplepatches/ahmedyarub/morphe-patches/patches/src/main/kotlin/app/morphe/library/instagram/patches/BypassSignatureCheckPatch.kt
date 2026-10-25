package app.morphe.library.instagram.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchBuilder
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object IsValidSignatureMethodFingerprint : Fingerprint (
    Fingerprint(
        strings = listOf("The provider for uri '", "' is not trusted: ")
    ),
    parameters = listOf("L", "Z"),
    returnType = "Z",
    custom = { method, _ ->
        method.indexOfFirstInstruction {
            getReference<MethodReference>()?.name == "keySet"
        } >= 0
    }
)


@Suppress("unused")
fun bypassSignatureCheckPatch(
    name: String = "Bypass signature check",
    description: String? = null,
    default: Boolean,

    block: BytecodePatchBuilder.() -> Unit
) = bytecodePatch(
    name = name,
    description = description,
    default = default
) {
    block(this)

    execute {
        IsValidSignatureMethodFingerprint.method.returnEarly(true)
    }
}

