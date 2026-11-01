package patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext

internal const val EXTENSION_PATH = "extensions/waze.mpe"

context(context: BytecodePatchContext)
internal fun returnString(definingClass: String, methodName: String, value: String) {
    Fingerprint(definingClass = definingClass, name = methodName,
        returnType = "Ljava/lang/String;", parameters = emptyList()).method.addInstructions(0, """
        const-string v0, "$value"
        return-object v0
    """)
}
