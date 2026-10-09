package app.morphe.extension.shared.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.PixelFormat;
import android.graphics.ColorFilter;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Outline;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.ProgressBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.StringReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.xml.parsers.DocumentBuilderFactory;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.patches.flags.PhotoFlagsRegistry;
import app.morphe.extension.shared.patches.flags.PhotoFlagsRegistry.CuratedFlag;

/**
 * High-performance Material 3 Phenotype Flag Manager for Morphe Google Photos.
 * Capable of smoothly displaying and streaming 1,000+ to 5,000+ flags via virtualized
 * ListView recycling, debounced filtering, and asynchronous background import pipelines.
 */
public final class PhenotypeFlagManager {

    private static final String PREF_NAME = "com.google.android.apps.photos.phenotype";
    private static final String SETTINGS_PILL_TAG = "morphe_photos_flags_pill";
    public static final String CUSTOM_FLAGS_KEY = "_morphe_custom_flag_ids";
    public static final String SEEDED_MARKER = "_morphe_flags_seeded";

    private static final ExecutorService IO_EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    // ─────────────────────────────────────────────────────────────────────────
    // Programmatic Material 3 Vector Icons (Resolution-Independent)
    // ─────────────────────────────────────────────────────────────────────────

    public static class MaterialVectorDrawable extends Drawable {
        public static final int TYPE_TUNE = 1;
        public static final int TYPE_LOGS = 2;
        public static final int TYPE_SEARCH = 3;
        public static final int TYPE_ADD = 4;
        public static final int TYPE_MORE = 5;
        public static final int TYPE_CLOSE = 6;
        public static final int TYPE_CHEVRON_DOWN = 7;
        public static final int TYPE_CHEVRON_UP = 8;
        public static final int TYPE_SYNC = 9;
        public static final int TYPE_EXPAND = 10;
        public static final int TYPE_COLLAPSE = 11;
        public static final int TYPE_IMPORT = 12;
        public static final int TYPE_PASTE = 13;
        public static final int TYPE_EXPORT = 14;
        public static final int TYPE_CLIPBOARD = 15;
        public static final int TYPE_PRESETS = 16;
        public static final int TYPE_DIAGNOSTICS = 17;
        public static final int TYPE_DELETE = 18;
        public static final int TYPE_RESTART = 19;
        public static final int TYPE_CHECK = 20;

        private final int type;
        private final Paint strokePaint;
        private final Paint fillPaint;

        public MaterialVectorDrawable(int type, int color) {
            this.type = type;

            this.strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            this.strokePaint.setColor(color);
            this.strokePaint.setStyle(Paint.Style.STROKE);
            this.strokePaint.setStrokeCap(Paint.Cap.ROUND);
            this.strokePaint.setStrokeJoin(Paint.Join.ROUND);

            this.fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            this.fillPaint.setColor(color);
            this.fillPaint.setStyle(Paint.Style.FILL);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) return;

            float w = b.width();
            float h = b.height();
            float left = b.left;
            float top = b.top;

            float strokeW = Math.max(2.2f, Math.min(w, h) * 0.095f);
            strokePaint.setStrokeWidth(strokeW);

            canvas.save();
            canvas.translate(left, top);

            switch (type) {
                case TYPE_TUNE: {
                    // Line 1: y=0.28, knob at 0.40
                    canvas.drawLine(w * 0.12f, h * 0.28f, w * 0.88f, h * 0.28f, strokePaint);
                    canvas.drawCircle(w * 0.38f, h * 0.28f, Math.min(w, h) * 0.12f, fillPaint);

                    // Line 2: y=0.50, knob at 0.68
                    canvas.drawLine(w * 0.12f, h * 0.50f, w * 0.88f, h * 0.50f, strokePaint);
                    canvas.drawCircle(w * 0.68f, h * 0.50f, Math.min(w, h) * 0.12f, fillPaint);

                    // Line 3: y=0.72, knob at 0.32
                    canvas.drawLine(w * 0.12f, h * 0.72f, w * 0.88f, h * 0.72f, strokePaint);
                    canvas.drawCircle(w * 0.32f, h * 0.72f, Math.min(w, h) * 0.12f, fillPaint);
                    break;
                }
                case TYPE_LOGS: {
                    float dotR = Math.min(w, h) * 0.065f;
                    canvas.drawCircle(w * 0.18f, h * 0.28f, dotR, fillPaint);
                    canvas.drawLine(w * 0.34f, h * 0.28f, w * 0.85f, h * 0.28f, strokePaint);

                    canvas.drawCircle(w * 0.18f, h * 0.50f, dotR, fillPaint);
                    canvas.drawLine(w * 0.34f, h * 0.50f, w * 0.72f, h * 0.50f, strokePaint);

                    canvas.drawCircle(w * 0.18f, h * 0.72f, dotR, fillPaint);
                    canvas.drawLine(w * 0.34f, h * 0.72f, w * 0.88f, h * 0.72f, strokePaint);
                    break;
                }
                case TYPE_SEARCH: {
                    float cx = w * 0.42f;
                    float cy = h * 0.42f;
                    float r = Math.min(w, h) * 0.26f;
                    canvas.drawCircle(cx, cy, r, strokePaint);
                    canvas.drawLine(w * 0.60f, h * 0.60f, w * 0.86f, h * 0.86f, strokePaint);
                    break;
                }
                case TYPE_ADD: {
                    canvas.drawLine(w * 0.50f, h * 0.18f, w * 0.50f, h * 0.82f, strokePaint);
                    canvas.drawLine(w * 0.18f, h * 0.50f, w * 0.82f, h * 0.50f, strokePaint);
                    break;
                }
                case TYPE_MORE: {
                    float r = Math.min(w, h) * 0.085f;
                    canvas.drawCircle(w * 0.50f, h * 0.24f, r, fillPaint);
                    canvas.drawCircle(w * 0.50f, h * 0.50f, r, fillPaint);
                    canvas.drawCircle(w * 0.50f, h * 0.76f, r, fillPaint);
                    break;
                }
                case TYPE_CLOSE: {
                    canvas.drawLine(w * 0.24f, h * 0.24f, w * 0.76f, h * 0.76f, strokePaint);
                    canvas.drawLine(w * 0.24f, h * 0.76f, w * 0.76f, h * 0.24f, strokePaint);
                    break;
                }
                case TYPE_CHEVRON_DOWN: {
                    Path p = new Path();
                    p.moveTo(w * 0.24f, h * 0.38f);
                    p.lineTo(w * 0.50f, h * 0.64f);
                    p.lineTo(w * 0.76f, h * 0.38f);
                    canvas.drawPath(p, strokePaint);
                    break;
                }
                case TYPE_CHEVRON_UP: {
                    Path p = new Path();
                    p.moveTo(w * 0.24f, h * 0.64f);
                    p.lineTo(w * 0.50f, h * 0.38f);
                    p.lineTo(w * 0.76f, h * 0.64f);
                    canvas.drawPath(p, strokePaint);
                    break;
                }
                case TYPE_SYNC: {
                    RectF arc = new RectF(w * 0.18f, h * 0.18f, w * 0.82f, h * 0.82f);
                    canvas.drawArc(arc, 45, 275, false, strokePaint);
                    Path arrow = new Path();
                    float ax = w * 0.74f;
                    float ay = h * 0.38f;
                    arrow.moveTo(ax, ay);
                    arrow.lineTo(ax + w * 0.18f, ay);
                    arrow.lineTo(ax, ay + h * 0.18f);
                    arrow.close();
                    canvas.drawPath(arrow, fillPaint);
                    break;
                }
                case TYPE_EXPAND: {
                    Path p = new Path();
                    p.moveTo(w * 0.16f, h * 0.28f);
                    p.lineTo(w * 0.42f, h * 0.28f);
                    p.lineTo(w * 0.52f, h * 0.38f);
                    p.lineTo(w * 0.84f, h * 0.38f);
                    p.lineTo(w * 0.84f, h * 0.78f);
                    p.lineTo(w * 0.16f, h * 0.78f);
                    p.close();
                    canvas.drawPath(p, strokePaint);
                    canvas.drawLine(w * 0.34f, h * 0.58f, w * 0.66f, h * 0.58f, strokePaint);
                    canvas.drawLine(w * 0.50f, h * 0.44f, w * 0.50f, h * 0.72f, strokePaint);
                    break;
                }
                case TYPE_COLLAPSE: {
                    Path p = new Path();
                    p.moveTo(w * 0.16f, h * 0.28f);
                    p.lineTo(w * 0.42f, h * 0.28f);
                    p.lineTo(w * 0.52f, h * 0.38f);
                    p.lineTo(w * 0.84f, h * 0.38f);
                    p.lineTo(w * 0.84f, h * 0.78f);
                    p.lineTo(w * 0.16f, h * 0.78f);
                    p.close();
                    canvas.drawPath(p, strokePaint);
                    canvas.drawLine(w * 0.34f, h * 0.58f, w * 0.66f, h * 0.58f, strokePaint);
                    break;
                }
                case TYPE_IMPORT: {
                    RectF doc = new RectF(w * 0.22f, h * 0.16f, w * 0.78f, h * 0.84f);
                    canvas.drawRoundRect(doc, w * 0.10f, h * 0.10f, strokePaint);
                    canvas.drawLine(w * 0.50f, h * 0.30f, w * 0.50f, h * 0.66f, strokePaint);
                    Path arr = new Path();
                    arr.moveTo(w * 0.34f, h * 0.52f);
                    arr.lineTo(w * 0.50f, h * 0.68f);
                    arr.lineTo(w * 0.66f, h * 0.52f);
                    canvas.drawPath(arr, strokePaint);
                    break;
                }
                case TYPE_PASTE: {
                    RectF clip = new RectF(w * 0.22f, h * 0.24f, w * 0.78f, h * 0.84f);
                    canvas.drawRoundRect(clip, w * 0.08f, h * 0.08f, strokePaint);
                    RectF topBar = new RectF(w * 0.36f, h * 0.16f, w * 0.64f, h * 0.30f);
                    canvas.drawRoundRect(topBar, w * 0.04f, h * 0.04f, strokePaint);
                    canvas.drawLine(w * 0.34f, h * 0.46f, w * 0.66f, h * 0.46f, strokePaint);
                    canvas.drawLine(w * 0.34f, h * 0.62f, w * 0.56f, h * 0.62f, strokePaint);
                    break;
                }
                case TYPE_EXPORT: {
                    RectF doc = new RectF(w * 0.22f, h * 0.16f, w * 0.78f, h * 0.84f);
                    canvas.drawRoundRect(doc, w * 0.10f, h * 0.10f, strokePaint);
                    canvas.drawLine(w * 0.50f, h * 0.68f, w * 0.50f, h * 0.32f, strokePaint);
                    Path arr = new Path();
                    arr.moveTo(w * 0.34f, h * 0.46f);
                    arr.lineTo(w * 0.50f, h * 0.30f);
                    arr.lineTo(w * 0.66f, h * 0.46f);
                    canvas.drawPath(arr, strokePaint);
                    break;
                }
                case TYPE_CLIPBOARD: {
                    RectF s1 = new RectF(w * 0.30f, h * 0.16f, w * 0.82f, h * 0.70f);
                    canvas.drawRoundRect(s1, w * 0.08f, h * 0.08f, strokePaint);
                    RectF s2 = new RectF(w * 0.18f, h * 0.30f, w * 0.70f, h * 0.84f);
                    canvas.drawRoundRect(s2, w * 0.08f, h * 0.08f, strokePaint);
                    break;
                }
                case TYPE_PRESETS: {
                    Path star = new Path();
                    float cx = w * 0.50f;
                    float cy = h * 0.50f;
                    star.moveTo(cx, h * 0.16f);
                    star.quadTo(cx, cy, w * 0.84f, cy);
                    star.quadTo(cx, cy, cx, h * 0.84f);
                    star.quadTo(cx, cy, w * 0.16f, cy);
                    star.quadTo(cx, cy, cx, h * 0.16f);
                    star.close();
                    canvas.drawPath(star, fillPaint);
                    break;
                }
                case TYPE_DIAGNOSTICS: {
                    canvas.drawLine(w * 0.16f, h * 0.82f, w * 0.84f, h * 0.82f, strokePaint);
                    canvas.drawLine(w * 0.30f, h * 0.82f, w * 0.30f, h * 0.50f, strokePaint);
                    canvas.drawLine(w * 0.50f, h * 0.82f, w * 0.50f, h * 0.24f, strokePaint);
                    canvas.drawLine(w * 0.70f, h * 0.82f, w * 0.70f, h * 0.38f, strokePaint);
                    break;
                }
                case TYPE_DELETE: {
                    canvas.drawLine(w * 0.20f, h * 0.28f, w * 0.80f, h * 0.28f, strokePaint);
                    canvas.drawLine(w * 0.38f, h * 0.20f, w * 0.62f, h * 0.20f, strokePaint);
                    Path can = new Path();
                    can.moveTo(w * 0.26f, h * 0.28f);
                    can.lineTo(w * 0.30f, h * 0.82f);
                    can.lineTo(w * 0.70f, h * 0.82f);
                    can.lineTo(w * 0.74f, h * 0.28f);
                    canvas.drawPath(can, strokePaint);
                    canvas.drawLine(w * 0.42f, h * 0.40f, w * 0.42f, h * 0.72f, strokePaint);
                    canvas.drawLine(w * 0.58f, h * 0.40f, w * 0.58f, h * 0.72f, strokePaint);
                    break;
                }
                case TYPE_RESTART: {
                    RectF arc = new RectF(w * 0.20f, h * 0.20f, w * 0.80f, h * 0.80f);
                    canvas.drawArc(arc, 125, 290, false, strokePaint);
                    canvas.drawLine(w * 0.50f, h * 0.12f, w * 0.50f, h * 0.46f, strokePaint);
                    break;
                }
                case TYPE_CHECK: {
                    Path p = new Path();
                    p.moveTo(w * 0.20f, h * 0.50f);
                    p.lineTo(w * 0.42f, h * 0.72f);
                    p.lineTo(w * 0.80f, h * 0.28f);
                    canvas.drawPath(p, strokePaint);
                    break;
                }
            }
            canvas.restore();
        }

        @Override public void setAlpha(int alpha) { strokePaint.setAlpha(alpha); fillPaint.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter cf) { strokePaint.setColorFilter(cf); fillPaint.setColorFilter(cf); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static String cleanCategoryTitle(String cat) {
        if (cat == null) return "";
        String s = cat.trim();
        if (s.contains("Video Remix")) return "Video Remix & AI Styling";
        if (s.contains("Photo Remix")) return "Photo Remix (Prompt Art)";
        if (s.contains("Highlight Video")) return "Highlight Video Recipes";
        if (s.contains("Outfit Try-on") || s.contains("My Fits")) return "Virtual Outfit Try-On";
        if (s.contains("Collage") || s.contains("Scrapbook")) return "Collage & Scrapbook";
        if (s.contains("Cinematic Photo")) return "Cinematic 3D Photos";
        if (s.contains("Animation")) return "Animations & GIF Editor";
        if (s.contains("Moods")) return "Moods Color Grading";
        if (s.contains("Storefront") || s.contains("Creative Studio")) return "Creative Studio Hub";
        if (s.contains("3D Pop-Out") || s.contains("Cutouts")) return "Memories: 3D Pop-Out";
        if (s.contains("Player Controls") || s.contains("Sound")) return "Memories: Player & Music";
        if (s.contains("Navigation") || s.contains("Floating Bar")) return "Floating Navigation Bar";
        if (s.contains("Collections") || s.contains("Shelves")) return "Collections & Shelves V2";
        if (s.contains("AI Photo") || s.contains("Editor Tools") || s.contains("Magic Editor")) return "AI Magic Editor Suite";
        if (s.contains("OneGoogle") || s.contains("Avatar Rings")) return "Subscriber Avatar Ring";

        s = s.replaceAll("^[\\p{So}\\p{Cs}\\p{Cn}\\p{Sk}\\p{Sc}\\s]+", "");
        s = s.replaceAll("(?i)^Create\\s*Tab:\\s*(Tool\\s*\\d+\\s*—\\s*)?", "");
        s = s.replaceAll("(?i)^Editor:\\s*", "");
        s = s.replaceAll("\\s*\\(Stamp\\s*M2\\)", "");
        s = s.replaceAll("\\s*\\(AMC\\s*Recipes\\)", "");
        s = s.replaceAll("[🎨🎬👗📄🎥🎞️✨⚡📊🛠️🔍➕⋮✕▶▼▲⭕🏛️🎵🧭📁🪄🖼️]", "").trim();
        return s.isEmpty() ? cat : s;
    }

    private static String cleanCategorySubtitle(String desc, String cat) {
        if (desc == null || desc.isEmpty()) {
            desc = PhotoFlagsRegistry.getCategoryTriggerDescription(cat);
        }
        if (desc == null) return null;
        String s = desc.trim();
        s = s.replaceAll("^[\\p{So}\\s]*⚡?\\s*Triggers:\\s*", "");
        s = s.replaceAll("(?i)\\s*in\\s*Create\\s*Tab$", "");
        s = s.replaceAll("[⚡✨🎨🎬👗📄🎥🎞️]", "").trim();
        if (s.isEmpty()) return null;
        return Character.toUpperCase(s.charAt(0)) + s.substring(1);
    }
    // Dynamic Material 3 Palette Engine
    public static final class Theme {
        public final boolean isDark;
        public final int bg;
        public final int surface;
        public final int surfaceContainer;
        public final int headerCardBg;
        public final int card;
        public final int cardActive;
        public final int cardBorder;
        public final int cardBorderActive;
        public final int primary;
        public final int primaryContainer;
        public final int onPrimary;
        public final int onPrimaryContainer;
        public final int textPrimary;
        public final int textSecondary;
        public final int textTertiary;
        public final int outline;
        public final int searchInputBg;
        public final int disableAllText;
        public final int disableAllBg;
        public final int enableAllText;
        public final int enableAllBg;

        public Theme(boolean isDark, int bg, int surface, int surfaceContainer, int headerCardBg,
                     int card, int cardActive, int cardBorder, int cardBorderActive,
                     int primary, int primaryContainer, int onPrimary, int onPrimaryContainer,
                     int textPrimary, int textSecondary, int textTertiary, int outline,
                     int searchInputBg, int disableAllText, int disableAllBg,
                     int enableAllText, int enableAllBg) {
            this.isDark = isDark;
            this.bg = bg;
            this.surface = surface;
            this.surfaceContainer = surfaceContainer;
            this.headerCardBg = headerCardBg;
            this.card = card;
            this.cardActive = cardActive;
            this.cardBorder = cardBorder;
            this.cardBorderActive = cardBorderActive;
            this.primary = primary;
            this.primaryContainer = primaryContainer;
            this.onPrimary = onPrimary;
            this.onPrimaryContainer = onPrimaryContainer;
            this.textPrimary = textPrimary;
            this.textSecondary = textSecondary;
            this.textTertiary = textTertiary;
            this.outline = outline;
            this.searchInputBg = searchInputBg;
            this.disableAllText = disableAllText;
            this.disableAllBg = disableAllBg;
            this.enableAllText = enableAllText;
            this.enableAllBg = enableAllBg;
        }

        public static Theme get(Context context) {
            boolean isDark = isDarkTheme(context);
            if (isDark) {
                return new Theme(
                        true,
                        0xFF121414, // bg
                        0xFF1A1C1C, // surface
                        0xFF222625, // surfaceContainer (M3 surface container high)
                        0xFF252928, // headerCardBg
                        0xFF1E2120, // card
                        0xFF152A26, // cardActive (subtle dark teal tint)
                        0xFF333836, // cardBorder
                        0xFF4CDAC6, // cardBorderActive
                        0xFF4CDAC6, // primary (M3 teal)
                        0xFF1D3E38, // primaryContainer (M3 subtle teal container)
                        0xFF003731, // onPrimary
                        0xFF70F7E3, // onPrimaryContainer
                        0xFFE1E3E1, // textPrimary (clean off-white)
                        0xFF8A938F, // textSecondary (clean neutral)
                        0xFF6C7572, // textTertiary
                        0xFF3A423F, // outline
                        0xFF292C2B, // searchInputBg
                        0xFF8A938F, // disableAllText (M3 onSurfaceVariant)
                        0xFF2A2E2D, // disableAllBg (M3 surfaceContainerHigh)
                        0xFF70F7E3, // enableAllText (M3 onPrimaryContainer)
                        0xFF1D3E38  // enableAllBg (M3 primaryContainer)
                );
            } else {
                return new Theme(
                        false,
                        0xFFF5F7F6, // bg
                        0xFFFFFFFF, // surface
                        0xFFEEF2F1, // surfaceContainer
                        0xFFF0F4F3, // headerCardBg
                        0xFFFFFFFF, // card
                        0xFFE6F4F1, // cardActive
                        0xFFD8E3E0, // cardBorder
                        0xFF006A60, // cardBorderActive
                        0xFF006A60, // primary
                        0xFFCCE8E3, // primaryContainer
                        0xFFFFFFFF, // onPrimary
                        0xFF005048, // onPrimaryContainer
                        0xFF191C1D, // textPrimary
                        0xFF53605D, // textSecondary
                        0xFF707976, // textTertiary
                        0xFFD8E3E0, // outline
                        0xFFE6EAE8, // searchInputBg
                        0xFF53605D, // disableAllText
                        0xFFECEFEF, // disableAllBg
                        0xFF005048, // enableAllText
                        0xFFCCE8E3  // enableAllBg
                );
            }
        }
    }

    public static boolean isDarkTheme(Context context) {
        if (context != null) {
            try {
                int mode = context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
                if (mode == Configuration.UI_MODE_NIGHT_YES) return true;
                if (mode == Configuration.UI_MODE_NIGHT_NO) return false;
            } catch (Throwable ignored) {}
        }
        return app.morphe.extension.shared.Utils.isDarkModeEnabled();
    }

    // Material 3 Fallback Palette
    private static final int M3_BG = 0xFFF5F7F6;
    private static final int M3_SURFACE = 0xFFFFFFFF;
    private static final int M3_CARD = 0xFFFFFFFF;
    private static final int M3_CARD_ACTIVE = 0xFFE6F4F1;
    private static final int M3_PRIMARY = 0xFF006A60;
    private static final int M3_PRIMARY_CONTAINER = 0xFFCCE8E3;
    private static final int M3_ON_PRIMARY = 0xFFFFFFFF;
    private static final int M3_TEXT_PRIMARY = 0xFF191C1D;
    private static final int M3_TEXT_SECONDARY = 0xFF53605D;
    private static final int M3_OUTLINE = 0xFFD8E3E0;

    private PhenotypeFlagManager() {}

    public static SharedPreferences getPrefs(Context context) {
        return context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Settings Activity Floating Pill Injection
    // ─────────────────────────────────────────────────────────────────────────

    public static void injectSettingsCard(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        activity.runOnUiThread(() -> {
            try {
                View decor = activity.getWindow().getDecorView();
                decor.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                    @Override
                    public void onGlobalLayout() {
                        try {
                            FrameLayout content = activity.findViewById(android.R.id.content);
                            if (content != null && content.findViewWithTag(SETTINGS_PILL_TAG) == null) {
                                LinearLayout pill = createFloatingPill(activity);
                                content.addView(pill);
                                Logger.printInfo(() -> "Photos Flags floating pill attached to SettingsActivity");
                            }
                        } catch (Throwable t) {
                            Logger.printException(() -> "Error attaching Photos Flags pill", t);
                        }
                    }
                });
            } catch (Throwable t) {
                Logger.printException(() -> "Error in injectSettingsCard", t);
            }
        });
    }

    private static LinearLayout createFloatingPill(Activity activity) {
        Theme theme = Theme.get(activity);
        float density = activity.getResources().getDisplayMetrics().density;

        LinearLayout dock = new LinearLayout(activity);
        dock.setTag(SETTINGS_PILL_TAG);
        dock.setOrientation(LinearLayout.HORIZONTAL);
        dock.setGravity(Gravity.CENTER_VERTICAL);

        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                (int) (52 * density)
        );
        lp.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
        lp.setMargins(0, 0, 0, (int) (22 * density));
        dock.setLayoutParams(lp);

        int padOuter = (int) (4 * density);
        dock.setPadding(padOuter, padOuter, padOuter, padOuter);
        dock.setElevation(8 * density);

        GradientDrawable bgDock = new GradientDrawable();
        bgDock.setCornerRadius(26 * density);
        bgDock.setColor(theme.surfaceContainer);
        bgDock.setStroke((int) (1 * density), theme.outline);
        dock.setBackground(bgDock);

        // Segment 1: Flags
        LinearLayout itemFlags = new LinearLayout(activity);
        itemFlags.setOrientation(LinearLayout.HORIZONTAL);
        itemFlags.setGravity(Gravity.CENTER);
        itemFlags.setClickable(true);
        itemFlags.setFocusable(true);
        int itemPadH = (int) (18 * density);
        itemFlags.setPadding(itemPadH, 0, itemPadH, 0);
        LinearLayout.LayoutParams lpFlags = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        );
        itemFlags.setLayoutParams(lpFlags);

        GradientDrawable bgFlags = new GradientDrawable();
        bgFlags.setCornerRadius(22 * density);
        bgFlags.setColor(theme.primaryContainer);
        itemFlags.setBackground(bgFlags);

        ImageView iconFlags = new ImageView(activity);
        iconFlags.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_TUNE, theme.onPrimaryContainer));
        int iconSize = (int) (20 * density);
        LinearLayout.LayoutParams icLp1 = new LinearLayout.LayoutParams(iconSize, iconSize);
        icLp1.setMargins(0, 0, (int) (8 * density), 0);
        iconFlags.setLayoutParams(icLp1);
        itemFlags.addView(iconFlags);

        TextView labelFlags = new TextView(activity);
        labelFlags.setText("Flags");
        labelFlags.setTextSize(14f);
        labelFlags.setTextColor(theme.onPrimaryContainer);
        labelFlags.setTypeface(null, Typeface.BOLD);
        itemFlags.addView(labelFlags);
        itemFlags.setOnClickListener(v -> showFlagManagerDialog(activity));
        dock.addView(itemFlags);

        // Divider line
        View divider = new View(activity);
        divider.setBackgroundColor(theme.outline);
        LinearLayout.LayoutParams divLp = new LinearLayout.LayoutParams((int) (1 * density), (int) (22 * density));
        divLp.setMargins((int) (4 * density), 0, (int) (4 * density), 0);
        divider.setLayoutParams(divLp);
        dock.addView(divider);

        // Segment 2: Logs
        LinearLayout itemLogs = new LinearLayout(activity);
        itemLogs.setOrientation(LinearLayout.HORIZONTAL);
        itemLogs.setGravity(Gravity.CENTER);
        itemLogs.setClickable(true);
        itemLogs.setFocusable(true);
        itemLogs.setPadding(itemPadH, 0, itemPadH, 0);
        LinearLayout.LayoutParams lpLogs = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        );
        itemLogs.setLayoutParams(lpLogs);

        GradientDrawable bgLogs = new GradientDrawable();
        bgLogs.setCornerRadius(22 * density);
        bgLogs.setColor(Color.TRANSPARENT);
        itemLogs.setBackground(bgLogs);

        ImageView iconLogs = new ImageView(activity);
        iconLogs.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_LOGS, theme.textPrimary));
        LinearLayout.LayoutParams icLp2 = new LinearLayout.LayoutParams(iconSize, iconSize);
        icLp2.setMargins(0, 0, (int) (8 * density), 0);
        iconLogs.setLayoutParams(icLp2);
        itemLogs.addView(iconLogs);

        TextView labelLogs = new TextView(activity);
        labelLogs.setText("Logs");
        labelLogs.setTextSize(14f);
        labelLogs.setTextColor(theme.textPrimary);
        labelLogs.setTypeface(null, Typeface.BOLD);
        itemLogs.addView(labelLogs);

        Handler longPressHandler = new Handler(Looper.getMainLooper());
        boolean[] longPressTriggered = new boolean[]{false};
        float[] downPos = new float[2];
        Runnable resetMemories5s = () -> {
            longPressTriggered[0] = true;
            try {
                itemLogs.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
            } catch (Throwable ignored) {}
            LocalCreationDownloader.clearSavedRegistry(activity);
            Toast.makeText(activity, "Morphe: Saved memories registry reset", Toast.LENGTH_SHORT).show();
        };

        itemLogs.setOnTouchListener((v, event) -> {
            switch (event.getAction()) {
                case MotionEvent.ACTION_DOWN:
                    longPressTriggered[0] = false;
                    downPos[0] = event.getX();
                    downPos[1] = event.getY();
                    longPressHandler.postDelayed(resetMemories5s, 5000);
                    itemLogs.setPressed(true);
                    return true;
                case MotionEvent.ACTION_MOVE:
                    float dx = Math.abs(event.getX() - downPos[0]);
                    float dy = Math.abs(event.getY() - downPos[1]);
                    if (dx > 24 * density || dy > 24 * density) {
                        longPressHandler.removeCallbacks(resetMemories5s);
                        itemLogs.setPressed(false);
                    }
                    return true;
                case MotionEvent.ACTION_UP:
                    longPressHandler.removeCallbacks(resetMemories5s);
                    itemLogs.setPressed(false);
                    if (!longPressTriggered[0]) {
                        app.morphe.extension.shared.diagnostics.DiagnosticsDialog.show(activity);
                    }
                    return true;
                case MotionEvent.ACTION_CANCEL:
                    longPressHandler.removeCallbacks(resetMemories5s);
                    itemLogs.setPressed(false);
                    return true;
            }
            return false;
        });
        dock.addView(itemLogs);

        return dock;
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Display Model & Virtualized Adapter
    // ─────────────────────────────────────────────────────────────────────────

    private static final int ITEM_TYPE_HEADER = 0;
    private static final int ITEM_TYPE_FLAG = 1;

    public static class DisplayItem {
        final int type;
        final String headerTitle;
        final CuratedFlag curatedFlag;
        final String customKey;
        Object value;

        DisplayItem(String headerTitle) {
            this.type = ITEM_TYPE_HEADER;
            this.headerTitle = headerTitle;
            this.curatedFlag = null;
            this.customKey = null;
            this.value = null;
        }

        DisplayItem(CuratedFlag curatedFlag, Object value) {
            this.type = ITEM_TYPE_FLAG;
            this.headerTitle = null;
            this.curatedFlag = curatedFlag;
            this.customKey = curatedFlag.key;
            this.value = value;
        }

        DisplayItem(String customKey, Object value) {
            this.type = ITEM_TYPE_FLAG;
            this.headerTitle = null;
            this.curatedFlag = null;
            this.customKey = customKey;
            this.value = value;
        }

        boolean isHeader() { return type == ITEM_TYPE_HEADER; }
        String getKey() { return customKey; }
        String getTitle() { return curatedFlag != null ? curatedFlag.title : customKey; }
        String getDescription() { return curatedFlag != null ? curatedFlag.description : null; }
        String getTrigger() { return curatedFlag != null ? curatedFlag.triggerTarget : null; }
        String getCategory() { return curatedFlag != null ? curatedFlag.category : null; }
    }

    private static class FlagViewHolder {
        LinearLayout root;
        TextView tvTitle;
        TextView tvTriggerBadge;
        TextView tvDesc;
        TextView tvKey;
        Switch swToggle;
        TextView valChip;
        ImageView btnDelete;
    }

    public interface TabUpdateListener {
        void onTabsUpdated(int curatedCount, int customCount, int selectedTab);
    }

    private static class HeaderViewHolder {
        LinearLayout root;
        TextView tvTitle;
        TextView tvBadge;
        ImageView ivChevron;
        TextView btnToggleAll;
        TextView tvTrigger;
    }

    public static class FlagAdapter extends BaseAdapter {
        public static final int TAB_CURATED = 0;
        public static final int TAB_CUSTOM = 1;

        private final Activity activity;
        private final SharedPreferences prefs;
        private final float density;
        private final Theme theme;
        private final List<DisplayItem> allItems = new ArrayList<>();
        private final List<DisplayItem> displayedItems = new ArrayList<>();
        private final List<DisplayItem> curatedItems = new ArrayList<>();
        private final List<DisplayItem> customItems = new ArrayList<>();
        private final Set<String> customKeysSet = new HashSet<>();
        private final Set<String> expandedCategories = new HashSet<>();
        private final Set<String> searchCollapsedCategories = new HashSet<>();
        private final TextView tvSub;
        private final LinearLayout emptyContainer;
        private int selectedTab = TAB_CURATED;
        private int totalFlagsCount = 0;
        private int activeFlagsCount = 0;
        private int curatedTotalCount = 0;
        private String currentFilterQuery = "";
        private TabUpdateListener tabListener;

        public void setTabUpdateListener(TabUpdateListener listener) {
            this.tabListener = listener;
        }

        public int getSelectedTab() {
            return selectedTab;
        }

        public void setSelectedTab(int tab) {
            this.selectedTab = tab;
            updateActiveList();
            filter(currentFilterQuery);
            if (tabListener != null) {
                tabListener.onTabsUpdated(curatedTotalCount, customKeysSet.size(), selectedTab);
            }
        }

        public void expandAll() {
            if (!currentFilterQuery.isEmpty()) {
                searchCollapsedCategories.clear();
            } else {
                for (DisplayItem it : allItems) {
                    if (it.isHeader()) {
                        expandedCategories.add(it.headerTitle);
                    }
                }
            }
            filter(currentFilterQuery);
        }

        public void collapseAll() {
            if (!currentFilterQuery.isEmpty()) {
                for (DisplayItem it : allItems) {
                    if (it.isHeader()) {
                        searchCollapsedCategories.add(it.headerTitle);
                    }
                }
            } else {
                expandedCategories.clear();
            }
            filter(currentFilterQuery);
        }

        public List<DisplayItem> getActiveFilteredFlags() {
            List<DisplayItem> list = new ArrayList<>();
            if (currentFilterQuery == null || currentFilterQuery.isEmpty()) {
                for (DisplayItem it : allItems) {
                    if (!it.isHeader()) {
                        list.add(it);
                    }
                }
            } else {
                for (DisplayItem it : allItems) {
                    if (!it.isHeader()) {
                        String target = it.getKey() + " " + it.getTitle() + " " + (it.getDescription() != null ? it.getDescription() : "") + " " + (it.getTrigger() != null ? it.getTrigger() : "") + " " + it.value;
                        if (target.toLowerCase().contains(currentFilterQuery)) {
                            list.add(it);
                        }
                    }
                }
            }
            return list;
        }

        public String getCurrentFilterQuery() {
            return currentFilterQuery != null ? currentFilterQuery : "";
        }

        public FlagAdapter(Activity activity, SharedPreferences prefs, TextView tvSub, LinearLayout emptyContainer) {
            this.activity = activity;
            this.prefs = prefs;
            this.density = activity.getResources().getDisplayMetrics().density;
            this.theme = Theme.get(activity);
            this.tvSub = tvSub;
            this.emptyContainer = emptyContainer;
        }

        @Override public int getCount() { return displayedItems.size(); }
        @Override public DisplayItem getItem(int position) { return displayedItems.get(position); }
        @Override public long getItemId(int position) { return position; }
        @Override public int getViewTypeCount() { return 2; }
        @Override public int getItemViewType(int position) { return displayedItems.get(position).type; }
        @Override public boolean isEnabled(int position) { return !displayedItems.get(position).isHeader(); }

        private static boolean isFlagEnabled(SharedPreferences prefs, CuratedFlag cf) {
            if (!prefs.contains(cf.key)) return false;
            if (cf.type == PhotoFlagsRegistry.FlagType.BOOLEAN) {
                try {
                    return prefs.getBoolean(cf.key, false);
                } catch (Exception e) {
                    return false;
                }
            } else if (cf.type == PhotoFlagsRegistry.FlagType.LONG) {
                try {
                    return prefs.getLong(cf.key, 0L) > 0;
                } catch (Exception e) {
                    return false;
                }
            }
            return true;
        }

        private Object sanitizeValue(String key, Object rawVal) {
            if (rawVal instanceof String) {
                String s = ((String) rawVal).trim();
                int h = s.indexOf('#'); if (h != -1) s = s.substring(0, h).trim();
                int sl = s.indexOf("//"); if (sl != -1) s = s.substring(0, sl).trim();
                int sm = s.indexOf(';'); if (sm != -1) s = s.substring(0, sm).trim();
                s = stripQuotes(s);
                if (s.equalsIgnoreCase("true")) {
                    prefs.edit().remove(key).putBoolean(key, true).apply();
                    return Boolean.TRUE;
                } else if (s.equalsIgnoreCase("false")) {
                    prefs.edit().remove(key).putBoolean(key, false).apply();
                    return Boolean.FALSE;
                } else if (s.matches("^-?\\d+$")) {
                    try {
                        long lv = Long.parseLong(s);
                        prefs.edit().remove(key).putLong(key, lv).apply();
                        return lv;
                    } catch (Exception ignored) {}
                }
                return s;
            }
            return rawVal;
        }

        public void reloadData() {
            curatedItems.clear();
            customItems.clear();
            customKeysSet.clear();
            Map<String, ?> all = prefs.getAll();
            curatedTotalCount = 0;

            boolean presetsLoaded = prefs.getBoolean("_presets_loaded", true);
            if (presetsLoaded) {
                // 1. Curated Flags
                List<String> categories = PhotoFlagsRegistry.getCategories();
                for (String cat : categories) {
                    List<CuratedFlag> flagsInCat = PhotoFlagsRegistry.getFlagsForCategory(cat);
                    if (flagsInCat.isEmpty()) continue;
                    DisplayItem catHeader = new DisplayItem(cat);
                    List<DisplayItem> catFlags = new ArrayList<>();
                    for (CuratedFlag f : flagsInCat) {
                        curatedTotalCount++;
                        Object raw = all.get(f.key);
                        Object v;
                        if (raw != null) {
                            v = sanitizeValue(f.key, raw);
                        } else {
                            v = f.defaultValue != null ? f.defaultValue : Boolean.FALSE;
                        }
                        catFlags.add(new DisplayItem(f, v));
                    }
                    if (!catFlags.isEmpty()) {
                        curatedItems.add(catHeader);
                        curatedItems.addAll(catFlags);
                    }
                }
            }

            // 2. Custom / Imported Flags (Strictly user-added non-curated overrides)
            Set<String> customKeys = prefs.getStringSet(CUSTOM_FLAGS_KEY, Collections.emptySet());
            for (String k : customKeys) {
                if (!k.startsWith("_") && !k.startsWith("__") && !PhotoFlagsRegistry.FLAG_MAP.containsKey(k)) {
                    customKeysSet.add(k);
                }
            }

            if (!customKeysSet.isEmpty()) {
                List<String> sortedKeys = new ArrayList<>(customKeysSet);
                Collections.sort(sortedKeys);
                String headerTitle = "Custom Overrides (" + sortedKeys.size() + ")";
                customItems.add(new DisplayItem(headerTitle));
                for (String k : sortedKeys) {
                    Object v = sanitizeValue(k, all.get(k));
                    customItems.add(new DisplayItem(k, v));
                }
            } else {
                selectedTab = TAB_CURATED;
            }

            updateActiveList();
            if (tabListener != null) {
                tabListener.onTabsUpdated(curatedTotalCount, customKeysSet.size(), selectedTab);
            }
            filter(currentFilterQuery);
        }

        private void updateActiveList() {
            allItems.clear();
            if (selectedTab == TAB_CURATED || customKeysSet.isEmpty()) {
                allItems.addAll(curatedItems);
                this.totalFlagsCount = curatedTotalCount;
            } else {
                allItems.addAll(customItems);
                this.totalFlagsCount = customKeysSet.size();
            }
        }

        private void updateSubtitleText(int flagsShown, int totalMatched) {
            if (totalFlagsCount == 0) {
                emptyContainer.setVisibility(View.VISIBLE);
                renderEmptySlate(activity, emptyContainer, density, theme, () -> {
                    PhotoFlagsRegistry.applyCuratedDefaults(prefs);
                    prefs.edit().putBoolean("_presets_loaded", true).apply();
                    GooglePhotosAccountAvatar.syncOneGoogleFlags(activity);
                    reloadData();
                    Toast.makeText(activity, "Loaded " + PhotoFlagsRegistry.CURATED_FLAGS.size() + " Morphe presets!", Toast.LENGTH_SHORT).show();
                });
                tvSub.setText("0 Flags Configured");
            } else if (!currentFilterQuery.isEmpty() && totalMatched == 0) {
                emptyContainer.setVisibility(View.VISIBLE);
                renderEmptyMessage(activity, emptyContainer, "No flags matched \"" + currentFilterQuery + "\"", density, theme);
                tvSub.setText("0 Flags Matched (" + totalFlagsCount + " Total)");
            } else {
                emptyContainer.setVisibility(View.GONE);
                if (selectedTab == TAB_CUSTOM) {
                    tvSub.setText(customKeysSet.size() + " Custom Overrides");
                } else if (currentFilterQuery.isEmpty()) {
                    tvSub.setText(totalFlagsCount + " Flags Configured");
                } else {
                    tvSub.setText(totalMatched + " Found (" + totalFlagsCount + " Total)");
                }
            }
        }

        private void updateSubtitleText() {
            int flagsShown = 0;
            for (DisplayItem it : displayedItems) {
                if (!it.isHeader()) flagsShown++;
            }
            updateSubtitleText(flagsShown, countTotalMatches(currentFilterQuery));
        }

        private int countTotalMatches(String query) {
            if (query == null || query.isEmpty()) return totalFlagsCount;
            int count = 0;
            for (DisplayItem it : allItems) {
                if (!it.isHeader()) {
                    String target = it.getKey() + " " + it.getTitle() + " " + (it.getDescription() != null ? it.getDescription() : "") + " " + (it.getTrigger() != null ? it.getTrigger() : "") + " " + it.value;
                    if (target.toLowerCase().contains(query)) {
                        count++;
                    }
                }
            }
            return count;
        }

        public void filter(String query) {
            String newQuery = query == null ? "" : query.toLowerCase().trim();
            if (!newQuery.equals(this.currentFilterQuery)) {
                searchCollapsedCategories.clear();
            }
            this.currentFilterQuery = newQuery;
            displayedItems.clear();

            DisplayItem currentHeader = null;
            List<DisplayItem> currentSection = new ArrayList<>();
            int totalMatched = 0;

            for (DisplayItem it : allItems) {
                if (it.isHeader()) {
                    if (currentHeader != null) {
                        if (currentFilterQuery.isEmpty() || !currentSection.isEmpty()) {
                            displayedItems.add(currentHeader);
                            boolean isExpanded = (currentHeader.headerTitle != null && currentHeader.headerTitle.startsWith("Custom Overrides"))
                                    || (currentFilterQuery.isEmpty()
                                        ? expandedCategories.contains(currentHeader.headerTitle)
                                        : !searchCollapsedCategories.contains(currentHeader.headerTitle));
                            if (isExpanded) {
                                displayedItems.addAll(currentSection);
                            }
                            totalMatched += currentSection.size();
                        }
                    }
                    currentHeader = it;
                    currentSection.clear();
                } else {
                    if (currentFilterQuery.isEmpty()) {
                        currentSection.add(it);
                    } else {
                        String target = it.getKey() + " " + it.getTitle() + " " + (it.getDescription() != null ? it.getDescription() : "") + " " + (it.getTrigger() != null ? it.getTrigger() : "") + " " + it.value;
                        if (target.toLowerCase().contains(currentFilterQuery)) {
                            currentSection.add(it);
                        }
                    }
                }
            }
            if (currentHeader != null) {
                if (currentFilterQuery.isEmpty() || !currentSection.isEmpty()) {
                    displayedItems.add(currentHeader);
                    boolean isExpanded = (currentHeader.headerTitle != null && currentHeader.headerTitle.startsWith("Custom Overrides"))
                            || (currentFilterQuery.isEmpty()
                                ? expandedCategories.contains(currentHeader.headerTitle)
                                : !searchCollapsedCategories.contains(currentHeader.headerTitle));
                    if (isExpanded) {
                        displayedItems.addAll(currentSection);
                    }
                    totalMatched += currentSection.size();
                }
            }

            notifyDataSetChanged();

            int flagsShown = 0;
            for (DisplayItem it : displayedItems) {
                if (!it.isHeader()) flagsShown++;
            }
            updateSubtitleText(flagsShown, totalMatched);
        }

        private void clearAllCustomFlagsDialog() {
            float density = activity.getResources().getDisplayMetrics().density;
            Theme theme = Theme.get(activity);
            LinearLayout layout = new LinearLayout(activity);
            layout.setOrientation(LinearLayout.VERTICAL);
            int mPad = (int) (20 * density);
            layout.setPadding(mPad, (int) (4 * density), mPad, (int) (12 * density));

            TextView tvMsg = new TextView(activity);
            tvMsg.setText("Are you sure you want to remove all " + customKeysSet.size() + " custom overrides?\n\nCurated Morphe flags will remain intact.");
            tvMsg.setTextSize(13);
            tvMsg.setTextColor(theme.textPrimary);
            tvMsg.setLineSpacing(0, 1.25f);
            layout.addView(tvMsg);

            createM3ActionDialog(activity, "Clear All Custom Flags?", layout, "Clear all", () -> {
                SharedPreferences.Editor ed = prefs.edit();
                for (String k : customKeysSet) {
                    ed.remove(k);
                }
                ed.remove(CUSTOM_FLAGS_KEY).apply();
                selectedTab = TAB_CURATED;
                reloadData();
                Toast.makeText(activity, "Cleared all custom flags", Toast.LENGTH_SHORT).show();
            }, true).show();
        }

        private void deleteSingleCustomFlagDialog(String key) {
            float density = activity.getResources().getDisplayMetrics().density;
            Theme theme = Theme.get(activity);
            LinearLayout layout = new LinearLayout(activity);
            layout.setOrientation(LinearLayout.VERTICAL);
            int mPad = (int) (20 * density);
            layout.setPadding(mPad, (int) (4 * density), mPad, (int) (12 * density));

            TextView tvMsg = new TextView(activity);
            tvMsg.setText("Are you sure you want to delete custom override \"" + key + "\"?");
            tvMsg.setTextSize(13);
            tvMsg.setTextColor(theme.textPrimary);
            tvMsg.setLineSpacing(0, 1.25f);
            layout.addView(tvMsg);

            createM3ActionDialog(activity, "Delete Custom Flag?", layout, "Delete", () -> {
                prefs.edit().remove(key).apply();
                Set<String> set = new HashSet<>(prefs.getStringSet(CUSTOM_FLAGS_KEY, Collections.emptySet()));
                set.remove(key);
                prefs.edit().putStringSet(CUSTOM_FLAGS_KEY, set).apply();
                reloadData();
                Toast.makeText(activity, "Removed custom override: " + key, Toast.LENGTH_SHORT).show();
            }, true).show();
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            DisplayItem item = getItem(position);

            if (item.isHeader()) {
                HeaderViewHolder hHolder;
                if (convertView != null && convertView.getTag() instanceof HeaderViewHolder) {
                    hHolder = (HeaderViewHolder) convertView.getTag();
                } else {
                    hHolder = new HeaderViewHolder();
                    LinearLayout card = new LinearLayout(activity);
                    card.setOrientation(LinearLayout.VERTICAL);
                    int padH = (int) (14 * density);
                    int padV = (int) (10 * density);
                    card.setPadding(padH, padV, padH, padV);

                    LinearLayout topRow = new LinearLayout(activity);
                    topRow.setOrientation(LinearLayout.HORIZONTAL);
                    topRow.setGravity(Gravity.CENTER_VERTICAL);

                    TextView tvTitle = new TextView(activity);
                    tvTitle.setTextSize(13.5f);
                    tvTitle.setTypeface(null, Typeface.BOLD);
                    LinearLayout.LayoutParams tLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
                    tvTitle.setLayoutParams(tLp);
                    topRow.addView(tvTitle);

                    TextView tvBadge = new TextView(activity);
                    tvBadge.setTextSize(11);
                    tvBadge.setTypeface(null, Typeface.BOLD);
                    int badgePadH = (int) (7 * density);
                    int badgePadV = (int) (2 * density);
                    tvBadge.setPadding(badgePadH, badgePadV, badgePadH, badgePadV);
                    LinearLayout.LayoutParams bdLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    bdLp.setMargins(0, 0, (int) (8 * density), 0);
                    tvBadge.setLayoutParams(bdLp);
                    topRow.addView(tvBadge);

                    TextView btnToggle = new TextView(activity);
                    btnToggle.setTextSize(11.5f);
                    btnToggle.setTypeface(null, Typeface.BOLD);
                    int bPadH = (int) (10 * density);
                    int bPadV = (int) (4 * density);
                    btnToggle.setPadding(bPadH, bPadV, bPadH, bPadV);
                    btnToggle.setClickable(true);
                    LinearLayout.LayoutParams btLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    btLp.setMargins(0, 0, (int) (6 * density), 0);
                    btnToggle.setLayoutParams(btLp);
                    topRow.addView(btnToggle);

                    ImageView ivChevron = new ImageView(activity);
                    LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams((int) (20 * density), (int) (20 * density));
                    ivChevron.setLayoutParams(cLp);
                    topRow.addView(ivChevron);
                    card.addView(topRow);

                    TextView tvTrigger = new TextView(activity);
                    tvTrigger.setTextSize(11.5f);
                    tvTrigger.setPadding(0, (int) (4 * density), 0, 0);
                    card.addView(tvTrigger);

                    hHolder.root = card;
                    hHolder.tvTitle = tvTitle;
                    hHolder.tvBadge = tvBadge;
                    hHolder.ivChevron = ivChevron;
                    hHolder.btnToggleAll = btnToggle;
                    hHolder.tvTrigger = tvTrigger;

                    convertView = card;
                    convertView.setTag(hHolder);
                }

                hHolder.root.setBackground(createCardDrawable(false, density, theme));
                hHolder.tvTitle.setTextColor(theme.textPrimary);
                hHolder.tvTrigger.setTextColor(theme.textSecondary);

                // Handle Custom Overrides Header (with Clear All button)
                if (item.headerTitle != null && item.headerTitle.startsWith("Custom Overrides")) {
                    hHolder.tvTitle.setText("Custom Overrides (" + customKeysSet.size() + ")");
                    hHolder.tvBadge.setVisibility(View.GONE);
                    hHolder.ivChevron.setVisibility(View.GONE);
                    hHolder.tvTrigger.setVisibility(View.GONE);
                    hHolder.btnToggleAll.setVisibility(View.VISIBLE);
                    hHolder.btnToggleAll.setText("Clear All");
                    hHolder.btnToggleAll.setTextColor(theme.isDark ? 0xFFFFB4AB : 0xFFBA1A1A);
                    hHolder.btnToggleAll.setBackground(createRoundedDrawable(theme.isDark ? 0xFF3E1E1E : 0xFFFFDAD6, 10 * density));
                    hHolder.btnToggleAll.setOnClickListener(v -> clearAllCustomFlagsDialog());
                    hHolder.root.setOnClickListener(null);
                    hHolder.root.setClickable(false);
                    return convertView;
                }

                String cat = item.headerTitle;
                hHolder.tvTitle.setText(cleanCategoryTitle(cat));
                hHolder.tvBadge.setVisibility(View.VISIBLE);
                hHolder.ivChevron.setVisibility(View.VISIBLE);

                boolean isExp = currentFilterQuery.isEmpty()
                        ? expandedCategories.contains(cat)
                        : !searchCollapsedCategories.contains(cat);

                int chevronType = isExp ? MaterialVectorDrawable.TYPE_CHEVRON_UP : MaterialVectorDrawable.TYPE_CHEVRON_DOWN;
                hHolder.ivChevron.setImageDrawable(new MaterialVectorDrawable(chevronType, theme.textSecondary));

                List<CuratedFlag> allInCat = PhotoFlagsRegistry.getFlagsForCategory(cat);
                List<CuratedFlag> flagsInCat = new ArrayList<>();
                if (currentFilterQuery.isEmpty()) {
                    flagsInCat.addAll(allInCat);
                } else {
                    for (CuratedFlag cf : allInCat) {
                        String target = cf.key + " " + cf.title + " " + (cf.description != null ? cf.description : "") + " " + (cf.triggerTarget != null ? cf.triggerTarget : "");
                        if (target.toLowerCase().contains(currentFilterQuery)) {
                            flagsInCat.add(cf);
                        }
                    }
                }
                int totalInCat = flagsInCat.size();
                int enabledInCat = 0;
                for (CuratedFlag cf : flagsInCat) {
                    if (isFlagEnabled(prefs, cf)) enabledInCat++;
                }

                hHolder.tvBadge.setText(enabledInCat + "/" + totalInCat);
                if (enabledInCat == 0) {
                    hHolder.tvBadge.setTextColor(theme.textSecondary);
                    hHolder.tvBadge.setBackground(createRoundedDrawable(theme.surfaceContainer, 10 * density));
                } else {
                    hHolder.tvBadge.setTextColor(theme.primary);
                    hHolder.tvBadge.setBackground(createRoundedDrawable(theme.primaryContainer, 10 * density));
                }

                String cleanDesc = cleanCategorySubtitle(null, cat);
                if (cleanDesc != null && !cleanDesc.isEmpty()) {
                    hHolder.tvTrigger.setVisibility(View.VISIBLE);
                    hHolder.tvTrigger.setText(cleanDesc);
                } else {
                    hHolder.tvTrigger.setVisibility(View.GONE);
                }

                View.OnClickListener toggleCollapse = v -> {
                    if (currentFilterQuery.isEmpty()) {
                        if (expandedCategories.contains(cat)) {
                            expandedCategories.remove(cat);
                        } else {
                            expandedCategories.add(cat);
                        }
                    } else {
                        if (searchCollapsedCategories.contains(cat)) {
                            searchCollapsedCategories.remove(cat);
                        } else {
                            searchCollapsedCategories.add(cat);
                        }
                    }
                    filter(currentFilterQuery);
                };

                hHolder.root.setClickable(true);
                hHolder.root.setOnClickListener(toggleCollapse);
                hHolder.tvTitle.setOnClickListener(toggleCollapse);
                hHolder.tvBadge.setOnClickListener(toggleCollapse);
                hHolder.ivChevron.setOnClickListener(toggleCollapse);
                hHolder.tvTrigger.setOnClickListener(toggleCollapse);

                if (totalInCat > 0) {
                    hHolder.btnToggleAll.setVisibility(View.VISIBLE);
                    boolean allEnabled = enabledInCat == totalInCat;
                    if (allEnabled) {
                        hHolder.btnToggleAll.setText("Disable all");
                        hHolder.btnToggleAll.setTextColor(theme.disableAllText);
                        hHolder.btnToggleAll.setBackground(createRoundedDrawable(theme.disableAllBg, 10 * density));
                    } else {
                        hHolder.btnToggleAll.setText("Enable all");
                        hHolder.btnToggleAll.setTextColor(theme.enableAllText);
                        hHolder.btnToggleAll.setBackground(createRoundedDrawable(theme.enableAllBg, 10 * density));
                    }

                    hHolder.btnToggleAll.setOnClickListener(v -> {
                        boolean targetState = !allEnabled;
                        SharedPreferences.Editor edit = prefs.edit();
                        for (CuratedFlag cf : flagsInCat) {
                            if (cf.type == PhotoFlagsRegistry.FlagType.BOOLEAN) {
                                edit.putBoolean(cf.key, targetState);
                            } else if (cf.type == PhotoFlagsRegistry.FlagType.LONG) {
                                if (targetState) {
                                    edit.putLong(cf.key, ((Number) cf.defaultValue).longValue());
                                } else {
                                    edit.putLong(cf.key, 0L);
                                }
                            }
                        }
                        edit.apply();
                        GooglePhotosAccountAvatar.syncOneGoogleFlags(activity);
                        reloadData();
                        Toast.makeText(activity, (targetState ? "Enabled " : "Disabled ") + totalInCat + " flags in " + cat, Toast.LENGTH_SHORT).show();
                    });
                } else {
                    hHolder.btnToggleAll.setVisibility(View.GONE);
                }

                return convertView;
            }

            FlagViewHolder holder;
            if (convertView == null || !(convertView.getTag() instanceof FlagViewHolder)) {
                holder = new FlagViewHolder();
                LinearLayout row = new LinearLayout(activity);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);
                int rPad = (int) (14 * density);
                row.setPadding(rPad, (int) (10 * density), rPad, (int) (10 * density));

                LinearLayout textCol = new LinearLayout(activity);
                textCol.setOrientation(LinearLayout.VERTICAL);
                LinearLayout.LayoutParams colLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
                textCol.setLayoutParams(colLp);

                TextView tvTitle = new TextView(activity);
                tvTitle.setTextSize(14);
                tvTitle.setTypeface(null, Typeface.BOLD);
                textCol.addView(tvTitle);

                TextView tvTriggerBadge = new TextView(activity);
                tvTriggerBadge.setTextSize(10);
                tvTriggerBadge.setTypeface(null, Typeface.BOLD);
                int bPad = (int) (6 * density);
                tvTriggerBadge.setPadding(bPad, (int) (2 * density), bPad, (int) (2 * density));
                LinearLayout.LayoutParams tbLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                tbLp.topMargin = (int) (2 * density);
                tbLp.bottomMargin = (int) (2 * density);
                tvTriggerBadge.setLayoutParams(tbLp);
                textCol.addView(tvTriggerBadge);

                TextView tvDesc = new TextView(activity);
                tvDesc.setTextSize(12);
                tvDesc.setPadding(0, (int) (2 * density), 0, (int) (2 * density));
                textCol.addView(tvDesc);

                TextView tvKey = new TextView(activity);
                tvKey.setTextSize(10);
                textCol.addView(tvKey);
                row.addView(textCol);

                Switch sw = new Switch(activity);
                row.addView(sw);

                TextView valChip = new TextView(activity);
                valChip.setTextSize(13);
                valChip.setTypeface(null, Typeface.BOLD);
                int p = (int) (10 * density);
                valChip.setPadding(p, (int) (6 * density), p, (int) (6 * density));
                row.addView(valChip);

                ImageView btnDelete = new ImageView(activity);
                int delSize = (int) (34 * density);
                LinearLayout.LayoutParams delLp = new LinearLayout.LayoutParams(delSize, delSize);
                delLp.setMargins((int) (6 * density), 0, 0, 0);
                btnDelete.setLayoutParams(delLp);
                btnDelete.setClickable(true);
                btnDelete.setFocusable(true);
                btnDelete.setPadding((int) (5 * density), (int) (5 * density), (int) (5 * density), (int) (5 * density));
                btnDelete.setVisibility(View.GONE);
                row.addView(btnDelete);

                holder.root = row;
                holder.tvTitle = tvTitle;
                holder.tvTriggerBadge = tvTriggerBadge;
                holder.tvDesc = tvDesc;
                holder.tvKey = tvKey;
                holder.swToggle = sw;
                holder.valChip = valChip;
                holder.btnDelete = btnDelete;

                convertView = row;
                convertView.setTag(holder);
            } else {
                holder = (FlagViewHolder) convertView.getTag();
            }

            // Re-apply styling on recycled views
            holder.tvTitle.setTextColor(theme.textPrimary);
            holder.tvDesc.setTextColor(theme.textSecondary);
            holder.tvKey.setTextColor(theme.textTertiary);
            holder.tvTriggerBadge.setTextColor(theme.primary);
            holder.tvTriggerBadge.setBackground(createRoundedDrawable(theme.isDark ? 0xFF173832 : 0xFFE6F4F1, 6 * density));
            holder.valChip.setTextColor(theme.primary);
            holder.valChip.setBackground(createRoundedDrawable(theme.primaryContainer, 8 * density));
            applySwitchTint(holder.swToggle, theme);

            // Bind Data
            String triggerStr = item.getTrigger();
            if (triggerStr != null && !triggerStr.isEmpty()) {
                holder.tvTriggerBadge.setVisibility(View.VISIBLE);
                holder.tvTriggerBadge.setText(cleanCategorySubtitle(triggerStr, null));
            } else {
                holder.tvTriggerBadge.setVisibility(View.GONE);
            }

            if (item.curatedFlag != null) {
                holder.tvTitle.setText(item.curatedFlag.title);
                holder.tvDesc.setVisibility(View.VISIBLE);
                holder.tvDesc.setText(item.curatedFlag.description);
                holder.tvKey.setText("ID: " + item.curatedFlag.key + " • " + item.curatedFlag.type + ": " + item.value);
                holder.btnDelete.setVisibility(View.GONE);
            } else {
                holder.tvTitle.setText(item.customKey);
                holder.tvDesc.setVisibility(View.GONE);
                String typeLabel = (item.value instanceof Boolean) ? "Boolean"
                        : (item.value instanceof Float || item.value instanceof Double) ? "Float"
                        : (item.value instanceof Number) ? "Long" : "String";
                holder.tvKey.setText(typeLabel + " • Value: " + item.value);
                holder.btnDelete.setVisibility(View.VISIBLE);
                holder.btnDelete.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_DELETE, theme.isDark ? 0xFFFFB4AB : 0xFFBA1A1A));
                holder.btnDelete.setOnClickListener(v -> deleteSingleCustomFlagDialog(item.getKey()));
            }

            if (item.value instanceof Boolean) {
                holder.valChip.setVisibility(View.GONE);
                holder.swToggle.setVisibility(View.VISIBLE);

                boolean isChecked = Boolean.TRUE.equals(item.value);
                holder.root.setBackground(createCardDrawable(isChecked, density, theme));

                holder.swToggle.setOnClickListener(null);
                holder.swToggle.setChecked(isChecked);

                View.OnClickListener toggleAction = v -> {
                    boolean next = !Boolean.TRUE.equals(item.value);
                    item.value = next;
                    holder.swToggle.setChecked(next);
                    holder.root.setBackground(createCardDrawable(next, density, theme));
                    prefs.edit().putBoolean(item.getKey(), next).apply();
                    if (next) {
                        activeFlagsCount++;
                    } else {
                        activeFlagsCount = Math.max(0, activeFlagsCount - 1);
                    }
                    if ("45531621".equals(item.getKey()) || "45531625".equals(item.getKey())) {
                        GooglePhotosAccountAvatar.syncOneGoogleFlags(activity);
                    }
                    updateSubtitleText();
                    notifyDataSetChanged();
                    Toast.makeText(activity, "Updated: " + item.getTitle(), Toast.LENGTH_SHORT).show();
                };

                holder.swToggle.setOnClickListener(toggleAction);
                holder.root.setClickable(true);
                holder.root.setOnClickListener(toggleAction);
            } else {
                holder.swToggle.setVisibility(View.GONE);
                holder.valChip.setVisibility(View.VISIBLE);
                holder.root.setBackground(createCardDrawable(false, density, theme));

                String chipText = ((item.value instanceof Float || item.value instanceof Double) ? "[Float] "
                        : (item.value instanceof Number) ? "[Long] " : "[String] ") + item.value;
                holder.valChip.setText(chipText);

                holder.root.setClickable(true);
                holder.root.setOnClickListener(v -> showEditValueDialog(activity, prefs, item.getKey(), item.getTitle(), item.value, () -> {
                    Object newVal = prefs.getAll().get(item.getKey());
                    if (newVal != null) {
                        item.value = newVal;
                        notifyDataSetChanged();
                    }
                }));
            }

            return convertView;
        }

        private void applySwitchTint(Switch sw, Theme theme) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                int[][] states = new int[][]{
                        new int[]{android.R.attr.state_checked},
                        new int[]{-android.R.attr.state_checked}
                };
                int[] thumbColors = new int[]{
                        theme.primary,
                        theme.textSecondary
                };
                int[] trackColors = new int[]{
                        theme.primaryContainer,
                        theme.isDark ? 0xFF353A38 : theme.outline
                };
                sw.setThumbTintList(new ColorStateList(states, thumbColors));
                sw.setTrackTintList(new ColorStateList(states, trackColors));
            }
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Main Flag Manager Dialog (Single Clean View)
    // ─────────────────────────────────────────────────────────────────────────

    public static void showFlagManagerDialog(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        float density = activity.getResources().getDisplayMetrics().density;
        Theme theme = Theme.get(activity);
        SharedPreferences prefs = getPrefs(activity);

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(createRoundedDrawable(theme.surface, 28 * density));
        root.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            root.setOutlineProvider(new ViewOutlineProvider() {
                @Override
                public void getOutline(View view, Outline outline) {
                    outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), 28 * density);
                }
            });
            root.setClipToOutline(true);
        }

        // 1. Top Bar
        LinearLayout topBar = new LinearLayout(activity);
        topBar.setOrientation(LinearLayout.HORIZONTAL);
        topBar.setGravity(Gravity.CENTER_VERTICAL);
        int tbPad = (int) (16 * density);
        topBar.setPadding(tbPad, (int) (12 * density), (int) (10 * density), (int) (8 * density));

        LinearLayout titleCol = new LinearLayout(activity);
        titleCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        titleCol.setLayoutParams(titleLp);

        TextView tvTitle = new TextView(activity);
        tvTitle.setText("Photos Flags");
        tvTitle.setTextSize(18);
        tvTitle.setTextColor(theme.textPrimary);
        tvTitle.setTypeface(null, Typeface.BOLD);
        titleCol.addView(tvTitle);

        TextView tvSub = new TextView(activity);
        tvSub.setText("Loading flags...");
        tvSub.setTextSize(11);
        tvSub.setTextColor(theme.textSecondary);
        titleCol.addView(tvSub);
        topBar.addView(titleCol);

        // Action Icons (Proper 22dp icons inside 42dp touch targets)
        View btnSearch = createHeaderIconButton(activity, new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_SEARCH, theme.textPrimary), (int) (42 * density), (int) (22 * density));
        View btnAdd = createHeaderIconButton(activity, new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_ADD, theme.textPrimary), (int) (42 * density), (int) (22 * density));
        View btnMenu = createHeaderIconButton(activity, new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_MORE, theme.textPrimary), (int) (42 * density), (int) (22 * density));
        View btnClose = createHeaderIconButton(activity, new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CLOSE, theme.textPrimary), (int) (42 * density), (int) (22 * density));

        topBar.addView(btnSearch);
        topBar.addView(btnAdd);
        topBar.addView(btnMenu);
        topBar.addView(btnClose);
        root.addView(topBar);

        // 2. Expandable Search Bar
        LinearLayout searchBox = new LinearLayout(activity);
        searchBox.setOrientation(LinearLayout.HORIZONTAL);
        searchBox.setGravity(Gravity.CENTER_VERTICAL);
        searchBox.setPadding(tbPad, (int) (6 * density), tbPad, (int) (10 * density));
        searchBox.setVisibility(View.GONE);

        LinearLayout inputWrapper = new LinearLayout(activity);
        inputWrapper.setOrientation(LinearLayout.HORIZONTAL);
        inputWrapper.setGravity(Gravity.CENTER_VERTICAL);
        inputWrapper.setBackground(createRoundedDrawable(theme.searchInputBg, 14 * density));
        LinearLayout.LayoutParams iwLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (46 * density));
        inputWrapper.setLayoutParams(iwLp);

        EditText etSearch = new EditText(activity);
        etSearch.setHint("Search flags, keys or values...");
        etSearch.setTextSize(14);
        etSearch.setTextColor(theme.textPrimary);
        etSearch.setHintTextColor(theme.textSecondary);
        etSearch.setBackground(null);
        etSearch.setSingleLine(true);
        etSearch.setMaxLines(1);
        etSearch.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_FILTER);
        etSearch.setImeOptions(EditorInfo.IME_ACTION_SEARCH | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        int sPad = (int) (14 * density);
        etSearch.setPadding(sPad, 0, (int) (6 * density), 0);
        LinearLayout.LayoutParams sLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f);
        etSearch.setLayoutParams(sLp);
        inputWrapper.addView(etSearch);

        ImageView btnClearSearch = new ImageView(activity);
        btnClearSearch.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CLOSE, theme.textSecondary));
        btnClearSearch.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        int cPad = (int) (12 * density);
        btnClearSearch.setPadding(cPad, 0, cPad, 0);
        btnClearSearch.setVisibility(View.GONE);
        btnClearSearch.setClickable(true);
        btnClearSearch.setFocusable(true);
        inputWrapper.addView(btnClearSearch);

        searchBox.addView(inputWrapper);
        root.addView(searchBox);

        // 2.5 Dynamic Tab Bar (Morphe Flags vs Custom Overrides)
        LinearLayout tabBar = new LinearLayout(activity);
        tabBar.setOrientation(LinearLayout.HORIZONTAL);
        tabBar.setGravity(Gravity.CENTER_VERTICAL);
        tabBar.setPadding(tbPad, (int) (2 * density), tbPad, (int) (6 * density));
        tabBar.setVisibility(View.GONE);

        TextView tabCurated = new TextView(activity);
        tabCurated.setText("Morphe Flags");
        tabCurated.setTextSize(13);
        tabCurated.setTypeface(null, Typeface.BOLD);
        tabCurated.setGravity(Gravity.CENTER);
        int tPadH = (int) (14 * density);
        int tPadV = (int) (7 * density);
        tabCurated.setPadding(tPadH, tPadV, tPadH, tPadV);
        LinearLayout.LayoutParams tcLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        tcLp.setMargins(0, 0, (int) (4 * density), 0);
        tabCurated.setLayoutParams(tcLp);
        tabCurated.setClickable(true);
        tabCurated.setFocusable(true);

        TextView tabCustom = new TextView(activity);
        tabCustom.setText("Custom Overrides");
        tabCustom.setTextSize(13);
        tabCustom.setTypeface(null, Typeface.BOLD);
        tabCustom.setGravity(Gravity.CENTER);
        tabCustom.setPadding(tPadH, tPadV, tPadH, tPadV);
        LinearLayout.LayoutParams tcustLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        tcustLp.setMargins((int) (4 * density), 0, 0, 0);
        tabCustom.setLayoutParams(tcustLp);
        tabCustom.setClickable(true);
        tabCustom.setFocusable(true);

        tabBar.addView(tabCurated);
        tabBar.addView(tabCustom);
        root.addView(tabBar);

        // 2.6 Global Action Bar (Enable all / Disable all / Expand all / Collapse all)
        LinearLayout globalActionBar = new LinearLayout(activity);
        globalActionBar.setOrientation(LinearLayout.HORIZONTAL);
        globalActionBar.setGravity(Gravity.CENTER_VERTICAL);
        int barPadH = (int) (12 * density);
        globalActionBar.setPadding(barPadH, (int) (3 * density), barPadH, (int) (8 * density));

        int gap = (int) (4 * density);

        LinearLayout btnEnableAllGlobal = createQuickActionPill(activity, MaterialVectorDrawable.TYPE_CHECK, "Enable all", density, theme);
        LinearLayout.LayoutParams p1 = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        p1.rightMargin = gap;
        btnEnableAllGlobal.setLayoutParams(p1);

        LinearLayout btnDisableAllGlobal = createQuickActionPill(activity, MaterialVectorDrawable.TYPE_CLOSE, "Disable all", density, theme);
        LinearLayout.LayoutParams p2 = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        p2.rightMargin = gap;
        btnDisableAllGlobal.setLayoutParams(p2);

        LinearLayout btnExpandAllGlobal = createQuickActionPill(activity, MaterialVectorDrawable.TYPE_EXPAND, "Expand all", density, theme);
        LinearLayout.LayoutParams p3 = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        p3.rightMargin = gap;
        btnExpandAllGlobal.setLayoutParams(p3);

        LinearLayout btnCollapseAllGlobal = createQuickActionPill(activity, MaterialVectorDrawable.TYPE_COLLAPSE, "Collapse all", density, theme);
        LinearLayout.LayoutParams p4 = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        btnCollapseAllGlobal.setLayoutParams(p4);

        globalActionBar.addView(btnEnableAllGlobal);
        globalActionBar.addView(btnDisableAllGlobal);
        globalActionBar.addView(btnExpandAllGlobal);
        globalActionBar.addView(btnCollapseAllGlobal);
        root.addView(globalActionBar);

        // 3. Virtualized List View with Fast-Scroll & Empty Container
        FrameLayout listFrame = new FrameLayout(activity);
        LinearLayout.LayoutParams listFrameLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        listFrame.setLayoutParams(listFrameLp);

        ListView listView = new ListView(activity);
        listView.setLayoutParams(new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        listView.setDivider(null);
        listView.setDividerHeight((int) (6 * density));
        listView.setPadding(tbPad, (int) (8 * density), tbPad, (int) (16 * density));
        listView.setClipToPadding(false);
        listView.setFastScrollEnabled(false);
        listView.setVerticalScrollBarEnabled(false);
        listFrame.addView(listView);

        LinearLayout emptyContainer = new LinearLayout(activity);
        emptyContainer.setOrientation(LinearLayout.VERTICAL);
        emptyContainer.setGravity(Gravity.CENTER);
        emptyContainer.setLayoutParams(new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        emptyContainer.setVisibility(View.GONE);
        listFrame.addView(emptyContainer);

        root.addView(listFrame);

        // 4. Bottom Action Dock
        LinearLayout bottomDock = new LinearLayout(activity);
        bottomDock.setOrientation(LinearLayout.VERTICAL);
        bottomDock.setGravity(Gravity.CENTER);
        int dPadH = (int) (16 * density);
        bottomDock.setPadding(dPadH, (int) (8 * density), dPadH, (int) (14 * density));

        LinearLayout btnApply = new LinearLayout(activity);
        btnApply.setOrientation(LinearLayout.HORIZONTAL);
        btnApply.setGravity(Gravity.CENTER);
        btnApply.setClickable(true);
        btnApply.setFocusable(true);
        btnApply.setBackground(createActionPillDrawable(theme.primary, 24 * density));
        int btnHeight = (int) (48 * density);
        LinearLayout.LayoutParams applyLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, btnHeight);
        btnApply.setLayoutParams(applyLp);

        TextView tvApply = new TextView(activity);
        tvApply.setText("Apply and restart");
        tvApply.setTextSize(14.5f);
        tvApply.setTypeface(null, Typeface.BOLD);
        tvApply.setTextColor(theme.onPrimary);
        btnApply.addView(tvApply);

        btnApply.setOnClickListener(v -> {
            dialog.dismiss();
            GooglePhotosAccountAvatar.syncOneGoogleFlags(activity);
            restartApp(activity);
        });
        bottomDock.addView(btnApply);
        root.addView(bottomDock);

        // Instantiate Adapter
        FlagAdapter adapter = new FlagAdapter(activity, prefs, tvSub, emptyContainer);
        listView.setAdapter(adapter);

        btnEnableAllGlobal.setOnClickListener(v -> {
            List<DisplayItem> targetFlags = adapter.getActiveFilteredFlags();
            if (targetFlags.isEmpty()) {
                Toast.makeText(activity, "No matching flags to enable", Toast.LENGTH_SHORT).show();
                return;
            }
            int count = targetFlags.size();
            boolean isCustom = adapter.getSelectedTab() == FlagAdapter.TAB_CUSTOM;
            String filterQuery = adapter.getCurrentFilterQuery();
            String title = isCustom ? "Enable " + count + " Custom Flags?" : "Enable " + count + " Flags?";
            String msg = filterQuery.isEmpty()
                    ? "Are you sure you want to enable all " + count + (isCustom ? " custom overrides?" : " Morphe flags?")
                    : "Are you sure you want to enable " + count + " flags matching \"" + filterQuery + "\"?";

            LinearLayout msgLayout = new LinearLayout(activity);
            msgLayout.setOrientation(LinearLayout.VERTICAL);
            int mPad = (int) (18 * density);
            msgLayout.setPadding(mPad, (int) (4 * density), mPad, (int) (12 * density));

            TextView tvMsg = new TextView(activity);
            tvMsg.setText(msg);
            tvMsg.setTextSize(13);
            tvMsg.setTextColor(theme.textPrimary);
            tvMsg.setLineSpacing(0, 1.25f);
            msgLayout.addView(tvMsg);

            createM3ActionDialog(activity, title, msgLayout, "Enable (" + count + ")", () -> {
                SharedPreferences.Editor edit = prefs.edit();
                if (!isCustom) {
                    for (DisplayItem item : targetFlags) {
                        if (item.curatedFlag != null) {
                            CuratedFlag cf = item.curatedFlag;
                            if (cf.type == PhotoFlagsRegistry.FlagType.BOOLEAN) {
                                edit.putBoolean(cf.key, true);
                            } else if (cf.type == PhotoFlagsRegistry.FlagType.LONG) {
                                edit.putLong(cf.key, ((Number) cf.defaultValue).longValue());
                            }
                        }
                    }
                } else {
                    for (DisplayItem item : targetFlags) {
                        String k = item.getKey();
                        if (item.value instanceof Boolean) {
                            edit.putBoolean(k, true);
                        } else if (item.value instanceof Long) {
                            long lv = ((Long) item.value);
                            edit.putLong(k, lv == 0L ? 1L : lv);
                        } else if (item.value instanceof Integer) {
                            int iv = ((Integer) item.value);
                            edit.putInt(k, iv == 0 ? 1 : iv);
                        }
                    }
                }
                edit.apply();
                GooglePhotosAccountAvatar.syncOneGoogleFlags(activity);
                adapter.reloadData();
                Toast.makeText(activity, "Enabled " + count + " flags! Tap 'Apply and restart' to apply.", Toast.LENGTH_SHORT).show();
            }).show();
        });

        btnDisableAllGlobal.setOnClickListener(v -> {
            List<DisplayItem> targetFlags = adapter.getActiveFilteredFlags();
            if (targetFlags.isEmpty()) {
                Toast.makeText(activity, "No matching flags to disable", Toast.LENGTH_SHORT).show();
                return;
            }
            int count = targetFlags.size();
            boolean isCustom = adapter.getSelectedTab() == FlagAdapter.TAB_CUSTOM;
            String filterQuery = adapter.getCurrentFilterQuery();
            String title = isCustom ? "Disable " + count + " Custom Flags?" : "Disable " + count + " Flags?";
            String msg = filterQuery.isEmpty()
                    ? "Are you sure you want to disable all " + count + (isCustom ? " custom overrides?" : " Morphe flags?")
                    : "Are you sure you want to disable " + count + " flags matching \"" + filterQuery + "\"?";

            LinearLayout msgLayout = new LinearLayout(activity);
            msgLayout.setOrientation(LinearLayout.VERTICAL);
            int mPad = (int) (18 * density);
            msgLayout.setPadding(mPad, (int) (4 * density), mPad, (int) (12 * density));

            TextView tvMsg = new TextView(activity);
            tvMsg.setText(msg);
            tvMsg.setTextSize(13);
            tvMsg.setTextColor(theme.textPrimary);
            tvMsg.setLineSpacing(0, 1.25f);
            msgLayout.addView(tvMsg);

            createM3ActionDialog(activity, title, msgLayout, "Disable (" + count + ")", () -> {
                SharedPreferences.Editor edit = prefs.edit();
                if (!isCustom) {
                    for (DisplayItem item : targetFlags) {
                        if (item.curatedFlag != null) {
                            CuratedFlag cf = item.curatedFlag;
                            if (cf.type == PhotoFlagsRegistry.FlagType.BOOLEAN) {
                                edit.putBoolean(cf.key, false);
                            } else if (cf.type == PhotoFlagsRegistry.FlagType.LONG) {
                                edit.putLong(cf.key, 0L);
                            }
                        }
                    }
                } else {
                    for (DisplayItem item : targetFlags) {
                        String k = item.getKey();
                        if (item.value instanceof Boolean) {
                            edit.putBoolean(k, false);
                        } else if (item.value instanceof Long) {
                            edit.putLong(k, 0L);
                        } else if (item.value instanceof Integer) {
                            edit.putInt(k, 0);
                        }
                    }
                }
                edit.apply();
                GooglePhotosAccountAvatar.syncOneGoogleFlags(activity);
                adapter.reloadData();
                Toast.makeText(activity, "Disabled " + count + " flags! Tap 'Apply and restart' to apply.", Toast.LENGTH_SHORT).show();
            }).show();
        });

        btnExpandAllGlobal.setOnClickListener(v -> {
            adapter.expandAll();
            Toast.makeText(activity, "Expanded all categories", Toast.LENGTH_SHORT).show();
        });

        btnCollapseAllGlobal.setOnClickListener(v -> {
            adapter.collapseAll();
            Toast.makeText(activity, "Collapsed all categories", Toast.LENGTH_SHORT).show();
        });

        tabCurated.setOnClickListener(v -> adapter.setSelectedTab(FlagAdapter.TAB_CURATED));
        tabCustom.setOnClickListener(v -> adapter.setSelectedTab(FlagAdapter.TAB_CUSTOM));

        adapter.setTabUpdateListener((curatedCount, customCount, selTab) -> {
            int activeCount = (selTab == FlagAdapter.TAB_CURATED) ? curatedCount : customCount;
            if (activeCount > 0) {
                globalActionBar.setVisibility(View.VISIBLE);
            } else {
                globalActionBar.setVisibility(View.GONE);
            }
            if (selTab == FlagAdapter.TAB_CUSTOM) {
                btnExpandAllGlobal.setVisibility(View.GONE);
                btnCollapseAllGlobal.setVisibility(View.GONE);
                p2.rightMargin = 0;
            } else {
                btnExpandAllGlobal.setVisibility(View.VISIBLE);
                btnCollapseAllGlobal.setVisibility(View.VISIBLE);
                p2.rightMargin = gap;
            }
            btnDisableAllGlobal.setLayoutParams(p2);
            if (customCount == 0) {
                tabBar.setVisibility(View.GONE);
            } else {
                tabBar.setVisibility(View.VISIBLE);
                tabCurated.setText("Morphe Flags (" + curatedCount + ")");
                tabCustom.setText("Custom Overrides (" + customCount + ")");
                if (selTab == FlagAdapter.TAB_CURATED) {
                    tabCurated.setBackground(createRoundedDrawable(theme.primary, 14 * density));
                    tabCurated.setTextColor(theme.onPrimary);
                    tabCustom.setBackground(createRoundedCardDrawable(theme.surfaceContainer, theme.outline, 14 * density));
                    tabCustom.setTextColor(theme.textSecondary);
                } else {
                    tabCustom.setBackground(createRoundedDrawable(theme.primary, 14 * density));
                    tabCustom.setTextColor(theme.onPrimary);
                    tabCurated.setBackground(createRoundedCardDrawable(theme.surfaceContainer, theme.outline, 14 * density));
                    tabCurated.setTextColor(theme.textSecondary);
                }
            }
        });

        btnSearch.setOnClickListener(v -> {
            if (searchBox.getVisibility() == View.VISIBLE) {
                searchBox.setVisibility(View.GONE);
                etSearch.setText("");
                InputMethodManager imm = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
                if (imm != null) {
                    imm.hideSoftInputFromWindow(etSearch.getWindowToken(), 0);
                }
            } else {
                searchBox.setVisibility(View.VISIBLE);
                etSearch.requestFocus();
                InputMethodManager imm = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
                if (imm != null) {
                    imm.showSoftInput(etSearch, InputMethodManager.SHOW_IMPLICIT);
                }
            }
        });

        btnClearSearch.setOnClickListener(v -> {
            etSearch.setText("");
            adapter.filter("");
        });

        etSearch.setOnEditorActionListener((v, actionId, event) -> {
            if (actionId == EditorInfo.IME_ACTION_SEARCH ||
                    actionId == EditorInfo.IME_ACTION_DONE ||
                    (event != null && event.getKeyCode() == KeyEvent.KEYCODE_ENTER)) {
                InputMethodManager imm = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
                if (imm != null) {
                    imm.hideSoftInputFromWindow(etSearch.getWindowToken(), 0);
                }
                etSearch.clearFocus();
                return true;
            }
            return false;
        });

        btnClose.setOnClickListener(v -> dialog.dismiss());

        Runnable refreshUi = adapter::reloadData;

        btnAdd.setOnClickListener(v -> showAddCustomFlagDialog(activity, prefs, refreshUi));
        btnMenu.setOnClickListener(v -> showProperOptionsMenu(activity, prefs, adapter, refreshUi));

        // Debounced Search TextWatcher
        Runnable[] searchRunnable = new Runnable[1];
        etSearch.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                btnClearSearch.setVisibility(s.length() > 0 ? View.VISIBLE : View.GONE);
                if (searchRunnable[0] != null) {
                    MAIN_HANDLER.removeCallbacks(searchRunnable[0]);
                }
                String q = s.toString();
                searchRunnable[0] = () -> adapter.filter(q);
                MAIN_HANDLER.postDelayed(searchRunnable[0], 200);
            }
            @Override public void afterTextChanged(Editable s) {}
        });

        dialog.setOnDismissListener(d -> {
            InputMethodManager imm = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
            if (imm != null && activity.getCurrentFocus() != null) {
                imm.hideSoftInputFromWindow(activity.getCurrentFocus().getWindowToken(), 0);
            }
        });

        refreshUi.run();
        dialog.setContentView(root);
        dialog.show();

        // Window size - popup-friendly (94% width, 88% height)
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
            int screenHeight = activity.getResources().getDisplayMetrics().heightPixels;
            int dialogWidth = Math.min((int) (screenWidth * 0.94f), (int) (520 * density));
            int dialogHeight = (int) (screenHeight * 0.88f);
            window.setLayout(dialogWidth, dialogHeight);
            window.setGravity(Gravity.CENTER);
        }
    }

    private static void renderEmptySlate(Activity activity, LinearLayout container, float density, Theme theme, Runnable onLoadPresets) {
        container.removeAllViews();
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setGravity(Gravity.CENTER);
        int p = (int) (40 * density);
        box.setPadding(p, p, p, p);

        FrameLayout iconCircle = new FrameLayout(activity);
        int cSize = (int) (64 * density);
        LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(cSize, cSize);
        iconCircle.setLayoutParams(cLp);
        GradientDrawable cBg = new GradientDrawable();
        cBg.setShape(GradientDrawable.OVAL);
        cBg.setColor(theme.surfaceContainer);
        iconCircle.setBackground(cBg);

        ImageView ivEmpty = new ImageView(activity);
        ivEmpty.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_PRESETS, theme.primary));
        int icEmptySize = (int) (32 * density);
        FrameLayout.LayoutParams icEmptyLp = new FrameLayout.LayoutParams(icEmptySize, icEmptySize, Gravity.CENTER);
        ivEmpty.setLayoutParams(icEmptyLp);
        iconCircle.addView(ivEmpty);
        box.addView(iconCircle);

        TextView title = new TextView(activity);
        title.setText("No Flags Configured");
        title.setTextSize(16);
        title.setTextColor(theme.textPrimary);
        title.setTypeface(null, Typeface.BOLD);
        title.setGravity(Gravity.CENTER);
        title.setPadding(0, (int) (14 * density), 0, (int) (4 * density));
        box.addView(title);

        TextView desc = new TextView(activity);
        desc.setText("Google Photos is running in stock mode.\nLoad Morphe presets or tap + to add a custom flag.");
        desc.setTextSize(13);
        desc.setTextColor(theme.textSecondary);
        desc.setGravity(Gravity.CENTER);
        box.addView(desc);

        if (onLoadPresets != null) {
            LinearLayout btnLoadPresets = new LinearLayout(activity);
            btnLoadPresets.setOrientation(LinearLayout.HORIZONTAL);
            btnLoadPresets.setGravity(Gravity.CENTER);
            btnLoadPresets.setClickable(true);
            btnLoadPresets.setFocusable(true);
            int bPadH = (int) (20 * density);
            int bPadV = (int) (10 * density);
            btnLoadPresets.setPadding(bPadH, bPadV, bPadH, bPadV);
            btnLoadPresets.setBackground(createActionPillDrawable(theme.primary, 18 * density));
            LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            bLp.topMargin = (int) (16 * density);
            btnLoadPresets.setLayoutParams(bLp);

            ImageView ivPreset = new ImageView(activity);
            ivPreset.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_PRESETS, theme.onPrimary));
            int icSize = (int) (16 * density);
            LinearLayout.LayoutParams ivLp = new LinearLayout.LayoutParams(icSize, icSize);
            ivLp.setMargins(0, 0, (int) (8 * density), 0);
            ivPreset.setLayoutParams(ivLp);
            btnLoadPresets.addView(ivPreset);

            TextView tvLoad = new TextView(activity);
            tvLoad.setText("Load Recommended Presets");
            tvLoad.setTextSize(13f);
            tvLoad.setTypeface(null, Typeface.BOLD);
            tvLoad.setTextColor(theme.onPrimary);
            btnLoadPresets.addView(tvLoad);

            btnLoadPresets.setOnClickListener(v -> onLoadPresets.run());
            box.addView(btnLoadPresets);
        }

        container.addView(box);
    }

    private static void renderEmptySlate(Activity activity, LinearLayout container, float density, Theme theme) {
        renderEmptySlate(activity, container, density, theme, null);
    }

    private static void renderEmptySlate(Activity activity, LinearLayout container, float density) {
        renderEmptySlate(activity, container, density, Theme.get(activity));
    }

    private static void renderEmptyMessage(Activity activity, LinearLayout container, String msg, float density, Theme theme) {
        container.removeAllViews();
        TextView tv = new TextView(activity);
        tv.setText(msg);
        tv.setTextSize(13);
        tv.setTextColor(theme.textSecondary);
        tv.setGravity(Gravity.CENTER);
        int p = (int) (32 * density);
        tv.setPadding(p, p, p, p);
        container.addView(tv);
    }

    private static void renderEmptyMessage(Activity activity, LinearLayout container, String msg, float density) {
        renderEmptyMessage(activity, container, msg, density, Theme.get(activity));
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Options Menu
    // ─────────────────────────────────────────────────────────────────────────

    private static void showProperOptionsMenu(Activity activity, SharedPreferences prefs, FlagAdapter adapter, Runnable onRefresh) {
        float density = activity.getResources().getDisplayMetrics().density;
        Theme theme = Theme.get(activity);
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding((int) (16 * density), (int) (4 * density), (int) (16 * density), (int) (16 * density));

        class MenuItem {
            final int iconType;
            final String title;
            final String subtitle;
            final Runnable action;
            MenuItem(int iconType, String title, String subtitle, Runnable action) {
                this.iconType = iconType;
                this.title = title;
                this.subtitle = subtitle;
                this.action = action;
            }
        }

        List<MenuItem> items = new ArrayList<>();

        // 1. Import from File (SAF)
        items.add(new MenuItem(MaterialVectorDrawable.TYPE_IMPORT, "Import from File", "Load flags from a .json or .txt backup via system file picker", () -> {
            launchSafImport(activity, prefs, onRefresh);
        }));

        // 2. Export to File (SAF)
        items.add(new MenuItem(MaterialVectorDrawable.TYPE_EXPORT, "Export to File", "Save configured flags to storage via system document creator", () -> {
            launchSafExport(activity, prefs);
        }));

        // 3. Load Recommended Presets
        items.add(new MenuItem(MaterialVectorDrawable.TYPE_PRESETS, "Load Recommended Presets", "Apply all " + PhotoFlagsRegistry.CURATED_FLAGS.size() + " Morphe feature flags (story colors, AI tools, Create Tab, Navigation)", () -> {
            LinearLayout msgLayout = new LinearLayout(activity);
            msgLayout.setOrientation(LinearLayout.VERTICAL);
            int mPad = (int) (18 * density);
            msgLayout.setPadding(mPad, (int) (4 * density), mPad, (int) (12 * density));

            TextView tvMsg = new TextView(activity);
            tvMsg.setText("This will activate all " + PhotoFlagsRegistry.CURATED_FLAGS.size() + " curated Morphe feature flags across AI tools, Create Tab, Stories, and Navigation.\n\nExisting values will be kept, and missing overrides will be enabled.");
            tvMsg.setTextSize(13);
            tvMsg.setTextColor(theme.textPrimary);
            tvMsg.setLineSpacing(0, 1.25f);
            msgLayout.addView(tvMsg);

            createM3ActionDialog(activity, "Load Recommended Presets", msgLayout, "Apply presets", () -> {
                PhotoFlagsRegistry.applyCuratedDefaults(prefs);
                prefs.edit().putBoolean("_presets_loaded", true).apply();
                GooglePhotosAccountAvatar.syncOneGoogleFlags(activity);
                onRefresh.run();
                Toast.makeText(activity, "Loaded " + PhotoFlagsRegistry.CURATED_FLAGS.size() + " Morphe presets! Restart to take effect.", Toast.LENGTH_LONG).show();
            }).show();
        }));

        // 4. Bulk Paste Text
        items.add(new MenuItem(MaterialVectorDrawable.TYPE_PASTE, "Bulk Paste Text", "Paste key=value lines, JSON, or XML directly", () -> {
            showBulkPasteDialog(activity, prefs, onRefresh);
        }));

        // 5. Copy All to Clipboard
        items.add(new MenuItem(MaterialVectorDrawable.TYPE_CLIPBOARD, "Copy All to Clipboard", "Copy all configured flags to clipboard as JSON", () -> {
            Map<String, ?> all = prefs.getAll();
            JSONObject json = new JSONObject();
            try {
                for (Map.Entry<String, ?> e : all.entrySet()) {
                    if (!e.getKey().startsWith("_")) {
                        json.put(e.getKey(), e.getValue());
                    }
                }
                ClipboardManager cm = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
                if (cm != null) {
                    cm.setPrimaryClip(ClipData.newPlainText("Flags JSON", json.toString(2)));
                    Toast.makeText(activity, "Copied " + json.length() + " flags to clipboard", Toast.LENGTH_SHORT).show();
                }
            } catch (Exception e) {
                Toast.makeText(activity, "Export failed: " + e.getMessage(), Toast.LENGTH_SHORT).show();
            }
        }));

        // 6. Share Flags Backup
        items.add(new MenuItem(MaterialVectorDrawable.TYPE_EXPORT, "Share Flags Backup", "Share active flags JSON via messaging, cloud, or notes", () -> {
            Map<String, ?> all = prefs.getAll();
            JSONObject json = new JSONObject();
            try {
                for (Map.Entry<String, ?> e : all.entrySet()) {
                    if (!e.getKey().startsWith("_")) {
                        json.put(e.getKey(), e.getValue());
                    }
                }
                Intent sendIntent = new Intent();
                sendIntent.setAction(Intent.ACTION_SEND);
                sendIntent.putExtra(Intent.EXTRA_TEXT, json.toString(2));
                sendIntent.setType("text/plain");
                Intent shareIntent = Intent.createChooser(sendIntent, "Share Flags Backup");
                activity.startActivity(shareIntent);
            } catch (Exception e) {
                Toast.makeText(activity, "Share failed: " + e.getMessage(), Toast.LENGTH_SHORT).show();
            }
        }));

        // 7. Reset All Flags
        items.add(new MenuItem(MaterialVectorDrawable.TYPE_DELETE, "Reset All Flags", "Remove all flags from list and restore stock photos mode", () -> {
            LinearLayout msgLayout = new LinearLayout(activity);
            msgLayout.setOrientation(LinearLayout.VERTICAL);
            int mPad = (int) (18 * density);
            msgLayout.setPadding(mPad, (int) (4 * density), mPad, (int) (12 * density));

            TextView tvMsg = new TextView(activity);
            tvMsg.setText("Are you sure you want to remove all flags from the list?\n\n• All stored overrides will be deleted.\n• Curated flags will be unloaded from the list.\n• Restores clean stock Google Photos behavior.\n• You can reload recommended presets anytime.");
            tvMsg.setTextSize(13);
            tvMsg.setTextColor(theme.textPrimary);
            tvMsg.setLineSpacing(0, 1.25f);
            msgLayout.addView(tvMsg);

            createM3ActionDialog(activity, "Reset All Flags?", msgLayout, "Reset all", () -> {
                prefs.edit().clear().putBoolean("_presets_loaded", false).commit();
                PhenotypeSeedData.restoreOfficialFlags(activity, prefs);
                GooglePhotosAccountAvatar.syncOneGoogleFlags(activity);
                try {
                    File sharedDir = new File(activity.getFilesDir(), "phenotype/shared");
                    if (sharedDir.exists()) {
                        File[] fList = sharedDir.listFiles();
                        if (fList != null) {
                            for (File f : fList) f.delete();
                        }
                    }
                    File phenoDir = new File(activity.getFilesDir(), "phenotype");
                    if (phenoDir.exists()) {
                        File[] pList = phenoDir.listFiles();
                        if (pList != null) {
                            for (File f : pList) {
                                if (f.isFile()) f.delete();
                            }
                        }
                    }
                } catch (Throwable ignored) {}
                adapter.collapseAll();
                onRefresh.run();
                Toast.makeText(activity, "All flags removed from list! Restored stock mode.", Toast.LENGTH_LONG).show();
            }, true).show();
        }));

        Dialog dialog = createM3Dialog(activity, "Flag Options", null);

        for (MenuItem mi : items) {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setClickable(true);
            row.setFocusable(true);
            int padH = (int) (14 * density);
            int padV = (int) (10 * density);
            row.setPadding(padH, padV, padH, padV);
            row.setBackground(createCardDrawable(false, density, theme));
            LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            rLp.bottomMargin = (int) (6 * density);
            row.setLayoutParams(rLp);

            // Icon container: 36dp rounded box with surfaceContainer
            FrameLayout iconBox = new FrameLayout(activity);
            int boxSize = (int) (36 * density);
            LinearLayout.LayoutParams ibLp = new LinearLayout.LayoutParams(boxSize, boxSize);
            iconBox.setLayoutParams(ibLp);
            GradientDrawable ibBg = new GradientDrawable();
            ibBg.setCornerRadius(12 * density);
            ibBg.setColor(theme.surfaceContainer);
            iconBox.setBackground(ibBg);

            ImageView ivIcon = new ImageView(activity);
            int iconColor = mi.iconType == MaterialVectorDrawable.TYPE_DELETE ? (theme.isDark ? 0xFFFFB4AB : 0xFFBA1A1A) : theme.primary;
            ivIcon.setImageDrawable(new MaterialVectorDrawable(mi.iconType, iconColor));
            int ivSize = (int) (22 * density);
            FrameLayout.LayoutParams ivLp = new FrameLayout.LayoutParams(ivSize, ivSize, Gravity.CENTER);
            ivIcon.setLayoutParams(ivLp);
            iconBox.addView(ivIcon);
            row.addView(iconBox);

            // Text column
            LinearLayout textCol = new LinearLayout(activity);
            textCol.setOrientation(LinearLayout.VERTICAL);
            textCol.setPadding((int) (12 * density), 0, 0, 0);
            LinearLayout.LayoutParams tcLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            textCol.setLayoutParams(tcLp);

            TextView tvTitle = new TextView(activity);
            tvTitle.setText(mi.title);
            tvTitle.setTextSize(14.5f);
            tvTitle.setTextColor(mi.iconType == MaterialVectorDrawable.TYPE_DELETE ? (theme.isDark ? 0xFFFFB4AB : 0xFFBA1A1A) : theme.textPrimary);
            tvTitle.setTypeface(null, Typeface.BOLD);
            textCol.addView(tvTitle);

            TextView tvSub = new TextView(activity);
            tvSub.setText(mi.subtitle);
            tvSub.setTextSize(11.5f);
            tvSub.setTextColor(theme.textSecondary);
            textCol.addView(tvSub);

            row.addView(textCol);
            row.setOnClickListener(v -> {
                dialog.dismiss();
                mi.action.run();
            });
            list.addView(row);
        }

        ScrollView scroll = new ScrollView(activity);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.addView(list);

        LinearLayout contentRoot = (LinearLayout) ((ViewGroup) dialog.findViewById(android.R.id.content)).getChildAt(0);
        contentRoot.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (activity.getResources().getDisplayMetrics().heightPixels * 0.65f)));
        dialog.show();
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Loading / Progress Dialog
    // ─────────────────────────────────────────────────────────────────────────

    public static Dialog showLoadingDialog(Activity activity, String title, String message) {
        float density = activity.getResources().getDisplayMetrics().density;
        Theme theme = Theme.get(activity);
        Dialog d = new Dialog(activity);
        d.requestWindowFeature(Window.FEATURE_NO_TITLE);
        d.setCancelable(false);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.HORIZONTAL);
        root.setGravity(Gravity.CENTER_VERTICAL);
        int p = (int) (20 * density);
        root.setPadding(p, p, p, p);
        root.setBackground(createRoundedDrawable(theme.surface, 20 * density));

        ProgressBar pb = new ProgressBar(activity);
        LinearLayout.LayoutParams pbLp = new LinearLayout.LayoutParams((int) (40 * density), (int) (40 * density));
        pbLp.setMargins(0, 0, (int) (16 * density), 0);
        pb.setLayoutParams(pbLp);
        root.addView(pb);

        LinearLayout textCol = new LinearLayout(activity);
        textCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        textCol.setLayoutParams(cLp);

        TextView tvT = new TextView(activity);
        tvT.setText(title);
        tvT.setTextSize(16);
        tvT.setTextColor(theme.textPrimary);
        tvT.setTypeface(null, Typeface.BOLD);
        textCol.addView(tvT);

        TextView tvM = new TextView(activity);
        tvM.setText(message);
        tvM.setTextSize(12);
        tvM.setTextColor(theme.textSecondary);
        tvM.setPadding(0, (int) (2 * density), 0, 0);
        textCol.addView(tvM);

        root.addView(textCol);

        d.setContentView(root);
        Window w = d.getWindow();
        if (w != null) {
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
            w.setLayout(Math.min((int) (screenWidth * 0.88f), (int) (420 * density)), ViewGroup.LayoutParams.WRAP_CONTENT);
            w.setGravity(Gravity.CENTER);
        }
        d.show();
        return d;
    }

    // ─────────────────────────────────────────────────────────────────────────
    // SAF (Storage Access Framework) File Operations
    // ─────────────────────────────────────────────────────────────────────────

    public static class SafHelperFragment extends android.app.Fragment {
        private static final int REQ_OPEN_DOCUMENT = 8011;
        private static final int REQ_CREATE_DOCUMENT = 8012;

        public interface FileCallback {
            void onFileSelected(Uri uri);
        }

        private FileCallback openCallback;
        private FileCallback createCallback;

        public void setOpenCallback(FileCallback cb) { this.openCallback = cb; }
        public void setCreateCallback(FileCallback cb) { this.createCallback = cb; }

        public void openDocument(String[] mimeTypes) {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("*/*");
            if (mimeTypes != null && mimeTypes.length > 0) {
                intent.putExtra(Intent.EXTRA_MIME_TYPES, mimeTypes);
            }
            startActivityForResult(intent, REQ_OPEN_DOCUMENT);
        }

        public void createDocument(String fileName, String mimeType) {
            Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType(mimeType);
            intent.putExtra(Intent.EXTRA_TITLE, fileName);
            startActivityForResult(intent, REQ_CREATE_DOCUMENT);
        }

        @Override
        public void onActivityResult(int requestCode, int resultCode, Intent data) {
            super.onActivityResult(requestCode, resultCode, data);
            if (resultCode == Activity.RESULT_OK && data != null && data.getData() != null) {
                Uri uri = data.getData();
                if (requestCode == REQ_OPEN_DOCUMENT && openCallback != null) {
                    openCallback.onFileSelected(uri);
                } else if (requestCode == REQ_CREATE_DOCUMENT && createCallback != null) {
                    createCallback.onFileSelected(uri);
                }
            }
            if (getFragmentManager() != null) {
                getFragmentManager().beginTransaction().remove(this).commitAllowingStateLoss();
            }
        }
    }

    private static void launchSafImport(Activity activity, SharedPreferences prefs, Runnable onRefresh) {
        try {
            SafHelperFragment fragment = new SafHelperFragment();
            fragment.setOpenCallback(uri -> {
                if (uri == null) return;
                Dialog loading = showLoadingDialog(activity, "Importing Flags...", "Reading file and saving overrides...");
                IO_EXECUTOR.execute(() -> {
                    int count = 0;
                    try {
                        InputStream is = activity.getContentResolver().openInputStream(uri);
                        if (is != null) {
                            BufferedReader reader = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
                            count = importFlagsStream(activity, prefs, reader);
                            reader.close();
                            is.close();
                        }
                    } catch (Throwable t) {
                        Logger.printException(() -> "Error importing file from SAF", t);
                    }
                    final int finalCount = count;
                    activity.runOnUiThread(() -> {
                        loading.dismiss();
                        Toast.makeText(activity, "✓ Imported " + finalCount + " flags from file!", Toast.LENGTH_SHORT).show();
                        if (onRefresh != null) onRefresh.run();
                    });
                });
            });
            activity.getFragmentManager().beginTransaction().add(fragment, "saf_import").commitAllowingStateLoss();
            activity.getFragmentManager().executePendingTransactions();
            fragment.openDocument(new String[]{"text/plain", "application/json", "text/xml", "*/*"});
        } catch (Throwable t) {
            Logger.printException(() -> "Error launching SAF file picker", t);
            Toast.makeText(activity, "Could not open file picker", Toast.LENGTH_SHORT).show();
        }
    }

    private static void launchSafExport(Activity activity, SharedPreferences prefs) {
        try {
            SafHelperFragment fragment = new SafHelperFragment();
            fragment.setCreateCallback(uri -> {
                if (uri == null) return;
                IO_EXECUTOR.execute(() -> {
                    boolean success = false;
                    try {
                        OutputStream os = activity.getContentResolver().openOutputStream(uri);
                        if (os != null) {
                            String jsonStr = generateExportJson(prefs);
                            os.write(jsonStr.getBytes(StandardCharsets.UTF_8));
                            os.flush();
                            os.close();
                            success = true;
                        }
                    } catch (Throwable t) {
                        Logger.printException(() -> "Error exporting file to SAF", t);
                    }
                    final boolean finalSuccess = success;
                    activity.runOnUiThread(() -> {
                        if (finalSuccess) {
                            Toast.makeText(activity, "✓ Exported flags to file!", Toast.LENGTH_SHORT).show();
                        } else {
                            Toast.makeText(activity, "Failed to save file", Toast.LENGTH_SHORT).show();
                        }
                    });
                });
            });
            activity.getFragmentManager().beginTransaction().add(fragment, "saf_export").commitAllowingStateLoss();
            activity.getFragmentManager().executePendingTransactions();
            fragment.createDocument("morphe_photos_flags.json", "application/json");
        } catch (Throwable t) {
            Logger.printException(() -> "Error launching SAF file save", t);
            Toast.makeText(activity, "Could not open file saver", Toast.LENGTH_SHORT).show();
        }
    }

    private static void copyAllToClipboard(Activity activity, SharedPreferences prefs) {
        String jsonStr = generateExportJson(prefs);
        ClipboardManager cm = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
        if (cm != null) {
            cm.setPrimaryClip(ClipData.newPlainText("Photos Flags", jsonStr));
            Toast.makeText(activity, "✓ Copied flags to clipboard!", Toast.LENGTH_SHORT).show();
        }
    }

    private static String generateExportJson(SharedPreferences prefs) {
        JSONObject json = new JSONObject();
        try {
            Map<String, ?> all = prefs.getAll();
            for (Map.Entry<String, ?> entry : all.entrySet()) {
                String k = entry.getKey();
                if (!k.startsWith("_") && !k.startsWith("__")) {
                    json.put(k, entry.getValue());
                }
            }
        } catch (Exception ignored) {}
        return json.toString();
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Bulk Paste Dialog
    // ─────────────────────────────────────────────────────────────────────────

    private static void showBulkPasteDialog(Activity activity, SharedPreferences prefs, Runnable onRefresh) {
        float density = activity.getResources().getDisplayMetrics().density;
        Theme theme = Theme.get(activity);
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int p = (int) (18 * density);
        layout.setPadding(p, 0, p, (int) (8 * density));

        TextView tvHelp = new TextView(activity);
        tvHelp.setText("Paste Key=Value lines, JSON preset, or Phenotype XML:");
        tvHelp.setTextSize(12);
        tvHelp.setTextColor(theme.textSecondary);
        tvHelp.setPadding(0, 0, 0, (int) (6 * density));
        layout.addView(tvHelp);

        LinearLayout actionRow = new LinearLayout(activity);
        actionRow.setOrientation(LinearLayout.HORIZONTAL);
        actionRow.setGravity(Gravity.CENTER_VERTICAL);
        actionRow.setPadding(0, 0, 0, (int) (8 * density));

        LinearLayout btnPasteClipboard = new LinearLayout(activity);
        btnPasteClipboard.setOrientation(LinearLayout.HORIZONTAL);
        btnPasteClipboard.setGravity(Gravity.CENTER);
        btnPasteClipboard.setClickable(true);
        btnPasteClipboard.setFocusable(true);
        btnPasteClipboard.setBackground(createActionPillDrawable(theme.primaryContainer, 14 * density));
        int bPadH = (int) (12 * density);
        int bPadV = (int) (7 * density);
        btnPasteClipboard.setPadding(bPadH, bPadV, bPadH, bPadV);
        LinearLayout.LayoutParams btnLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        btnPasteClipboard.setLayoutParams(btnLp);

        int ivPasteColor = theme.isDark ? theme.onPrimaryContainer : theme.primary;
        ImageView ivPaste = new ImageView(activity);
        ivPaste.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_PASTE, ivPasteColor));
        int icPasteSize = (int) (14 * density);
        LinearLayout.LayoutParams ivPasteLp = new LinearLayout.LayoutParams(icPasteSize, icPasteSize);
        ivPasteLp.setMargins(0, 0, (int) (6 * density), 0);
        ivPaste.setLayoutParams(ivPasteLp);
        btnPasteClipboard.addView(ivPaste);

        TextView tvPaste = new TextView(activity);
        tvPaste.setText("Paste from clipboard");
        tvPaste.setTextSize(12);
        tvPaste.setTypeface(null, Typeface.BOLD);
        tvPaste.setTextColor(ivPasteColor);
        btnPasteClipboard.addView(tvPaste);
        actionRow.addView(btnPasteClipboard);

        TextView tvCountPreview = new TextView(activity);
        tvCountPreview.setText("0 flags detected");
        tvCountPreview.setTextSize(12);
        tvCountPreview.setTextColor(theme.textSecondary);
        tvCountPreview.setGravity(Gravity.END);
        LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        tvCountPreview.setLayoutParams(cLp);
        actionRow.addView(tvCountPreview);
        layout.addView(actionRow);

        EditText etInput = new EditText(activity);
        etInput.setHint("Paste flags here...\ne.g.\n45705305=true\n45762698=2\n45531621=true");
        etInput.setTextSize(13);
        etInput.setTextColor(theme.textPrimary);
        etInput.setHintTextColor(theme.textSecondary);
        etInput.setBackground(createRoundedDrawable(theme.searchInputBg, 12 * density));
        int pad = (int) (12 * density);
        etInput.setPadding(pad, pad, pad, pad);
        etInput.setMinLines(6);
        etInput.setMaxLines(12);
        etInput.setGravity(Gravity.TOP);
        layout.addView(etInput);

        Runnable[] countRunnable = new Runnable[1];
        etInput.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                if (countRunnable[0] != null) {
                    MAIN_HANDLER.removeCallbacks(countRunnable[0]);
                }
                String text = s.toString();
                countRunnable[0] = () -> {
                    IO_EXECUTOR.execute(() -> {
                        int detected = countFlagsInText(text);
                        activity.runOnUiThread(() -> tvCountPreview.setText(detected + " flags detected"));
                    });
                };
                MAIN_HANDLER.postDelayed(countRunnable[0], 250);
            }
            @Override public void afterTextChanged(Editable s) {}
        });

        btnPasteClipboard.setOnClickListener(v -> {
            ClipboardManager cm = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null && cm.hasPrimaryClip() && cm.getPrimaryClip().getItemCount() > 0) {
                CharSequence text = cm.getPrimaryClip().getItemAt(0).getText();
                if (text != null) {
                    etInput.setText(text);
                    Toast.makeText(activity, "Pasted from clipboard", Toast.LENGTH_SHORT).show();
                }
            } else {
                Toast.makeText(activity, "Clipboard is empty", Toast.LENGTH_SHORT).show();
            }
        });

        Dialog dialog = createM3ActionDialog(activity, "Bulk Paste Flags", layout, "Import all", () -> {
            String text = etInput.getText().toString().trim();
            if (!text.isEmpty()) {
                Dialog loading = showLoadingDialog(activity, "Importing Flags...", "Parsing flags and saving overrides...");
                IO_EXECUTOR.execute(() -> {
                    BufferedReader reader = new BufferedReader(new StringReader(text));
                    int count = importFlagsStream(activity, prefs, reader);
                    activity.runOnUiThread(() -> {
                        loading.dismiss();
                        Toast.makeText(activity, "✓ Imported " + count + " flags!", Toast.LENGTH_SHORT).show();
                        if (onRefresh != null) onRefresh.run();
                    });
                });
            }
        });
        dialog.show();
    }

    private static int countFlagsInText(String content) {
        if (content == null || content.isEmpty()) return 0;
        try {
            String trimmed = content.trim();
            if (trimmed.startsWith("{")) {
                JSONObject json = new JSONObject(content);
                int c = 0;
                Iterator<String> it = json.keys();
                while (it.hasNext()) {
                    if (!it.next().startsWith("_")) c++;
                }
                return c;
            }
        } catch (Exception ignored) {}

        int count = 0;
        String[] lines = content.split("\\n");
        for (String line : lines) {
            String l = line.trim();
            if (l.isEmpty() || l.startsWith("#") || l.startsWith("//") || l.startsWith(";") || l.startsWith("<!--")) {
                continue;
            }
            int eqIdx = l.indexOf('=');
            if (eqIdx > 0) {
                String k = l.substring(0, eqIdx).trim();
                if (!k.startsWith("#") && !k.startsWith("//") && !k.startsWith(";")) {
                    count++;
                }
            } else if (l.contains("<flag") || l.contains("<boolean") || l.contains("<long") || l.contains("<string")) {
                count++;
            }
        }
        return count;
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Fast Streaming Import & Parsing Engine
    // ─────────────────────────────────────────────────────────────────────────

    private static int importFlagsStream(Activity activity, SharedPreferences prefs, BufferedReader reader) {
        int count = 0;
        SharedPreferences.Editor editor = prefs.edit();
        Set<String> customKeys = new HashSet<>(prefs.getStringSet(CUSTOM_FLAGS_KEY, Collections.emptySet()));

        try {
            List<String> allLines = new ArrayList<>();
            String line;
            while ((line = reader.readLine()) != null) {
                allLines.add(line);
            }

            // Find first non-empty, non-comment line to detect format
            String firstContentLine = "";
            for (String l : allLines) {
                String t = l.trim();
                if (!t.isEmpty() && !t.startsWith("#") && !t.startsWith("//") && !t.startsWith(";") && !t.startsWith("<!--")) {
                    firstContentLine = t;
                    break;
                }
            }

            if (firstContentLine.startsWith("{")) {
                StringBuilder sb = new StringBuilder();
                for (String l : allLines) sb.append(l).append('\n');
                JSONObject json = new JSONObject(sb.toString());
                Iterator<String> keys = json.keys();
                while (keys.hasNext()) {
                    String k = keys.next();
                    if (k.startsWith("_")) continue;
                    Object v = json.get(k);
                    editor.remove(k);
                    applyEntry(editor, k, v);
                    if (!PhotoFlagsRegistry.FLAG_MAP.containsKey(k)) {
                        customKeys.add(k);
                    }
                    count++;
                }
            } else if (firstContentLine.contains("<flag") || firstContentLine.startsWith("<?xml") || firstContentLine.startsWith("<map") || firstContentLine.startsWith("<package")) {
                StringBuilder sb = new StringBuilder();
                for (String l : allLines) sb.append(l).append('\n');
                Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                        .parse(new InputSource(new StringReader(sb.toString())));

                NodeList flags = doc.getElementsByTagName("flag");
                for (int i = 0; i < flags.getLength(); i++) {
                    Element el = (Element) flags.item(i);
                    String name = el.getAttribute("name");
                    String type = el.getAttribute("type");
                    String value = el.getAttribute("value");
                    if (name.isEmpty() || name.startsWith("_")) continue;

                    editor.remove(name);
                    if ("boolean".equalsIgnoreCase(type)) {
                        editor.putBoolean(name, Boolean.parseBoolean(value));
                    } else if ("float".equalsIgnoreCase(type) || "double".equalsIgnoreCase(type)) {
                        try { editor.putFloat(name, Float.parseFloat(value)); }
                        catch (Exception ex) { editor.putString(name, value); }
                    } else if ("long".equalsIgnoreCase(type) || "int".equalsIgnoreCase(type) || "integer".equalsIgnoreCase(type)) {
                        try { editor.putLong(name, Long.parseLong(value)); }
                        catch (Exception ex) { editor.putLong(name, 1L); }
                    } else {
                        editor.putString(name, value);
                    }
                    if (!PhotoFlagsRegistry.FLAG_MAP.containsKey(name)) {
                        customKeys.add(name);
                    }
                    count++;
                }

                NodeList booleans = doc.getElementsByTagName("boolean");
                for (int i = 0; i < booleans.getLength(); i++) {
                    Element el = (Element) booleans.item(i);
                    String name = el.getAttribute("name");
                    if (!name.isEmpty() && !name.startsWith("_")) {
                        editor.remove(name);
                        editor.putBoolean(name, Boolean.parseBoolean(el.getAttribute("value")));
                        if (!PhotoFlagsRegistry.FLAG_MAP.containsKey(name)) {
                            customKeys.add(name);
                        }
                        count++;
                    }
                }
                NodeList longs = doc.getElementsByTagName("long");
                for (int i = 0; i < longs.getLength(); i++) {
                    Element el = (Element) longs.item(i);
                    String name = el.getAttribute("name");
                    if (!name.isEmpty() && !name.startsWith("_")) {
                        editor.remove(name);
                        try { editor.putLong(name, Long.parseLong(el.getAttribute("value"))); }
                        catch (Exception ignored) {}
                        if (!PhotoFlagsRegistry.FLAG_MAP.containsKey(name)) {
                            customKeys.add(name);
                        }
                        count++;
                    }
                }
                NodeList strings = doc.getElementsByTagName("string");
                for (int i = 0; i < strings.getLength(); i++) {
                    Element el = (Element) strings.item(i);
                    String name = el.getAttribute("name");
                    if (!name.isEmpty() && !name.startsWith("_")) {
                        editor.remove(name);
                        editor.putString(name, el.getTextContent());
                        if (!PhotoFlagsRegistry.FLAG_MAP.containsKey(name)) {
                            customKeys.add(name);
                        }
                        count++;
                    }
                }
            } else {
                for (String l : allLines) {
                    if (parseAndApplyKeyValueLine(l, editor, customKeys)) {
                        count++;
                    }
                }
            }

            editor.putStringSet(CUSTOM_FLAGS_KEY, customKeys).apply();
            GooglePhotosAccountAvatar.syncOneGoogleFlags(activity);
        } catch (Exception e) {
            Logger.printException(() -> "Streaming import failed", e);
        }
        return count;
    }

    private static String stripQuotes(String s) {
        if (s == null) return "";
        s = s.trim();
        if (s.length() >= 2) {
            char f = s.charAt(0);
            char l = s.charAt(s.length() - 1);
            if ((f == '"' && l == '"') || (f == 39 && l == 39)) {
                return s.substring(1, s.length() - 1).trim();
            }
        }
        return s;
    }

    private static boolean parseAndApplyKeyValueLine(String line, SharedPreferences.Editor editor, Set<String> customKeys) {
        if (line == null) return false;
        line = line.trim();
        if (line.isEmpty() || line.startsWith("#") || line.startsWith("//") || line.startsWith(";") || line.startsWith("<!--")) {
            return false;
        }

        int eqIdx = line.indexOf('=');
        if (eqIdx <= 0) return false;

        String k = line.substring(0, eqIdx).trim();
        if (k.isEmpty() || k.startsWith("#") || k.startsWith("//") || k.startsWith(";")) {
            return false;
        }

        String v = line.substring(eqIdx + 1).trim();

        // Strip inline comments (#, //, ;)
        int commentHash = v.indexOf('#');
        if (commentHash != -1) v = v.substring(0, commentHash).trim();

        int commentSlash = v.indexOf("//");
        if (commentSlash != -1) v = v.substring(0, commentSlash).trim();

        int commentSemi = v.indexOf(';');
        if (commentSemi != -1) v = v.substring(0, commentSemi).trim();

        // Strip surrounding quotes ("value" or 'value')
        v = stripQuotes(v);

        if (v.isEmpty()) return false;

        // Clean out any existing dirty type entry in SharedPreferences before putting correct type
        editor.remove(k);

        if (v.equalsIgnoreCase("true")) {
            editor.putBoolean(k, true);
        } else if (v.equalsIgnoreCase("false")) {
            editor.putBoolean(k, false);
        } else if (v.matches("^-?\\d+$")) {
            try {
                editor.putLong(k, Long.parseLong(v));
            } catch (Exception ex) {
                editor.putString(k, v);
            }
        } else if (v.matches("^-?\\d*\\.\\d+$")) {
            try {
                editor.putFloat(k, Float.parseFloat(v));
            } catch (Exception ex) {
                editor.putString(k, v);
            }
        } else {
            editor.putString(k, v);
        }

        if (!PhotoFlagsRegistry.FLAG_MAP.containsKey(k)) {
            customKeys.add(k);
        }
        return true;
    }

    private static void applyEntry(SharedPreferences.Editor editor, String key, Object val) {
        if (val instanceof Boolean) {
            editor.putBoolean(key, (Boolean) val);
        } else if (val instanceof Float || val instanceof Double) {
            editor.putFloat(key, ((Number) val).floatValue());
        } else if (val instanceof Number) {
            editor.putLong(key, ((Number) val).longValue());
        } else {
            editor.putString(key, String.valueOf(val));
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Single-Flag Addition & Value Edit Dialogs
    // ─────────────────────────────────────────────────────────────────────────

    private static void showAddCustomFlagDialog(Activity activity, SharedPreferences prefs, Runnable onRefresh) {
        float density = activity.getResources().getDisplayMetrics().density;
        Theme theme = Theme.get(activity);
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int p = (int) (18 * density);
        layout.setPadding(p, 0, p, (int) (8 * density));

        TextView tvTypeLabel = new TextView(activity);
        tvTypeLabel.setText("Flag Data Type:");
        tvTypeLabel.setTextSize(12);
        tvTypeLabel.setTextColor(theme.textSecondary);
        tvTypeLabel.setPadding(0, 0, 0, (int) (6 * density));
        layout.addView(tvTypeLabel);

        LinearLayout typeRow = new LinearLayout(activity);
        typeRow.setOrientation(LinearLayout.HORIZONTAL);
        typeRow.setGravity(Gravity.CENTER_VERTICAL);
        typeRow.setPadding(0, 0, 0, (int) (10 * density));

        int[] selectedType = new int[]{0}; // 0=Boolean, 1=Long, 2=Float, 3=String
        TextView[] typeButtons = new TextView[4];
        String[] typeNames = new String[]{"Boolean", "Long", "Float", "String"};

        EditText etKey = new EditText(activity);
        etKey.setHint("Flag ID (e.g. 45705305)");
        etKey.setTextSize(14);
        etKey.setTextColor(theme.textPrimary);
        etKey.setHintTextColor(theme.textSecondary);
        etKey.setBackground(createRoundedDrawable(theme.searchInputBg, 10 * density));
        int pad = (int) (10 * density);
        etKey.setPadding(pad, pad, pad, pad);

        EditText etVal = new EditText(activity);
        etVal.setText("true");
        etVal.setHint("Value (true / false)");
        etVal.setTextSize(14);
        etVal.setTextColor(theme.textPrimary);
        etVal.setHintTextColor(theme.textSecondary);
        etVal.setBackground(createRoundedDrawable(theme.searchInputBg, 10 * density));
        etVal.setPadding(pad, pad, pad, pad);
        LinearLayout.LayoutParams vLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        vLp.setMargins(0, (int) (8 * density), 0, 0);
        etVal.setLayoutParams(vLp);

        Runnable updateTypeButtons = () -> {
            for (int i = 0; i < 4; i++) {
                boolean isSel = (selectedType[0] == i);
                typeButtons[i].setBackground(createActionPillDrawable(isSel ? theme.primary : theme.searchInputBg, 8 * density));
                typeButtons[i].setTextColor(isSel ? theme.onPrimary : theme.textPrimary);
            }
            if (selectedType[0] == 0) {
                etVal.setHint("true or false");
                if (etVal.getText().toString().isEmpty() || etVal.getText().toString().equals("0")) etVal.setText("true");
            } else if (selectedType[0] == 1) {
                etVal.setHint("Integer value (e.g. 2, 3)");
                if (etVal.getText().toString().equals("true") || etVal.getText().toString().equals("false")) etVal.setText("1");
            } else if (selectedType[0] == 2) {
                etVal.setHint("Decimal value (e.g. 1.5, 2.0)");
                if (etVal.getText().toString().equals("true") || etVal.getText().toString().equals("false")) etVal.setText("1.0");
            } else {
                etVal.setHint("String value");
            }
        };

        for (int i = 0; i < 4; i++) {
            final int tIdx = i;
            TextView b = new TextView(activity);
            b.setText(typeNames[i]);
            b.setTextSize(11.5f);
            b.setTypeface(null, Typeface.BOLD);
            b.setGravity(Gravity.CENTER);
            b.setClickable(true);
            b.setFocusable(true);
            int tPadH = (int) (6 * density);
            int tPadV = (int) (7 * density);
            b.setPadding(tPadH, tPadV, tPadH, tPadV);
            LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            if (i > 0) bLp.setMargins((int) (4 * density), 0, 0, 0);
            b.setLayoutParams(bLp);
            b.setOnClickListener(v -> {
                selectedType[0] = tIdx;
                updateTypeButtons.run();
            });
            typeButtons[i] = b;
            typeRow.addView(b);
        }
        updateTypeButtons.run();

        layout.addView(typeRow);
        layout.addView(etKey);
        layout.addView(etVal);

        Dialog dialog = createM3ActionDialog(activity, "Add Custom Flag", layout, "Save", () -> {
            String k = etKey.getText().toString().trim();
            String v = etVal.getText().toString().trim();
            if (!k.isEmpty() && !v.isEmpty()) {
                SharedPreferences.Editor ed = prefs.edit();
                if (selectedType[0] == 0) {
                    ed.putBoolean(k, Boolean.parseBoolean(v));
                } else if (selectedType[0] == 1) {
                    try {
                        ed.putLong(k, Long.parseLong(v));
                    } catch (Exception ex) {
                        ed.putString(k, v);
                    }
                } else if (selectedType[0] == 2) {
                    try {
                        ed.putFloat(k, Float.parseFloat(v));
                    } catch (Exception ex) {
                        ed.putString(k, v);
                    }
                } else {
                    ed.putString(k, v);
                }
                if (!PhotoFlagsRegistry.FLAG_MAP.containsKey(k)) {
                    Set<String> custom = new HashSet<>(prefs.getStringSet(CUSTOM_FLAGS_KEY, Collections.emptySet()));
                    custom.add(k);
                    ed.putStringSet(CUSTOM_FLAGS_KEY, custom);
                }
                ed.apply();
                if ("45531621".equals(k) || "45531625".equals(k)) {
                    GooglePhotosAccountAvatar.syncOneGoogleFlags(activity);
                }
                Toast.makeText(activity, "✓ Saved custom flag (" + typeNames[selectedType[0]] + ")", Toast.LENGTH_SHORT).show();
                onRefresh.run();
            }
        });
        dialog.show();
    }

    private static void showEditValueDialog(Activity activity, SharedPreferences prefs,
                                            String key, String title, Object currentVal,
                                            Runnable onRefresh) {
        float density = activity.getResources().getDisplayMetrics().density;
        Theme theme = Theme.get(activity);
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int p = (int) (18 * density);
        layout.setPadding(p, 0, p, (int) (8 * density));

        String typeDesc = (currentVal instanceof Boolean) ? "Boolean"
                : (currentVal instanceof Float || currentVal instanceof Double) ? "Float (Decimal)"
                : (currentVal instanceof Number) ? "Long (Integer)" : "String";

        TextView tvDesc = new TextView(activity);
        tvDesc.setText("Editing " + typeDesc + " for:\n" + title);
        tvDesc.setTextSize(13);
        tvDesc.setTextColor(theme.textSecondary);
        tvDesc.setPadding(0, 0, 0, (int) (8 * density));
        layout.addView(tvDesc);

        EditText etVal = new EditText(activity);
        etVal.setText(String.valueOf(currentVal));
        etVal.setTextSize(14);
        etVal.setTextColor(theme.textPrimary);
        etVal.setHintTextColor(theme.textSecondary);
        etVal.setBackground(createRoundedDrawable(theme.searchInputBg, 10 * density));
        int pad = (int) (10 * density);
        etVal.setPadding(pad, pad, pad, pad);
        layout.addView(etVal);

        Dialog dialog = createM3ActionDialog(activity, "Edit Flag Value", layout, "Save", () -> {
            String v = etVal.getText().toString().trim();
            if (!v.isEmpty()) {
                SharedPreferences.Editor ed = prefs.edit();
                if (currentVal instanceof Boolean) {
                    ed.putBoolean(key, Boolean.parseBoolean(v));
                } else if (currentVal instanceof Float || currentVal instanceof Double) {
                    try {
                        ed.putFloat(key, Float.parseFloat(v));
                    } catch (Exception ex) {
                        ed.putString(key, v);
                    }
                } else if (currentVal instanceof Number) {
                    try {
                        ed.putLong(key, Long.parseLong(v));
                    } catch (Exception ex) {
                        try {
                            ed.putFloat(key, Float.parseFloat(v));
                        } catch (Exception ex2) {
                            ed.putString(key, v);
                        }
                    }
                } else {
                    ed.putString(key, v);
                }
                ed.apply();
                if ("45531621".equals(key) || "45531625".equals(key)) {
                    GooglePhotosAccountAvatar.syncOneGoogleFlags(activity);
                }
                Toast.makeText(activity, "Updated " + title, Toast.LENGTH_SHORT).show();
                onRefresh.run();
            }
        });
        dialog.show();
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Helpers & UI Components
    // ─────────────────────────────────────────────────────────────────────────

    private static View createHeaderIconButton(Activity activity, Drawable iconDrawable, int touchSizePx, int iconSizePx) {
        FrameLayout box = new FrameLayout(activity);
        box.setClickable(true);
        box.setFocusable(true);
        box.setLayoutParams(new LinearLayout.LayoutParams(touchSizePx, touchSizePx));

        ImageView iv = new ImageView(activity);
        iv.setImageDrawable(iconDrawable);
        FrameLayout.LayoutParams ivLp = new FrameLayout.LayoutParams(iconSizePx, iconSizePx, Gravity.CENTER);
        iv.setLayoutParams(ivLp);
        box.addView(iv);
        return box;
    }

    private static View createHeaderIconButton(Activity activity, Drawable iconDrawable, int touchSizePx) {
        return createHeaderIconButton(activity, iconDrawable, touchSizePx, (int) (touchSizePx * 0.55f));
    }

    private static Drawable createActionPillDrawable(int bgColor, float radiusPx) {
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(radiusPx);
        shape.setColor(bgColor);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            GradientDrawable mask = new GradientDrawable();
            mask.setCornerRadius(radiusPx);
            mask.setColor(Color.WHITE);
            ColorStateList rippleColor = ColorStateList.valueOf(0x22888888);
            return new RippleDrawable(rippleColor, shape, mask);
        }
        return shape;
    }

    private static LinearLayout createQuickActionPill(Activity activity, int iconType, String text, float density, Theme theme) {
        LinearLayout pill = new LinearLayout(activity);
        pill.setOrientation(LinearLayout.HORIZONTAL);
        pill.setGravity(Gravity.CENTER);
        pill.setClickable(true);
        pill.setFocusable(true);
        pill.setMinimumHeight((int) (38 * density));
        int padH = (int) (3.5f * density);
        int padV = (int) (8.5f * density);
        pill.setPadding(padH, padV, padH, padV);
        pill.setBackground(createActionPillDrawable(theme.surfaceContainer, 14 * density));

        ImageView iv = new ImageView(activity);
        int iconSize = (int) (15 * density);
        LinearLayout.LayoutParams ivLp = new LinearLayout.LayoutParams(iconSize, iconSize);
        ivLp.rightMargin = (int) (3.5f * density);
        iv.setLayoutParams(ivLp);
        iv.setImageDrawable(new MaterialVectorDrawable(iconType, theme.textPrimary));
        pill.addView(iv);

        TextView tv = new TextView(activity);
        tv.setText(text);
        tv.setTextSize(11f);
        tv.setTypeface(null, Typeface.BOLD);
        tv.setTextColor(theme.textPrimary);
        tv.setIncludeFontPadding(false);
        tv.setSingleLine(true);
        tv.setEllipsize(TextUtils.TruncateAt.END);
        pill.addView(tv);

        return pill;
    }

    private static GradientDrawable createCardDrawable(boolean active, float density, Theme theme) {
        GradientDrawable gd = new GradientDrawable();
        gd.setCornerRadius(16 * density);
        gd.setColor(active ? theme.cardActive : theme.card);
        gd.setStroke(active ? (int) (1.5f * density) : (int) (1 * density),
                active ? theme.cardBorderActive : theme.cardBorder);
        return gd;
    }

    private static GradientDrawable createCardDrawable(boolean active, float density) {
        return createCardDrawable(active, density, Theme.get(null));
    }

    private static GradientDrawable createRoundedDrawable(int color, float radiusPx) {
        GradientDrawable gd = new GradientDrawable();
        gd.setCornerRadius(radiusPx);
        gd.setColor(color);
        return gd;
    }

    private static GradientDrawable createRoundedCardDrawable(int bgColor, int strokeColor, float radius) {
        GradientDrawable d = new GradientDrawable();
        d.setShape(GradientDrawable.RECTANGLE);
        d.setCornerRadius(radius);
        d.setColor(bgColor);
        d.setStroke(1, strokeColor);
        return d;
    }

    private static Dialog createM3Dialog(Activity activity, String title, View customView) {
        float density = activity.getResources().getDisplayMetrics().density;
        Theme theme = Theme.get(activity);
        Dialog d = new Dialog(activity);
        d.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(createRoundedDrawable(theme.surface, 28 * density));

        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        int pad = (int) (20 * density);
        header.setPadding(pad, pad, pad, (int) (8 * density));

        TextView tvT = new TextView(activity);
        tvT.setText(title);
        tvT.setTextSize(17.5f);
        tvT.setTextColor(theme.textPrimary);
        tvT.setTypeface(null, Typeface.BOLD);
        header.addView(tvT, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        FrameLayout btnClose = new FrameLayout(activity);
        int cSize = (int) (36 * density);
        btnClose.setLayoutParams(new LinearLayout.LayoutParams(cSize, cSize));
        ImageView ivClose = new ImageView(activity);
        ivClose.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CLOSE, theme.textSecondary));
        int icSize = (int) (18 * density);
        FrameLayout.LayoutParams icLp = new FrameLayout.LayoutParams(icSize, icSize, Gravity.CENTER);
        ivClose.setLayoutParams(icLp);
        btnClose.addView(ivClose);
        btnClose.setClickable(true);
        btnClose.setFocusable(true);
        btnClose.setOnClickListener(v -> d.dismiss());
        header.addView(btnClose);
        root.addView(header);

        if (customView != null) {
            root.addView(customView);
        }

        d.setContentView(root);
        Window w = d.getWindow();
        if (w != null) {
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
            w.setLayout(Math.min((int) (screenWidth * 0.90f), (int) (460 * density)), ViewGroup.LayoutParams.WRAP_CONTENT);
            w.setGravity(Gravity.CENTER);
        }
        return d;
    }

    private static Dialog createM3ActionDialog(Activity activity, String title, View customView,
                                               String actionText, Runnable onAction) {
        return createM3ActionDialog(activity, title, customView, actionText, onAction, false);
    }

    private static Dialog createM3ActionDialog(Activity activity, String title, View customView,
                                               String actionText, Runnable onAction, boolean isDestructive) {
        float density = activity.getResources().getDisplayMetrics().density;
        Theme theme = Theme.get(activity);
        Dialog d = createM3Dialog(activity, title, customView);

        LinearLayout actions = new LinearLayout(activity);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        int p = (int) (20 * density);
        actions.setPadding(p, (int) (8 * density), p, (int) (18 * density));

        TextView btnCancel = new TextView(activity);
        btnCancel.setText("Cancel");
        btnCancel.setTextSize(13.5f);
        btnCancel.setTypeface(null, Typeface.BOLD);
        btnCancel.setTextColor(theme.primary);
        btnCancel.setGravity(Gravity.CENTER);
        btnCancel.setClickable(true);
        btnCancel.setFocusable(true);
        int padH = (int) (16 * density);
        int padV = (int) (9.5f * density);
        btnCancel.setPadding(padH, padV, padH, padV);
        btnCancel.setBackground(createActionPillDrawable(theme.surfaceContainer, 18 * density));
        btnCancel.setOnClickListener(v -> d.dismiss());
        LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cLp.setMargins(0, 0, (int) (10 * density), 0);
        actions.addView(btnCancel, cLp);

        TextView btnOk = new TextView(activity);
        btnOk.setText(actionText);
        btnOk.setTextSize(13.5f);
        btnOk.setTypeface(null, Typeface.BOLD);
        btnOk.setTextColor(theme.onPrimary);
        btnOk.setGravity(Gravity.CENTER);
        btnOk.setClickable(true);
        btnOk.setFocusable(true);
        btnOk.setPadding((int) (20 * density), padV, (int) (20 * density), padV);
        int actionBg = isDestructive
                ? (theme.isDark ? 0xFFBA1A1A : 0xFFB3261E)
                : theme.primary;
        btnOk.setBackground(createActionPillDrawable(actionBg, 18 * density));
        btnOk.setOnClickListener(v -> {
            d.dismiss();
            if (onAction != null) onAction.run();
        });
        actions.addView(btnOk, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        ((LinearLayout) ((ViewGroup) d.findViewById(android.R.id.content)).getChildAt(0)).addView(actions);

        return d;
    }

    private static void restartApp(Activity activity) {
        try {
            Intent intent = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
            if (intent != null) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                activity.startActivity(intent);
            }
            android.os.Process.killProcess(android.os.Process.myPid());
            System.exit(0);
        } catch (Throwable t) {
            Logger.printException(() -> "Error restarting Photos app", t);
        }
    }
}
