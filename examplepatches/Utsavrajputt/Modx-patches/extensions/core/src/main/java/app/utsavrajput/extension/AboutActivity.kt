package app.utsavrajput.extension

import android.app.Activity
import android.content.ActivityNotFoundException
import android.content.Intent
import android.graphics.Color
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.net.Uri
import android.os.Bundle
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import android.widget.Toast

/**
 * "About" screen — Modxzone-style branded page: app logo, title, tagline
 * card, and a list of official links (GitHub, repo, Telegram, WhatsApp).
 * Same chrome as ToolsActivity (matches native "Local" tab): pure-black
 * edge-to-edge background, bold top-left title (no icons here, per
 * requirements), shared bottom nav.
 *
 * Built entirely in code — no XML layout / R.layout reference (see
 * SESSION_README for why: extendWith() never merges the extension
 * module's own resources.arsc into the host APK). Uses .equals() instead
 * of == for string compares and manual loops instead of listOf/forEach —
 * avoids Kotlin stdlib calls MX Player's stripped runtime doesn't already
 * use (see the NoSuchMethodError/Intrinsics.areEqual fix history).
 */
class AboutActivity : Activity() {

    companion object {
        private const val ICON_GITHUB = 1
        private const val ICON_CODE = 2
        private const val ICON_TELEGRAM = 3
        private const val ICON_WHATSAPP = 4
    }

    // Manual holder — avoids kotlin.Pair (stripped from MX Player's stdlib)
    private class LinkItem(
        val title: String,
        val colorHex: String,
        val url: String,
        val iconKind: Int,
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

        root.addView(TopBarBuilder.build(this, "About", false))
        root.addView(
            buildContent(),
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f),
        )
        root.addView(NavBarBuilder.build(this, "about"))

        setContentView(root)
    }

    private fun buildContent(): View {
        val scroll = ScrollView(this)
        val column = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(dp(24), dp(24), dp(24), dp(24))
        }

        // ---- Logo ----
        val logo = ImageView(this).apply {
            setImageBitmap(IconAssets.modxZoneLogo())
            layoutParams = LinearLayout.LayoutParams(dp(96), dp(96)).apply {
                gravity = Gravity.CENTER_HORIZONTAL
            }
        }
        column.addView(logo)

        // ---- Title ----
        column.addView(TextView(this).apply {
            text = "Modx Patches"
            setTextColor(Color.WHITE)
            textSize = 22f
            setTypeface(typeface, Typeface.BOLD)
            gravity = Gravity.CENTER
            setPadding(0, dp(16), 0, 0)
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
            )
        })

        // ---- Subtitle ----
        column.addView(TextView(this).apply {
            text = "Custom patch set for MX Player"
            setTextColor(Color.parseColor("#8A8F98"))
            textSize = 13f
            gravity = Gravity.CENTER
            setPadding(0, dp(4), 0, 0)
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
            )
        })

        // ---- Tagline card ----
        val card = GradientDrawable().apply {
            setColor(Color.parseColor("#12151A"))
            cornerRadius = dp(14).toFloat()
        }
        column.addView(TextView(this).apply {
            text = "Reverse-engineered. Repurposed. Perfected.\n\nBuilt by Utsav Rajput."
            setTextColor(Color.parseColor("#C7CBD1"))
            textSize = 14f
            gravity = Gravity.CENTER
            background = card
            setPadding(dp(20), dp(20), dp(20), dp(20))
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
            ).apply { topMargin = dp(24) }
        })

        // ---- Section header ----
        column.addView(TextView(this).apply {
            text = "OFFICIAL LINKS"
            setTextColor(Color.parseColor("#6E7480"))
            textSize = 12f
            setTypeface(typeface, Typeface.BOLD)
            letterSpacing = 0.12f
            setPadding(dp(4), 0, 0, dp(8))
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
            ).apply { topMargin = dp(28) }
        })

        // ---- Link rows ----
        val links = arrayOf(
            LinkItem("GitHub", "#24292F", "https://github.com/utsavrajputt", ICON_GITHUB),
            LinkItem("Modx-Patches", "#E53935", "https://github.com/Utsavrajputt/Modx-patches", ICON_CODE),
            LinkItem("Telegram", "#26A5E4", "https://t.me/+_za0AQ_gtjxjZWQ1", ICON_TELEGRAM),
            LinkItem("WhatsApp Channel", "#25D366", "https://whatsapp.com/channel/0029VbCrjAVAjPXNhDZ74O3C", ICON_WHATSAPP),
        )

        var i = 0
        while (i < links.size) {
            column.addView(buildLinkRow(links[i]))
            i = i + 1
        }

        scroll.addView(column)
        return scroll
    }

    private fun buildLinkRow(item: LinkItem): View {
        val outValue = TypedValue()
        theme.resolveAttribute(android.R.attr.selectableItemBackground, outValue, true)

        val rowBg = GradientDrawable().apply {
            setColor(Color.parseColor("#12151A"))
            cornerRadius = dp(16).toFloat()
        }

        val row = LinearLayout(this).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            background = rowBg
            setPadding(dp(16), dp(14), dp(16), dp(14))
            isClickable = true
            isFocusable = true
            if (android.os.Build.VERSION.SDK_INT >= 23) {
                foreground = getDrawable(outValue.resourceId)
            }
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
            ).apply { topMargin = dp(10) }
        }

        val circle = GradientDrawable().apply {
            shape = GradientDrawable.OVAL
            setColor(Color.parseColor(item.colorHex))
        }
        val glyphBitmap = when (item.iconKind) {
            ICON_GITHUB -> IconAssets.githubGlyph()
            ICON_CODE -> IconAssets.codeGlyph()
            ICON_TELEGRAM -> IconAssets.telegramGlyph()
            else -> IconAssets.whatsappGlyph()
        }
        row.addView(
            FrameLayout(this).apply {
                background = circle
                layoutParams = LinearLayout.LayoutParams(dp(44), dp(44))
                addView(
                    ImageView(this@AboutActivity).apply {
                        setImageBitmap(glyphBitmap)
                        layoutParams = FrameLayout.LayoutParams(dp(22), dp(22)).apply {
                            gravity = Gravity.CENTER
                        }
                    },
                )
            },
        )

        row.addView(
            TextView(this).apply {
                text = item.title
                setTextColor(Color.WHITE)
                textSize = 16f
                setTypeface(typeface, Typeface.BOLD)
                setPadding(dp(16), 0, 0, 0)
                layoutParams = LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
            },
        )

        row.addView(TextView(this).apply {
            text = "\u276F"
            setTextColor(Color.parseColor("#6E7480"))
            textSize = 16f
        })

        row.setOnClickListener {
            try {
                startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(item.url)))
            } catch (e: ActivityNotFoundException) {
                Toast.makeText(this, "Couldn't open " + item.title, Toast.LENGTH_SHORT).show()
            }
        }

        return row
    }
}
