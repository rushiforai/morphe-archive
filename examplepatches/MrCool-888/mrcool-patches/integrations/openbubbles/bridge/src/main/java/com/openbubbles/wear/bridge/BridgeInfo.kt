package com.openbubbles.wear.bridge

import android.app.KeyguardManager
import android.content.Context
import android.os.Build
import android.os.PowerManager

object BridgeInfo {
    const val BRIDGE_VERSION = "3.1.0-dev"
    fun isOpenBubblesPackage(name: String?): Boolean = name == "com.openbubbles.messaging"
    fun isPhoneLocked(context: Context): Boolean = runCatching {
        context.getSystemService(KeyguardManager::class.java)?.isDeviceLocked == true
    }.getOrDefault(false)
    fun isPhoneAwake(context: Context): Boolean = runCatching {
        context.getSystemService(PowerManager::class.java)?.isInteractive == true
    }.getOrDefault(true)
    @JvmStatic fun shouldAlertWatch(context: Context): Boolean = runCatching {
        val power = context.getSystemService(PowerManager::class.java) ?: return false
        val keyguard = context.getSystemService(KeyguardManager::class.java) ?: return false
        !power.isInteractive || keyguard.isKeyguardLocked
    }.getOrDefault(false)
    fun phoneName(): String = listOf(Build.MANUFACTURER.orEmpty(), Build.MODEL.orEmpty())
        .filter { it.isNotBlank() }.joinToString(" ").ifBlank { "Android phone" }
}
