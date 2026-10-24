package app.morphe.extension.chmate

import android.os.Build
import android.view.ViewGroup
import androidx.activity.compose.setContent
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.compositeOver
import androidx.compose.ui.graphics.lerp
import androidx.compose.ui.graphics.luminance
import androidx.compose.ui.graphics.toArgb
import androidx.compose.ui.unit.dp
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack

/** Shared expressive shapes, motion, color and accessible spacing for extension screens. */
object HaiagaruUi {
    /** Same opaque backdrop as Compose; transparent native window colors must not reveal black. */
    @JvmStatic fun toolTabHeaderColors(context: android.content.Context): IntArray {
        val native = try { NativeThemeColors.colors(context)?.takeIf { it.size == 7 } }
            catch (_: RuntimeException) { null }
        val dark = context.resources.configuration.uiMode and
            android.content.res.Configuration.UI_MODE_NIGHT_MASK == android.content.res.Configuration.UI_MODE_NIGHT_YES
        val scheme = native?.let(::chMateColorScheme) ?: if (dark) darkColorScheme() else lightColorScheme()
        return intArrayOf(scheme.background.toArgb(), scheme.onBackground.toArgb())
    }
    private val LocalNativeColors = staticCompositionLocalOf<IntArray?> { null }
    @JvmStatic
    fun controls(activity: HaiagaruComposeActivity, model: android.view.View): android.view.View =
        androidx.compose.ui.platform.ComposeView(activity).apply {
            setContent { Theme {
                var localRevision by remember(model) { mutableIntStateOf(0) }
                val revision = rememberModelRevision(model) + localRevision
                ModelContent(model, revision) { localRevision++ }
            } }
        }

    @JvmStatic
    fun showPlayer(activity: HaiagaruComposeActivity, surface: android.view.View) {
        activity.setContent { Theme {
            Surface(color = androidx.compose.ui.graphics.Color.Black) {
                androidx.compose.ui.viewinterop.AndroidView(factory = { surface }, modifier = Modifier.fillMaxSize())
            }
        } }
    }

    @JvmStatic fun bindRelease(view: android.view.View, action: Runnable) { view.setTag(0x48690b01, action) }
    @JvmStatic fun bindSwipe(view: android.view.View, action: java.util.function.Consumer<Boolean>) { view.setTag(0x48690b02, action) }
    internal class ScrollRequest(val position: Int)
    @JvmStatic fun scrollTo(view: android.view.View, position: Int) { view.setTag(0x48690b03, ScrollRequest(position.coerceAtLeast(0))) }
    @JvmStatic fun scrollPosition(view: android.view.View): Int = view.getTag(0x48690b04) as? Int ?: view.scrollY
    @JvmStatic
    fun showModel(activity: HaiagaruComposeActivity, title: String, model: android.view.View) {
        if (model is ViewGroup) prepareNativeSurfaces(model)
        activity.setContent { Theme { ModelScreen(activity, title, model) } }
    }
    @JvmStatic
    fun showArchiveSearch(activity: HaiagaruComposeActivity, model: android.widget.LinearLayout) {
        activity.setContent { Theme { ArchiveSearchScreen(activity, model) } }
    }
    @JvmStatic
    fun showForm(activity: HaiagaruComposeActivity, title: String, model: ViewGroup) {
        activity.setContent { Theme { FormScreen(activity, title, model) } }
    }

    @OptIn(ExperimentalMaterial3Api::class)
    @Composable
    private fun FormScreen(activity: HaiagaruComposeActivity, title: String, model: ViewGroup) {
        var revision by remember { mutableIntStateOf(0) }
        @Suppress("UNUSED_VARIABLE") val refresh = revision
        val rows = settingsRows(model)
        Scaffold(topBar = { TopAppBar(title = { Text(title, maxLines = 1, overflow = androidx.compose.ui.text.style.TextOverflow.Ellipsis) }, navigationIcon = {
            IconButton(onClick = { activity.finish() }) { Icon(Icons.AutoMirrored.Filled.ArrowBack, "戻る") }
        }) }) { insets ->
            LazyColumn(Modifier.fillMaxSize().padding(insets).imePadding(), contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)) {
                items(rows, key = { System.identityHashCode(it.control) }) { row ->
                    Group { BoundSettingRow(row) { revision++ } }
                }
            }
        }
    }

    @OptIn(ExperimentalMaterial3ExpressiveApi::class)
    @Composable
    fun Theme(content: @Composable () -> Unit) {
        val context = LocalContext.current
        val systemDark = isSystemInDarkTheme()
        val fallback = if (Build.VERSION.SDK_INT >= 31) {
            if (systemDark) dynamicDarkColorScheme(context) else dynamicLightColorScheme(context)
        } else if (systemDark) darkColorScheme() else expressiveLightColorScheme()
        // Dialogs wrap the native Activity in a fixed Light theme for resource loading.
        // Ask ChMate's palette getter, which also works for standalone video Activities.
        var host = context
        for (depth in 0 until 16) {
            if (host is android.app.Activity || host !is android.content.ContextWrapper) break
            val base = host.baseContext
            if (base === host) break
            host = base
        }
        val native = try { NativeThemeColors.colors(host)?.takeIf { it.size == 7 } }
            catch (_: RuntimeException) { null }
        val colors = native?.let(::chMateColorScheme) ?: fallback
        CompositionLocalProvider(LocalNativeColors provides native) {
            MaterialExpressiveTheme(colorScheme = colors, content = content)
        }
    }

    /** Use ChMate's palette for every container role, including cards and tonal buttons. */
    private fun chMateColorScheme(palette: IntArray): ColorScheme {
        val nativeText = Color(palette[1])
        val backdrop = if (nativeText.luminance() > .5f) Color.Black else Color.White
        val background = Color(palette[0]).compositeOver(Color(palette[6]).compositeOver(backdrop))
        val surface = Color(palette[3]).compositeOver(background)
        val text = nativeText.compositeOver(surface)
        val primary = Color(palette[2]).takeIf { it.alpha > 0f }
            ?.compositeOver(surface) ?: text
        val dark = background.luminance() < .179f
        val base = if (dark) darkColorScheme() else lightColorScheme()
        val container = lerp(surface, primary, .15f)
        fun on(color: Color) = if (color.luminance() > .179f) Color.Black else Color.White
        return base.copy(
            primary = primary, onPrimary = on(primary),
            primaryContainer = container, onPrimaryContainer = on(container),
            secondary = primary, onSecondary = on(primary),
            secondaryContainer = container, onSecondaryContainer = on(container),
            tertiary = primary, onTertiary = on(primary),
            tertiaryContainer = container, onTertiaryContainer = on(container),
            background = background, onBackground = nativeText.compositeOver(background),
            surface = surface, onSurface = text,
            surfaceVariant = lerp(surface, text, .08f),
            onSurfaceVariant = lerp(surface, text, .78f),
            outline = lerp(surface, text, .55f), outlineVariant = lerp(surface, text, .30f),
            inverseSurface = text, inverseOnSurface = surface, inversePrimary = on(text),
            surfaceTint = primary,
            surfaceDim = lerp(surface, Color.Black, .06f),
            surfaceBright = lerp(surface, text, .12f),
            surfaceContainerLowest = surface,
            surfaceContainerLow = lerp(surface, text, .02f),
            surfaceContainer = lerp(surface, text, .04f),
            surfaceContainerHigh = lerp(surface, text, .08f),
            surfaceContainerHighest = lerp(surface, text, .12f),
        )
    }

    @Composable internal fun sliderColors(): SliderColors {
        val palette = LocalNativeColors.current ?: return SliderDefaults.colors()
        val scheme = MaterialTheme.colorScheme
        val active = Color(palette[4]).takeIf { it.alpha > 0f }
            ?.compositeOver(scheme.surface) ?: scheme.primary
        val inactive = Color(palette[5]).takeIf { it.alpha > 0f }
            ?.compositeOver(scheme.surface) ?: scheme.outlineVariant
        return SliderDefaults.colors(thumbColor = active, activeTrackColor = active,
            inactiveTrackColor = inactive)
    }

    @Composable
    fun Group(title: String? = null, content: @Composable ColumnScope.() -> Unit) {
        Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
            if (title != null) Text(title, style = MaterialTheme.typography.titleSmall,
                color = MaterialTheme.colorScheme.primary, modifier = Modifier.padding(start = 12.dp, top = 8.dp))
            Surface(shape = RoundedCornerShape(24.dp), color = MaterialTheme.colorScheme.surfaceContainerLow,
                border = BorderStroke(1.dp, MaterialTheme.colorScheme.outline)) {
                Column(Modifier.fillMaxWidth().padding(8.dp), content = content)
            }
        }
    }
}
