package app.morphe.extension.sabp.shots

import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.TextView
import app.cash.paparazzi.DeviceConfig
import app.cash.paparazzi.Paparazzi
import app.morphe.extension.sabp.EppyTheme
import app.morphe.extension.sabp.ui.EppyIcon
import app.morphe.extension.sabp.ui.NavItem
import app.morphe.extension.sabp.ui.PlayButton
import app.morphe.extension.sabp.ui.Ui
import com.android.ide.common.rendering.api.SessionParams
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test

/**
 * Renders eppy's shared components in every style, light and dark, at 100 % and 200 % font
 * scale, and checks their geometry from a real measure/layout pass:
 *  - navigation icon and label share a centre line and the icon sits centred in its indicator;
 *  - labels are never clipped and every target is at least 48 dp;
 *  - chip icons are vertically centred on their label;
 *  - selecting a navigation item changes no sizes (theme/state change never changes layout).
 * Images go to ui-tests/src/test/snapshots/images for review.
 */
class ComponentShots {
    @get:Rule
    val paparazzi = Paparazzi(
        deviceConfig = DeviceConfig.PIXEL_5,
        theme = "android:Theme.Material.Light.NoActionBar",
        renderingMode = SessionParams.RenderingMode.V_SCROLL,
    )

    @Test
    fun components_font100() = gallery(1f)

    @Test
    fun components_font200() {
        paparazzi.unsafeUpdateConfig(deviceConfig = DeviceConfig.PIXEL_5.copy(fontScale = 2f))
        gallery(2f)
    }

    @Test
    fun icons() {
        val ctx = TestContext(paparazzi.context, mapOf("skin" to "material", "mode" to "light"))
        val t = EppyTheme.resolve(ctx, 0)
        val grid = LinearLayout(ctx).apply { orientation = LinearLayout.VERTICAL; setBackgroundColor(0xFFFFFFFF.toInt()) }
        var row: LinearLayout? = null
        var id = 1
        while (true) {
            val probe = EppyIcon(id, 0)
            if (!hasPath(probe)) break
            if ((id - 1) % 8 == 0) {
                row = LinearLayout(ctx)
                grid.addView(row)
            }
            for (filled in listOf(false, true)) {
                val iv = android.widget.ImageView(ctx)
                iv.setImageDrawable(EppyIcon(id, t.onSurface, filled))
                row!!.addView(iv, LinearLayout.LayoutParams(Ui.dp(ctx, 40f), Ui.dp(ctx, 40f)).apply { setMargins(6, 6, 6, 6) })
            }
            id++
        }
        assertTrue("icon set is empty", id > 20)
        paparazzi.snapshot(grid, "icons")
    }

    private fun hasPath(icon: EppyIcon): Boolean = try {
        val m = EppyIcon::class.java.getDeclaredMethod("path", Int::class.javaPrimitiveType, Boolean::class.javaPrimitiveType)
        m.isAccessible = true
        !(m.invoke(null, icon.icon(), false) as android.graphics.Path).isEmpty
    } catch (e: Throwable) {
        false
    }

    private fun gallery(fontScale: Float) {
        for (skin in EppyTheme.SKINS) for (mode in listOf("light", "dark")) {
            val ctx = TestContext(paparazzi.context, mapOf("skin" to skin, "mode" to mode))
            val t = EppyTheme.resolve(ctx, 0)
            t.activateFont()
            val section = LinearLayout(ctx).apply {
                orientation = LinearLayout.VERTICAL
                background = t.background()
                setPadding(0, Ui.dp(ctx, 12f), 0, Ui.dp(ctx, 12f))
            }
            section.addView(Ui.text(ctx, t, "$skin · $mode · font ${(fontScale * 100).toInt()}%", 14f, 600, t.onSurface).apply {
                setPadding(Ui.dp(ctx, 16f), 0, 0, Ui.dp(ctx, 8f))
            })

            // Bottom bar
            val bar = LinearLayout(ctx).apply { setBackgroundColor(t.surfaceContainer) }
            val barItems = listOf(EppyIcon.HOME to "Home", EppyIcon.LIBRARY to "Library", EppyIcon.BOOKMARK to "Bookmarks", EppyIcon.SETTINGS to "Settings")
                .mapIndexed { i, (icon, label) ->
                    NavItem(ctx, t, icon, label, NavItem.STYLE_BAR).also {
                        it.isSelected = i == 0
                        bar.addView(it, LinearLayout.LayoutParams(0, Ui.dp(ctx, 80f), 1f))
                    }
                }
            section.addView(bar)

            // Floating pill
            val pill = LinearLayout(ctx).apply {
                background = Ui.rounded(t.navBg, Ui.dp(ctx, 28f).toFloat())
                setPadding(Ui.dp(ctx, 8f), Ui.dp(ctx, 8f), Ui.dp(ctx, 8f), Ui.dp(ctx, 8f))
            }
            val pillItems = listOf(EppyIcon.HOME, EppyIcon.LIBRARY, EppyIcon.BOOKMARK, EppyIcon.SETTINGS).mapIndexed { i, icon ->
                NavItem(ctx, t, icon, "Tab $i", NavItem.STYLE_PILL).also {
                    it.isSelected = i == 1
                    pill.addView(it, LinearLayout.LayoutParams(Ui.dp(ctx, 56f), Ui.dp(ctx, 52f)))
                }
            }
            section.addView(FrameLayout(ctx).apply {
                setPadding(0, Ui.dp(ctx, 12f), 0, Ui.dp(ctx, 12f))
                addView(pill, FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, android.view.Gravity.CENTER_HORIZONTAL))
            })

            // Rail item
            val rail = NavItem(ctx, t, EppyIcon.LIBRARY, "Library", NavItem.STYLE_RAIL).also { it.isSelected = true }
            section.addView(rail, LinearLayout.LayoutParams(Ui.dp(ctx, 80f), ViewGroup.LayoutParams.WRAP_CONTENT))

            // Transport row
            val controls = LinearLayout(ctx).apply { gravity = android.view.Gravity.CENTER }
            controls.addView(Ui.iconButton(ctx, t, EppyIcon.REWIND, t.onSurface, 0, "Rewind", null))
            controls.addView(PlayButton(ctx).also { it.apply(t) }, LinearLayout.LayoutParams(Ui.dp(ctx, 72f), Ui.dp(ctx, 72f)))
            controls.addView(Ui.iconButton(ctx, t, EppyIcon.FORWARD, t.onSurface, 0, "Forward", null))
            section.addView(controls)

            // Chips
            val chips = LinearLayout(ctx).apply { setPadding(Ui.dp(ctx, 16f), Ui.dp(ctx, 8f), 0, Ui.dp(ctx, 8f)) }
            val chipViews = listOf(
                Ui.chip(ctx, t, EppyIcon.BOOKMARK_ADD, "Add bookmark", false, "Remove bookmark", null),
                Ui.chip(ctx, t, EppyIcon.SPEED, "1.25×", true, null),
                Ui.chip(ctx, t, EppyIcon.MOON, "Sleep", false, null),
            )
            chipViews.forEach {
                chips.addView(it)
                chips.addView(Ui.space(ctx, 8, 1))
            }
            section.addView(android.widget.HorizontalScrollView(ctx).apply { addView(chips) })

            // Settings rows
            section.addView(Ui.switchRow(ctx, t, "Reduce motion", "Skip transitions and shape animations", true, null))
            section.addView(Ui.linkRow(ctx, t, EppyIcon.HISTORY, "History", "Recent position changes", null))

            Geometry.layout(section, Ui.dp(ctx, 393f))
            val name = "$skin-$mode-font${(fontScale * 100).toInt()}"
            checkNav(name, barItems + pillItems + rail, ctx)
            checkChips(name, chipViews)
            checkSelectionKeepsGeometry(name, barItems)
            paparazzi.snapshot(section, name)
        }
    }

    private fun checkNav(name: String, items: List<NavItem>, ctx: android.content.Context) {
        val min = Ui.dp(ctx, 48f)
        for (item in items) {
            val icon = item.iconView()
            val ind = item.indicatorView()
            assertTrue("$name: nav target ${item.width}x${item.height} < 48dp", item.width >= min && item.height >= min)
            Geometry.assertNear("$name: icon centred in indicator (x)", Geometry.centerX(icon, item), Geometry.centerX(ind, item), 1f)
            Geometry.assertNear("$name: icon centred in indicator (y)", Geometry.centerY(icon, item), Geometry.centerY(ind, item), 1f)
            val label = item.labelView()
            if (label.parent != null) {
                Geometry.assertNear("$name: label under icon", Geometry.centerX(label, item), Geometry.centerX(icon, item), 1.5f)
                val bottom = Geometry.offset(label, item)[1] + label.height
                assertTrue("$name: label clipped ($bottom > ${item.height})", bottom <= item.height)
                assertTrue("$name: label overlaps icon", Geometry.offset(label, item)[1] >= Geometry.offset(ind, item)[1] + ind.height)
            }
        }
    }

    private fun checkChips(name: String, chips: List<LinearLayout>) {
        for (chip in chips) {
            val label = Geometry.find<TextView>(chip).first()
            val icon = Geometry.find<android.widget.ImageView>(chip).firstOrNull() ?: continue
            Geometry.assertNear("$name: chip icon centred on label", Geometry.centerY(icon, chip), Geometry.centerY(label, chip), 1.5f)
            assertTrue("$name: chip label clipped", Geometry.offset(label, chip)[1] >= 0 && Geometry.offset(label, chip)[1] + label.height <= chip.height)
        }
    }

    private fun checkSelectionKeepsGeometry(name: String, items: List<NavItem>) {
        val before = items.map { intArrayOf(it.left, it.top, it.width, it.height, it.labelView().width) }
        items.forEachIndexed { i, it -> it.isSelected = i == items.size - 1 }
        val parent = items.first().parent as View
        parent.measure(
            View.MeasureSpec.makeMeasureSpec(parent.width, View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(parent.height, View.MeasureSpec.EXACTLY),
        )
        parent.layout(parent.left, parent.top, parent.right, parent.bottom)
        val after = items.map { intArrayOf(it.left, it.top, it.width, it.height, it.labelView().width) }
        for (i in items.indices) {
            assertTrue("$name: selecting changed nav geometry ${before[i].toList()} → ${after[i].toList()}", before[i].contentEquals(after[i]))
        }
        items.forEachIndexed { i, it -> it.isSelected = i == 0 }
    }
}
