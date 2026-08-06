package com.p1.mobile.putong.data

import android.util.Log

object MorphDebug {
    private const val TAG = "MORPH_DEBUG"

    @JvmStatic
    var DEBUG = true

    @JvmStatic
    fun log(message: String) {
        if (DEBUG) {
            Log.d(TAG, message)
        }
    }

    @JvmStatic
    fun logAndReturnFalse(message: String): Boolean {
        log(message)
        return false
    }

    @JvmStatic
    fun logAndReturnTrue(message: String): Boolean {
        log(message)
        return true
    }

    @JvmStatic
    fun logAndReturnNull(message: String): Any? {
        log(message)
        return null
    }
}
