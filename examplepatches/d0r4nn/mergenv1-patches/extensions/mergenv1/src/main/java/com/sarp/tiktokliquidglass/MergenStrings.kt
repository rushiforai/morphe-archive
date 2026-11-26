package com.sarp.tiktokliquidglass

import android.content.Context
import java.util.Locale
import java.util.TimeZone

/**
 * Automatic English (default) / Turkish (Turkey) string resolver.
 * Uses Turkish when the device language/country is TR or the timezone is Turkey;
 * defaults to English for all other regions.
 */
object MergenStrings {

    fun isTurkish(context: Context? = null): Boolean {
        if (context != null) {
            when (MergenPrefs.getLanguageOverride(context)) {
                1 -> return false
                2 -> return true
            }
        }
        val locale = context?.resources?.configuration?.locales?.let {
            if (it.size() > 0) it[0] else null
        } ?: Locale.getDefault()

        if (locale.language.equals("tr", ignoreCase = true) ||
            locale.country.equals("TR", ignoreCase = true)
        ) {
            return true
        }
        val tzId = TimeZone.getDefault().id
        return tzId == "Europe/Istanbul" || tzId == "Asia/Istanbul" || tzId == "Turkey"
    }

    fun t(context: Context?, tr: String, en: String): String =
        if (isTurkish(context)) tr else en
}
