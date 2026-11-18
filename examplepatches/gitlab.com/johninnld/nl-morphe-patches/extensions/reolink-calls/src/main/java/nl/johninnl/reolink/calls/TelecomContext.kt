package nl.johninnl.reolink.calls

import android.content.Context
import android.content.ContextWrapper
import android.content.res.Resources

/** extendWith injects library bytecode, not its AAR resources. Scope its three route labels here. */
internal class TelecomContext(private val original: Context) : ContextWrapper(original) {
    private val routes = object : Resources(original.assets, original.resources.displayMetrics, original.resources.configuration) {
        override fun getString(id: Int): String {
            val dutch = original.resources.configuration.locales[0].language == "nl"
            return when (id) {
                androidx.core.telecom.R.string.callendpoint_name_earpiece -> if (dutch) "Telefoon" else "Earpiece"
                androidx.core.telecom.R.string.callendpoint_name_speaker -> if (dutch) "Luidspreker" else "Speaker"
                androidx.core.telecom.R.string.callendpoint_name_wiredheadset -> if (dutch) "Bedrade headset" else "Wired headset"
                else -> original.resources.getString(id)
            }
        }
    }
    override fun getResources(): Resources = routes
    override fun getApplicationContext(): Context = this
}
