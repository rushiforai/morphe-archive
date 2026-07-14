package app.utsavrajput.extension

import android.app.Activity
import android.content.ActivityNotFoundException
import android.content.Intent
import android.graphics.Color
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.os.Bundle
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.view.Window
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import android.widget.Toast

/**
 * Tools screen — visually matches MX Player's native "Local" tab:
 *  - Same pure-black background
 *  - Title in same top-left position/size/weight as "Folders"
 *  - Same bottom nav bar (Local / Fatafat / Search / Games) so user can
 *    switch tabs directly from this screen instead of hitting back.
 *
 * Kept 100% programmatic (no XML layouts / R.layout refs) and avoids any
 * Kotlin stdlib surface MX Player's stripped runtime doesn't already use
 * (manual loops instead of listOf/forEach, custom holder class instead of
 * kotlin.Pair, no joinToString/filter/etc).
 */
class ToolsActivity : Activity() {

    // Manual holder — avoids kotlin.Pair (stripped from MX Player's stdlib)
    private class ToolItem(
        val title: String,
        val subtitle: String,
        val colorHex: String,
        val emoji: String,
        val targetClass: String,
    )

    private fun dp(value: Int): Int {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            value.toFloat(),
            resources.displayMetrics,
        ).toInt()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // MX Player draws edge-to-edge with a pure-black status/nav bar.
        // A plain Activity defaults to the system gray/translucent nav bar,
        // which is the "grey bar" showing below our bottom nav row — force
        // both system bars to black so there's no visible seam.
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
        window.statusBarColor = Color.BLACK
        window.navigationBarColor = Color.BLACK

        val root = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(Color.BLACK)
            layoutParams = ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT,
            )
        }

        root.addView(buildTitleBar())
        root.addView(buildToolsList(), LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f
        ))
        root.addView(buildBottomNav())

        setContentView(root)
    }

    // ---- Title bar: matches "Folders" — top-left, bold, 28sp, white ----
    private fun buildTitleBar(): View {
        val bar = LinearLayout(this).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(dp(16), dp(24), dp(16), dp(16))
        }
        val title = TextView(this).apply {
            text = "Tools"
            setTextColor(Color.WHITE)
            textSize = 28f
            setTypeface(typeface, Typeface.BOLD)
        }
        bar.addView(title)
        return bar
    }

    // ---- Scrollable tool rows, styled like MX Player's Local list ----
    private fun buildToolsList(): View {
        val scroll = ScrollView(this)
        val list = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
        }

        val items = arrayOf(
            ToolItem("File Transfer", "Send/receive files nearby", "#2ECC71", "\uD83D\uDCC1",
                "com.mxtech.videoplayer.mxtransfer.ui.ActionActivity"),
            ToolItem("WhatsApp Status Saver", "Save and share WhatsApp statuses", "#25D366", "\uD83D\uDCF2",
                "com.mxtech.videoplayer.ad.local.WhatsAppActivityOnlineTheme"),
            ToolItem("My Playlists", "Manage your video playlists", "#9B59B6", "\uD83C\uDFAC",
                "com.mxtech.videoplaylist.VideoPlaylistActivity"),
            ToolItem("Secure Folder", "PIN-protected private vault", "#3498DB", "\uD83D\uDD12",
                "com.mxtech.privatefolder.setup.PrivateVerifyActivity"),
            ToolItem("URL Stream", "Play or manage streamed URLs", "#E67E22", "\uD83C\uDF10",
                "com.mxtech.videoplayer.ad.local.netstream.NetworkStreamHistoryActivity"),
            ToolItem("Recycle Bin", "Restore or permanently delete trashed files", "#E74C3C", "\uD83D\uDDD1",
                "com.mxtech.videoplayer.ad.local.bin.RecycleBinActivity"),
        )

        var i = 0
        while (i < items.size) {
            list.addView(buildToolRow(items[i]))
            i = i + 1
        }

        scroll.addView(list)
        return scroll
    }

    private fun buildToolRow(item: ToolItem): View {
        val outValue = TypedValue()
        theme.resolveAttribute(android.R.attr.selectableItemBackground, outValue, true)

        val row = LinearLayout(this).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(dp(16), dp(14), dp(16), dp(14))
            isClickable = true
            isFocusable = true
            setBackgroundResource(outValue.resourceId)
        }

        val circle = GradientDrawable().apply {
            shape = GradientDrawable.OVAL
            setColor(Color.parseColor(item.colorHex))
        }
        val icon = TextView(this).apply {
            text = item.emoji
            textSize = 20f
            gravity = Gravity.CENTER
            background = circle
            layoutParams = LinearLayout.LayoutParams(dp(44), dp(44))
        }
        row.addView(icon)

        val textCol = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(dp(14), 0, 0, 0)
        }
        textCol.addView(TextView(this).apply {
            text = item.title
            setTextColor(Color.WHITE)
            textSize = 16f
            setTypeface(typeface, Typeface.BOLD)
        })
        textCol.addView(TextView(this).apply {
            text = item.subtitle
            setTextColor(Color.parseColor("#999999"))
            textSize = 13f
        })
        row.addView(textCol)

        row.setOnClickListener {
            try {
                val intent = Intent()
                intent.setClassName(packageName, item.targetClass)
                startActivity(intent)
            } catch (e: ActivityNotFoundException) {
                Toast.makeText(this, item.title + " not available", Toast.LENGTH_SHORT).show()
            }
        }

        return row
    }

    // ---- Bottom nav bar: same 4 tabs as MX Player, same style ----
    private class NavItem(val label: String, val emoji: String, val active: Boolean, val tabKey: String)

    private fun buildBottomNav(): View {
        val bar = LinearLayout(this).apply {
            orientation = LinearLayout.HORIZONTAL
            setBackgroundColor(Color.BLACK)
            setPadding(0, dp(8), 0, dp(8))
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(56)
            )
        }

        val navItems = arrayOf(
            NavItem("Local", "\uD83D\uDCC1", false, "local"),
            NavItem("Fatafat", "\u26A1", false, "fatafat"),
            NavItem("Search", "\uD83D\uDD0D", true, "search"), // this screen replaces Search
            NavItem("Games", "\uD83C\uDFAE", false, "games"),
        )

        var i = 0
        while (i < navItems.size) {
            bar.addView(buildNavTab(navItems[i]), LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.MATCH_PARENT, 1f
            ))
            i = i + 1
        }

        return bar
    }

    private fun buildNavTab(item: NavItem): View {
        val activeColor = Color.parseColor("#4A90E2")
        val inactiveColor = Color.parseColor("#888888")
        val tintColor = if (item.active) activeColor else inactiveColor

        val tab = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER
            background = null
            setPadding(0, 0, 0, 0)
            isClickable = true
            isFocusable = true
        }

        // Fatafat has real MX Player icons embedded (IconAssets) — use
        // those directly, no tint needed since the art is pre-colored.
        // Other tabs fall back to emoji glyphs until their icons are
        // extracted the same way (see IconAssets.kt TODOs).
        if (item.tabKey.equals("fatafat")) {
            val iconView = ImageView(this).apply {
                setImageBitmap(
                    if (item.active) IconAssets.fatafatSelected() else IconAssets.fatafatDefault()
                )
                layoutParams = LinearLayout.LayoutParams(dp(24), dp(24)).apply {
                    bottomMargin = dp(2)
                }
            }
            tab.addView(iconView)
        } else {
            tab.addView(TextView(this).apply {
                text = item.emoji
                textSize = 18f
                gravity = Gravity.CENTER
                setTextColor(tintColor)
                setPadding(0, 0, 0, dp(2))
            })
        }

        tab.addView(TextView(this).apply {
            text = item.label
            textSize = 11f
            gravity = Gravity.CENTER
            setTextColor(tintColor)
            setPadding(0, 0, 0, 0)
        })

        // Local/Fatafat/Games trigger a real tab switch on the underlying
        // MX Player fragment (via reflection into O1()) before finishing —
        // otherwise finish() alone just reveals whatever tab was last
        // visible, not the one the user actually tapped here.
        if (!item.active) {
            tab.setOnClickListener {
                ExtensionHooks.switchTab(item.tabKey)
                finish()
            }
        }

        return tab
    }
}