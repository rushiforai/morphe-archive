package app.sadmod.client.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.rounded.ArrowBack
import androidx.compose.material.icons.rounded.CheckCircle
import androidx.compose.material.icons.rounded.Close
import androidx.compose.material.icons.rounded.Download
import androidx.compose.material.icons.rounded.InstallMobile
import androidx.compose.material.icons.rounded.Star
import androidx.compose.material.icons.rounded.Verified
import androidx.compose.material3.Button
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ElevatedCard
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FilledTonalButton
import androidx.compose.material3.FilterChip
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.SegmentedButton
import androidx.compose.material3.SegmentedButtonDefaults
import androidx.compose.material3.SingleChoiceSegmentedButtonRow
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.VerticalDivider
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties
import app.sadmod.client.data.crypto.HappyModCrypto
import app.sadmod.client.data.download.ApkInstaller
import app.sadmod.client.data.model.DownloadStatus
import app.sadmod.client.data.model.DownloadTask
import app.sadmod.client.data.model.ModItem
import app.sadmod.client.ui.DetailUiState
import app.sadmod.client.ui.components.AuroraAppIcon
import app.sadmod.client.ui.components.MetaPill
import app.sadmod.client.ui.components.compactDisplaySize
import app.sadmod.client.ui.i18n.LocalStrings
import coil3.compose.AsyncImage
import java.io.File

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AppDetailScreen(
    state: DetailUiState,
    downloads: List<DownloadTask>,
    onBack: () -> Unit,
    onRetry: () -> Unit,
    onSearchAuthor: (String) -> Unit,
    onDownloadMod: (ModItem, String) -> Unit,
    onDownloadOriginal: (urlId: String, title: String, version: String, icon: String) -> Unit,
    onInstallError: (String) -> Unit,
    modifier: Modifier = Modifier
) {
    val strings = LocalStrings.current
    val context = LocalContext.current
    var selectedTab by remember { mutableIntStateOf(0) }
    var modSortMode by remember { mutableIntStateOf(0) }
    var zoomedScreenshot by remember { mutableStateOf<String?>(null) }

    Scaffold(
        modifier = modifier,
        topBar = {
            TopAppBar(
                title = {},
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(
                            imageVector = Icons.AutoMirrored.Rounded.ArrowBack,
                            contentDescription = strings.back
                        )
                    }
                }
            )
        }
    ) { innerPadding ->
        when {
            state.isLoading -> {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(innerPadding),
                    contentAlignment = Alignment.Center
                ) {
                    CircularProgressIndicator()
                }
            }

            state.error != null || state.bundle == null -> {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(innerPadding),
                    contentAlignment = Alignment.Center
                ) {
                    Column(
                        horizontalAlignment = Alignment.CenterHorizontally,
                        modifier = Modifier.padding(24.dp)
                    ) {
                        Text(
                            text = state.error ?: strings.failedFallback,
                            style = MaterialTheme.typography.bodyLarge,
                            color = MaterialTheme.colorScheme.error
                        )
                        Spacer(modifier = Modifier.height(12.dp))
                        Button(onClick = onRetry) { Text(strings.retry) }
                    }
                }
            }

            else -> {
                val bundle = state.bundle
                val header = bundle.header
                val official = bundle.officialDetail
                val primaryMod = bundle.latestTested?.takeIf {
                    it.urlId.isNotBlank() && it.version.isNotBlank()
                } ?: bundle.mods.firstOrNull() ?: bundle.latestTested
                val primaryTask = primaryMod?.let { mod ->
                    downloads.firstOrNull { it.urlId == mod.urlId }
                }
                val officialTask = downloads.firstOrNull { it.urlId == bundle.urlId && !it.isMod }

                LazyColumn(
                    contentPadding = PaddingValues(
                        top = innerPadding.calculateTopPadding() + 4.dp,
                        bottom = 36.dp
                    ),
                    verticalArrangement = Arrangement.spacedBy(18.dp),
                    modifier = Modifier.fillMaxSize()
                ) {
                    item(key = "hero") {
                        Column(modifier = Modifier.padding(horizontal = 20.dp)) {
                            Row(verticalAlignment = Alignment.CenterVertically) {
                                AuroraAppIcon(
                                    iconUrl = header.icon.ifBlank { official?.icon.orEmpty() },
                                    contentDescription = header.title,
                                    size = 84.dp,
                                    cornerRadius = 22.dp
                                )
                                Spacer(modifier = Modifier.width(16.dp))
                                Column(modifier = Modifier.weight(1f)) {
                                    Text(
                                        text = header.title,
                                        style = MaterialTheme.typography.headlineMedium,
                                        maxLines = 2,
                                        overflow = TextOverflow.Ellipsis
                                    )
                                    val author = header.author.ifBlank { official?.author.orEmpty() }
                                    if (author.isNotBlank()) {
                                        Spacer(modifier = Modifier.height(4.dp))
                                        Text(
                                            text = author,
                                            style = MaterialTheme.typography.labelLarge,
                                            color = MaterialTheme.colorScheme.primary,
                                            modifier = Modifier.clickable { onSearchAuthor(author) }
                                        )
                                    }
                                    Spacer(modifier = Modifier.height(6.dp))
                                    Text(
                                        text = bundle.urlId,
                                        style = MaterialTheme.typography.labelSmall,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                                        maxLines = 1,
                                        overflow = TextOverflow.Ellipsis
                                    )
                                }
                            }

                            Spacer(modifier = Modifier.height(18.dp))

                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.SpaceEvenly,
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .clip(RoundedCornerShape(18.dp))
                                    .background(MaterialTheme.colorScheme.surfaceContainerLow)
                                    .padding(vertical = 12.dp, horizontal = 8.dp)
                            ) {
                                MetricCell(
                                    value = header.rating.ifBlank { official?.rating ?: "–" },
                                    label = strings.ratingLabel,
                                    hasStar = true
                                )
                                VerticalDivider(modifier = Modifier.height(28.dp))
                                MetricCell(
                                    value = official?.weeklyHitsFormat?.ifBlank { primaryMod?.weeklyHitsFormat }
                                        ?: primaryMod?.weeklyHitsFormat ?: "–",
                                    label = strings.downloadsLabel
                                )
                                VerticalDivider(modifier = Modifier.height(28.dp))
                                MetricCell(
                                    value = compactDisplaySize(
                                        primaryMod?.displaySize?.ifBlank { official?.displaySize }
                                            ?: official?.displaySize ?: "–"
                                    ),
                                    label = strings.sizeLabel
                                )
                                VerticalDivider(modifier = Modifier.height(28.dp))
                                MetricCell(
                                    value = "${bundle.mods.size}",
                                    label = strings.modsLabel
                                )
                            }

                            Spacer(modifier = Modifier.height(16.dp))

                            Row(
                                horizontalArrangement = Arrangement.spacedBy(10.dp),
                                modifier = Modifier.fillMaxWidth()
                            ) {
                                if (primaryMod != null) {
                                    DownloadCtaButton(
                                        task = primaryTask,
                                        idleLabel = strings.getMod,
                                        onStart = {
                                            onDownloadMod(
                                                primaryMod,
                                                header.icon.ifBlank { official?.icon.orEmpty() }
                                            )
                                        },
                                        onInstall = { file ->
                                            ApkInstaller.installFile(context, file)
                                                .onFailure { onInstallError(it.message ?: "Error") }
                                        },
                                        modifier = Modifier.weight(1f)
                                    )
                                }
                                if (official?.hasOriginalApk == "1") {
                                    val isDone = officialTask?.status == DownloadStatus.COMPLETED && officialTask.filePath != null
                                    val isBusy = officialTask?.status == DownloadStatus.DOWNLOADING ||
                                        officialTask?.status == DownloadStatus.RESOLVING
                                    OutlinedButton(
                                        onClick = {
                                            if (isDone) {
                                                ApkInstaller.installFile(context, File(officialTask!!.filePath!!))
                                                    .onFailure { onInstallError(it.message ?: "Error") }
                                            } else if (!isBusy) {
                                                onDownloadOriginal(
                                                    bundle.urlId,
                                                    "${header.title} (Original)",
                                                    official.version,
                                                    header.icon.ifBlank { official.icon }
                                                )
                                            }
                                        },
                                        shape = RoundedCornerShape(26.dp),
                                        modifier = Modifier.height(50.dp)
                                    ) {
                                        Text(
                                            when {
                                                isDone -> strings.originalInstalledBtn
                                                isBusy -> strings.downloadingPct((officialTask!!.progress * 100).toInt())
                                                else -> strings.original
                                            }
                                        )
                                    }
                                }
                            }
                        }
                    }

                    val screenshots = header.screenshotsList.ifEmpty { official?.screenshotsList.orEmpty() }
                    if (screenshots.isNotEmpty()) {
                        item(key = "screenshots") {
                            LazyRow(
                                contentPadding = PaddingValues(horizontal = 20.dp),
                                horizontalArrangement = Arrangement.spacedBy(12.dp)
                            ) {
                                items(screenshots) { url ->
                                    AsyncImage(
                                        model = url,
                                        contentDescription = null,
                                        contentScale = ContentScale.Crop,
                                        modifier = Modifier
                                            .height(190.dp)
                                            .width(320.dp)
                                            .clip(RoundedCornerShape(18.dp))
                                            .background(MaterialTheme.colorScheme.surfaceContainerHigh)
                                            .clickable { zoomedScreenshot = url }
                                    )
                                }
                            }
                        }
                    }

                    item(key = "tabs") {
                        val tabs = listOf(strings.modsTab(bundle.mods.size), strings.aboutTab)
                        SingleChoiceSegmentedButtonRow(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(horizontal = 20.dp)
                        ) {
                            tabs.forEachIndexed { index, label ->
                                SegmentedButton(
                                    selected = selectedTab == index,
                                    onClick = { selectedTab = index },
                                    shape = SegmentedButtonDefaults.itemShape(
                                        index = index,
                                        count = tabs.size
                                    )
                                ) {
                                    Text(label)
                                }
                            }
                        }
                    }

                    if (selectedTab == 0) {
                        if (bundle.mods.isEmpty()) {
                            item(key = "no_mods") {
                                Text(
                                    text = strings.noModsHint,
                                    style = MaterialTheme.typography.bodyLarge,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                                    modifier = Modifier.padding(horizontal = 20.dp)
                                )
                            }
                        } else {
                            if (bundle.mods.size > 1) {
                                item(key = "mod_sort") {
                                    Row(
                                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                                        modifier = Modifier
                                            .horizontalScroll(rememberScrollState())
                                            .padding(horizontal = 20.dp)
                                    ) {
                                        listOf(
                                            strings.sortRecommended,
                                            strings.sortWorkingRate,
                                            strings.sortSmallest
                                        ).forEachIndexed { idx, label ->
                                            FilterChip(
                                                selected = modSortMode == idx,
                                                onClick = { modSortMode = idx },
                                                label = {
                                                    Text(text = label, maxLines = 1, softWrap = false)
                                                }
                                            )
                                        }
                                    }
                                }
                            }
                            val sortedMods = when (modSortMode) {
                                1 -> bundle.mods.sortedByDescending { it.workingPercent ?: -1 }
                                2 -> bundle.mods.sortedBy { if (it.longSize > 0.0) it.longSize else Double.MAX_VALUE }
                                else -> bundle.mods
                            }
                            items(
                                items = sortedMods,
                                key = { "mod_${it.urlId}_${it.version}" }
                            ) { mod ->
                                val task = downloads.firstOrNull { it.urlId == mod.urlId }
                                ModBuildCard(
                                    mod = mod,
                                    isRecommended = mod.urlId == bundle.latestTested?.urlId,
                                    task = task,
                                    onDownload = {
                                        onDownloadMod(
                                            mod,
                                            header.icon.ifBlank { official?.icon.orEmpty() }
                                        )
                                    },
                                    onInstall = { file ->
                                        ApkInstaller.installFile(context, file)
                                            .onFailure { onInstallError(it.message ?: "Error") }
                                    },
                                    modifier = Modifier.padding(horizontal = 20.dp)
                                )
                            }
                        }
                    } else {
                        item(key = "about") {
                            Column(
                                verticalArrangement = Arrangement.spacedBy(12.dp),
                                modifier = Modifier.padding(horizontal = 20.dp)
                            ) {
                                if (!official?.shortDesc.isNullOrBlank()) {
                                    Text(
                                        text = official!!.shortDesc,
                                        style = MaterialTheme.typography.titleMedium
                                    )
                                }
                                val descText = HappyModCrypto.cleanHtml(official?.detail.orEmpty())
                                    .ifBlank { strings.noDescAvailable }
                                Text(
                                    text = descText,
                                    style = MaterialTheme.typography.bodyMedium,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                                HorizontalDivider(modifier = Modifier.padding(vertical = 4.dp))
                                if (!official?.version.isNullOrBlank()) {
                                    Text(
                                        text = strings.currentOriginalVersion(
                                            official!!.version,
                                            compactDisplaySize(official.displaySize)
                                        ),
                                        style = MaterialTheme.typography.labelLarge
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    zoomedScreenshot?.let { url ->
        Dialog(
            onDismissRequest = { zoomedScreenshot = null },
            properties = DialogProperties(usePlatformDefaultWidth = false)
        ) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .background(Color.Black.copy(alpha = 0.92f))
                    .clickable { zoomedScreenshot = null },
                contentAlignment = Alignment.Center
            ) {
                AsyncImage(
                    model = url,
                    contentDescription = null,
                    contentScale = ContentScale.Fit,
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp)
                )
                IconButton(
                    onClick = { zoomedScreenshot = null },
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(16.dp)
                ) {
                    Icon(
                        imageVector = Icons.Rounded.Close,
                        contentDescription = strings.close,
                        tint = Color.White
                    )
                }
            }
        }
    }
}

@Composable
private fun MetricCell(
    value: String,
    label: String,
    hasStar: Boolean = false
) {
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Text(
                text = value,
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            if (hasStar) {
                Spacer(modifier = Modifier.width(3.dp))
                Icon(
                    imageVector = Icons.Rounded.Star,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.size(16.dp)
                )
            }
        }
        Text(
            text = label,
            style = MaterialTheme.typography.labelSmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Composable
private fun DownloadCtaButton(
    task: DownloadTask?,
    idleLabel: String,
    onStart: () -> Unit,
    onInstall: (File) -> Unit,
    modifier: Modifier = Modifier
) {
    val strings = LocalStrings.current
    when (task?.status) {
        DownloadStatus.RESOLVING -> {
            Button(
                onClick = {},
                enabled = false,
                shape = RoundedCornerShape(26.dp),
                modifier = modifier.height(50.dp)
            ) {
                CircularProgressIndicator(strokeWidth = 2.dp, modifier = Modifier.size(18.dp))
                Spacer(modifier = Modifier.width(8.dp))
                Text(strings.connecting)
            }
        }
        DownloadStatus.DOWNLOADING, DownloadStatus.VERIFYING, DownloadStatus.PATCHING -> {
            val pct = (task.progress * 100).toInt()
            FilledTonalButton(
                onClick = {},
                shape = RoundedCornerShape(26.dp),
                modifier = modifier.height(50.dp)
            ) {
                Text(
                    if (task.status == DownloadStatus.DOWNLOADING) strings.downloadingPct(pct)
                    else strings.verifyingShort
                )
            }
        }
        DownloadStatus.COMPLETED -> {
            Button(
                onClick = { task.filePath?.let { onInstall(File(it)) } },
                shape = RoundedCornerShape(26.dp),
                modifier = modifier.height(50.dp)
            ) {
                Icon(imageVector = Icons.Rounded.InstallMobile, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text(strings.install)
            }
        }
        else -> {
            Button(
                onClick = onStart,
                shape = RoundedCornerShape(26.dp),
                modifier = modifier.height(50.dp)
            ) {
                Icon(imageVector = Icons.Rounded.Download, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text(idleLabel, maxLines = 1, overflow = TextOverflow.Ellipsis)
            }
        }
    }
}

@Composable
private fun ModBuildCard(
    mod: ModItem,
    isRecommended: Boolean,
    task: DownloadTask?,
    onDownload: () -> Unit,
    onInstall: (File) -> Unit,
    modifier: Modifier = Modifier
) {
    val strings = LocalStrings.current
    ElevatedCard(
        shape = RoundedCornerShape(20.dp),
        colors = CardDefaults.elevatedCardColors(
            containerColor = MaterialTheme.colorScheme.surfaceContainerLow
        ),
        modifier = modifier.fillMaxWidth()
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(
                    text = "v${mod.version}",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                if (mod.displaySize.isNotBlank()) {
                    MetaPill(text = compactDisplaySize(mod.displaySize))
                }
                val working = mod.workingPercent
                if (working != null) {
                    Surface(
                        shape = RoundedCornerShape(50),
                        color = MaterialTheme.colorScheme.primaryContainer
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            modifier = Modifier.padding(horizontal = 9.dp, vertical = 4.dp)
                        ) {
                            Icon(
                                imageVector = Icons.Rounded.CheckCircle,
                                contentDescription = null,
                                tint = MaterialTheme.colorScheme.onPrimaryContainer,
                                modifier = Modifier.size(13.dp)
                            )
                            Spacer(modifier = Modifier.width(4.dp))
                            Text(
                                text = strings.workingPct(working),
                                style = MaterialTheme.typography.labelSmall,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                        }
                    }
                }
                if (isRecommended) {
                    Icon(
                        imageVector = Icons.Rounded.Verified,
                        contentDescription = strings.recommended,
                        tint = MaterialTheme.colorScheme.primary,
                        modifier = Modifier.size(18.dp)
                    )
                }
            }

            val cleanInfo = HappyModCrypto.cleanHtml(mod.modInfo)
            if (cleanInfo.isNotBlank()) {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = cleanInfo,
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Spacer(modifier = Modifier.height(12.dp))

            if (task?.status == DownloadStatus.DOWNLOADING) {
                LinearProgressIndicator(
                    progress = { task.progress },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(6.dp)
                        .clip(RoundedCornerShape(3.dp))
                )
                Spacer(modifier = Modifier.height(8.dp))
            }

            Row(
                horizontalArrangement = Arrangement.End,
                modifier = Modifier.fillMaxWidth()
            ) {
                when (task?.status) {
                    DownloadStatus.RESOLVING -> {
                        FilledTonalButton(onClick = {}, enabled = false) {
                            Text(strings.connecting)
                        }
                    }
                    DownloadStatus.DOWNLOADING, DownloadStatus.VERIFYING, DownloadStatus.PATCHING -> {
                        FilledTonalButton(onClick = {}) {
                            Text(strings.downloadingPct((task.progress * 100).toInt()))
                        }
                    }
                    DownloadStatus.COMPLETED -> {
                        Button(onClick = { task.filePath?.let { onInstall(File(it)) } }) {
                            Icon(Icons.Rounded.InstallMobile, contentDescription = null)
                            Spacer(modifier = Modifier.width(6.dp))
                            Text(strings.install)
                        }
                    }
                    else -> {
                        FilledTonalButton(onClick = onDownload) {
                            Icon(Icons.Rounded.Download, contentDescription = null)
                            Spacer(modifier = Modifier.width(6.dp))
                            Text(strings.downloadBtn)
                        }
                    }
                }
            }
        }
    }
}
