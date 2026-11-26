package app.sadmod.client.ui.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.rounded.Close
import androidx.compose.material.icons.rounded.ContentCopy
import androidx.compose.material.icons.rounded.DeleteOutline
import androidx.compose.material.icons.rounded.DownloadDone
import androidx.compose.material.icons.rounded.GppBad
import androidx.compose.material.icons.rounded.GppGood
import androidx.compose.material.icons.rounded.GppMaybe
import androidx.compose.material.icons.rounded.InstallMobile
import androidx.compose.material.icons.rounded.Refresh
import androidx.compose.material.icons.rounded.Restore
import androidx.compose.material.icons.rounded.Security
import androidx.compose.material.icons.rounded.Settings
import androidx.compose.material.icons.rounded.Tune
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Checkbox
import androidx.compose.material3.ElevatedCard
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FilledTonalButton
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateMapOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.platform.LocalClipboardManager
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.AnnotatedString
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import app.sadmod.client.data.download.ApkInstaller
import app.sadmod.client.data.download.ApkSecurityScanner
import app.sadmod.client.data.model.ApkSecurityReport
import app.sadmod.client.data.model.DownloadStatus
import app.sadmod.client.data.model.DownloadTask
import app.sadmod.client.data.model.SecurityRiskLevel
import app.sadmod.client.ui.components.AuroraAppIcon
import app.sadmod.client.ui.components.formatBytes
import app.sadmod.client.ui.i18n.LocalStrings
import java.io.File

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DownloadsScreen(
    tasks: List<DownloadTask>,
    onCancel: (String) -> Unit,
    onRetry: (String) -> Unit,
    onRemove: (String) -> Unit,
    onPatchPermissions: (taskId: String, permissionsToRemove: Set<String>) -> Unit,
    onRestoreOriginal: (taskId: String) -> Unit,
    onOpenSettings: () -> Unit,
    onMessage: (String) -> Unit,
    modifier: Modifier = Modifier
) {
    val strings = LocalStrings.current
    val context = LocalContext.current
    val clipboard = LocalClipboardManager.current
    val hasInstallPermission = ApkInstaller.canInstallPackages(context)

    var inspectedTask by remember { mutableStateOf<DownloadTask?>(null) }
    var editingTask by remember { mutableStateOf<DownloadTask?>(null) }
    var pendingRiskConfirm by remember { mutableStateOf<DownloadTask?>(null) }

    val triggerInstall: (DownloadTask) -> Unit = { task ->
        task.filePath?.let { path ->
            ApkInstaller.installFile(context, File(path))
                .onFailure { onMessage(it.message ?: "Error") }
        }
    }

    Column(modifier = modifier.fillMaxSize()) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 20.dp, vertical = 12.dp)
        ) {
            Text(
                text = strings.tabDownloads,
                style = MaterialTheme.typography.headlineMedium,
                modifier = Modifier.weight(1f)
            )
            IconButton(onClick = onOpenSettings) {
                Icon(Icons.Rounded.Settings, contentDescription = strings.settingsTitle)
            }
        }

        if (!hasInstallPermission) {
            Surface(
                shape = RoundedCornerShape(20.dp),
                color = MaterialTheme.colorScheme.tertiaryContainer,
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 4.dp)
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier.padding(14.dp)
                ) {
                    Icon(
                        imageVector = Icons.Rounded.Security,
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.onTertiaryContainer
                    )
                    Spacer(modifier = Modifier.width(12.dp))
                    Text(
                        text = strings.unknownSourcesNotice,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onTertiaryContainer,
                        modifier = Modifier.weight(1f)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    FilledTonalButton(
                        onClick = { ApkInstaller.openInstallPermissionSettings(context) }
                    ) {
                        Text(strings.allow)
                    }
                }
            }
        }

        if (tasks.isEmpty()) {
            Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Icon(
                        imageVector = Icons.Rounded.DownloadDone,
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.onSurfaceVariant,
                        modifier = Modifier.height(48.dp)
                    )
                    Spacer(modifier = Modifier.height(10.dp))
                    Text(
                        text = strings.noDownloadsTitle,
                        style = MaterialTheme.typography.titleMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Text(
                        text = strings.noDownloadsSubtitle,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        } else {
            LazyColumn(
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp),
                modifier = Modifier.fillMaxSize()
            ) {
                items(tasks, key = { it.id }) { task ->
                    DownloadTaskCard(
                        task = task,
                        onCancel = { onCancel(task.id) },
                        onRetry = { onRetry(task.id) },
                        onRemove = { onRemove(task.id) },
                        onInspectSecurity = { inspectedTask = task },
                        onEditPermissions = { editingTask = task },
                        onRestoreOriginal = { onRestoreOriginal(task.id) },
                        onInstall = {
                            if (task.securityReport?.riskLevel == SecurityRiskLevel.HIGH) {
                                pendingRiskConfirm = task
                            } else {
                                triggerInstall(task)
                            }
                        }
                    )
                }
            }
        }
    }

    inspectedTask?.securityReport?.let { report ->
        val taskTitle = inspectedTask?.title.orEmpty()
        ModalBottomSheet(onDismissRequest = { inspectedTask = null }) {
            SecurityReportSheet(
                title = taskTitle,
                report = report,
                onCopyHash = {
                    clipboard.setText(AnnotatedString(report.sha256))
                    onMessage(strings.sha256Copied)
                },
                onClose = { inspectedTask = null }
            )
        }
    }

    editingTask?.let { target ->
        ModalBottomSheet(onDismissRequest = { editingTask = null }) {
            PermissionEditorSheet(
                task = target,
                onApply = { toRemove ->
                    editingTask = null
                    onPatchPermissions(target.id, toRemove)
                },
                onRestore = {
                    editingTask = null
                    onRestoreOriginal(target.id)
                },
                onClose = { editingTask = null }
            )
        }
    }

    pendingRiskConfirm?.let { riskyTask ->
        val highList = riskyTask.securityReport?.findings?.filter { it.isHighRisk }
            ?.joinToString("\n") { "• ${strings.findingTitle(it)}" }.orEmpty()
        AlertDialog(
            onDismissRequest = { pendingRiskConfirm = null },
            icon = {
                Icon(
                    imageVector = Icons.Rounded.GppBad,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.error
                )
            },
            title = { Text(strings.securityWarningTitle) },
            text = { Text(strings.securityWarningBody(riskyTask.title, highList)) },
            confirmButton = {
                Button(
                    colors = ButtonDefaults.buttonColors(containerColor = MaterialTheme.colorScheme.error),
                    onClick = {
                        pendingRiskConfirm = null
                        triggerInstall(riskyTask)
                    }
                ) {
                    Text(strings.installAnyway)
                }
            },
            dismissButton = {
                TextButton(onClick = { pendingRiskConfirm = null }) {
                    Text(strings.cancel)
                }
            }
        )
    }
}

@Composable
private fun DownloadTaskCard(
    task: DownloadTask,
    onCancel: () -> Unit,
    onRetry: () -> Unit,
    onRemove: () -> Unit,
    onInspectSecurity: () -> Unit,
    onEditPermissions: () -> Unit,
    onRestoreOriginal: () -> Unit,
    onInstall: () -> Unit
) {
    val strings = LocalStrings.current
    ElevatedCard(
        shape = RoundedCornerShape(22.dp),
        colors = CardDefaults.elevatedCardColors(
            containerColor = MaterialTheme.colorScheme.surfaceContainerLow
        ),
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                AuroraAppIcon(
                    iconUrl = task.iconUrl,
                    contentDescription = task.title,
                    size = 52.dp,
                    cornerRadius = 15.dp
                )
                Spacer(modifier = Modifier.width(12.dp))
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = task.title,
                        style = MaterialTheme.typography.titleMedium,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    val subtitle = when (task.status) {
                        DownloadStatus.RESOLVING -> strings.resolvingLink
                        DownloadStatus.DOWNLOADING -> {
                            val speed = if (task.speedBytesPerSec > 0) " · ${formatBytes(task.speedBytesPerSec)}/s" else ""
                            "${formatBytes(task.downloadedBytes)} / ${formatBytes(task.totalBytes)}$speed"
                        }
                        DownloadStatus.VERIFYING -> strings.verifyingAndScanning
                        DownloadStatus.PATCHING -> strings.patchingApk
                        DownloadStatus.COMPLETED -> strings.completedMeta(formatBytes(task.totalBytes), task.version)
                        DownloadStatus.FAILED -> task.errorMessage ?: strings.failedFallback
                        DownloadStatus.CANCELLED -> strings.cancelled
                    }
                    Text(
                        text = subtitle,
                        style = MaterialTheme.typography.bodyMedium,
                        color = if (task.status == DownloadStatus.FAILED) {
                            MaterialTheme.colorScheme.error
                        } else {
                            MaterialTheme.colorScheme.onSurfaceVariant
                        },
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                }

                when (task.status) {
                    DownloadStatus.RESOLVING, DownloadStatus.DOWNLOADING,
                    DownloadStatus.VERIFYING, DownloadStatus.PATCHING -> {
                        IconButton(onClick = onCancel) {
                            Icon(Icons.Rounded.Close, contentDescription = strings.cancel)
                        }
                    }
                    DownloadStatus.FAILED, DownloadStatus.CANCELLED -> {
                        IconButton(onClick = onRetry) {
                            Icon(Icons.Rounded.Refresh, contentDescription = strings.retryBtn)
                        }
                        IconButton(onClick = onRemove) {
                            Icon(Icons.Rounded.DeleteOutline, contentDescription = strings.remove)
                        }
                    }
                    DownloadStatus.COMPLETED -> {
                        if (task.backupPath != null) {
                            IconButton(onClick = onRestoreOriginal) {
                                Icon(Icons.Rounded.Restore, contentDescription = strings.restoreOriginal)
                            }
                        }
                        IconButton(onClick = onRemove) {
                            Icon(Icons.Rounded.DeleteOutline, contentDescription = strings.remove)
                        }
                    }
                }
            }

            if (task.status == DownloadStatus.DOWNLOADING ||
                task.status == DownloadStatus.RESOLVING ||
                task.status == DownloadStatus.VERIFYING ||
                task.status == DownloadStatus.PATCHING
            ) {
                Spacer(modifier = Modifier.height(12.dp))
                if (task.status != DownloadStatus.DOWNLOADING || task.totalBytes <= 0L) {
                    LinearProgressIndicator(
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(6.dp)
                            .clip(RoundedCornerShape(3.dp))
                    )
                } else {
                    LinearProgressIndicator(
                        progress = { task.progress },
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(6.dp)
                            .clip(RoundedCornerShape(3.dp))
                    )
                }
            }

            if (task.status == DownloadStatus.COMPLETED) {
                task.securityReport?.let { report ->
                    Spacer(modifier = Modifier.height(10.dp))
                    val (bg, fg, icon) = when (report.riskLevel) {
                        SecurityRiskLevel.CLEAN -> Triple(
                            MaterialTheme.colorScheme.primaryContainer,
                            MaterialTheme.colorScheme.onPrimaryContainer,
                            Icons.Rounded.GppGood
                        )
                        SecurityRiskLevel.MEDIUM -> Triple(
                            MaterialTheme.colorScheme.secondaryContainer,
                            MaterialTheme.colorScheme.onSecondaryContainer,
                            Icons.Rounded.GppMaybe
                        )
                        SecurityRiskLevel.HIGH -> Triple(
                            MaterialTheme.colorScheme.errorContainer,
                            MaterialTheme.colorScheme.onErrorContainer,
                            Icons.Rounded.GppBad
                        )
                    }
                    Surface(
                        onClick = onInspectSecurity,
                        shape = RoundedCornerShape(14.dp),
                        color = bg,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            modifier = Modifier.padding(horizontal = 12.dp, vertical = 8.dp)
                        ) {
                            Icon(
                                imageVector = icon,
                                contentDescription = null,
                                tint = fg,
                                modifier = Modifier.size(18.dp)
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(
                                text = strings.riskSummary(report),
                                style = MaterialTheme.typography.labelMedium,
                                color = fg,
                                modifier = Modifier.weight(1f),
                                maxLines = 2,
                                overflow = TextOverflow.Ellipsis
                            )
                            Text(
                                text = strings.details,
                                style = MaterialTheme.typography.labelSmall,
                                color = fg
                            )
                        }
                    }
                }

                Spacer(modifier = Modifier.height(10.dp))
                val permCount = task.securityReport?.declaredPermissions?.size ?: 0
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    modifier = Modifier.fillMaxWidth()
                ) {
                    if (!task.isBundle && permCount > 0) {
                        OutlinedButton(
                            onClick = onEditPermissions,
                            shape = RoundedCornerShape(24.dp),
                            contentPadding = PaddingValues(horizontal = 8.dp, vertical = 10.dp),
                            modifier = Modifier.weight(1.12f)
                        ) {
                            Icon(Icons.Rounded.Tune, contentDescription = null, modifier = Modifier.size(16.dp))
                            Spacer(modifier = Modifier.width(5.dp))
                            Text(
                                text = strings.editPermissions(permCount),
                                maxLines = 1,
                                softWrap = false,
                                overflow = TextOverflow.Ellipsis
                            )
                        }
                    }
                    Button(
                        onClick = onInstall,
                        shape = RoundedCornerShape(24.dp),
                        contentPadding = PaddingValues(horizontal = 8.dp, vertical = 10.dp),
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(Icons.Rounded.InstallMobile, contentDescription = null, modifier = Modifier.size(16.dp))
                        Spacer(modifier = Modifier.width(6.dp))
                        Text(
                            text = when {
                                task.isBundle -> strings.installBundle
                                task.isPatched -> strings.installPatchedApk
                                else -> strings.installApk
                            },
                            maxLines = 1,
                            softWrap = false,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun PermissionEditorSheet(
    task: DownloadTask,
    onApply: (permissionsToRemove: Set<String>) -> Unit,
    onRestore: () -> Unit,
    onClose: () -> Unit
) {
    val strings = LocalStrings.current
    val report = task.securityReport
    val allPerms = remember(task.id, task.isPatched) {
        val base = report?.declaredPermissions.orEmpty()
        (base + task.removedPermissions).distinct()
    }
    val checkedMap = remember(task.id, allPerms) {
        mutableStateMapOf<String, Boolean>().apply {
            allPerms.forEach { perm ->
                put(perm, perm !in task.removedPermissions)
            }
        }
    }

    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp),
        modifier = Modifier.padding(start = 20.dp, end = 20.dp, bottom = 28.dp)
    ) {
        Text(text = strings.permEditorTitle, style = MaterialTheme.typography.titleLarge)
        Text(
            text = strings.permEditorSubtitle,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        if (task.isBundle) {
            Text(text = strings.splitBundleNote, style = MaterialTheme.typography.bodyMedium)
            Button(onClick = onClose, modifier = Modifier.fillMaxWidth()) {
                Text(strings.close)
            }
            return
        }

        if (allPerms.isEmpty()) {
            Text(text = strings.noPermissionsDeclared, style = MaterialTheme.typography.bodyMedium)
            Button(onClick = onClose, modifier = Modifier.fillMaxWidth()) {
                Text(strings.close)
            }
            return
        }

        Row(
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            modifier = Modifier.fillMaxWidth()
        ) {
            FilledTonalButton(
                onClick = {
                    allPerms.forEach { perm ->
                        if (ApkSecurityScanner.isHighRiskPermission(perm) ||
                            (ApkSecurityScanner.isMediumRiskPermission(perm) &&
                                perm != "android.permission.REQUEST_INSTALL_PACKAGES")
                        ) {
                            checkedMap[perm] = false
                        }
                    }
                },
                modifier = Modifier.weight(1f)
            ) {
                Text(strings.stripRiskyQuick, maxLines = 1, overflow = TextOverflow.Ellipsis)
            }
            if (task.backupPath != null) {
                OutlinedButton(onClick = onRestore) {
                    Text(strings.restoreOriginal)
                }
            }
        }

        HorizontalDivider()

        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .heightIn(max = 320.dp),
            verticalArrangement = Arrangement.spacedBy(4.dp)
        ) {
            items(allPerms, key = { it }) { perm ->
                val isChecked = checkedMap[perm] ?: true
                val isHigh = ApkSecurityScanner.isHighRiskPermission(perm)
                val isMed = ApkSecurityScanner.isMediumRiskPermission(perm)
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier
                        .fillMaxWidth()
                        .clip(RoundedCornerShape(12.dp))
                        .clickable { checkedMap[perm] = !isChecked }
                        .padding(vertical = 4.dp, horizontal = 4.dp)
                ) {
                    Checkbox(
                        checked = isChecked,
                        onCheckedChange = { checkedMap[perm] = it }
                    )
                    Spacer(modifier = Modifier.width(6.dp))
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = strings.permissionLabel(perm),
                            style = MaterialTheme.typography.bodyLarge
                        )
                        Text(
                            text = perm,
                            style = MaterialTheme.typography.labelSmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                    if (isHigh || isMed) {
                        Surface(
                            shape = RoundedCornerShape(50),
                            color = if (isHigh) MaterialTheme.colorScheme.errorContainer
                            else MaterialTheme.colorScheme.secondaryContainer
                        ) {
                            Text(
                                text = if (isHigh) strings.permRiskHigh else strings.permRiskMedium,
                                style = MaterialTheme.typography.labelSmall,
                                color = if (isHigh) MaterialTheme.colorScheme.onErrorContainer
                                else MaterialTheme.colorScheme.onSecondaryContainer,
                                modifier = Modifier.padding(horizontal = 8.dp, vertical = 3.dp)
                            )
                        }
                    }
                }
            }
        }

        val toRemove = checkedMap.filterValues { !it }.keys.toSet()
        Button(
            onClick = { onApply(toRemove) },
            shape = RoundedCornerShape(24.dp),
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(strings.applyAndResign)
        }
    }
}

@Composable
private fun SecurityReportSheet(
    title: String,
    report: ApkSecurityReport,
    onCopyHash: () -> Unit,
    onClose: () -> Unit
) {
    val strings = LocalStrings.current
    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp),
        modifier = Modifier.padding(start = 20.dp, end = 20.dp, bottom = 28.dp)
    ) {
        Text(
            text = strings.securityReportTitle(title),
            style = MaterialTheme.typography.titleLarge,
            maxLines = 2,
            overflow = TextOverflow.Ellipsis
        )
        Text(
            text = strings.riskSummary(report),
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        HorizontalDivider()
        if (report.findings.isEmpty()) {
            Text(
                text = strings.securityCleanBody,
                style = MaterialTheme.typography.bodyMedium
            )
        } else {
            LazyColumn(
                modifier = Modifier.heightIn(max = 260.dp),
                verticalArrangement = Arrangement.spacedBy(10.dp)
            ) {
                items(report.findings) { finding ->
                    Row(verticalAlignment = Alignment.Top) {
                        Icon(
                            imageVector = if (finding.isHighRisk) Icons.Rounded.GppBad else Icons.Rounded.GppMaybe,
                            contentDescription = null,
                            tint = if (finding.isHighRisk) MaterialTheme.colorScheme.error else MaterialTheme.colorScheme.primary,
                            modifier = Modifier
                                .padding(top = 2.dp)
                                .size(18.dp)
                        )
                        Spacer(modifier = Modifier.width(10.dp))
                        Column {
                            Text(
                                text = strings.findingTitle(finding),
                                style = MaterialTheme.typography.titleMedium
                            )
                            val detail = strings.findingDetail(finding)
                            if (detail.isNotBlank()) {
                                Text(
                                    text = detail,
                                    style = MaterialTheme.typography.labelMedium,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                    }
                }
            }
        }
        HorizontalDivider()
        if (report.sha256.isNotBlank()) {
            Text(text = strings.sha256Label, style = MaterialTheme.typography.labelMedium)
            Text(
                text = report.sha256,
                style = MaterialTheme.typography.labelSmall.copy(fontFamily = FontFamily.Monospace),
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            OutlinedButton(onClick = onCopyHash, modifier = Modifier.fillMaxWidth()) {
                Icon(Icons.Rounded.ContentCopy, contentDescription = null, modifier = Modifier.size(16.dp))
                Spacer(modifier = Modifier.width(8.dp))
                Text(strings.copySha256)
            }
        }
        Button(onClick = onClose, modifier = Modifier.fillMaxWidth()) {
            Text(strings.close)
        }
    }
}
