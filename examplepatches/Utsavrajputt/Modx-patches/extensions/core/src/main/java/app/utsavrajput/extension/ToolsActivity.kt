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
import android.view.WindowManager
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import android.widget.Toast

/**
 * Tools screen — visually matches MX Player's native "Local" tab:
 *  - Same pure-black background, edge-to-edge with system bars
 *  - Bold left-aligned title ("Tools") + right-side search/sort icons,
 *    same position/style as MX Player's own top bar
 *  - Same bottom nav bar (Local / Fatafat / Tools / About), built via the
 *    shared NavBarBuilder so it's pixel-identical to AboutActivity's
 *
 * Kept 100% programmatic (no XML layouts / R.layout refs) and avoids any
 * Kotlin stdlib surface MX Player's stripped runtime doesn't already use
 * (manual loops instead of listOf/forEach, .equals() instead of == for
 * string compares, custom holder class instead of kotlin.Pair).
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

        // Kill the default window scale/fade transition on entry so opening
        // Tools feels as instant as the native Local<->Fatafat fragment swap
        // (the launch-side half of this fix lives in ExtensionHooks.launch()).
        overridePendingTransition(0, 0)

        // MX Player draws edge-to-edge with a pure-black status/nav bar and
        // no light-scrim on either system bar. Force the same here so
        // there's no visible seam/grey tint behind our custom chrome.
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
        window.statusBarColor = Color.BLACK
        window.navigationBarColor = Color.BLACK
        var uiFlags = window.decorView.systemUiVisibility
        uiFlags = uiFlags and View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR.inv()
        uiFlags = uiFlags and View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR.inv()
        window.decorView.systemUiVisibility = uiFlags

        val root = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(Color.BLACK)
            layoutParams = ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT,
            )
        }

        root.addView(TopBarBuilder.build(this, "Tools", true))
        root.addView(
            buildToolsList(),
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f),
        )
        root.addView(NavBarBuilder.build(this, "tools"))

        setContentView(root)
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
}