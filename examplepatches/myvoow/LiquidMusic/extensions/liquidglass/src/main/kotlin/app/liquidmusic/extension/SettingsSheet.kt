/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 *
 * The controls are LiquidSlider, LiquidToggle and LiquidButton from Backdrop by Kyant (Apache
 * License 2.0), used unchanged: https://github.com/Kyant0/AndroidLiquidGlass (see libs/README.md).
 */
package app.liquidmusic.extension

import android.os.Build
import android.view.Gravity
import android.view.KeyEvent
import android.view.View
import android.view.ViewGroup
import android.view.ViewTreeObserver
import android.view.WindowInsets
import android.widget.FrameLayout
import android.window.OnBackInvokedCallback
import android.window.OnBackInvokedDispatcher
import androidx.annotation.RequiresApi
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ColumnScope
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.BasicText
import androidx.compose.foundation.verticalScroll
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.drawBehind
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import app.liquidmusic.extension.compose.ComposeHost
import com.kyant.backdrop.Backdrop
import com.kyant.backdrop.backdrops.layerBackdrop
import com.kyant.backdrop.backdrops.rememberLayerBackdrop
import com.kyant.backdrop.catalog.components.LiquidButton
import com.kyant.backdrop.catalog.components.LiquidSlider
import com.kyant.backdrop.catalog.components.LiquidToggle
import com.kyant.backdrop.drawBackdrop
import com.kyant.backdrop.effects.blur
import com.kyant.backdrop.effects.lens
import com.kyant.backdrop.effects.vibrancy
import com.kyant.shapes.RoundedRectangle
import kotlin.math.roundToInt

/**
 * The Liquid Glass settings, in a glass sheet over the top of the screen, opened with a long press
 * on the liquid tab bar. Every change applies at once to the glass below, which stays visible.
 */
@RequiresApi(Build.VERSION_CODES.S)
internal object SettingsSheet {

    private var current: Sheet? = null

    fun show(anchor: View, content: AppleContent) {
        if (current != null) return
        val root = anchor.rootView as? ViewGroup ?: return
        current = Sheet(root, content)
    }

    private class Sheet(val root: ViewGroup, val content: AppleContent) : ViewTreeObserver.OnPreDrawListener {
        val view = ComposeHost.createView(root.context)
        val location = IntArray(2)
        var viewX by mutableIntStateOf(0)
        var viewY by mutableIntStateOf(0)
        var backCallback: Any? = null

        init {
            val statusBar = root.rootWindowInsets?.getInsets(WindowInsets.Type.statusBars())?.top ?: 0
            view.setContent { SheetContent(content, { viewX }, { viewY }, statusBar, ::close) }
            root.addView(view, FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (root.height * 0.62f).roundToInt(), Gravity.TOP))
            view.elevation = 1000f
            view.isFocusableInTouchMode = true
            view.requestFocus()
            view.setOnKeyListener { _, keyCode, event ->
                if (keyCode == KeyEvent.KEYCODE_BACK && event.action == KeyEvent.ACTION_UP) close()
                keyCode == KeyEvent.KEYCODE_BACK
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) registerBack()
            root.viewTreeObserver.addOnPreDrawListener(this)
        }

        @RequiresApi(Build.VERSION_CODES.TIRAMISU)
        private fun registerBack() {
            val callback = OnBackInvokedCallback { close() }
            view.findOnBackInvokedDispatcher()?.registerOnBackInvokedCallback(OnBackInvokedDispatcher.PRIORITY_OVERLAY, callback)
            backCallback = callback
        }

        override fun onPreDraw(): Boolean {
            content.update()
            view.getLocationInWindow(location)
            viewX = location[0]
            viewY = location[1]
            return true
        }

        fun close() {
            root.viewTreeObserver.removeOnPreDrawListener(this)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                (backCallback as? OnBackInvokedCallback)?.let { view.findOnBackInvokedDispatcher()?.unregisterOnBackInvokedCallback(it) }
            }
            root.removeView(view)
            current = null
        }
    }

    @Composable
    private fun SheetContent(content: AppleContent, viewX: () -> Int, viewY: () -> Int, statusBar: Int, onClose: () -> Unit) {
        val dark = isSystemInDarkTheme()
        val text = if (dark) Color.White else Color.Black
        val surface = if (dark) Color(0xFF121212).copy(alpha = 0.45f) else Color(0xFFFAFAFA).copy(alpha = 0.55f)
        val screen = rememberLayerBackdrop()
        // Recomposes when a setting changes, including on Reset.
        LiquidSettings.revision

        Box(Modifier.fillMaxSize()) {
            // The app behind the sheet, recorded for the glass but never shown itself.
            Box(
                Modifier
                    .matchParentSize()
                    .alpha(0f)
                    .layerBackdrop(screen)
                    .drawBehind { content.draw(this, viewX(), viewY()) }
            )
            Column(
                Modifier
                    .padding(start = 12f.dp, end = 12f.dp, top = with(LocalDensity.current) { statusBar.toDp() } + 8f.dp, bottom = 8f.dp)
                    .drawBackdrop(
                        backdrop = screen,
                        shape = { RoundedRectangle(32f.dp) },
                        effects = {
                            vibrancy()
                            blur(16f.dp.toPx())
                            lens(16f.dp.toPx(), 32f.dp.toPx())
                        },
                        onDrawSurface = { drawRect(surface) }
                    )
                    .verticalScroll(rememberScrollState())
                    .padding(20f.dp),
                verticalArrangement = Arrangement.spacedBy(16f.dp)
            ) {
                BasicText("Liquid Glass", style = TextStyle(text, 24f.sp, fontWeight = FontWeight.Bold))

                Section("Glass", text)
                SliderRow("Blur", "blurRadius", LiquidSettings.blurRadiusDp(), 0, 24, "dp", text, screen)
                SliderRow("Refraction width", "refractionHeight", LiquidSettings.refractionHeightDp(), 0, 48, "dp", text, screen)
                SliderRow("Refraction strength", "refractionAmount", LiquidSettings.refractionAmountDp(), 0, 64, "dp", text, screen)
                SliderRow("Vibrancy", "saturation", LiquidSettings.saturationPercent(), 100, 200, "%", text, screen)
                SliderRow("Apple's tint", "tintOpacity", LiquidSettings.tintOpacityPercent(), 0, 100, "%", text, screen)
                SliderRow("Edge highlight", "highlight", LiquidSettings.highlightPercent(), 0, 100, "%", text, screen)
                ToggleRow("Chromatic aberration", "chromaticAberration", LiquidSettings.chromaticAberration(), text, screen)
                ToggleRow("Search bar", "applyToSearchBar", LiquidSettings.applyToSearchBar(), text, screen)
                ToggleRow("Tablet sidebar", "applyToSidebar", LiquidSettings.applyToSidebar(), text, screen)

                Section("Tab bar", text)
                ToggleRow("Liquid tab bar", "liquidTabBar", LiquidSettings.liquidTabBar(), text, screen)
                ToggleRow("Tab labels", "tabLabels", LiquidSettings.tabLabels(), text, screen)
                ToggleRow("Hide New", "hideNewTab", LiquidSettings.hideNewTab(), text, screen)
                ToggleRow("Hide Radio", "hideRadioTab", LiquidSettings.hideRadioTab(), text, screen)
                ToggleRow("Haptic feedback", "tabHaptics", LiquidSettings.tabHaptics(), text, screen)
                StartTabRow(text, screen)

                Row(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.spacedBy(12f.dp)) {
                    LiquidButton(onClick = LiquidSettings::reset, backdrop = screen, modifier = Modifier.weight(1f)) {
                        BasicText("Reset", style = TextStyle(text, 16f.sp))
                    }
                    LiquidButton(onClick = onClose, backdrop = screen, modifier = Modifier.weight(1f), tint = Color(0xFF0091FF)) {
                        BasicText("Done", style = TextStyle(Color.White, 16f.sp, fontWeight = FontWeight.SemiBold))
                    }
                }
            }
        }
    }

    @Composable
    private fun Section(title: String, text: Color) {
        BasicText(title.uppercase(), style = TextStyle(text.copy(alpha = 0.6f), 13f.sp, fontWeight = FontWeight.SemiBold))
    }

    @Composable
    private fun ColumnScope.SliderRow(
        title: String, key: String, value: Int, min: Int, max: Int, unit: String, text: Color, backdrop: Backdrop,
    ) {
        Column(verticalArrangement = Arrangement.spacedBy(10f.dp)) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                BasicText(title, style = TextStyle(text, 16f.sp), modifier = Modifier.weight(1f))
                BasicText("$value $unit", style = TextStyle(text.copy(alpha = 0.6f), 14f.sp))
            }
            LiquidSlider(
                value = { value.toFloat() },
                onValueChange = { LiquidSettings.set(key, it.roundToInt()) },
                valueRange = min.toFloat()..max.toFloat(),
                visibilityThreshold = 0.5f,
                backdrop = backdrop,
                modifier = Modifier.fillMaxWidth()
            )
        }
    }

    @Composable
    private fun ToggleRow(title: String, key: String, value: Boolean, text: Color, backdrop: Backdrop) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            BasicText(title, style = TextStyle(text, 16f.sp), modifier = Modifier.weight(1f))
            LiquidToggle(
                selected = { value },
                onSelect = { LiquidSettings.set(key, it) },
                backdrop = backdrop
            )
        }
    }

    private val START_TABS = listOf("home" to "Home", "new" to "New", "radio" to "Radio", "library" to "Library", "search" to "Search")

    @Composable
    private fun StartTabRow(text: Color, backdrop: Backdrop) {
        val current = START_TABS.indexOfFirst { it.first == LiquidSettings.startTab() }.coerceAtLeast(0)
        Row(verticalAlignment = Alignment.CenterVertically) {
            Column(Modifier.weight(1f)) {
                BasicText("Start tab", style = TextStyle(text, 16f.sp))
                BasicText("Next time the app opens", style = TextStyle(text.copy(alpha = 0.6f), 13f.sp))
            }
            Spacer(Modifier.width(12f.dp))
            LiquidButton(
                onClick = { LiquidSettings.set("startTab", START_TABS[(current + 1) % START_TABS.size].first) },
                backdrop = backdrop
            ) {
                BasicText(START_TABS[current].second, style = TextStyle(text, 15f.sp))
            }
        }
    }
}
