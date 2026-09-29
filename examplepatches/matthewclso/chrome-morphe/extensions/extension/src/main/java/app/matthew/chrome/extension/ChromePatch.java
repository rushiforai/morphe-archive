package app.matthew.chrome.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Toast;

public final class ChromePatch {
    private static final String TAG = "ChromePatch";
    private static final String BUTTON_TAG = "chrome.patch.mode";
    private ChromePatch() {}

    public static void installToolbar(View toolbar) {
        Activity activity = activity(toolbar.getContext());
        Log.i(TAG, "Toolbar context=" + toolbar.getContext().getClass().getName()
                + "; activity=" + (activity == null ? "none" : activity.getClass().getName()));
        if (activity == null || !activity.getClass().getName().startsWith(
                "org.chromium.chrome.browser.ChromeTabbedActivity")) return;
        View candidate = toolbar.findViewById(id(toolbar, "toolbar_buttons"));
        Log.i(TAG, "Toolbar button container=" + (candidate == null ? "none" : candidate.getClass().getName()));
        if (!(candidate instanceof LinearLayout)) return;
        LinearLayout buttons = (LinearLayout) candidate;
        if (buttons.findViewWithTag(BUTTON_TAG) != null) return;
        ImageButton toggle = new ImageButton(toolbar.getContext());
        toggle.setTag(BUTTON_TAG);
        toggle.setScaleType(ImageView.ScaleType.CENTER);
        toggle.setImageDrawable(new ModeIcon(toolbar.getResources().getDisplayMetrics().density));
        TypedValue background = new TypedValue();
        toolbar.getContext().getTheme().resolveAttribute(
                android.R.attr.selectableItemBackgroundBorderless, background, true);
        if (background.resourceId != 0) toggle.setBackgroundResource(background.resourceId);
        int size = Math.round(48 * toolbar.getResources().getDisplayMetrics().density);
        toggle.setLayoutParams(new LinearLayout.LayoutParams(size, ViewGroup.LayoutParams.MATCH_PARENT));
        toggle.setMinimumHeight(size);
        toggle.setContentDescription("Switch to Incognito tabs");
        toggle.setOnClickListener(v -> {
            try {
                boolean target = !NativeBridge.isIncognito(activity);
                if (NativeBridge.tabCount(activity, target) == 0) {
                    int menu = id(toolbar, target ? "new_incognito_tab_menu_id" : "new_tab_menu_id");
                    if (menu == 0 || !NativeBridge.newTab(activity, menu)) {
                        Toast.makeText(activity, "This browsing mode is unavailable", Toast.LENGTH_SHORT).show();
                    }
                } else {
                    NativeBridge.selectModel(activity, target);
                }
                updateButton(activity, toolbar, toggle);
                ModeRouting.remember(activity);
            } catch (RuntimeException e) {
                Log.e(TAG, "Mode switch failed", e);
                Toast.makeText(activity, "Unable to switch browsing mode", Toast.LENGTH_SHORT).show();
            }
        });
        toggle.setOnLongClickListener(v -> {
            activity.startActivity(new Intent(activity, MorpheSettingsActivity.class));
            return true;
        });
        // The container's measured width is already used by ToolbarPhone to size the omnibox.
        View tabSwitcher = toolbar.findViewById(id(toolbar, "tab_switcher_button"));
        int index = tabSwitcher == null ? 0 : buttons.indexOfChild(tabSwitcher);
        buttons.addView(toggle, Math.max(0, index));
        // A restored model can change after layout has already run. Read its final state before draw.
        toolbar.getViewTreeObserver().addOnPreDrawListener(() -> {
            updateButton(activity, toolbar, toggle);
            return true;
        });
        toggle.post(() -> updateButton(activity, toolbar, toggle));
        Log.i(TAG, "Mode button installed");
    }

    public static int suggestionTop(View suggestions, int original) {
        if (!PatchSettings.trueBottom() || !NativeBridge.bottomSelected() || !(suggestions.getParent() instanceof View)) return original;
        int[] parent = new int[2];
        ((View) suggestions.getParent()).getLocationInWindow(parent);
        android.graphics.Rect viewport = new android.graphics.Rect();
        suggestions.getWindowVisibleDisplayFrame(viewport);
        return Math.max(0, viewport.top - parent[1]);
    }

    public static boolean useNtpMorph(boolean original) {
        return original && !(PatchSettings.trueBottom() && NativeBridge.bottomSelected());
    }

    public static int suggestionHeight(View suggestions, int original) {
        if (!PatchSettings.trueBottom() || !NativeBridge.bottomSelected() || !(suggestions.getParent() instanceof View)) return original;
        View toolbar = suggestions.getRootView().findViewById(id(suggestions, "toolbar"));
        if (toolbar == null || !toolbar.isLaidOut()) return original;
        int[] bar = new int[2];
        int[] parent = new int[2];
        toolbar.getLocationInWindow(bar);
        ((View) suggestions.getParent()).getLocationInWindow(parent);
        return Math.max(0, bar[1] - parent[1] - suggestionTop(suggestions, 0));
    }

    private static void updateButton(Activity activity, View toolbar, ImageButton button) {
        int visibility = PatchSettings.enabled(PatchSettings.BUTTON) ? View.VISIBLE : View.GONE;
        if (button.getVisibility() != visibility) button.setVisibility(visibility);
        try {
            boolean incognito = NativeBridge.isIncognito(activity);
            String description = incognito ? "Switch to regular tabs" : "Switch to Incognito tabs";
            if (!description.contentEquals(button.getContentDescription())) {
                button.setContentDescription(description);
                button.setTooltipText(description);
                ((ModeIcon) button.getDrawable()).incognito = incognito;
                button.invalidate();
            }
            View home = toolbar.findViewById(id(toolbar, "home_button"));
            ColorStateList tint = home instanceof ImageView ? ((ImageView) home).getImageTintList() : null;
            if (tint != null && !tint.equals(button.getImageTintList())) button.setImageTintList(tint);
        } catch (RuntimeException ignored) {
            // Inflation can precede tab-model initialization. The next layout retries.
        }
    }

    private static int id(View view, String name) {
        int id = view.getResources().getIdentifier(name, "id", view.getContext().getPackageName());
        return id != 0 ? id : view.getResources().getIdentifier(name, "id", "com.android.chrome");
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            Context next = ((ContextWrapper) context).getBaseContext();
            if (next == context) break;
            context = next;
        }
        return null;
    }

    private static final class ModeIcon extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int size;
        boolean incognito;
        ModeIcon(float density) { size = Math.round(24 * density); paint.setColor(Color.GRAY); }
        @Override public int getIntrinsicWidth() { return size; }
        @Override public int getIntrinsicHeight() { return size; }
        @Override public void draw(Canvas canvas) {
            canvas.save();
            canvas.translate(getBounds().left, getBounds().top);
            canvas.scale(getBounds().width() / 24f, getBounds().height() / 24f);
            paint.setStrokeWidth(1.8f);
            if (incognito) {
                paint.setStyle(Paint.Style.STROKE);
                canvas.drawRoundRect(5, 4, 19, 20, 2, 2, paint);
                canvas.drawLine(9, 8, 15, 8, paint);
            } else {
                paint.setStyle(Paint.Style.FILL);
                Path hat = new Path();
                hat.moveTo(5, 10); hat.lineTo(8, 3); hat.lineTo(16, 3); hat.lineTo(19, 10); hat.close();
                canvas.drawPath(hat, paint);
                canvas.drawRect(3, 10, 21, 12, paint);
                paint.setStyle(Paint.Style.STROKE);
                canvas.drawCircle(7, 17, 3, paint); canvas.drawCircle(17, 17, 3, paint);
                canvas.drawLine(10, 17, 14, 17, paint);
            }
            canvas.restore();
        }
        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(android.graphics.ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public int getOpacity() { return android.graphics.PixelFormat.TRANSLUCENT; }
    }
}
