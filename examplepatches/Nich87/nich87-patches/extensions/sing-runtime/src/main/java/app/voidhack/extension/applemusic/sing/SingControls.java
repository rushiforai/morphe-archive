package app.voidhack.extension.applemusic.sing;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.concurrent.ConcurrentHashMap;

public final class SingControls {
    private static final String BUTTON_TAG = "app.voidhack.sing.controls";
    private static final int PLAYER_PLATTER = 0x2effffff;
    private static final int PLAYER_FOREGROUND = 0xf0ffffff;
    private static final int SHEET_SURFACE = 0xf0262528;
    private static final int SYMBOL_ON_FILL = 0xff29272b;
    private static final ConcurrentHashMap<String, Integer> RESOURCE_IDS = new ConcurrentHashMap<>();
    private static boolean preparationFailed;

    private SingControls() {}

    public interface PlayerControls {
        void voidhackShowControls();
        void voidhackResumeControlsFade();
    }

    public static void attach(View root) {
        attach(root, null);
    }

    public static void attach(View root, PlayerControls playerControls) {
        if (!(root instanceof ViewGroup container)) return;
        Context context = root.getContext();
        if (root.findViewWithTag(BUTTON_TAG) != null) return;
        int layout = resource(context, "layout", "voidhack_sing_slot");
        int icon = resource(context, "drawable", "ic_nowplaying_vocal");
        View controls = root.findViewById(resource(context, "id", "controls"));
        if (layout == 0 || icon == 0 || controls == null) return;

        FrameLayout slot = (FrameLayout) LayoutInflater.from(context).inflate(layout, container, false);
        View nativeVocal = root.findViewById(resource(context, "id", "vocal_ctrl"));
        View loading = root.findViewById(resource(context, "id", "loading_progress"));
        slot.setTag(new Control(slot, controls, nativeVocal, loading, icon, playerControls));
        container.addView(slot);
    }

    public static boolean isMixerOpen(View root) {
        if (root == null) return false;
        View button = root.findViewWithTag(BUTTON_TAG);
        return button != null && button.getParent() instanceof View slot
                && slot.getTag() instanceof Control control
                && (SingPlayback.isPreparing() || control.keepsControlsVisible());
    }

    private enum Panel { MIX, SETUP, PREPARING, ERROR, FORMAT }

    private static final class Control implements View.OnAttachStateChangeListener,
            ViewTreeObserver.OnPreDrawListener {
        private final FrameLayout slot;
        private final View controls;
        private final View nativeVocal;
        private final View loading;
        private final PlayerControls playerControls;
        private final Context context;
        private final ImageButton button;
        private final int icon;
        private final int platter;
        private final int foreground;
        private final Runnable refreshPanel = this::refreshPanel;
        private PopupWindow popup;
        private Panel panel;
        private boolean buttonSynced;
        private int lastMix;
        private boolean lastSelected;
        private float lastButtonAlpha = Float.NaN;

        Control(FrameLayout slot, View controls, View nativeVocal, View loading, int icon,
                PlayerControls playerControls) {
            this.slot = slot;
            this.controls = controls;
            this.nativeVocal = nativeVocal;
            this.loading = loading;
            this.playerControls = playerControls;
            this.icon = icon;
            context = slot.getContext();
            platter = color(context, "player_vibrant_tertiary", PLAYER_PLATTER);
            foreground = color(context, "player_vibrant_primary", PLAYER_FOREGROUND);

            button = new ImageButton(context);
            button.setTag(BUTTON_TAG);
            button.setImageResource(icon);
            button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            int inset = dp(context, 6);
            button.setPadding(inset, inset, inset, inset);
            button.setBackground(buttonBackground());
            button.setImageTintList(new ColorStateList(
                    new int[][]{{android.R.attr.state_selected}, {}},
                    new int[]{SYMBOL_ON_FILL, foreground}));
            button.setContentDescription(text(context, "title"));
            button.setOnClickListener(view -> togglePanel());
            button.setOnLongClickListener(view -> {
                if (SingPlayback.mix() == 0) return false;
                SingPlayback.setMix(0);
                syncButton();
                return true;
            });
            slot.addView(button, new FrameLayout.LayoutParams(-1, -1));
            slot.addOnAttachStateChangeListener(this);
            syncButton();
        }

        @Override
        public void onViewAttachedToWindow(View view) {
            slot.getViewTreeObserver().addOnPreDrawListener(this);
        }

        @Override
        public void onViewDetachedFromWindow(View view) {
            slot.getViewTreeObserver().removeOnPreDrawListener(this);
            closePanel(false);
        }

        @Override
        public boolean onPreDraw() {
            float alpha = nativeVocal == null ? controls.getAlpha() : nativeVocal.getAlpha();
            boolean visible = controls.isShown() && controls.getAlpha() > 0.01f && alpha > 0.01f
                    && (nativeVocal == null || nativeVocal.getVisibility() != View.VISIBLE)
                    && (loading == null || loading.getVisibility() != View.VISIBLE);
            int visibility = visible ? View.VISIBLE : View.INVISIBLE;
            if (slot.getVisibility() != visibility) slot.setVisibility(visibility);
            if (slot.getAlpha() != alpha) slot.setAlpha(alpha);
            if (!visible && popup != null) closePanel();
            syncButton();
            return true;
        }

        private void syncButton() {
            int mix = SingPlayback.mix();
            boolean selected = SingPlayback.streamSupported() && mix != 0;
            float alpha = panel == Panel.MIX && popup != null ? 0f : 1f;
            if (!buttonSynced || selected != lastSelected) {
                button.setSelected(selected);
                lastSelected = selected;
            }
            if (!buttonSynced || mix != lastMix) {
                String description = mixLabel(mix);
                if (!TextUtils.equals(button.getStateDescription(), description)) {
                    button.setStateDescription(description);
                }
                lastMix = mix;
            }
            if (!buttonSynced || alpha != lastButtonAlpha) {
                if (button.getAlpha() != alpha) button.setAlpha(alpha);
                lastButtonAlpha = alpha;
            }
            buttonSynced = true;
        }

        private void togglePanel() {
            if (popup != null) closePanel();
            else openPanel(currentPanel());
        }

        private Panel currentPanel() {
            if (SingPlayback.isReady()) return SingPlayback.streamSupported() ? Panel.MIX : Panel.FORMAT;
            if (SingPlayback.isPreparing()) return Panel.PREPARING;
            return preparationFailed ? Panel.ERROR : Panel.SETUP;
        }

        private void refreshPanel() {
            if (popup == null) return;
            Panel next = currentPanel();
            if (next != panel) openPanel(next);
            else slot.postDelayed(refreshPanel, 400);
        }

        private boolean keepsControlsVisible() {
            return (panel == Panel.MIX || panel == Panel.PREPARING)
                    && popup != null && popup.isShowing();
        }

        private void openPanel(Panel mode) {
            closePanel(false);
            if (!slot.isAttachedToWindow() || slot.getVisibility() != View.VISIBLE) return;
            View root = slot.getRootView();
            int gap = mode == Panel.MIX ? 0 : dp(context, 8);
            int[] location = new int[2];
            slot.getLocationInWindow(location);
            int maxHeight = Math.max(dp(context, 72), location[1] - gap
                    + (mode == Panel.MIX ? button.getHeight() : 0));
            View content = mode == Panel.MIX ? mixContent(maxHeight) : statusContent(mode);
            content.measure(View.MeasureSpec.makeMeasureSpec(root.getWidth(), View.MeasureSpec.AT_MOST),
                    View.MeasureSpec.makeMeasureSpec(maxHeight, View.MeasureSpec.AT_MOST));
            int width = content.getMeasuredWidth();
            int height = content.getMeasuredHeight();
            if (width == 0 || height == 0) return;

            PopupWindow window = new PopupWindow(content, width, height, true);
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setOutsideTouchable(true);
            window.setInputMethodMode(PopupWindow.INPUT_METHOD_NOT_NEEDED);
            window.setAnimationStyle(0);
            window.setOnDismissListener(() -> {
                if (popup == window) releasePanel(true);
            });
            panel = mode;
            popup = window;
            int offset = mode == Panel.MIX ? -height : -height - button.getHeight() - gap;
            window.showAsDropDown(button, 0, offset, Gravity.END);
            if ((mode == Panel.MIX || mode == Panel.PREPARING) && playerControls != null) {
                playerControls.voidhackShowControls();
            }
            syncButton();

            content.setPivotX(slot.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL
                    ? button.getWidth() / 2f : width - button.getWidth() / 2f);
            content.setPivotY(height);
            content.setScaleY(0.91f);
            content.setAlpha(0f);
            content.animate().alpha(1f).scaleY(1f).setDuration(160)
                    .setInterpolator(new DecelerateInterpolator()).start();
            slot.postDelayed(refreshPanel, 400);
        }

        private void closePanel() {
            closePanel(true);
        }

        private void closePanel(boolean resumeFade) {
            PopupWindow open = popup;
            if (open == null) return;
            releasePanel(resumeFade);
            open.dismiss();
        }

        private void releasePanel(boolean resumeFade) {
            boolean heldFade = panel == Panel.MIX || panel == Panel.PREPARING;
            popup = null;
            panel = null;
            slot.removeCallbacks(refreshPanel);
            if (heldFade && resumeFade && playerControls != null && !SingPlayback.isPreparing()) {
                playerControls.voidhackResumeControlsFade();
            }
            syncButton();
        }

        private View mixContent(int maxHeight) {
            LinearLayout content = new LinearLayout(context);
            content.setGravity(Gravity.BOTTOM | Gravity.END);
            content.setLayoutDirection(slot.getLayoutDirection());
            int width = dimen(context, "lyrics_vocal_attenuation_width_dragging", 72);
            int height = Math.min(maxHeight, dimen(context, "lyrics_vocal_attenuation_height_dragging", 156));
            int iconSize = dimen(context, "lyrics_vocal_attenuation_drawable_size_dragging", 56);

            TextView reset = action(text(context, "reset"), 13);
            reset.setBackground(ripple(SHEET_SURFACE, dp(context, 18)));
            reset.setPadding(dp(context, 12), 0, dp(context, 12), 0);
            reset.setMaxLines(1);
            reset.setEllipsize(TextUtils.TruncateAt.END);
            LinearLayout.LayoutParams resetPlacement = new LinearLayout.LayoutParams(-2, dp(context, 48));
            resetPlacement.setMarginEnd(dp(context, 8));
            content.addView(reset, resetPlacement);

            FrameLayout capsule = new FrameLayout(context);
            SingMixSlider slider = new SingMixSlider(context, platter, foreground, 0x9b8b878d);
            slider.setContentDescription(text(context, "mix"));
            capsule.addView(slider, new FrameLayout.LayoutParams(-1, -1));

            ImageView light = micSymbol(iconSize, foreground);
            ImageView dark = micSymbol(iconSize, SYMBOL_ON_FILL);
            addSymbol(capsule, light, iconSize);
            addSymbol(capsule, dark, iconSize);
            Rect lightClip = new Rect();
            Rect darkClip = new Rect();
            Runnable render = () -> {
                int mix = SingPlayback.mix();
                slider.setMix(mix);
                slider.setStateDescription(mixLabel(mix));
                reset.setVisibility(mix == 0 ? View.INVISIBLE : View.VISIBLE);
                int boundary = Math.round(slider.getHeight() * ((100 - mix) / 200f));
                int split = Math.max(0, Math.min(light.getHeight(), boundary - light.getTop()));
                lightClip.set(0, 0, light.getWidth(), split);
                darkClip.set(0, split, dark.getWidth(), dark.getHeight());
                light.setClipBounds(lightClip);
                dark.setClipBounds(darkClip);
                syncButton();
            };
            capsule.addOnLayoutChangeListener((view, l, t, r, b, oldL, oldT, oldR, oldB) -> render.run());
            slider.setOnMixChanged(value -> {
                SingPlayback.setMix(value);
                render.run();
            });
            reset.setOnClickListener(view -> {
                SingPlayback.setMix(0);
                render.run();
                slider.requestFocus();
            });
            content.addView(capsule, new LinearLayout.LayoutParams(width, height));
            render.run();
            return content;
        }

        private void addSymbol(FrameLayout capsule, ImageView symbol, int iconSize) {
            FrameLayout.LayoutParams position = new FrameLayout.LayoutParams(
                    iconSize, iconSize, Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
            position.bottomMargin = dp(context, 3);
            capsule.addView(symbol, position);
        }

        private ImageView micSymbol(int size, int tint) {
            ImageView image = new ImageView(context);
            image.setImageResource(icon);
            image.setImageTintList(ColorStateList.valueOf(tint));
            image.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            int inset = Math.max(0, (size - dp(context, 42)) / 2);
            image.setPadding(inset, inset, inset, inset);
            image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            return image;
        }

        private View statusContent(Panel mode) {
            int inset = dp(context, 16);
            int width = Math.min(dp(context, 248), Math.max(dp(context, 148),
                    slot.getRootView().getWidth() - dp(context, 56)));
            LinearLayout body = new LinearLayout(context);
            body.setOrientation(LinearLayout.VERTICAL);
            body.setPadding(inset, inset, inset, inset);
            body.setMinimumWidth(width);
            body.setBackground(rounded(SHEET_SURFACE, dp(context, 20)));

            TextView title = label(text(context, "title"), 16, foreground);
            title.setTypeface(title.getTypeface(), android.graphics.Typeface.BOLD);
            body.addView(title);

            String message = switch (mode) {
                case PREPARING -> "preparing";
                case ERROR -> "failed";
                case FORMAT -> "format";
                default -> "setup";
            };
            TextView details = label(text(context, message), 14, 0xc9ffffff);
            details.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            LinearLayout.LayoutParams detailPlacement = new LinearLayout.LayoutParams(width - inset * 2, -2);
            detailPlacement.topMargin = dp(context, 6);
            body.addView(details, detailPlacement);

            if (mode == Panel.PREPARING) {
                ProgressBar progress = new ProgressBar(context, null, android.R.attr.progressBarStyleHorizontal);
                progress.setIndeterminate(true);
                progress.setIndeterminateTintList(ColorStateList.valueOf(foreground));
                LinearLayout.LayoutParams placement = new LinearLayout.LayoutParams(-1, dp(context, 14));
                placement.topMargin = dp(context, 8);
                body.addView(progress, placement);
            } else if (mode != Panel.FORMAT) {
                TextView prepare = action(text(context, "download"), 15);
                prepare.setBackground(ripple(platter, dp(context, 12)));
                LinearLayout.LayoutParams placement = new LinearLayout.LayoutParams(-1, -2);
                placement.topMargin = dp(context, 12);
                body.addView(prepare, placement);
                prepare.setOnClickListener(view -> prepareModel());
            }

            ScrollView scroll = new ScrollView(context);
            scroll.setFillViewport(true);
            scroll.setVerticalScrollBarEnabled(false);
            scroll.addView(body, new ScrollView.LayoutParams(width, -2));
            return scroll;
        }

        private void prepareModel() {
            if (SingPlayback.isPreparing()) return;
            preparationFailed = false;
            if (playerControls != null) playerControls.voidhackShowControls();
            SingPlayback.prepare(context, error -> {
                preparationFailed = error != null;
                slot.removeCallbacks(refreshPanel);
                refreshPanel();
                if (slot.isAttachedToWindow() && playerControls != null && !keepsControlsVisible()) {
                    playerControls.voidhackResumeControlsFade();
                }
            });
            openPanel(Panel.PREPARING);
        }

        private TextView action(String title, int size) {
            TextView action = label(title, size, foreground);
            action.setGravity(Gravity.CENTER);
            action.setMinHeight(dp(context, 48));
            action.setTypeface(action.getTypeface(), android.graphics.Typeface.BOLD);
            action.setFocusable(true);
            action.setAccessibilityDelegate(new View.AccessibilityDelegate() {
                @Override
                public void onInitializeAccessibilityNodeInfo(View host,
                        android.view.accessibility.AccessibilityNodeInfo info) {
                    super.onInitializeAccessibilityNodeInfo(host, info);
                    info.setClassName(android.widget.Button.class.getName());
                }
            });
            return action;
        }

        private StateListDrawable buttonBackground() {
            int radius = dimen(context, "lyrics_vocal_attenuation_platter_corner_radius", 11);
            StateListDrawable background = new StateListDrawable();
            background.addState(new int[]{android.R.attr.state_selected}, ripple(foreground, radius));
            background.addState(new int[]{}, ripple(platter, radius));
            return background;
        }

        private TextView label(String title, int size, int color) {
            TextView view = new TextView(context);
            view.setText(title);
            view.setTextSize(size);
            view.setTextColor(color);
            return view;
        }

        private String mixLabel(int mix) {
            if (mix == 0) return text(context, "original");
            return text(context, mix < 0 ? "reduce_vocals" : "reduce_backing", Math.abs(mix));
        }
    }

    private static RippleDrawable ripple(int color, int radius) {
        return new RippleDrawable(ColorStateList.valueOf(0x24ffffff), rounded(color, radius), null);
    }

    private static GradientDrawable rounded(int color, int radius) {
        GradientDrawable background = new GradientDrawable();
        background.setColor(color);
        background.setCornerRadius(radius);
        return background;
    }

    private static int dp(Context context, int size) {
        return Math.round(size * context.getResources().getDisplayMetrics().density);
    }

    private static int resource(Context context, String type, String name) {
        String key = type + "/" + name;
        Integer cached = RESOURCE_IDS.get(key);
        if (cached != null) return cached;
        int id = context.getResources().getIdentifier(name, type, context.getPackageName());
        if (id != 0) RESOURCE_IDS.put(key, id);
        return id;
    }

    private static int color(Context context, String name, int fallback) {
        int id = resource(context, "color", name);
        return id != 0 ? context.getColor(id) : fallback;
    }

    private static int dimen(Context context, String name, int fallback) {
        int id = resource(context, "dimen", name);
        return id != 0 ? context.getResources().getDimensionPixelSize(id) : dp(context, fallback);
    }

    private static String text(Context context, String name, Object... args) {
        return context.getString(resource(context, "string", "voidhack_sing_" + name), args);
    }
}
