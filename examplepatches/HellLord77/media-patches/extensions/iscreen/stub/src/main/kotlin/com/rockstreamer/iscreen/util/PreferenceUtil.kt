package com.rockstreamer.iscreen.util

abstract class PreferenceUtil {
    abstract fun getRefreshToken(): String
    abstract fun setRefreshToken(token: String)
}