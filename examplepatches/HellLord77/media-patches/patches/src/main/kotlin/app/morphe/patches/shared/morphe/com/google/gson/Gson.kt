package app.morphe.patches.shared.morphe.com.google.gson

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.morphe.java.lang.Class
import app.morphe.patches.shared.morphe.java.lang.Object
import app.morphe.patches.shared.morphe.java.lang.String
import com.android.tools.smali.dexlib2.AccessFlags

object Gson {
    override fun toString() = "Lcom/google/gson/Gson;"

    object FromJsonFingerprint : Fingerprint(
        definingClass = Gson.toString(),
        name = "fromJson",
        accessFlags = listOf(AccessFlags.PUBLIC),
        returnType = Object.toString(),
        parameters = listOf(String.toString(), Class.toString()),
    )
}
