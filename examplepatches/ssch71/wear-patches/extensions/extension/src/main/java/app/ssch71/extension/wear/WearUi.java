/*
 * Copyright (C) 2026 ssch71
 */
package app.ssch71.extension.wear;

import android.app.Activity;
import android.app.Application;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.View;

@SuppressWarnings({"unused", "deprecation"})
public final class WearUi {
    /** 폰 UI를 이 dp 폭으로 보이게 맞춤. 작을수록 글씨/버튼이 커짐 */
    private static final float TARGET_WIDTH_DP = 260f;
    /** 원형 화면 내접 정사각형 인셋: (1 - 1/√2) / 2 ≈ 0.146 */
    private static final float ROUND_INSET_RATIO = 0.146f;

    private WearUi() {}

    public static void onCreate(Activity activity) {
        applyDensity(activity);
        if (Build.VERSION.SDK_INT >= 29) {
            activity.registerActivityLifecycleCallbacks(new Callbacks());
        }
    }

    private static boolean isRound(Resources res) {
        return res.getConfiguration().isScreenRound();
    }

    private static void applyDensity(Activity activity) {
        Resources res = activity.getResources();
        DisplayMetrics dm = res.getDisplayMetrics();
        Configuration conf = new Configuration(res.getConfiguration());

        int shortPx = Math.min(dm.widthPixels, dm.heightPixels);
        float contentPx = isRound(res) ? shortPx * (1f - 2f * ROUND_INSET_RATIO) : shortPx;
        float density = contentPx / TARGET_WIDTH_DP;
        int dpi = Math.round(density * 160f);

        dm.density = density;
        dm.scaledDensity = density * conf.fontScale;
        dm.densityDpi = dpi;

        conf.densityDpi = dpi;
        conf.screenWidthDp = Math.round(dm.widthPixels / density);
        conf.screenHeightDp = Math.round(dm.heightPixels / density);
        conf.smallestScreenWidthDp = Math.min(conf.screenWidthDp, conf.screenHeightDp);

        res.updateConfiguration(conf, dm);
    }

    private static void applyRoundInset(Activity activity) {
        Resources res = activity.getResources();
        if (!isRound(res)) return;
        View content = activity.findViewById(android.R.id.content);
        if (content == null) return;
        DisplayMetrics dm = res.getDisplayMetrics();
        int pad = Math.round(Math.min(dm.widthPixels, dm.heightPixels) * ROUND_INSET_RATIO);
        content.setPadding(pad, pad, pad, pad);
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override public void onActivityPostCreated(Activity a, Bundle b) { applyRoundInset(a); }
        @Override public void onActivityCreated(Activity a, Bundle b) {}
        @Override public void onActivityStarted(Activity a) {}
        @Override public void onActivityResumed(Activity a) {}
        @Override public void onActivityPaused(Activity a) {}
        @Override public void onActivityStopped(Activity a) {}
        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
        @Override public void onActivityDestroyed(Activity a) { a.unregisterActivityLifecycleCallbacks(this); }
    }
}
