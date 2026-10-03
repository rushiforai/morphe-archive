package com.rockstreamer.iscreentv.utils

abstract class PreferenceUtil {
    abstract fun getRefreshToken(): String
    abstract fun setRefreshToken(token: String)
}