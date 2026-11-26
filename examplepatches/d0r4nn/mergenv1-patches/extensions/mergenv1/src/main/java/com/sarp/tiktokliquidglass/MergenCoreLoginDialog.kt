package com.sarp.tiktokliquidglass

import android.app.Activity
import android.app.Dialog
import android.content.Context
import android.content.Intent
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Path
import android.graphics.Typeface
import android.graphics.drawable.ColorDrawable
import android.graphics.drawable.GradientDrawable
import android.net.Uri
import android.text.InputType
import android.text.method.HideReturnsTransformationMethod
import android.text.method.PasswordTransformationMethod
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.view.Window
import android.view.WindowManager
import android.view.inputmethod.EditorInfo
import android.widget.EditText
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import kotlin.math.min
import kotlin.math.roundToInt

/**
 * Pure Black & White Swiss-Kinetic Mergen Reticle vector mark.
 */
class MergenReticleView(
    context: Context,
    private var tintColor: Int = Color.WHITE
) : View(context) {

    private val strokePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.STROKE
        strokeCap = Paint.Cap.SQUARE
        strokeJoin = Paint.Join.MITER
        color = tintColor
    }
    private val dotPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL
        color = tintColor
    }
    private val bracketPath = Path()
    private val chevronPath = Path()

    fun setTintColor(color: Int) {
        if (tintColor != color) {
            tintColor = color
            strokePaint.color = color
            dotPaint.color = color
            invalidate()
        }
    }

    override fun onDraw(canvas: Canvas) {
        val w = width.toFloat()
        val h = height.toFloat()
        if (w <= 0f || h <= 0f) return

        val s = (w / 14f).coerceAtLeast(1.5f)
        strokePaint.strokeWidth = s
        val m = w * 0.11f
        val c = w * 0.30f

        bracketPath.reset()
        bracketPath.moveTo(m, c); bracketPath.lineTo(m, m); bracketPath.lineTo(c, m)
        bracketPath.moveTo(w - c, m); bracketPath.lineTo(w - m, m); bracketPath.lineTo(w - m, c)
        bracketPath.moveTo(w - m, h - c); bracketPath.lineTo(w - m, h - m); bracketPath.lineTo(w - c, h - m)
        bracketPath.moveTo(c, h - m); bracketPath.lineTo(m, h - m); bracketPath.lineTo(m, h - c)
        canvas.drawPath(bracketPath, strokePaint)

        chevronPath.reset()
        chevronPath.moveTo(w * 0.50f, h * 0.22f)
        chevronPath.lineTo(w * 0.72f, h * 0.66f)
        chevronPath.lineTo(w * 0.50f, h * 0.55f)
        chevronPath.lineTo(w * 0.28f, h * 0.66f)
        chevronPath.close()
        canvas.drawPath(chevronPath, strokePaint)

        val dotRadius = (w * 0.056f).coerceAtLeast(1.5f)
        canvas.drawCircle(w * 0.50f, h * 0.76f, dotRadius, dotPaint)
    }
}

/**
 * Strictly Black & White Swiss-Kinetic MergenCore Login Modal.
 * Zero Liquid Glass, zero blur, sharp 0dp corners, 1px borders, monospace typography.
 */
object MergenCoreLoginDialog {

    private var activeDialog: Dialog? = null

    private fun dp(context: Context, value: Float): Int =
        TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, context.resources.displayMetrics).roundToInt()

    private fun sharpBox(fillColor: Int, strokeColor: Int, strokePx: Int = 1): GradientDrawable =
        GradientDrawable().apply {
            shape = GradientDrawable.RECTANGLE
            cornerRadius = 0f
            setColor(fillColor)
            if (strokePx > 0) {
                setStroke(strokePx, strokeColor)
            }
        }

    fun show(activity: Activity, onAuthenticated: (MergenSession) -> Unit) {
        if (activity.isFinishing || activity.isDestroyed) return
        try {
            activeDialog?.dismiss()
        } catch (_: Throwable) {
        }

        val dialog = Dialog(activity, android.R.style.Theme_Translucent_NoTitleBar)
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.setCanceledOnTouchOutside(true)
        dialog.window?.apply {
            setBackgroundDrawable(ColorDrawable(Color.argb(215, 0, 0, 0)))
            setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
            @Suppress("DEPRECATION")
            setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)
        }

        val screenW = activity.resources.displayMetrics.widthPixels
        val cardWidth = min(screenW - dp(activity, 32f), dp(activity, 392f))
        val borderPx = dp(activity, 1f).coerceAtLeast(1)

        val bg = Color.BLACK
        val surface = Color.parseColor("#0A0A0A")
        val ink = Color.WHITE
        val muted = Color.argb(158, 255, 255, 255)
        val hairline = Color.argb(64, 255, 255, 255)

        var busy = false
        var passwordVisible = false
        var dismissing = false

        lateinit var card: LinearLayout
        lateinit var backdrop: FrameLayout

        val dismissAnimated = {
            if (!busy && !dismissing) {
                dismissing = true
                if (MergenSpringEngine.isReducedMotion(activity)) {
                    MergenSpringEngine.springPop(
                        view = card,
                        fromScaleX = card.scaleX,
                        fromScaleY = card.scaleY,
                        toScaleX = 1f,
                        toScaleY = 1f,
                        fromAlpha = card.alpha,
                        toAlpha = 0f,
                        maxBlurDp = 0f,
                        onEnd = {
                            try {
                                dialog.dismiss()
                            } catch (_: Throwable) {
                            }
                        }
                    )
                } else {
                    MergenSpringEngine.springPop(
                        view = card,
                        fromScaleX = card.scaleX,
                        fromScaleY = card.scaleY,
                        toScaleX = 0.94f,
                        toScaleY = 0.94f,
                        fromAlpha = card.alpha,
                        toAlpha = 0f,
                        dampingRatioX = 0.96f,
                        responseX = 0.20f,
                        dampingRatioY = 0.96f,
                        responseY = 0.20f,
                        maxBlurDp = 7f
                    )
                    MergenSpringEngine.springTranslationY(
                        view = card,
                        targetY = TypedValue.applyDimension(
                            TypedValue.COMPLEX_UNIT_DIP,
                            24f,
                            activity.resources.displayMetrics
                        ),
                        dampingRatio = 0.96f,
                        responseSec = 0.20f,
                        maxBlurDp = 8f,
                        onEnd = {
                            try {
                                dialog.dismiss()
                            } catch (_: Throwable) {
                            }
                        }
                    )
                }
            }
        }

        backdrop = FrameLayout(activity).apply {
            layoutParams = ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
            )
            setOnClickListener {
                dismissAnimated()
            }
        }

        val scroll = ScrollView(activity).apply {
            isFillViewport = true
            overScrollMode = View.OVER_SCROLL_NEVER
        }

        val centerWrapper = FrameLayout(activity).apply {
            layoutParams = FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            )
            val vPad = dp(activity, 24f)
            setPadding(dp(activity, 16f), vPad, dp(activity, 16f), vPad)
            setOnClickListener {
                dismissAnimated()
            }
        }

        card = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            background = sharpBox(bg, ink, borderPx)
            val p = dp(activity, 20f)
            setPadding(p, p, p, p)
            isClickable = true
            isFocusable = true
        }

        // Top Header Row
        val headerRow = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
        }

        val reticle = MergenReticleView(activity, ink).apply {
            val s = dp(activity, 20f)
            layoutParams = LinearLayout.LayoutParams(s, s).apply {
                rightMargin = dp(activity, 10f)
            }
        }
        headerRow.addView(reticle)

        val headerTitle = TextView(activity).apply {
            text = MergenStrings.t(activity, "MERGENCORE // OTURUM AÇ", "MERGENCORE // SIGN IN")
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f)
            setTextColor(ink)
            letterSpacing = 0.06f
        }
        headerRow.addView(
            headerTitle,
            LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
        )

        val closeBtn = TextView(activity).apply {
            text = "[×]"
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f)
            setTextColor(ink)
            setPadding(dp(activity, 10f), dp(activity, 6f), dp(activity, 4f), dp(activity, 6f))
            MergenSpringEngine.attachSpringPress(this, pressedScale = 0.90f)
            setOnClickListener {
                MergenHaptics.playTap(activity)
                dismissAnimated()
            }
        }
        headerRow.addView(closeBtn)
        card.addView(headerRow)

        // Hairline Divider
        card.addView(
            View(activity).apply { setBackgroundColor(hairline) },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, borderPx).apply {
                topMargin = dp(activity, 12f)
                bottomMargin = dp(activity, 12f)
            }
        )

        // Telemetry line
        card.addView(TextView(activity).apply {
            text = MergenStrings.t(
                activity,
                "HEDEF: MERGENV1  •  MAX CİHAZ: ${MergenCoreAuth.MAX_DEVICES}",
                "TARGET: MERGENV1  •  MAX DEVICES: ${MergenCoreAuth.MAX_DEVICES}"
            )
            typeface = Typeface.MONOSPACE
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f)
            setTextColor(muted)
            letterSpacing = 0.08f
        })

        // Sub-hint
        card.addView(
            TextView(activity).apply {
                text = MergenStrings.t(
                    activity,
                    "MergenV1 arayüz özelliklerini açmak için MergenCore hesabınla oturum aç.",
                    "Sign in with your MergenCore account to unlock MergenV1 UI features."
                )
                typeface = Typeface.SANS_SERIF
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f)
                setTextColor(Color.argb(200, 255, 255, 255))
            },
            LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            ).apply {
                topMargin = dp(activity, 6f)
                bottomMargin = dp(activity, 16f)
            }
        )

        // Field 1: @handle or email
        card.addView(TextView(activity).apply {
            text = MergenStrings.t(activity, "@KULLANICI ADI VEYA E-POSTA", "@USERNAME OR EMAIL")
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f)
            setTextColor(Color.argb(185, 255, 255, 255))
            letterSpacing = 0.06f
        })

        val identifierInput = EditText(activity).apply {
            hint = MergenStrings.t(activity, "@kullaniciadi", "@username")
            setHintTextColor(Color.argb(90, 255, 255, 255))
            setTextColor(ink)
            typeface = Typeface.MONOSPACE
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f)
            background = sharpBox(surface, hairline, borderPx)
            setPadding(dp(activity, 12f), dp(activity, 11f), dp(activity, 12f), dp(activity, 11f))
            inputType = InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_VARIATION_EMAIL_ADDRESS
            imeOptions = EditorInfo.IME_ACTION_NEXT
            isSingleLine = true
        }
        card.addView(
            identifierInput,
            LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            ).apply {
                topMargin = dp(activity, 6f)
                bottomMargin = dp(activity, 14f)
            }
        )

        // Field 2: Password
        card.addView(TextView(activity).apply {
            text = MergenStrings.t(activity, "PAROLA", "PASSWORD")
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f)
            setTextColor(Color.argb(185, 255, 255, 255))
            letterSpacing = 0.06f
        })

        val passBox = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            background = sharpBox(surface, hairline, borderPx)
        }

        val passwordInput = EditText(activity).apply {
            hint = "••••••••"
            setHintTextColor(Color.argb(90, 255, 255, 255))
            setTextColor(ink)
            typeface = Typeface.MONOSPACE
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f)
            background = null
            setPadding(dp(activity, 12f), dp(activity, 11f), dp(activity, 8f), dp(activity, 11f))
            inputType = InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_VARIATION_PASSWORD
            transformationMethod = PasswordTransformationMethod.getInstance()
            imeOptions = EditorInfo.IME_ACTION_DONE
            isSingleLine = true
        }
        passBox.addView(
            passwordInput,
            LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
        )

        val showLabel = MergenStrings.t(activity, "[GÖSTER]", "[SHOW]")
        val hideLabel = MergenStrings.t(activity, "[GİZLE]", "[HIDE]")
        val togglePassBtn = TextView(activity).apply {
            text = showLabel
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f)
            setTextColor(muted)
            setPadding(dp(activity, 8f), dp(activity, 10f), dp(activity, 12f), dp(activity, 10f))
            MergenSpringEngine.attachSpringPress(this, pressedScale = 0.92f)
            setOnClickListener {
                passwordVisible = !passwordVisible
                val sel = passwordInput.selectionEnd
                passwordInput.transformationMethod = if (passwordVisible) {
                    HideReturnsTransformationMethod.getInstance()
                } else {
                    PasswordTransformationMethod.getInstance()
                }
                passwordInput.typeface = Typeface.MONOSPACE
                if (sel >= 0) passwordInput.setSelection(sel.coerceAtMost(passwordInput.text.length))
                text = if (passwordVisible) hideLabel else showLabel
            }
        }
        passBox.addView(togglePassBtn)
        card.addView(
            passBox,
            LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            ).apply {
                topMargin = dp(activity, 6f)
                bottomMargin = dp(activity, 14f)
            }
        )

        // Inverted Monochrome Error Banner
        val errorBanner = TextView(activity).apply {
            background = sharpBox(ink, ink, 0)
            setTextColor(bg)
            typeface = Typeface.MONOSPACE
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f)
            setPadding(dp(activity, 10f), dp(activity, 10f), dp(activity, 10f), dp(activity, 10f))
            visibility = View.GONE
        }
        card.addView(
            errorBanner,
            LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            ).apply {
                bottomMargin = dp(activity, 14f)
            }
        )

        // Primary Action Button
        val signInLabel = MergenStrings.t(activity, "MERGENCORE İLE GİRİŞ YAP →", "SIGN IN WITH MERGENCORE →")
        val submitBtn = TextView(activity).apply {
            text = signInLabel
            gravity = Gravity.CENTER
            background = sharpBox(ink, ink, 0)
            setTextColor(bg)
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f)
            letterSpacing = 0.05f
            setPadding(dp(activity, 14f), dp(activity, 14f), dp(activity, 14f), dp(activity, 14f))
            MergenSpringEngine.attachSpringPress(this, pressedScale = 0.95f)
        }

        val submitLogin = {
            if (!busy && !dismissing) {
                val idText = identifierInput.text?.toString()?.trim().orEmpty()
                val passText = passwordInput.text?.toString().orEmpty()
                if (idText.isEmpty() || passText.isEmpty()) {
                    MergenHaptics.playError(activity)
                    errorBanner.text = MergenStrings.t(
                        activity,
                        "[ERR] Kullanıcı adı ve parola gereklidir.",
                        "[ERR] Username and password are required."
                    )
                    errorBanner.visibility = View.VISIBLE
                } else {
                    busy = true
                    errorBanner.visibility = View.GONE
                    submitBtn.text = MergenStrings.t(activity, "DOĞRULANIYOR...", "AUTHENTICATING...")
                    submitBtn.alpha = 0.75f
                    dialog.setCancelable(false)

                    MergenCoreAuth.loginAsync(activity, idText, passText) { result ->
                        busy = false
                        submitBtn.text = signInLabel
                        submitBtn.alpha = 1f
                        dialog.setCancelable(true)

                        when (result) {
                            is MergenAuthResult.Success -> {
                                MergenHaptics.playSuccess(activity)
                                try {
                                    dialog.dismiss()
                                } catch (_: Throwable) {
                                }
                                onAuthenticated(result.session)
                            }
                            is MergenAuthResult.Error -> {
                                MergenHaptics.playError(activity)
                                errorBanner.text = "[ERR] ${result.message}"
                                errorBanner.visibility = View.VISIBLE
                            }
                        }
                    }
                }
            }
        }

        submitBtn.setOnClickListener { submitLogin() }
        passwordInput.setOnEditorActionListener { _, actionId, _ ->
            if (actionId == EditorInfo.IME_ACTION_DONE) {
                submitLogin()
                true
            } else {
                false
            }
        }

        card.addView(
            submitBtn,
            LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            )
        )

        // Portal Link
        val portalLink = TextView(activity).apply {
            text = MergenStrings.t(
                activity,
                "Hesabın yok mu? mergen-core.web.app ↗",
                "Need an account? mergen-core.web.app ↗"
            )
            gravity = Gravity.CENTER
            typeface = Typeface.MONOSPACE
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
            setTextColor(muted)
            setPadding(dp(activity, 8f), dp(activity, 14f), dp(activity, 8f), dp(activity, 4f))
            setOnClickListener {
                try {
                    val intent = Intent(Intent.ACTION_VIEW, Uri.parse(MergenCoreAuth.PORTAL_URL))
                    activity.startActivity(intent)
                } catch (_: Throwable) {
                }
            }
        }
        card.addView(
            portalLink,
            LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            )
        )

        centerWrapper.addView(
            card,
            FrameLayout.LayoutParams(
                cardWidth,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER
            )
        )
        scroll.addView(centerWrapper)
        backdrop.addView(
            scroll,
            FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER
            )
        )

        dialog.setContentView(backdrop)
        dialog.setOnCancelListener {
            dismissAnimated()
        }
        dialog.setOnDismissListener {
            if (activeDialog === dialog) activeDialog = null
        }
        activeDialog = dialog
        dialog.show()

        if (MergenSpringEngine.isReducedMotion(activity)) {
            MergenSpringEngine.springPop(
                view = card,
                fromScaleX = 1f,
                fromScaleY = 1f,
                toScaleX = 1f,
                toScaleY = 1f,
                fromAlpha = 0f,
                toAlpha = 1f,
                maxBlurDp = 0f
            )
        } else {
            card.translationY = dp(activity, 28f).toFloat()
            MergenSpringEngine.springPop(
                view = card,
                fromScaleX = 0.94f,
                fromScaleY = 0.94f,
                toScaleX = 1f,
                toScaleY = 1f,
                fromAlpha = 0f,
                toAlpha = 1f,
                dampingRatioX = 0.86f,
                responseX = 0.28f,
                dampingRatioY = 0.86f,
                responseY = 0.28f,
                maxBlurDp = 7f
            )
            MergenSpringEngine.springTranslationY(
                view = card,
                targetY = 0f,
                dampingRatio = 0.88f,
                responseSec = 0.30f,
                maxBlurDp = 9f
            )
        }
    }
}
