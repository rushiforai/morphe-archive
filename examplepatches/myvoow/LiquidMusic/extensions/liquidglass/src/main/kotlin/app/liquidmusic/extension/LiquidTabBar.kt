/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 *
 * The bar itself is LiquidBottomTabs from Backdrop by Kyant (Apache License 2.0), used unchanged:
 * https://github.com/Kyant0/AndroidLiquidGlass (see libs/README.md).
 */
package app.liquidmusic.extension

import android.graphics.Color.BLACK
import android.graphics.PorterDuff
import android.graphics.PorterDuffColorFilter
import android.graphics.Rect
import android.graphics.Typeface
import android.graphics.drawable.Drawable
import android.os.Build
import android.util.Log
import android.view.HapticFeedbackConstants
import android.view.Menu
import android.view.View
import android.view.ViewGroup
import android.view.ViewTreeObserver
import android.widget.FrameLayout
import android.widget.TextView
import androidx.annotation.RequiresApi
import androidx.compose.foundation.gestures.awaitEachGesture
import androidx.compose.foundation.gestures.awaitFirstDown
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.text.BasicText
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.drawBehind
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.drawscope.drawIntoCanvas
import androidx.compose.ui.graphics.nativeCanvas
import androidx.compose.ui.graphics.toArgb
import androidx.compose.ui.input.pointer.PointerEventPass
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.ComposeView
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.IntOffset
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import app.liquidmusic.extension.compose.ComposeHost
import com.kyant.backdrop.backdrops.layerBackdrop
import com.kyant.backdrop.backdrops.rememberLayerBackdrop
import com.kyant.backdrop.catalog.components.LiquidBottomTab
import com.kyant.backdrop.catalog.components.LiquidBottomTabs
import java.lang.reflect.Method
import java.util.WeakHashMap
import kotlin.math.roundToInt

/**
 * Apple Music's floating tab bar, drawn by LiquidBottomTabs, the liquid tab bar of Backdrop: a glass
 * capsule, with a drop of glass on the active tab that can be dragged from tab to tab. A long press
 * on the bar opens the Liquid Glass settings.
 *
 * Apple's BottomNavigationView stays where it is and keeps doing the navigation. It only stops
 * drawing (empty clip bounds), and this bar drives it through its public methods. The bar lives
 * in a ComposeView next to it, which follows its position, visibility and alpha on every frame.
 * The glass shows what is behind the bar (see [AppleContent]), recorded in a backdrop layer that
 * is never shown itself.
 */
@RequiresApi(Build.VERSION_CODES.S)
internal class LiquidTabBar private constructor(
    private val bottomNav: ViewGroup,
    private val blurView: View,
) : ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {

    private class Tab(val id: Int, val name: String, val title: String, val icon: Drawable?)

    private val parent = bottomNav.parent as ViewGroup
    private val overlay: ComposeView = ComposeHost.createView(bottomNav.context)
    private val content = AppleContent(blurView)
    private val density = bottomNav.resources.displayMetrics.density
    /** Room around the bar for the drop, which grows when pressed, and for its shadow. */
    private val overflow = (24 * density).roundToInt()
    private val location = IntArray(2)
    private var errorLogged = false
    private var tabsRevision = -1

    // State read by the composition.
    private var tabs by mutableStateOf(emptyList<Tab>())
    private var selectedIndex by mutableIntStateOf(0)
    private var barX by mutableIntStateOf(0)
    private var barWidth by mutableIntStateOf(0)
    private var overlayX by mutableIntStateOf(0)
    private var overlayY by mutableIntStateOf(0)
    private var labelTypeface: Typeface? = null

    init {
        overlay.outlineProvider = null
        overlay.setContent { Bar() }
        parent.addView(overlay, parent.indexOfChild(bottomNav) + 1, ViewGroup.LayoutParams(parent.width, bottomNav.height + 2 * overflow))
        labelTypeface = findTypeface(bottomNav)
        refreshTabs()
        selectStartTab()
        sync()
        bottomNav.viewTreeObserver.addOnPreDrawListener(this)
        bottomNav.addOnAttachStateChangeListener(this)
    }

    // region Composition

    @Composable
    private fun Bar() {
        val appleContent = rememberLayerBackdrop()
        val contentColor = if (isSystemInDarkTheme()) Color.White else Color.Black
        val fontFamily = remember(labelTypeface) {
            labelTypeface?.let { FontFamily(androidx.compose.ui.text.font.Typeface(it)) }
        }
        val selected = remember { { selectedIndex } }
        val labels = LiquidSettings.revision.let { LiquidSettings.tabLabels() }
        val tabs = tabs
        Box(Modifier.fillMaxSize()) {
            // What is behind the bar, recorded for the glass but never shown itself.
            Box(
                Modifier
                    .matchParentSize()
                    .alpha(0f)
                    .layerBackdrop(appleContent)
                    .drawBehind { content.draw(this, overlayX, overlayY) }
            )
            if (tabs.isNotEmpty() && barWidth > 0) {
                val width = with(LocalDensity.current) { barWidth.toDp() }
                LiquidBottomTabs(
                    selectedTabIndex = selected,
                    onTabSelected = ::onTabSelected,
                    backdrop = appleContent,
                    tabsCount = tabs.size,
                    modifier = Modifier
                        .align(Alignment.CenterStart)
                        .offset { IntOffset(barX, 0) }
                        .width(width)
                        .pointerInput(Unit) { detectLongPress(::openSettings) }
                ) {
                    tabs.forEachIndexed { index, tab ->
                        LiquidBottomTab({ onTabClicked(index) }) {
                            Box(Modifier.size(28f.dp).drawBehind { drawIcon(tab.icon, contentColor) })
                            if (labels) {
                                BasicText(
                                    tab.title,
                                    style = TextStyle(contentColor, 10f.sp, fontFamily = fontFamily),
                                    overflow = TextOverflow.Ellipsis,
                                    softWrap = false,
                                    maxLines = 1
                                )
                            }
                        }
                    }
                }
            }
        }
    }

    private fun DrawScope.drawIcon(icon: Drawable?, color: Color) {
        icon ?: return
        drawIntoCanvas { canvas ->
            icon.setBounds(0, 0, size.width.roundToInt(), size.height.roundToInt())
            icon.colorFilter = PorterDuffColorFilter(color.toArgb(), PorterDuff.Mode.SRC_IN)
            icon.draw(canvas.nativeCanvas)
        }
    }

    private fun openSettings() {
        overlay.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS)
        SettingsSheet.show(bottomNav, content)
    }

    // endregion

    // region Navigation

    private fun onTabClicked(index: Int) {
        val tab = tabs.getOrNull(index) ?: return
        if (index == selectedIndex) {
            // Same tab again: Apple scrolls its page back to the top.
            setSelectedItemId(tab.id)
        } else {
            // The drop moves, then LiquidBottomTabs reports the new tab to onTabSelected.
            selectedIndex = index
        }
    }

    private fun onTabSelected(index: Int) {
        val tab = tabs.getOrNull(index) ?: return
        selectedIndex = index
        if (selectedItemId() != tab.id) {
            setSelectedItemId(tab.id)
            if (LiquidSettings.tabHaptics()) overlay.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK)
        }
    }

    private fun selectStartTab() {
        if (startTabApplied) return
        startTabApplied = true
        val start = tabNameFor(LiquidSettings.startTab()) ?: return
        val tab = tabs.firstOrNull { it.name == start } ?: return
        if (selectedItemId() != tab.id) setSelectedItemId(tab.id)
    }

    private fun refreshTabs() {
        tabsRevision = LiquidSettings.revision
        val menu = invoke(bottomNav, "getMenu") as? Menu ?: return
        val resources = bottomNav.resources
        tabs = (0 until menu.size()).map(menu::getItem).filter { it.isVisible }.mapNotNull { item ->
            val name = runCatching { resources.getResourceEntryName(item.itemId) }.getOrDefault("")
            if (isHidden(name)) return@mapNotNull null
            val icon = item.icon?.constantState?.newDrawable(resources)?.mutate() ?: item.icon
            Tab(item.itemId, name, item.title?.toString().orEmpty(), icon)
        }
    }

    private fun selectedItemId(): Int = invoke(bottomNav, "getSelectedItemId") as? Int ?: View.NO_ID

    private fun setSelectedItemId(id: Int) {
        invoke(bottomNav, "setSelectedItemId", id)
    }

    // endregion

    // region Frame tracking

    override fun onPreDraw(): Boolean {
        try {
            if (LiquidSettings.liquidTabBar()) sync() else remove()
        } catch (t: Throwable) {
            if (!errorLogged) Log.e(LiquidGlassPatch.TAG, "Liquid tab bar update failed", t)
            errorLogged = true
        }
        return true
    }

    private fun sync() {
        // Apple's bar keeps its place, its visibility and its touch targets, but draws nothing,
        // not even its shadow.
        if (bottomNav.clipBounds?.isEmpty != true) bottomNav.clipBounds = EMPTY
        if (bottomNav.outlineSpotShadowColor != 0) bottomNav.outlineSpotShadowColor = 0
        if (bottomNav.outlineAmbientShadowColor != 0) bottomNav.outlineAmbientShadowColor = 0

        val visibility = if (bottomNav.isShown) View.VISIBLE else View.INVISIBLE
        if (overlay.visibility != visibility) overlay.visibility = visibility
        if (overlay.alpha != bottomNav.alpha) overlay.alpha = bottomNav.alpha
        if (overlay.elevation != bottomNav.elevation) overlay.elevation = bottomNav.elevation

        val params = overlay.layoutParams
        val width = parent.width
        val height = bottomNav.height + 2 * overflow
        if (params.width != width || params.height != height) {
            params.width = width
            params.height = height
            overlay.layoutParams = params
        }
        overlay.translationX = -overlay.left.toFloat()
        overlay.translationY = bottomNav.top + bottomNav.translationY - overflow - overlay.top
        barX = (bottomNav.left + bottomNav.translationX).roundToInt()
        barWidth = bottomNav.width

        content.update()
        overlay.getLocationInWindow(location)
        overlayX = location[0]
        overlayY = location[1]

        if (tabsRevision != LiquidSettings.revision) refreshTabs()
        val index = tabs.indexOfFirst { it.id == selectedItemId() }
        if (index >= 0 && index != selectedIndex) selectedIndex = index
    }

    /** Gives the tab bar back to Apple (the setting was turned off). */
    private fun remove() {
        bottomNav.viewTreeObserver.removeOnPreDrawListener(this)
        bottomNav.removeOnAttachStateChangeListener(this)
        parent.removeView(overlay)
        bottomNav.clipBounds = null
        bottomNav.outlineSpotShadowColor = BLACK
        bottomNav.outlineAmbientShadowColor = BLACK
        BARS.remove(bottomNav)
        blurView.invalidate()
    }

    override fun onViewAttachedToWindow(view: View) {
        bottomNav.viewTreeObserver.addOnPreDrawListener(this)
    }

    override fun onViewDetachedFromWindow(view: View) {
        bottomNav.viewTreeObserver.removeOnPreDrawListener(this)
    }

    // endregion

    companion object {
        private val EMPTY = Rect()
        private val BARS = WeakHashMap<View, LiquidTabBar>()
        private val FAILED = WeakHashMap<View, Boolean>()
        private val METHODS = HashMap<String, Method>()
        private var startTabApplied = false

        /**
         * Called while the BlurView of the tab bar draws. Sets the liquid tab bar up (after this
         * frame, views cannot be added while drawing) and returns true when it replaces the bar,
         * false to keep the glass of the BlurView.
         */
        @JvmStatic
        fun replace(blurView: View, bottomNav: View?): Boolean {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S || !LiquidSettings.liquidTabBar()) return false
            if (bottomNav !is ViewGroup || FAILED.containsKey(bottomNav)) return false
            val parent = bottomNav.parent
            if (parent !is FrameLayout && parent?.javaClass?.name?.endsWith("ConstraintLayout") != true) return false
            if (!BARS.containsKey(bottomNav)) {
                BARS[bottomNav] = null // Pending until the next message.
                blurView.post {
                    try {
                        if (BARS[bottomNav] == null && bottomNav.isAttachedToWindow && LiquidSettings.liquidTabBar()) {
                            BARS[bottomNav] = LiquidTabBar(bottomNav, blurView)
                        } else if (BARS[bottomNav] == null) {
                            BARS.remove(bottomNav)
                            blurView.invalidate()
                        }
                    } catch (t: Throwable) {
                        Log.e(LiquidGlassPatch.TAG, "Liquid tab bar disabled", t)
                        FAILED[bottomNav] = true
                        BARS.remove(bottomNav)
                        bottomNav.clipBounds = null
                        blurView.invalidate()
                    }
                }
            }
            return true
        }

        private fun isHidden(name: String) =
            (name.contains("browse") && LiquidSettings.hideNewTab()) ||
                (name.contains("radio") && LiquidSettings.hideRadioTab())

        /** Resource name of the menu item for a "Start tab" option value. */
        private fun tabNameFor(option: String?): String? = when (option?.lowercase()) {
            "new" -> "action_browse_deprecated"
            "radio" -> "action_multiply_radio_deprecated"
            "library" -> "action_library_deprecated"
            "search" -> "search_fragment_deprecated"
            else -> null // Home: Apple's own start tab.
        }

        private fun findTypeface(view: View): Typeface? {
            if (view is TextView) return view.typeface
            if (view is ViewGroup) {
                for (i in 0 until view.childCount) findTypeface(view.getChildAt(i))?.let { return it }
            }
            return null
        }

        private fun invoke(target: Any, name: String, vararg args: Int): Any? {
            val key = name + args.size
            val method = METHODS[key] ?: target.javaClass.methods.first {
                it.name == name && it.parameterTypes.size == args.size
            }.also { METHODS[key] = it }
            return method.invoke(target, *args.toTypedArray())
        }

        /**
         * Calls [onLongPress] when a finger stays on the bar for the long press timeout without
         * moving, then keeps the rest of the gesture from the tabs, so the press does not select one.
         */
        private suspend fun androidx.compose.ui.input.pointer.PointerInputScope.detectLongPress(onLongPress: () -> Unit) {
            awaitEachGesture {
                val down = awaitFirstDown(requireUnconsumed = false, pass = PointerEventPass.Initial)
                val released = withTimeoutOrNull(viewConfiguration.longPressTimeoutMillis) {
                    while (true) {
                        val change = awaitPointerEvent(PointerEventPass.Initial).changes
                            .firstOrNull { it.id == down.id } ?: return@withTimeoutOrNull
                        if (!change.pressed) return@withTimeoutOrNull
                        if ((change.position - down.position).getDistance() > viewConfiguration.touchSlop) {
                            return@withTimeoutOrNull
                        }
                    }
                }
                if (released != null) return@awaitEachGesture
                onLongPress()
                do {
                    val event = awaitPointerEvent(PointerEventPass.Initial)
                    event.changes.forEach { it.consume() }
                } while (event.changes.any { it.pressed })
            }
        }
    }
}
