package app.afterglow.extension.navigation;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ImageView;
import android.widget.TextView;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.concurrent.FutureTask;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Inflates the installed YouTube APK's actual ConstraintLayouts and custom views in this
 * isolated instrumentation process. It never starts YouTube or changes its preferences.
 */
public final class TabPresentationRegression extends Instrumentation {
    private static final String NATIVE_PACKAGE = "app.morphe.android.youtube";
    private static final String[] LAYOUTS = {"image_only_tab", "image_only_tab", "image_with_text_tab",
        "avatar_image_only_tab", "image_with_text_tab"};
    private static final String[] TITLES = {"Home", "Shorts", "Subscriptions", "You", "Afterglow"};
    private Context nativeContext;
    private final JSONArray passed = new JSONArray(), measurements = new JSONArray();
    private int assertions;

    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); start(); }
    private void check(boolean condition, String message) {
        assertions++;
        if (!condition) throw new AssertionError(message);
    }
    private int id(String name, String type) {
        int id = nativeContext.getResources().getIdentifier(name, type, NATIVE_PACKAGE);
        if (id == 0) throw new AssertionError("Missing native " + type + "/" + name);
        return id;
    }
    private int dp(int value) { return Math.round(value * nativeContext.getResources().getDisplayMetrics().density); }
    private TextView label(View tab) { return tab.findViewById(id("text", "id")); }
    private LinearLayout row(boolean mapLayouts, boolean nativeLabelFreePadding) {
        LinearLayout row = new LinearLayout(nativeContext);
        row.setOrientation(LinearLayout.HORIZONTAL);
        for (int i=0; i<LAYOUTS.length; i++) {
            int resource = id(LAYOUTS[i], "layout");
            if (mapLayouts) resource = TabBarHooks.tabLayout(resource, row);
            View tab = LayoutInflater.from(nativeContext).inflate(resource, row, false);
            if (i != 3) {
                ImageView image = tab.findViewById(id("image", "id"));
                // The original image-only XML uses wrap_content; its native binder supplies
                // a 24dp drawable. An empty ImageView would invalidate the negative control.
                image.setImageDrawable(nativeContext.getDrawable(id("yt_outline_home_black_24", "drawable")));
            }
            // Lavbz.<init> derives j from the layout ID after inflate. PivotBar.e applies
            // this native dimension only when j and flag 45845634 are true.
            boolean iconOnly = resource == id("image_only_tab", "layout") || resource == id("avatar_image_only_tab", "layout");
            if (iconOnly && nativeLabelFreePadding) {
                int top = nativeContext.getResources().getDimensionPixelSize(id("pivot_bar_label_free_tab_padding_top", "dimen"));
                tab.setPaddingRelative(tab.getPaddingStart(), top, tab.getPaddingEnd(), tab.getPaddingBottom());
            }
            TextView label = label(tab);
            if (label != null) { TabBarHooks.tabLabel(label); label.setText(TITLES[i]); }
            TabBarHooks.tabCreated(tab);
            tab.setSelected(i == 2);
            row.addView(tab);
        }
        return row;
    }
    private void layout(LinearLayout row) {
        int width = dp(412), height = dp(48);
        row.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        row.layout(0, 0, width, height);
    }
    private JSONArray bounds(LinearLayout row, String name) throws Exception {
        JSONArray result = new JSONArray();
        for (int i=0; i<row.getChildCount(); i++) {
            View tab = row.getChildAt(i);
            View icon = tab.findViewById(id(i==3 ? "pivot_bar_thumbnail" : "image", "id"));
            check(icon != null, name + ": native icon/avatar exists " + i);
            check(icon.getWidth()==dp(24) && icon.getHeight()==dp(24), name + ": native 24dp icon bounds " + i);
            Rect rect = new Rect(0, 0, icon.getWidth(), icon.getHeight());
            row.offsetDescendantRectToMyCoords(icon, rect);
            result.put(new JSONObject().put("tab", TITLES[i]).put("top", rect.top).put("bottom", rect.bottom)
                .put("left", rect.left).put("right", rect.right));
        }
        measurements.put(new JSONObject().put("case", name).put("icons", result));
        return result;
    }
    private void aligned(LinearLayout row, String name) throws Exception {
        layout(row);
        JSONArray icons = bounds(row, name);
        int top=icons.getJSONObject(0).getInt("top"), bottom=icons.getJSONObject(0).getInt("bottom");
        for (int i=1; i<icons.length(); i++) {
            check(Math.abs(top-icons.getJSONObject(i).getInt("top")) <= 1, name + ": icon top " + i);
            check(Math.abs(bottom-icons.getJSONObject(i).getInt("bottom")) <= 1, name + ": icon bottom " + i);
        }
    }
    private void labels(LinearLayout row, int visibility) {
        for (int i=0; i<row.getChildCount(); i++) {
            TextView label = label(row.getChildAt(i));
            check(label != null, "Every renderer has a native label: " + TITLES[i]);
            check(label.getVisibility()==visibility, "Label visibility: " + TITLES[i]);
            check(label.getText().toString().equals(TITLES[i]), "Native title preserved: " + TITLES[i]);
        }
    }
    private boolean preDraw(LinearLayout row) {
        boolean cancel = false;
        for (int i=0; i<row.getChildCount(); i++) cancel |= row.getChildAt(i).getViewTreeObserver().dispatchOnPreDraw();
        return cancel;
    }
    private void runCases() throws Exception {
        Context apk = getTargetContext().createPackageContext(NATIVE_PACKAGE,
            Context.CONTEXT_INCLUDE_CODE | Context.CONTEXT_IGNORE_SECURITY);
        Configuration configuration = new Configuration(apk.getResources().getConfiguration());
        configuration.densityDpi=420;
        configuration.fontScale=1f;
        apk = apk.createConfigurationContext(configuration);
        int theme = apk.getResources().getIdentifier("Theme.YouTube.Dark", "style", NATIVE_PACKAGE);
        nativeContext = new ContextThemeWrapper(apk, theme);
        check(nativeContext.getClassLoader().loadClass("android.support.constraint.ConstraintLayout") != null,
            "Use actual native ConstraintLayout");

        Gate.removeLabels=false;
        LinearLayout legacy = row(false, true);
        layout(legacy);
        JSONArray old = bounds(legacy, "original mixed native layouts");
        check(label(legacy.getChildAt(0))==null && label(legacy.getChildAt(1))==null && label(legacy.getChildAt(3))==null,
            "Reproduce missing Home, Shorts and You labels");
        check(old.getJSONObject(0).getInt("top")>old.getJSONObject(2).getInt("top"), "Reproduce icon-only tab pushed down");
        passed.put("negative control: missing labels and mixed icon heights reproduced");
        Gate.removeLabels=true;
        preDraw(legacy); layout(legacy);
        old=bounds(legacy, "original mixed layouts with labels hidden");
        check(old.getJSONObject(0).getInt("top")>old.getJSONObject(2).getInt("top"),
            "Reproduce misalignment with every available label hidden");
        passed.put("negative control: hidden labels still leave original icons misaligned");

        Gate.removeLabels=false;
        LinearLayout fixed = row(true, true);
        aligned(fixed, "fixed labels visible"); labels(fixed, View.VISIBLE);
        check(fixed.getChildAt(3).findViewById(id("pivot_bar_thumbnail", "id")).getClass().getName()
            .equals("com.google.android.libraries.youtube.common.ui.CircularImageView"), "Use native labelled avatar class");
        passed.put("all native titles restored and icon/avatar bounds aligned");

        Gate.removeLabels=true;
        check(preDraw(fixed), "Changing label visibility schedules native re-layout before drawing");
        aligned(fixed, "fixed labels hidden"); labels(fixed, View.GONE);
        check(!preDraw(fixed), "Steady hidden labels do not repeatedly cancel drawing");
        passed.put("hide labels aligns all icons without reinflating views");

        Gate.removeLabels=false;
        check(preDraw(fixed), "Restoring labels schedules native re-layout");
        aligned(fixed, "fixed labels restored"); labels(fixed, View.VISIBLE);
        check(!preDraw(fixed), "Steady visible labels do not repeatedly cancel drawing");
        passed.put("restoring labels works on the same bound views");

        fixed.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
        aligned(fixed, "fixed RTL labels visible");
        Gate.removeLabels=true; preDraw(fixed);
        aligned(fixed, "fixed RTL labels hidden");
        passed.put("RTL visible and hidden labels preserve vertical alignment");

        Gate.removeLabels=false;
        LinearLayout noPadding = row(true, false);
        aligned(noPadding, "fixed without native label-free padding flag");
        passed.put("native padding flag off also aligns");
        TextView externallyHidden = label(noPadding.getChildAt(0));
        externallyHidden.setVisibility(View.INVISIBLE);
        Gate.removeLabels=true; TabBarHooks.tabLabel(externallyHidden);
        Gate.removeLabels=false; TabBarHooks.tabLabel(externallyHidden);
        check(externallyHidden.getVisibility()==View.INVISIBLE, "Do not expose a label hidden by another owner");
        Gate.installed=false;
        check(TabBarHooks.tabLayout(id("image_only_tab", "layout"), noPadding)==id("image_only_tab", "layout"),
            "Uninstalled feature preserves native layout");
        Gate.installed=true;
        check(TabBarHooks.tabLayout(id("image_with_text_tab", "layout"), noPadding)==id("image_with_text_tab", "layout"),
            "Existing labelled layout unchanged");
        check(TabBarHooks.tabLayout(1234, noPadding)==1234, "Unknown layouts unchanged");
        passed.put("native layout and visibility fallback behavior preserved");
    }
    @Override public void onStart() {
        JSONObject result = new JSONObject();
        try {
            FutureTask<Void> test = new FutureTask<>(() -> { runCases(); return null; });
            runOnMainSync(test); test.get();
            result.put("success", true);
        } catch (Throwable error) {
            StringWriter stack = new StringWriter(); error.printStackTrace(new PrintWriter(stack));
            try { result.put("success", false).put("error", stack.toString()); } catch(Exception ignored) {}
        }
        try {
            result.put("assertions", assertions).put("passed", passed).put("measurements", measurements)
                .put("nativePackage", NATIVE_PACKAGE).put("sdk", android.os.Build.VERSION.SDK_INT);
            try (FileWriter out = new FileWriter(new File(getTargetContext().getFilesDir(), "result.json"))) {
                out.write(result.toString(2));
            }
        } catch(Exception error) { throw new RuntimeException(error); }
        Bundle summary = new Bundle(); summary.putString("result", result.toString());
        finish(result.optBoolean("success") ? Activity.RESULT_OK : Activity.RESULT_CANCELED, summary);
    }
}
