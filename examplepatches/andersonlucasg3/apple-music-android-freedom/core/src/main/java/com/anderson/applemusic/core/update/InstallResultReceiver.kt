package com.anderson.applemusic.core.update

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.pm.PackageInstaller
import android.os.Build
import android.util.Log
import kotlinx.coroutines.channels.Channel

/**
 * Result callback for the [PackageInstaller] session committed by
 * [UpdateChecker.installApk]. The system sends this after the user confirms (or cancels)
 * the install dialog, so [UpdateController] can wait before starting the next APK.
 */
class InstallResultReceiver : BroadcastReceiver() {

    companion object {
        const val ACTION_INSTALL_COMMIT =
            "com.anderson.applemusic.core.action.INSTALL_COMMIT"

        private const val TAG = "UpdateInstaller"

        /** One install at a time; [UpdateController] receives from it. */
        internal val results = Channel<InstallResult>(Channel.BUFFERED)
    }

    override fun onReceive(context: Context, intent: Intent) {
        val status = intent.getIntExtra(PackageInstaller.EXTRA_STATUS, PackageInstaller.STATUS_FAILURE)
        val message = intent.getStringExtra(PackageInstaller.EXTRA_STATUS_MESSAGE).orEmpty()
        Log.i(TAG, "resultado da instalação: status=$status mensagem=$message")

        // Not terminal: the system is asking us to open the confirmation UI. The real
        // result arrives in a later broadcast.
        if (status != PackageInstaller.STATUS_PENDING_USER_ACTION) {
            results.trySend(InstallResult(status, message))
            return
        }

        val confirm = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            intent.getParcelableExtra(Intent.EXTRA_INTENT, Intent::class.java)
        } else {
            @Suppress("DEPRECATION")
            intent.getParcelableExtra(Intent.EXTRA_INTENT)
        }
        if (confirm == null) {
            Log.w(TAG, "PENDING_USER_ACTION sem EXTRA_INTENT")
            results.trySend(InstallResult(status, "diálogo de instalação indisponível"))
            return
        }
        confirm.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        runCatching { context.startActivity(confirm) }
            .onFailure {
                Log.w(TAG, "diálogo de instalação indisponível: ${it.message}")
                results.trySend(InstallResult(status, it.message.orEmpty()))
            }
    }
}
