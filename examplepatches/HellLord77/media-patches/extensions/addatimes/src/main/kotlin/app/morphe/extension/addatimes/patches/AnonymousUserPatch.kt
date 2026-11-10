@file:JvmName("AnonymousUserPatch")

package app.morphe.extension.addatimes.patches

import android.content.Context
import app.morphe.extension.shared.Utils

@Suppress("unused")
fun onCreate() {
    val context = Utils.getContext() ?: return
    val preferences = context.getSharedPreferences("addatimes", Context.MODE_PRIVATE)

    if ("login_status" !in preferences) {
        preferences
            .edit()
            .apply {
                putBoolean("login_status", true)
                Utils.showToastShort("login_status: true")
            }.apply()
    }
}
