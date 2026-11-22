/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.morphe.extension.h19e8p.flags;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import app.morphe.extension.h19e8p.Prefs;
import app.morphe.extension.h19e8p.Text;

/**
 * X を使っている間に、X が読んだフラグを記録する。
 *
 * <p>フラグの読み取りはすべて {@link FlagReads} を通るので、「リセット」してから画面を開き、
 * 一覧を見れば、その画面が実際に読んだフラグが分かる。部品の並びは見ないので、要素ピッカーでは
 * 手がかりが取れない Compose 製の画面でも同じように使える。
 *
 * <p>記録は「✕」を押すまで続く。一覧を見た後に X に戻ると、すぐに続きを記録できる。
 */
@SuppressWarnings("deprecation")
public final class FlagRecorder {
    private static final long REFRESH_MS = 500;

    private static boolean active;
    private static boolean registered;
    private static FrameLayout overlay;
    private static TextView counter;
    private static Activity overlayHost;
    private static final Runnable REFRESH = FlagRecorder::refreshLabel;

    private FlagRecorder() {
    }

    /** 始める。この後すぐに設定画面を閉じ、次に前に出る X の画面に操作の帯を出す。 */
    public static boolean start() {
        try {
            Context context = Prefs.context();
            if (context == null) return false;
            Application application = (Application) context.getApplicationContext();
            if (!registered) {
                application.registerActivityLifecycleCallbacks(new Callbacks());
                registered = true;
            }
            FlagReads.startRecording();
            active = true;
            return true;
        } catch (Throwable ex) {
            return false;
        }
    }

    /** 記録を終える。止めるのは「✕」とこれだけ。 */
    public static void cancel() {
        active = false;
        FlagReads.stopRecording();
        detach();
    }

    public static boolean isActive() {
        return active;
    }

    /** 記録を続けたまま、ここまでの分を消す。次に開く画面だけを測れる。 */
    private static void reset(Context context) {
        FlagReads.startRecording();
        refreshLabel();
        Toast.makeText(context, Text.of("記録をリセットしました", "Recording reset"), Toast.LENGTH_SHORT).show();
    }

    /** 一覧を開く。記録は止めないので、X に戻るとすぐに続きを記録する。 */
    private static void showResults() {
        Activity host = overlayHost;
        detach();
        if (host == null) return;
        Intent intent = new Intent(host, FlagResultsActivity.class);
        intent.putExtra(FlagResultsActivity.EXTRA_MODE, FlagResultsActivity.MODE_RECORDER);
        host.startActivity(intent);
    }

    private static void detach() {
        try {
            if (counter != null) counter.removeCallbacks(REFRESH);
            if (overlay != null && overlay.getParent() instanceof ViewGroup) {
                ((ViewGroup) overlay.getParent()).removeView(overlay);
            }
        } catch (Throwable ignored) {
        }
        overlay = null;
        counter = null;
        overlayHost = null;
    }

    private static void attach(Activity activity) {
        if (!active || activity == null || ElementPicker.isOwnActivity(activity)) return;
        if (overlayHost == activity && overlay != null) return;

        detach();
        try {
            View decor = activity.getWindow().getDecorView();
            if (!(decor instanceof ViewGroup)) return;

            FrameLayout root = new FrameLayout(activity);
            LinearLayout panel = new LinearLayout(activity);
            panel.setOrientation(LinearLayout.HORIZONTAL);
            panel.setBackgroundColor(0xE6000000);

            TextView count = action(activity, "", null);
            // 件数の所をつかむと帯ごと動かせる。調べたいものを隠した時のため。
            OverlayButtons.attachDragHandle(activity, count, panel, null);
            panel.addView(count);
            panel.addView(action(activity, Text.of("リセット", "Reset"), () -> reset(activity)));
            panel.addView(action(activity, Text.of("表示", "Show"), FlagRecorder::showResults));
            panel.addView(action(activity, "✕", FlagRecorder::cancel));

            OverlayButtons.park(activity, root, panel, 160);
            // 根元の面はクリックを受け取らないので、タッチを受けるのは帯だけで、記録中も X は普通に使える。
            root.addView(panel);
            ((ViewGroup) decor).addView(root, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            overlay = root;
            counter = count;
            overlayHost = activity;
            refreshLabel();
        } catch (Throwable ex) {
            detach();
        }
    }

    private static TextView action(Context context, String text, Runnable onClick) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextColor(Color.WHITE);
        int pad = OverlayButtons.dp(context, 10);
        view.setPadding(pad, pad, pad, pad);
        if (onClick != null) {
            view.setClickable(true);
            view.setOnClickListener(v -> onClick.run());
        }
        return view;
    }

    private static void refreshLabel() {
        if (counter == null) return;
        counter.setText("REC " + FlagReads.recordedCount());
        counter.postDelayed(REFRESH, REFRESH_MS);
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity activity) {
            attach(activity);
        }

        @Override
        public void onActivityPaused(Activity activity) {
            if (overlayHost == activity) detach();
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            if (overlayHost == activity) detach();
        }
    }
}
