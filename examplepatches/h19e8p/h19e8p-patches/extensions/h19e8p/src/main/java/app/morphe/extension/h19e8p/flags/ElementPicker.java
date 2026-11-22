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
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.h19e8p.Prefs;
import app.morphe.extension.h19e8p.Text;

/**
 * 画面の部品を選んで、関係しそうなフラグを探す道具 (uBlock の要素ピッカーのようなもの)。
 *
 * <p>アプリの画面は、調べたい部品を出すまでに操作が要るので、2つのモードで動く。操作モードでは
 * 小さなボタンだけを出し、タッチはすべて X に届く。選択モードでは、重ねた面がタッチを受け取り、
 * 指の下の部品を囲んで見せる。始めは操作モード。
 *
 * <p>重ねる面は X の画面の中に足すので、ほかのアプリの上に表示する権限は要らない。
 */
@SuppressWarnings("deprecation")
public final class ElementPicker {
    static final String EXTRA_CLASS = "picker_class";
    static final String EXTRA_ID_NAME = "picker_id_name";
    static final String EXTRA_TEXT = "picker_text";
    static final String EXTRA_ANCESTORS = "picker_ancestors";

    private static boolean armed;
    private static boolean registered;
    private static boolean pickMode;

    private static FrameLayout overlay;
    private static PickerSurface surface;
    private static View hintBar;
    private static Button toggleButton;
    private static Activity overlayHost;

    private ElementPicker() {
    }

    /** 始める。この後すぐに設定画面を閉じ、次に前に出る X の画面にボタンを出す。 */
    public static boolean arm() {
        try {
            Context context = Prefs.context();
            if (context == null) return false;
            Application application = (Application) context.getApplicationContext();
            if (!registered) {
                application.registerActivityLifecycleCallbacks(new Callbacks());
                registered = true;
            }
            armed = true;
            pickMode = false;
            return true;
        } catch (Throwable ex) {
            return false;
        }
    }

    public static void disarm() {
        armed = false;
        pickMode = false;
        detach();
    }

    public static boolean isArmed() {
        return armed;
    }

    private static void detach() {
        try {
            if (overlay != null && overlay.getParent() instanceof ViewGroup) {
                ((ViewGroup) overlay.getParent()).removeView(overlay);
            }
        } catch (Throwable ignored) {
        }
        overlay = null;
        surface = null;
        hintBar = null;
        toggleButton = null;
        overlayHost = null;
    }

    /** h19e8p Patches 自身の画面 (設定・結果) か。そこでは部品を選ばない。 */
    static boolean isOwnActivity(Activity activity) {
        return activity.getClass().getName().startsWith("app.morphe.extension.h19e8p.");
    }

    private static void attach(Activity activity) {
        if (!armed || activity == null || isOwnActivity(activity)) return;
        if (overlayHost == activity && overlay != null) return;

        detach();
        try {
            View decor = activity.getWindow().getDecorView();
            if (!(decor instanceof ViewGroup)) return;

            FrameLayout root = new FrameLayout(activity);
            PickerSurface pickerSurface = new PickerSurface(activity, decor, root);
            root.addView(pickerSurface, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            View bar = buildHintBar(activity);
            root.addView(bar);

            Button toggle = OverlayButtons.createDraggable(activity, root, 96, () -> setPickMode(!pickMode));
            root.addView(toggle);

            ((ViewGroup) decor).addView(root, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            overlay = root;
            surface = pickerSurface;
            hintBar = bar;
            toggleButton = toggle;
            overlayHost = activity;
            applyMode();
        } catch (Throwable ex) {
            detach();
        }
    }

    private static void setPickMode(boolean enabled) {
        pickMode = enabled;
        applyMode();
    }

    private static void applyMode() {
        if (surface == null || hintBar == null || toggleButton == null) return;
        // FrameLayout の子は GONE だとタッチを受け取らないので、操作モードでは X の操作を一切邪魔しない。
        surface.setVisibility(pickMode ? View.VISIBLE : View.GONE);
        hintBar.setVisibility(pickMode ? View.VISIBLE : View.GONE);
        toggleButton.setText(pickMode ? Text.of("操作", "Navigate") : Text.of("選択", "Pick"));
    }

    private static View buildHintBar(Context context) {
        LinearLayout bar = new LinearLayout(context);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setBackgroundColor(0xE6000000);
        int pad = OverlayButtons.dp(context, 12);
        // ステータスバーの下に出す。
        bar.setPadding(pad, pad + statusBarHeight(context), pad, pad);

        TextView hint = new TextView(context);
        hint.setText(Text.of("要素を押したまま動かし、離すと選択します",
                "Press and drag over the element, release to select"));
        hint.setTextColor(Color.WHITE);
        bar.addView(hint, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Button cancel = new Button(context);
        cancel.setAllCaps(false);
        cancel.setText(Text.of("終了", "Stop"));
        cancel.setOnClickListener(v -> disarm());
        bar.addView(cancel, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.gravity = Gravity.TOP;
        bar.setLayoutParams(lp);
        return bar;
    }

    private static int statusBarHeight(Context context) {
        int id = context.getResources().getIdentifier("status_bar_height", "dimen", "android");
        return id > 0 ? context.getResources().getDimensionPixelSize(id) : 0;
    }

    /** 画面全体のタッチを受け取り、指の下の部品を囲んで見せる面。 */
    private static final class PickerSurface extends View {
        private final View decor;
        private final View self;
        private final Paint fill = new Paint();
        private final Paint stroke = new Paint();
        private final Rect highlight = new Rect();
        private final int[] location = new int[2];
        private View picked;

        PickerSurface(Context context, View decor, View overlayRoot) {
            super(context);
            this.decor = decor;
            this.self = overlayRoot;
            fill.setColor(0x330099FF);
            stroke.setColor(0xFF0099FF);
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setStrokeWidth(OverlayButtons.dp(context, 2));
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            int x = (int) event.getRawX();
            int y = (int) event.getRawY();
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                case MotionEvent.ACTION_MOVE:
                    picked = findDeepest(decor, x, y, self);
                    updateHighlight();
                    invalidate();
                    return true;
                case MotionEvent.ACTION_UP:
                    View target = picked;
                    picked = null;
                    highlight.setEmpty();
                    invalidate();
                    if (target != null) commit(target);
                    return true;
                default:
                    return true;
            }
        }

        private void updateHighlight() {
            if (picked == null) {
                highlight.setEmpty();
                return;
            }
            picked.getLocationOnScreen(location);
            int[] mine = new int[2];
            getLocationOnScreen(mine);
            int left = location[0] - mine[0];
            int top = location[1] - mine[1];
            highlight.set(left, top, left + picked.getWidth(), top + picked.getHeight());
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            if (!highlight.isEmpty()) {
                canvas.drawRect(highlight, fill);
                canvas.drawRect(highlight, stroke);
            }
        }
    }

    /** その点を含む、いちばん手前に見えている部品。重ねた面そのものは除く。 */
    private static View findDeepest(View root, int x, int y, View exclude) {
        if (root == null || root == exclude) return null;
        if (root.getVisibility() != View.VISIBLE) return null;

        int[] loc = new int[2];
        root.getLocationOnScreen(loc);
        if (x < loc[0] || y < loc[1] || x > loc[0] + root.getWidth() || y > loc[1] + root.getHeight()) {
            return null;
        }
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            // 後の子ほど手前に描かれるので、後ろから探す。
            for (int i = group.getChildCount() - 1; i >= 0; i--) {
                View hit = findDeepest(group.getChildAt(i), x, y, exclude);
                if (hit != null) return hit;
            }
        }
        return root;
    }

    private static void commit(View view) {
        Activity host = overlayHost;
        // 始めたままにしておく。結果の画面から戻るとボタンがすぐ出て、設定画面を通らずに次を選べる。
        pickMode = false;
        detach();
        if (host == null) return;
        Intent intent = new Intent(host, FlagResultsActivity.class);
        intent.putExtra(FlagResultsActivity.EXTRA_MODE, FlagResultsActivity.MODE_PICKER);
        intent.putExtra(EXTRA_CLASS, view.getClass().getName());
        intent.putExtra(EXTRA_ID_NAME, idNameOf(view));
        intent.putExtra(EXTRA_TEXT, textOf(view));
        intent.putExtra(EXTRA_ANCESTORS, ancestorsOf(view));
        host.startActivity(intent);
    }

    static String idNameOf(View view) {
        try {
            if (view.getId() == View.NO_ID) return null;
            return view.getResources().getResourceEntryName(view.getId());
        } catch (Throwable ex) {
            return null;
        }
    }

    private static String textOf(View view) {
        try {
            if (view instanceof TextView) {
                CharSequence text = ((TextView) view).getText();
                if (text != null && text.length() > 0) return text.toString();
            }
            CharSequence description = view.getContentDescription();
            if (description != null && description.length() > 0) return description.toString();
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String[] ancestorsOf(View view) {
        List<String> chain = new ArrayList<>();
        try {
            ViewGroup parent = view.getParent() instanceof ViewGroup ? (ViewGroup) view.getParent() : null;
            while (parent != null && chain.size() < 8) {
                String idName = idNameOf(parent);
                chain.add(parent.getClass().getName() + (idName != null ? "  #" + idName : ""));
                parent = parent.getParent() instanceof ViewGroup ? (ViewGroup) parent.getParent() : null;
            }
        } catch (Throwable ignored) {
        }
        return chain.toArray(new String[0]);
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
