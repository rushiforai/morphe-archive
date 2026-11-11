@file:JvmName("AnonymousUserPatch")

package app.morphe.extension.cinematic.patches

import android.content.Context
import app.morphe.extension.shared.Utils

@Suppress("unused")
fun onCreate() {
    val context = Utils.getContext() ?: return
    val preferences = context.getSharedPreferences("CASH_DATA_CINEMATIC", Context.MODE_PRIVATE)

    if ("user_phone_no" !in preferences) {
        preferences
            .edit()
            .apply {
                putString("user_phone_no", "0")
                putString("USER_SUBSCRIPTION_STATUS", "1")
                Utils.showToastShort("user_phone_no: 0")
            }.apply()
    }
}
