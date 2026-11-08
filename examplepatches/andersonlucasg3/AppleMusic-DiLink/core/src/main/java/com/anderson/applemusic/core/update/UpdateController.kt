package com.anderson.applemusic.core.update

import android.content.Context
import android.content.pm.PackageInstaller
import android.util.Log
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import kotlinx.coroutines.withTimeoutOrNull
import java.io.File

/**
 * Drives the update flow for one companion app: check on demand, download with progress,
 * verify, then hand each APK to the system installer (engine first, companion last).
 *
 * UI-agnostic: exposes [state] and never blocks the caller; all work runs in [scope],
 * which the Compose screen cancels when it leaves the composition.
 */
class UpdateController(
    context: Context,
    private val artifact: String,
    private val currentVersionCode: Long,
) {
    private companion object {
        private const val TAG = "UpdateController"
        private const val INSTALL_TIMEOUT_MS = 10L * 60L * 1000L
    }

    private val checker = UpdateChecker(context)
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.Main.immediate)
    private val _state = MutableStateFlow(UpdateUiState())
    val state: StateFlow<UpdateUiState> = _state.asStateFlow()

    private var job: Job? = null

    /** [force] is the "Verificar atualizações" button; otherwise the 24 h throttle applies. */
    fun check(force: Boolean) {
        if (job?.isActive == true) return
        if (!force && !checker.shouldCheckNow()) {
            Log.i(TAG, "checagem ignorada (throttle de 24 h)")
            return
        }
        job = scope.launch {
            _state.value = UpdateUiState(phase = UpdatePhase.CHECKING)
            try {
                val plan = checker.check(currentVersionCode, artifact)
                checker.markChecked()
                _state.value = if (plan == null) {
                    UpdateUiState(phase = UpdatePhase.UP_TO_DATE)
                } else {
                    UpdateUiState(phase = UpdatePhase.AVAILABLE, plan = plan)
                }
                Log.i(TAG, if (plan == null) "sem atualização" else "atualização ${plan.info.version} disponível")
            } catch (e: CancellationException) {
                throw e
            } catch (e: Exception) {
                _state.value = UpdateUiState(
                    phase = UpdatePhase.ERROR,
                    message = e.message ?: "Falha ao verificar atualizações",
                )
                Log.w(TAG, "falha ao verificar atualizações", e)
            }
        }
    }

    /** Downloads and installs every step of the current plan, in order. */
    fun downloadAndInstall() {
        val plan = _state.value.plan ?: return
        if (job?.isActive == true) return
        job = scope.launch {
            try {
                for ((index, step) in plan.steps.withIndex()) {
                    _state.update {
                        it.copy(
                            phase = UpdatePhase.DOWNLOADING,
                            progress = 0,
                            stepIndex = index,
                            message = null,
                        )
                    }
                    val dest = File(checker.downloadDir(), step.asset.name)
                    checker.downloadApk(step.asset, dest) { progress ->
                        _state.update { it.copy(progress = progress) }
                    }

                    _state.update { it.copy(phase = UpdatePhase.INSTALLING) }
                    checker.installApk(dest)
                    val result = withTimeoutOrNull(INSTALL_TIMEOUT_MS) {
                        InstallResultReceiver.results.receive()
                    }
                    if (result == null) {
                        throw IllegalStateException("Tempo esgotado aguardando a instalação")
                    }
                    if (result.status != PackageInstaller.STATUS_SUCCESS) {
                        throw IllegalStateException(installFailure(result))
                    }
                    Log.i(TAG, "${step.asset.name} instalado")
                }
                _state.update { it.copy(phase = UpdatePhase.DONE) }
            } catch (e: CancellationException) {
                throw e
            } catch (e: Exception) {
                _state.update {
                    it.copy(
                        phase = UpdatePhase.ERROR,
                        message = e.message ?: "Falha ao baixar ou instalar a atualização",
                    )
                }
                Log.w(TAG, "falha no update", e)
            }
        }
    }

    fun cancel() {
        job?.cancel()
        job = null
        _state.update {
            if (it.plan == null) {
                UpdateUiState()
            } else {
                it.copy(phase = UpdatePhase.AVAILABLE, progress = 0, stepIndex = 0, message = null)
            }
        }
    }

    /** "Depois" / close button. */
    fun dismiss() {
        if (job?.isActive == true) {
            job?.cancel()
            job = null
        }
        _state.value = UpdateUiState()
    }

    fun close() {
        scope.cancel()
    }

    private fun installFailure(result: InstallResult): String = when (result.status) {
        PackageInstaller.STATUS_FAILURE_ABORTED -> "Instalação cancelada."
        PackageInstaller.STATUS_FAILURE_BLOCKED ->
            "O sistema bloqueou a instalação. Autorize “instalar apps desconhecidos” " +
                "para o Apple Music e tente de novo."
        PackageInstaller.STATUS_FAILURE_STORAGE -> "Sem espaço suficiente para instalar a atualização."
        PackageInstaller.STATUS_FAILURE_INCOMPATIBLE -> "O APK não é compatível com este dispositivo."
        else -> buildString {
            append("Não foi possível instalar a atualização")
            if (result.message.isNotBlank()) append(": ").append(result.message)
        }
    }
}
