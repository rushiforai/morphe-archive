@file:JvmName("TempUserPatch")

package app.morphe.extension.kabbik.patches

import android.content.Context
import app.morphe.extension.shared.Utils
import org.json.JSONObject

private const val TOKEN =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9." +
        "eyJ1c2VyX2lkIjoiOTc2MCIsInJvbGUiOjEsImlhdCI6MTY3Njg3NjI3OH0." +
        "Ll1915AVcmLzRJ473jyjWo_1NIWxneFMVA8OCcWRp4k"

@Suppress("unused")
fun onCreate() {
    val context = Utils.getContext() ?: return
    val preferences = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)

    if ("flutter.loginUser" !in preferences) {
        preferences
            .edit()
            .apply {
                putString("flutter.loginUser", getLoginUser(TOKEN, 0))
                putString("flutter.isSubscribe", "1")
                Utils.showToastShort("token: $TOKEN")
            }.apply()
    }
}

@Suppress("SameParameterValue")
private fun getLoginUser(
    token: String,
    userId: Int,
) = JSONObject().put("token", token).put("user", JSONObject().put("id", userId)).toString()
