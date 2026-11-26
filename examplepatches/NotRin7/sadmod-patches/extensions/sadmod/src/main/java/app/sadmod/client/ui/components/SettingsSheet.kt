package app.sadmod.client.ui.components

import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.rounded.DeleteSweep
import androidx.compose.material.icons.rounded.Refresh
import androidx.compose.material.icons.rounded.Settings
import androidx.compose.material3.Button
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FilterChip
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.SegmentedButton
import androidx.compose.material3.SegmentedButtonDefaults
import androidx.compose.material3.SingleChoiceSegmentedButtonRow
import androidx.compose.material3.Switch
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.unit.dp
import app.sadmod.client.data.prefs.AppLanguage
import app.sadmod.client.data.prefs.ProxyMode
import app.sadmod.client.data.prefs.UserSettings
import app.sadmod.client.ui.ConnectionTestState
import app.sadmod.client.ui.i18n.LocalStrings

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SettingsSheet(
    settings: UserSettings,
    connectionTestState: ConnectionTestState,
    storageCount: Int,
    storageBytes: Long,
    onLanguageChange: (AppLanguage) -> Unit,
    onDohChange: (Boolean) -> Unit,
    onProxyChange: (ProxyMode, String, Int) -> Unit,
    onTestConnection: () -> Unit,
    onRotateId: () -> Unit,
    onSaveHistoryChange: (Boolean) -> Unit,
    onCustomApiChange: (String) -> Unit,
    onClearDownloads: () -> Unit,
    onDismiss: () -> Unit
) {
    val strings = LocalStrings.current
    var hostInput by remember(settings.proxyHost) { mutableStateOf(settings.proxyHost) }
    var portInput by remember(settings.proxyPort) { mutableStateOf(settings.proxyPort.toString()) }
    var customBaseInput by remember(settings.customApiBase) { mutableStateOf(settings.customApiBase) }

    ModalBottomSheet(onDismissRequest = onDismiss) {
        Column(
            verticalArrangement = Arrangement.spacedBy(14.dp),
            modifier = Modifier
                .verticalScroll(rememberScrollState())
                .padding(start = 20.dp, end = 20.dp, bottom = 32.dp)
        ) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    imageVector = Icons.Rounded.Settings,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary
                )
                Spacer(modifier = Modifier.width(10.dp))
                Text(text = strings.settingsTitle, style = MaterialTheme.typography.titleLarge)
            }

            // Language Picker
            Text(text = strings.languageSection, style = MaterialTheme.typography.titleMedium)
            val langOptions = listOf(
                AppLanguage.SYSTEM to strings.langSystem,
                AppLanguage.EN to strings.langEnglish,
                AppLanguage.DE to strings.langGerman
            )
            SingleChoiceSegmentedButtonRow(modifier = Modifier.fillMaxWidth()) {
                langOptions.forEachIndexed { idx, (lang, label) ->
                    SegmentedButton(
                        selected = settings.language == lang,
                        onClick = { onLanguageChange(lang) },
                        shape = SegmentedButtonDefaults.itemShape(idx, langOptions.size)
                    ) {
                        Text(label, maxLines = 1, softWrap = false)
                    }
                }
            }

            HorizontalDivider()

            // Network & Anonymity
            Text(text = strings.networkSection, style = MaterialTheme.typography.titleMedium)

            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(text = strings.dohTitle, style = MaterialTheme.typography.bodyLarge)
                    Text(
                        text = strings.dohDesc,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Spacer(modifier = Modifier.width(12.dp))
                Switch(
                    checked = settings.dohEnabled,
                    onCheckedChange = onDohChange,
                    enabled = settings.proxyMode == ProxyMode.NONE
                )
            }

            Text(text = strings.proxyLabel, style = MaterialTheme.typography.labelLarge)
            val proxyOptions = listOf(
                ProxyMode.NONE to strings.proxyDirect,
                ProxyMode.TOR_ORBOT to strings.proxyTor,
                ProxyMode.CUSTOM_SOCKS5 to strings.proxySocks5,
                ProxyMode.CUSTOM_HTTP to strings.proxyHttp
            )
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                modifier = Modifier.horizontalScroll(rememberScrollState())
            ) {
                proxyOptions.forEach { (mode, label) ->
                    FilterChip(
                        selected = settings.proxyMode == mode,
                        onClick = {
                            val p = portInput.toIntOrNull() ?: 9050
                            onProxyChange(mode, hostInput, p)
                        },
                        label = { Text(label, maxLines = 1, softWrap = false) }
                    )
                }
            }

            if (settings.proxyMode == ProxyMode.CUSTOM_SOCKS5 || settings.proxyMode == ProxyMode.CUSTOM_HTTP) {
                Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                    OutlinedTextField(
                        value = hostInput,
                        onValueChange = {
                            hostInput = it
                            val p = portInput.toIntOrNull() ?: 9050
                            onProxyChange(settings.proxyMode, it, p)
                        },
                        label = { Text(strings.proxyHostLabel) },
                        singleLine = true,
                        modifier = Modifier.weight(2f)
                    )
                    OutlinedTextField(
                        value = portInput,
                        onValueChange = {
                            portInput = it
                            it.toIntOrNull()?.let { p -> onProxyChange(settings.proxyMode, hostInput, p) }
                        },
                        label = { Text(strings.proxyPortLabel) },
                        singleLine = true,
                        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
                        modifier = Modifier.weight(1f)
                    )
                }
            }

            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(10.dp),
                modifier = Modifier.fillMaxWidth()
            ) {
                OutlinedButton(
                    onClick = onTestConnection,
                    enabled = connectionTestState !is ConnectionTestState.Testing
                ) {
                    if (connectionTestState is ConnectionTestState.Testing) {
                        CircularProgressIndicator(strokeWidth = 2.dp, modifier = Modifier.size(16.dp))
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(strings.testingConnection)
                    } else {
                        Text(strings.testConnection)
                    }
                }
                when (connectionTestState) {
                    is ConnectionTestState.Success -> Text(
                        text = strings.connectionOk(connectionTestState.latencyMs),
                        style = MaterialTheme.typography.labelLarge,
                        color = MaterialTheme.colorScheme.primary
                    )
                    is ConnectionTestState.Error -> Text(
                        text = strings.connectionErr(connectionTestState.message),
                        style = MaterialTheme.typography.labelMedium,
                        color = MaterialTheme.colorScheme.error
                    )
                    else -> Unit
                }
            }

            // Ephemeral Session ID
            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(text = strings.anonIdLabel, style = MaterialTheme.typography.bodyLarge)
                    val uid = settings.sessionUid
                    val masked = if (uid.length > 10) "${uid.take(6)}…${uid.takeLast(6)}" else uid
                    Text(
                        text = masked,
                        style = MaterialTheme.typography.labelMedium.copy(fontFamily = FontFamily.Monospace),
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                OutlinedButton(onClick = onRotateId) {
                    Icon(Icons.Rounded.Refresh, contentDescription = null, modifier = Modifier.size(16.dp))
                    Spacer(modifier = Modifier.width(6.dp))
                    Text(strings.rotateId)
                }
            }

            // Search History opt-in
            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(text = strings.saveHistoryTitle, style = MaterialTheme.typography.bodyLarge)
                    Text(
                        text = strings.saveHistoryDesc,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Spacer(modifier = Modifier.width(12.dp))
                Switch(
                    checked = settings.saveSearchHistory,
                    onCheckedChange = onSaveHistoryChange
                )
            }

            OutlinedTextField(
                value = customBaseInput,
                onValueChange = {
                    customBaseInput = it
                    onCustomApiChange(it)
                },
                label = { Text(strings.customEndpointLabel) },
                placeholder = { Text(strings.customEndpointHint) },
                singleLine = true,
                modifier = Modifier.fillMaxWidth()
            )

            HorizontalDivider()

            // Storage
            Text(text = strings.storageSection, style = MaterialTheme.typography.titleMedium)
            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(
                    text = strings.storageStats(storageCount, formatBytes(storageBytes)),
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    modifier = Modifier.weight(1f)
                )
                Button(
                    onClick = onClearDownloads,
                    enabled = storageCount > 0
                ) {
                    Icon(Icons.Rounded.DeleteSweep, contentDescription = null, modifier = Modifier.size(18.dp))
                    Spacer(modifier = Modifier.width(6.dp))
                    Text(strings.clearDownloads)
                }
            }

            Spacer(modifier = Modifier.height(8.dp))
        }
    }
}
