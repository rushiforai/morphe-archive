package app.morphe.extension.pixiv.aiflag

import android.app.Activity
import android.app.AlertDialog
import android.content.Context
import android.content.res.Configuration
import android.graphics.Color
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.text.InputType
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.*

object AiFilterSettingsView {

    @JvmStatic
    fun setup(activity: Activity) {
        try {
            val isDark = (activity.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES

            val bgColor = if (isDark) 0xFF121212.toInt() else 0xFFF5F5F7.toInt()
            val cardBgColor = if (isDark) 0xFF1E1E1E.toInt() else 0xFFFFFFFF.toInt()
            val textPrimaryColor = if (isDark) 0xFFEEEEEE.toInt() else 0xFF1F2937.toInt()
            val textSecondaryColor = if (isDark) 0xFF9E9E9E.toInt() else 0xFF6B7280.toInt()
            val dividerColor = if (isDark) 0xFF2D2D2D.toInt() else 0xFFE5E7EB.toInt()
            val accentColor = 0xFF0096FA.toInt() // Pixiv brand blue
            val redColor = 0xFFDC2626.toInt()

            activity.window?.setSoftInputMode(
                android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
            )

            val root = LinearLayout(activity).apply {
                orientation = LinearLayout.VERTICAL
                setBackgroundColor(bgColor)
                layoutParams = ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
                )
            }

            // Toolbar
            val toolbar = LinearLayout(activity).apply {
                orientation = LinearLayout.HORIZONTAL
                gravity = Gravity.CENTER_VERTICAL
                setBackgroundColor(cardBgColor)
                val h = dpToPx(activity, 56f).toInt()
                layoutParams = LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, h)
                val p = dpToPx(activity, 16f).toInt()
                setPadding(p, 0, p, 0)
                elevation = dpToPx(activity, 2f)
            }

            val backButton = TextView(activity).apply {
                text = "←"
                textSize = 24f
                setTextColor(textPrimaryColor)
                val p = dpToPx(activity, 8f).toInt()
                setPadding(0, 0, p * 2, 0)
                setOnClickListener {
                    activity.finish()
                }
            }
            toolbar.addView(backButton)

            val titleView = TextView(activity).apply {
                text = "AI Work Filter Settings"
                textSize = 18f
                typeface = Typeface.DEFAULT_BOLD
                setTextColor(textPrimaryColor)
            }
            toolbar.addView(titleView)

            root.addView(toolbar)

            // Scrollable content
            val scrollView = ScrollView(activity).apply {
                isFillViewport = true
                isSmoothScrollingEnabled = true
                layoutParams = LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.MATCH_PARENT
                )
            }

            val content = LinearLayout(activity).apply {
                orientation = LinearLayout.VERTICAL
                val pad = dpToPx(activity, 16f).toInt()
                setPadding(pad, pad, pad, pad * 2)
            }

            // Section 1: Display Preferences Card
            content.addView(createSectionHeader(activity, "DISPLAY PREFERENCES", accentColor))

            val displayCard = createCard(activity, cardBgColor)

            // Switch: Hide Completely
            val hideSwitchRow = createSwitchRow(
                activity,
                "Hide AI Works Completely",
                "Completely remove AI works from feeds instead of dimming them with [AI] badge.",
                textPrimaryColor,
                textSecondaryColor,
                AiFilterConfig.getHideCompletely(activity)
            ) { isChecked ->
                AiFilterConfig.setHideCompletely(activity, isChecked)
            }
            displayCard.addView(hideSwitchRow)

            displayCard.addView(createDivider(activity, dividerColor))

            // Switch: Auto-Block Artists
            val autoBlockSwitchRow = createSwitchRow(
                activity,
                "Auto-Block AI Artists",
                "Automatically record accounts that post AI works to hide all their current and future works.",
                textPrimaryColor,
                textSecondaryColor,
                AiFilterConfig.getAutoBlockArtists(activity)
            ) { isChecked ->
                AiFilterConfig.setAutoBlockArtists(activity, isChecked)
            }
            displayCard.addView(autoBlockSwitchRow)

            content.addView(displayCard)

            // Section 2: Blocked Artists
            content.addView(createSectionHeader(activity, "BLOCKED ARTISTS", accentColor))

            val blockedCard = createCard(activity, cardBgColor)
            val blockedRow = LinearLayout(activity).apply {
                orientation = LinearLayout.HORIZONTAL
                gravity = Gravity.CENTER_VERTICAL
                val p = dpToPx(activity, 16f).toInt()
                setPadding(p, p, p, p)
            }

            val blockedCountView = TextView(activity).apply {
                text = "Blocked Artists: ${AiFilterConfig.getBlockedUserCount(activity)}"
                textSize = 15f
                setTextColor(textPrimaryColor)
                layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
            }
            blockedRow.addView(blockedCountView)

            val clearButton = TextView(activity).apply {
                text = "Clear All"
                textSize = 14f
                typeface = Typeface.DEFAULT_BOLD
                setTextColor(redColor)
                val hp = dpToPx(activity, 12f).toInt()
                val vp = dpToPx(activity, 6f).toInt()
                setPadding(hp, vp, hp, vp)
                background = GradientDrawable().apply {
                    shape = GradientDrawable.RECTANGLE
                    setColor(0x15DC2626)
                    cornerRadius = dpToPx(activity, 6f)
                    setStroke(dpToPx(activity, 1f).toInt(), redColor)
                }
                setOnClickListener {
                    AlertDialog.Builder(activity)
                        .setTitle("Clear Blocked Artists")
                        .setMessage("Are you sure you want to unblock all auto-blocked artists (${AiFilterConfig.getBlockedUserCount(activity)} accounts)?")
                        .setPositiveButton("Clear") { _, _ ->
                            AiFilterConfig.clearBlockedUserIds(activity)
                            blockedCountView.text = "Blocked Artists: 0"
                            Toast.makeText(activity, "Blocked artists list cleared", Toast.LENGTH_SHORT).show()
                        }
                        .setNegativeButton("Cancel", null)
                        .show()
                }
            }
            blockedRow.addView(clearButton)
            blockedCard.addView(blockedRow)
            content.addView(blockedCard)

            // Section 3: Substring Tag Blocklist
            content.addView(createSectionHeader(activity, "SUBSTRING TAG BLOCKLIST", accentColor))
            val subCard = createCard(activity, cardBgColor)
            val subFlow = FlowLayout(activity).apply {
                val p = dpToPx(activity, 12f).toInt()
                setPadding(p, 0, p, p)
            }

            fun refreshSubChips() {
                subFlow.removeAllViews()
                val tags = AiFilterConfig.getSubstringBlocklist(activity)
                for (tag in tags) {
                    subFlow.addView(createChip(activity, tag, isDark) {
                        AiFilterConfig.removeSubstringBlocklistTag(activity, tag)
                        refreshSubChips()
                    })
                }
            }

            val subInputRow = createAddTagInputRow(activity, "Add keyword...", accentColor, textPrimaryColor, isDark) { newTag ->
                AiFilterConfig.addSubstringBlocklistTag(activity, newTag)
                refreshSubChips()
            }
            subCard.addView(subInputRow)
            subCard.addView(subFlow)
            refreshSubChips()
            content.addView(subCard)

            // Section 4: Exact Tag Blocklist
            content.addView(createSectionHeader(activity, "EXACT TAG BLOCKLIST", accentColor))
            val exactCard = createCard(activity, cardBgColor)
            val exactFlow = FlowLayout(activity).apply {
                val p = dpToPx(activity, 12f).toInt()
                setPadding(p, 0, p, p)
            }

            fun refreshExactChips() {
                exactFlow.removeAllViews()
                val tags = AiFilterConfig.getExactBlocklist(activity)
                for (tag in tags) {
                    exactFlow.addView(createChip(activity, tag, isDark) {
                        AiFilterConfig.removeExactBlocklistTag(activity, tag)
                        refreshExactChips()
                    })
                }
            }

            val exactInputRow = createAddTagInputRow(activity, "Add exact tag...", accentColor, textPrimaryColor, isDark) { newTag ->
                AiFilterConfig.addExactBlocklistTag(activity, newTag)
                refreshExactChips()
            }
            exactCard.addView(exactInputRow)
            exactCard.addView(exactFlow)
            refreshExactChips()
            content.addView(exactCard)

            // Section 5: Whitelist
            content.addView(createSectionHeader(activity, "TAG WHITELIST (NEVER FLAGGED)", accentColor))
            val whiteCard = createCard(activity, cardBgColor)
            val whiteFlow = FlowLayout(activity).apply {
                val p = dpToPx(activity, 12f).toInt()
                setPadding(p, 0, p, p)
            }

            fun refreshWhiteChips() {
                whiteFlow.removeAllViews()
                val tags = AiFilterConfig.getWhitelist(activity)
                for (tag in tags) {
                    whiteFlow.addView(createChip(activity, tag, isDark) {
                        AiFilterConfig.removeWhitelistTag(activity, tag)
                        refreshWhiteChips()
                    })
                }
            }

            val whiteInputRow = createAddTagInputRow(activity, "Add whitelist tag...", accentColor, textPrimaryColor, isDark) { newTag ->
                AiFilterConfig.addWhitelistTag(activity, newTag)
                refreshWhiteChips()
            }
            whiteCard.addView(whiteInputRow)
            whiteCard.addView(whiteFlow)
            refreshWhiteChips()
            content.addView(whiteCard)

            // Reset Defaults Button
            val resetRow = LinearLayout(activity).apply {
                gravity = Gravity.CENTER
                val topP = dpToPx(activity, 20f).toInt()
                setPadding(0, topP, 0, 0)
            }
            val resetButton = TextView(activity).apply {
                text = "Reset Default Tags"
                textSize = 14f
                setTextColor(textSecondaryColor)
                val hp = dpToPx(activity, 16f).toInt()
                val vp = dpToPx(activity, 8f).toInt()
                setPadding(hp, vp, hp, vp)
                background = GradientDrawable().apply {
                    shape = GradientDrawable.RECTANGLE
                    cornerRadius = dpToPx(activity, 6f)
                    setStroke(dpToPx(activity, 1f).toInt(), dividerColor)
                }
                setOnClickListener {
                    AlertDialog.Builder(activity)
                        .setTitle("Reset Tags")
                        .setMessage("Restore default tag blocklists and clear the whitelist?")
                        .setPositiveButton("Reset") { _, _ ->
                            AiFilterConfig.resetDefaultTags(activity)
                            refreshSubChips()
                            refreshExactChips()
                            refreshWhiteChips()
                            Toast.makeText(activity, "Tags reset to defaults", Toast.LENGTH_SHORT).show()
                        }
                        .setNegativeButton("Cancel", null)
                        .show()
                }
            }
            resetRow.addView(resetButton)
            content.addView(resetRow)

            scrollView.addView(content)
            root.addView(scrollView)

            activity.setContentView(root)
        } catch (t: Throwable) {
            android.util.Log.e("AiFilterSettingsView", "Failed to setup AI filter settings view", t)
        }
    }

    private fun createSectionHeader(context: Context, title: String, color: Int): TextView {
        return TextView(context).apply {
            text = title
            textSize = 12f
            typeface = Typeface.DEFAULT_BOLD
            setTextColor(color)
            val topP = dpToPx(context, 18f).toInt()
            val botP = dpToPx(context, 8f).toInt()
            val sideP = dpToPx(context, 4f).toInt()
            setPadding(sideP, topP, sideP, botP)
        }
    }

    private fun createCard(context: Context, bgColor: Int): LinearLayout {
        return LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            background = GradientDrawable().apply {
                shape = GradientDrawable.RECTANGLE
                setColor(bgColor)
                cornerRadius = dpToPx(context, 10f)
            }
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
            )
        }
    }

    private fun createDivider(context: Context, color: Int): View {
        return View(context).apply {
            setBackgroundColor(color)
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                dpToPx(context, 1f).toInt()
            )
        }
    }

    private fun createSwitchRow(
        context: Context,
        title: String,
        description: String,
        titleColor: Int,
        descColor: Int,
        initialValue: Boolean,
        onChecked: (Boolean) -> Unit
    ): LinearLayout {
        val row = LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            val p = dpToPx(context, 16f).toInt()
            setPadding(p, p, p, p)
        }

        val textCol = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
        }

        val tvTitle = TextView(context).apply {
            text = title
            textSize = 15f
            typeface = Typeface.DEFAULT_BOLD
            setTextColor(titleColor)
        }
        textCol.addView(tvTitle)

        val tvDesc = TextView(context).apply {
            text = description
            textSize = 12f
            setTextColor(descColor)
            val topP = dpToPx(context, 4f).toInt()
            setPadding(0, topP, 0, 0)
        }
        textCol.addView(tvDesc)

        row.addView(textCol)

        val sw = Switch(context).apply {
            isChecked = initialValue
            setOnCheckedChangeListener { _, isChecked ->
                onChecked(isChecked)
            }
        }
        row.addView(sw)

        row.setOnClickListener {
            sw.isChecked = !sw.isChecked
        }

        return row
    }

    private fun createAddTagInputRow(
        context: Context,
        hintText: String,
        accentColor: Int,
        textColor: Int,
        isDark: Boolean,
        onAdd: (String) -> Unit
    ): LinearLayout {
        val row = LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            val p = dpToPx(context, 12f).toInt()
            setPadding(p, p, p, p)
        }

        val editText = EditText(context).apply {
            hint = hintText
            setHintTextColor(if (isDark) 0xFF666666.toInt() else 0xFFAAAAAA.toInt())
            setTextColor(textColor)
            textSize = 14f
            inputType = InputType.TYPE_CLASS_TEXT
            val p = dpToPx(context, 10f).toInt()
            setPadding(p, p, p, p)
            background = GradientDrawable().apply {
                shape = GradientDrawable.RECTANGLE
                setColor(if (isDark) 0xFF2A2A2A.toInt() else 0xFFF0F0F2.toInt())
                cornerRadius = dpToPx(context, 6f)
            }
            layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
            setOnFocusChangeListener { view, hasFocus ->
                if (hasFocus) {
                    view.postDelayed({
                        var parentView = view.parent
                        while (parentView != null && parentView !is ScrollView) {
                            parentView = parentView.parent
                        }
                        val scroll = parentView as? ScrollView
                        val topOffset = (view.parent as? View)?.top ?: 0
                        scroll?.smoothScrollTo(0, view.bottom + topOffset + 120)
                    }, 250)
                }
            }
        }
        row.addView(editText)

        val addButton = TextView(context).apply {
            text = "Add"
            textSize = 14f
            typeface = Typeface.DEFAULT_BOLD
            setTextColor(Color.WHITE)
            background = GradientDrawable().apply {
                shape = GradientDrawable.RECTANGLE
                setColor(accentColor)
                cornerRadius = dpToPx(context, 6f)
            }
            val hp = dpToPx(context, 16f).toInt()
            val vp = dpToPx(context, 10f).toInt()
            setPadding(hp, vp, hp, vp)
            val margin = dpToPx(context, 8f).toInt()
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
            ).apply {
                leftMargin = margin
                marginStart = margin
            }
            setOnClickListener {
                val text = editText.text.toString().trim()
                if (text.isNotEmpty()) {
                    onAdd(text)
                    editText.setText("")
                }
            }
        }
        row.addView(addButton)

        return row
    }

    private fun createChip(context: Context, tag: String, isDark: Boolean, onRemove: () -> Unit): View {
        val chip = LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            background = GradientDrawable().apply {
                shape = GradientDrawable.RECTANGLE
                setColor(if (isDark) 0xFF2C2C2C.toInt() else 0xFFE9E9EB.toInt())
                cornerRadius = dpToPx(context, 16f)
            }
            val hp = dpToPx(context, 10f).toInt()
            val vp = dpToPx(context, 5f).toInt()
            setPadding(hp, vp, hp, vp)
            val margin = dpToPx(context, 4f).toInt()
            layoutParams = ViewGroup.MarginLayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            ).apply {
                setMargins(margin, margin, margin, margin)
            }
        }

        val label = TextView(context).apply {
            text = tag
            textSize = 13f
            setTextColor(if (isDark) 0xFFEEEEEE.toInt() else 0xFF222222.toInt())
        }
        chip.addView(label)

        val close = TextView(context).apply {
            text = "  ✕"
            textSize = 11f
            typeface = Typeface.DEFAULT_BOLD
            setTextColor(if (isDark) 0xFF888888.toInt() else 0xFF666666.toInt())
            setOnClickListener {
                onRemove()
            }
        }
        chip.addView(close)

        return chip
    }

    private fun dpToPx(context: Context, dp: Float): Float {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            dp,
            context.resources.displayMetrics
        )
    }

    class FlowLayout(context: Context) : ViewGroup(context) {
        override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
            val width = MeasureSpec.getSize(widthMeasureSpec)
            var x = paddingLeft
            var y = paddingTop
            var rowHeight = 0

            for (i in 0 until childCount) {
                val child = getChildAt(i)
                if (child.visibility != GONE) {
                    measureChild(child, widthMeasureSpec, heightMeasureSpec)
                    val lp = (child.layoutParams as? MarginLayoutParams) ?: MarginLayoutParams(child.layoutParams)
                    val childWidth = child.measuredWidth + lp.leftMargin + lp.rightMargin
                    val childHeight = child.measuredHeight + lp.topMargin + lp.bottomMargin

                    if (x + childWidth > width - paddingRight && x > paddingLeft) {
                        x = paddingLeft
                        y += rowHeight
                        rowHeight = 0
                    }
                    x += childWidth
                    rowHeight = maxOf(rowHeight, childHeight)
                }
            }
            y += rowHeight + paddingBottom
            setMeasuredDimension(width, resolveSize(y, heightMeasureSpec))
        }

        override fun onLayout(changed: Boolean, l: Int, t: Int, r: Int, b: Int) {
            val width = r - l
            var x = paddingLeft
            var y = paddingTop
            var rowHeight = 0

            for (i in 0 until childCount) {
                val child = getChildAt(i)
                if (child.visibility != GONE) {
                    val lp = (child.layoutParams as? MarginLayoutParams) ?: MarginLayoutParams(child.layoutParams)
                    val childWidth = child.measuredWidth
                    val childHeight = child.measuredHeight

                    if (x + childWidth + lp.leftMargin + lp.rightMargin > width - paddingRight && x > paddingLeft) {
                        x = paddingLeft
                        y += rowHeight
                        rowHeight = 0
                    }
                    val cl = x + lp.leftMargin
                    val ct = y + lp.topMargin
                    child.layout(cl, ct, cl + childWidth, ct + childHeight)

                    x += childWidth + lp.leftMargin + lp.rightMargin
                    rowHeight = maxOf(rowHeight, childHeight + lp.topMargin + lp.bottomMargin)
                }
            }
        }

        override fun checkLayoutParams(p: LayoutParams?): Boolean {
            return p is MarginLayoutParams
        }

        override fun generateDefaultLayoutParams(): LayoutParams {
            return MarginLayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT)
        }

        override fun generateLayoutParams(p: LayoutParams?): LayoutParams {
            return MarginLayoutParams(p)
        }

        override fun generateLayoutParams(attrs: android.util.AttributeSet?): LayoutParams {
            return MarginLayoutParams(context, attrs)
        }
    }
}
