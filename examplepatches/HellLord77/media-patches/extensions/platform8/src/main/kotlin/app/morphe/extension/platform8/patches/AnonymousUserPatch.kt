@file:JvmName("AnonymousUserPatch")

package app.morphe.extension.platform8.patches

import android.content.Context
import app.morphe.extension.shared.Utils

private const val SESSION_ID = "60194480f127015d9011475a"

@Suppress("unused")
fun onCreate() {
    val context = Utils.getContext() ?: return
    val preferences =
        context.getSharedPreferences("${context.packageName}_preferences", Context.MODE_PRIVATE)

    if ("profile_info" !in preferences) {
        preferences
            .edit()
            .apply {
                putString("profile_info", "{}")
                putString("session_id", SESSION_ID)
                Utils.showToastShort("session_id: $SESSION_ID")
            }.apply()
    }
}
