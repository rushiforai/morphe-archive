package app.sadmod.client.ui.screens

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
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.rounded.ArrowForward
import androidx.compose.material3.Button
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.Text
import androidx.compose.material3.pulltorefresh.PullToRefreshBox
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.derivedStateOf
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import app.sadmod.client.data.model.IndexCategoryBlock
import app.sadmod.client.ui.FeedUiState
import app.sadmod.client.ui.components.AuroraAppListRow
import app.sadmod.client.ui.components.AuroraCompactAppCard
import app.sadmod.client.ui.components.AuroraSearchPill
import app.sadmod.client.ui.components.AuroraSpotlightCard
import app.sadmod.client.ui.components.SadModPrivacySheet
import app.sadmod.client.ui.i18n.LocalStrings

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FeedScreen(
    title: String,
    searchPlaceholder: String,
    state: FeedUiState,
    onSearchClick: () -> Unit,
    onOpenSettings: () -> Unit,
    onRefresh: () -> Unit,
    onLoadMore: () -> Unit,
    onAppClick: (String) -> Unit,
    modifier: Modifier = Modifier
) {
    val strings = LocalStrings.current
    var selectedCategory by remember { mutableStateOf<IndexCategoryBlock?>(null) }
    var showPrivacySheet by remember { mutableStateOf(false) }
    val listState = rememberLazyListState()

    val shouldLoadMore by remember {
        derivedStateOf {
            val lastVisible = listState.layoutInfo.visibleItemsInfo.lastOrNull()?.index ?: 0
            lastVisible >= (listState.layoutInfo.totalItemsCount - 2).coerceAtLeast(1)
        }
    }

    LaunchedEffect(shouldLoadMore, state.sections.size) {
        if (shouldLoadMore && state.sections.isNotEmpty() && state.canLoadMore && !state.isLoadingMore) {
            onLoadMore()
        }
    }

    Column(modifier = modifier.fillMaxSize()) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp, vertical = 10.dp)
        ) {
            AuroraSearchPill(
                placeholder = searchPlaceholder,
                onClick = onSearchClick,
                onShieldClick = { showPrivacySheet = true },
                onSettingsClick = onOpenSettings
            )
            Spacer(modifier = Modifier.height(10.dp))
            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 4.dp)
            ) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.headlineMedium,
                    color = MaterialTheme.colorScheme.onBackground,
                    modifier = Modifier.weight(1f)
                )
                Text(
                    text = strings.appName,
                    style = MaterialTheme.typography.labelLarge,
                    color = MaterialTheme.colorScheme.primary
                )
            }
        }

        PullToRefreshBox(
            isRefreshing = state.isRefreshing,
            onRefresh = onRefresh,
            modifier = Modifier.fillMaxSize()
        ) {
            when {
                state.isLoading && state.sections.isEmpty() -> {
                    Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                        CircularProgressIndicator()
                    }
                }
                state.error != null && state.sections.isEmpty() -> {
                    Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            modifier = Modifier.padding(24.dp)
                        ) {
                            Text(
                                text = state.error,
                                style = MaterialTheme.typography.bodyLarge,
                                color = MaterialTheme.colorScheme.error
                            )
                            Spacer(modifier = Modifier.height(12.dp))
                            Button(onClick = onRefresh) {
                                Text(strings.retry)
                            }
                        }
                    }
                }
                else -> {
                    LazyColumn(
                        state = listState,
                        contentPadding = PaddingValues(bottom = 24.dp),
                        verticalArrangement = Arrangement.spacedBy(18.dp),
                        modifier = Modifier.fillMaxSize()
                    ) {
                        if (state.featured.isNotEmpty()) {
                            item(key = "featured_header") {
                                Column {
                                    Text(
                                        text = strings.featured,
                                        style = MaterialTheme.typography.titleLarge,
                                        modifier = Modifier.padding(horizontal = 20.dp)
                                    )
                                    Spacer(modifier = Modifier.height(10.dp))
                                    LazyRow(
                                        contentPadding = PaddingValues(horizontal = 16.dp),
                                        horizontalArrangement = Arrangement.spacedBy(12.dp)
                                    ) {
                                        items(
                                            items = state.featured,
                                            key = { "feat_${it.urlId}_${it.id}" }
                                        ) { app ->
                                            AuroraSpotlightCard(
                                                app = app,
                                                onClick = { onAppClick(app.urlId) }
                                            )
                                        }
                                    }
                                }
                            }
                        }

                        items(
                            items = state.sections,
                            key = { "cat_${it.catInfo?.urlId ?: it.hashCode()}" }
                        ) { block ->
                            Column {
                                Row(
                                    verticalAlignment = Alignment.CenterVertically,
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(start = 20.dp, end = 8.dp)
                                ) {
                                    Text(
                                        text = block.catInfo?.title ?: strings.categoryFallback,
                                        style = MaterialTheme.typography.titleLarge,
                                        modifier = Modifier.weight(1f)
                                    )
                                    IconButton(onClick = { selectedCategory = block }) {
                                        Icon(
                                            imageVector = Icons.AutoMirrored.Rounded.ArrowForward,
                                            contentDescription = strings.showAll
                                        )
                                    }
                                }
                                Spacer(modifier = Modifier.height(6.dp))
                                LazyRow(
                                    contentPadding = PaddingValues(horizontal = 12.dp),
                                    horizontalArrangement = Arrangement.spacedBy(4.dp)
                                ) {
                                    items(
                                        items = block.list,
                                        key = { "${block.catInfo?.urlId}_${it.urlId}_${it.id}" }
                                    ) { app ->
                                        AuroraCompactAppCard(
                                            app = app,
                                            onClick = { onAppClick(app.urlId) }
                                        )
                                    }
                                }
                            }
                        }

                        if (state.isLoadingMore) {
                            item(key = "loading_more") {
                                Box(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(16.dp),
                                    contentAlignment = Alignment.Center
                                ) {
                                    CircularProgressIndicator(strokeWidth = 3.dp)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    selectedCategory?.let { block ->
        ModalBottomSheet(onDismissRequest = { selectedCategory = null }) {
            Column(modifier = Modifier.padding(bottom = 24.dp)) {
                Text(
                    text = block.catInfo?.title ?: strings.categoryFallback,
                    style = MaterialTheme.typography.titleLarge,
                    modifier = Modifier.padding(horizontal = 20.dp, vertical = 8.dp)
                )
                LazyColumn(
                    contentPadding = PaddingValues(vertical = 8.dp)
                ) {
                    items(block.list, key = { "sheet_${it.urlId}_${it.id}" }) { app ->
                        AuroraAppListRow(
                            app = app,
                            onClick = {
                                selectedCategory = null
                                onAppClick(app.urlId)
                            }
                        )
                    }
                }
            }
        }
    }

    if (showPrivacySheet) {
        SadModPrivacySheet(onDismiss = { showPrivacySheet = false })
    }
}
