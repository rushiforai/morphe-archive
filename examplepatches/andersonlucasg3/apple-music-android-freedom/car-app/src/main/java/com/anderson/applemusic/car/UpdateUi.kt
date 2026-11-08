package com.anderson.applemusic.car

import androidx.activity.compose.BackHandler
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.anderson.applemusic.core.update.UpdatePhase
import com.anderson.applemusic.core.update.UpdateUiState

/** Top-bar entry point for the updater, next to "Entrar na conta". */
@Composable
internal fun UpdatesButton(onClick: () -> Unit, compact: Boolean = false) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Row(
        modifier = Modifier
            .height(48.dp)
            .clip(RoundedCornerShape(ControlRadius))
            .background(if (pressed) CardColor else Color.Transparent)
            .clickable(interactionSource = interaction, indication = null, onClick = onClick)
            .padding(horizontal = 12.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Text(
            // The phone in landscape is ~780 dp wide: the short label keeps both quiet
            // top-bar entries complete instead of clipped.
            text = if (compact) "Atualizações" else "Verificar atualizações",
            color = if (pressed) TextPrimary else TextSecondary,
            fontSize = 13.sp,
            fontWeight = FontWeight.Normal,
            maxLines = 1,
        )
    }
}

/**
 * Modal shown for every updater phase. The system install dialog sits above it, so the
 * overlay only carries the download progress and the engine-then-app explanation.
 */
@Composable
internal fun UpdateOverlay(
    state: UpdateUiState,
    currentVersionName: String,
    onInstall: () -> Unit,
    onCancel: () -> Unit,
    onDismiss: () -> Unit,
) {
    if (state.phase == UpdatePhase.IDLE) return

    val dismissible = state.phase != UpdatePhase.DOWNLOADING &&
        state.phase != UpdatePhase.INSTALLING
    BackHandler(enabled = dismissible) { onDismiss() }

    Box(
        modifier = Modifier.fillMaxSize().background(Color.Black.copy(alpha = 0.78f)),
        contentAlignment = Alignment.Center,
    ) {
        Column(
            modifier = Modifier
                .widthIn(max = 480.dp)
                .clip(RoundedCornerShape(CardRadius))
                .background(CardColor)
                .padding(24.dp),
        ) {
            when (state.phase) {
                UpdatePhase.CHECKING -> {
                    Title("Verificando atualizações…")
                    Body("Consultando a última release no GitHub.")
                    ButtonsRow {
                        DialogButton("Cancelar", primary = false, onClick = onCancel)
                    }
                }

                UpdatePhase.UP_TO_DATE -> {
                    Title("Tudo em dia")
                    Body("Você já está na versão mais recente (Apple Music $currentVersionName).")
                    ButtonsRow {
                        DialogButton("OK", primary = true, onClick = onDismiss)
                    }
                }

                UpdatePhase.AVAILABLE -> {
                    val plan = state.plan
                    Title("Atualização ${plan?.info?.version.orEmpty()} disponível")
                    Body(
                        "Instalada: $currentVersionName. Nova: " +
                            plan?.info?.version.orEmpty() + ".",
                    )
                    Spacer(Modifier.height(8.dp))
                    plan?.steps?.forEach { step ->
                        Body(
                            "• ${step.label} — ${formatSize(step.asset.size)}" +
                                if (step.engine) " (engine, instalado primeiro)" else "",
                        )
                    }
                    if ((plan?.steps?.size ?: 0) > 1) {
                        Spacer(Modifier.height(6.dp))
                        Body("O engine é atualizado primeiro; o sistema pede confirmação para cada APK.")
                    }
                    ButtonsRow {
                        DialogButton("Atualizar", primary = true, onClick = onInstall)
                        DialogButton("Depois", primary = false, onClick = onDismiss)
                    }
                }

                UpdatePhase.DOWNLOADING -> {
                    val plan = state.plan
                    val step = plan?.steps?.getOrNull(state.stepIndex)
                    Title("Baixando atualização")
                    Body(
                        buildString {
                            append(step?.label.orEmpty())
                            step?.let { append(" — ${formatSize(it.asset.size)}") }
                            if (plan != null) append(" (${state.stepIndex + 1}/${plan.steps.size})")
                        },
                    )
                    Spacer(Modifier.height(16.dp))
                    ProgressBar(state.progress)
                    Spacer(Modifier.height(8.dp))
                    Body(if (state.progress >= 0) "${state.progress}%" else "Baixando…")
                    ButtonsRow {
                        DialogButton("Cancelar", primary = false, onClick = onCancel)
                    }
                }

                UpdatePhase.INSTALLING -> {
                    Title("Confirme a instalação")
                    Body("O Android abriu o diálogo do sistema. Toque em “Instalar” para concluir.")
                    val plan = state.plan
                    if (plan != null && plan.steps.size > 1 && state.stepIndex == 0) {
                        Spacer(Modifier.height(6.dp))
                        Body("Depois do engine, o app continua e instala ${plan.steps[1].label}.")
                    }
                }

                UpdatePhase.DONE -> {
                    Title("Atualização instalada")
                    Body("O app foi atualizado. Feche e abra novamente se ele não reiniciar sozinho.")
                    ButtonsRow {
                        DialogButton("Fechar", primary = true, onClick = onDismiss)
                    }
                }

                UpdatePhase.ERROR -> {
                    Title("Não foi possível atualizar")
                    Body(state.message ?: "Falha ao verificar, baixar ou instalar a atualização.")
                    ButtonsRow {
                        DialogButton("Fechar", primary = true, onClick = onDismiss)
                    }
                }

                UpdatePhase.IDLE -> Unit
            }
        }
    }
}

@Composable
private fun Title(text: String) {
    Text(
        text = text,
        color = TextPrimary,
        fontSize = 21.sp,
        fontWeight = FontWeight.Bold,
        modifier = Modifier.fillMaxWidth(),
    )
    Spacer(Modifier.height(6.dp))
}

@Composable
private fun Body(text: String) {
    Text(
        text = text,
        color = TextSecondary,
        fontSize = 14.sp,
        modifier = Modifier.fillMaxWidth(),
    )
}

@Composable
private fun ButtonsRow(content: @Composable () -> Unit) {
    Spacer(Modifier.height(20.dp))
    Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) { content() }
}

@Composable
private fun ProgressBar(progress: Int) {
    val fraction = progress.coerceIn(0, 100) / 100f
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(6.dp)
            .clip(RoundedCornerShape(3.dp))
            .background(TrackColor),
    ) {
        Box(Modifier.fillMaxWidth(fraction).height(6.dp).background(Accent))
    }
}

@Composable
private fun DialogButton(text: String, primary: Boolean, onClick: () -> Unit) {
    Box(
        modifier = Modifier
            .height(44.dp)
            .clip(RoundedCornerShape(50))
            .background(if (primary) Accent else CardColorPressed)
            .clickable(onClick = onClick)
            .padding(horizontal = 24.dp),
        contentAlignment = Alignment.Center,
    ) {
        Text(
            text = text,
            color = TextPrimary,
            fontSize = 15.sp,
            fontWeight = FontWeight.SemiBold,
        )
    }
}

private fun formatSize(bytes: Long): String =
    if (bytes <= 0) "tamanho desconhecido" else "%.1f MB".format(bytes / (1024.0 * 1024.0))
