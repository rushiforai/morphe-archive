/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Bundle;
import android.preference.Preference;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.telegram.misc.ProxyOrder;

/**
 * The editor for {@link ProxyOrder} (#71): Telegram's saved proxies, each with a handle to drag it
 * by and a Pin button. Every change is kept as it's made, so Done only closes. A pinned proxy stays
 * with the pinned ones on top, and one that isn't stays below them. A screen reader gets Move up,
 * Move down and Pin or Unpin as actions on each proxy instead of the drag.
 */
final class ProxyOrderEditor {
    static final String KEY = "action_proxy_order";
    /** Tags on each proxy's line and its Pin button, for tests and the device check. */
    static final String ITEM = "hushtelegram_proxy_order_item";
    static final String PIN = "hushtelegram_proxy_order_pin";
    static final String GRIP = "hushtelegram_proxy_order_grip";

    // Outside both the standard action bits and android.R.id, so no screen reader mistakes them.
    static final int MOVE_UP = 0x7E0F0001;
    static final int MOVE_DOWN = 0x7E0F0002;
    static final int TOGGLE_PIN = 0x7E0F0003;

    private final Context context;
    private final Preference row;
    private final LinearLayout list;
    /** Whether the order goes past the pins: true once a proxy has been dragged or moved. */
    private boolean ownOrder = ProxyOrder.ownOrder();
    @Nullable private View bySpeed;
    private float downY;
    private boolean moved;

    private ProxyOrderEditor(Context context, Preference row) {
        this.context = context;
        this.row = row;
        list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);
    }

    /** Opens the editor over the settings page. The row's summary follows every change. */
    static AlertDialog open(Activity activity, Preference row) {
        Context themed = HushTelegramPreferenceFragment.themed(activity);
        ProxyOrderEditor editor = new ProxyOrderEditor(themed, row);
        List<ProxyOrder.Row> rows = ProxyOrder.rows();
        AlertDialog.Builder builder = new AlertDialog.Builder(themed)
                .setTitle(L10n.t("Proxy order"))
                .setView(editor.body(rows))
                .setPositiveButton(L10n.t("Done"), null);
        // Back to Telegram's speed order for every proxy that isn't pinned.
        if (!rows.isEmpty()) builder.setNeutralButton(L10n.t("Sort by speed"), (dialog, which) -> {
            boolean saved = ProxyOrder.save(editor.rows(), false);
            row.setSummary(ProxyOrder.summary());
            Utils.showToastShort(saved ? L10n.t("Unpinned proxies sort by speed again.")
                    : L10n.t("Couldn't save the order. Try again."));
        });
        AlertDialog dialog = builder.show();
        ScreenColors.dialog(dialog);
        editor.bySpeed = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
        editor.showBySpeed();
        return dialog;
    }

    /** Sort by speed shows only once there's an order of the person's own to undo. */
    private void showBySpeed() {
        if (bySpeed != null) bySpeed.setVisibility(ownOrder ? View.VISIBLE : View.GONE);
    }

    private View body(List<ProxyOrder.Row> rows) {
        ScrollView scroll = new ScrollView(context);
        scroll.setVerticalScrollBarEnabled(true);
        scroll.setScrollbarFadingEnabled(false);
        LinearLayout fields = new LinearLayout(context);
        fields.setOrientation(LinearLayout.VERTICAL);
        fields.setPaddingRelative(dp(20), dp(8), dp(20), dp(12));
        scroll.addView(fields, new ScrollView.LayoutParams(ScrollView.LayoutParams.MATCH_PARENT,
                ScrollView.LayoutParams.WRAP_CONTENT));
        TextView note = new TextView(context);
        note.setText(rows.isEmpty()
                ? L10n.t("Telegram's proxy list is empty. Add a proxy in Telegram's proxy settings, or find free "
                        + "proxies, then come back here.")
                : L10n.t("Drag a proxy by its handle to move it, and pin the ones you want on top. Telegram's proxy "
                        + "screen shows them in this order. Once you've moved one, proxies added later go below "
                        + "in Telegram's order."));
        note.setTextColor(ScreenColors.DEFAULT.summary);
        note.setTextSize(14);
        note.setLineSpacing(dp(2), 1);
        note.setPadding(0, 0, 0, dp(12));
        fields.addView(note);
        for (ProxyOrder.Row proxy : rows) list.addView(item(proxy));
        fields.addView(list, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));
        return scroll;
    }

    /**
     * One proxy's line: the handle, its address, whether it's in use, and Pin or Unpin. The handle
     * is left out for a screen reader, which moves the line with its actions instead.
     */
    @SuppressLint("ClickableViewAccessibility")
    private View item(ProxyOrder.Row proxy) {
        ScreenColors colors = ScreenColors.DEFAULT;
        LinearLayout item = new LinearLayout(context);
        item.setTag(proxy);
        item.setOrientation(LinearLayout.HORIZONTAL);
        item.setGravity(Gravity.CENTER_VERTICAL);
        item.setMinimumHeight(dp(56));
        item.setBackground(new ColorDrawable(colors.dialog));

        ImageView grip = new ImageView(context);
        grip.setTag(GRIP);
        grip.setImageDrawable(new Grip(colors.summary, dp(2)));
        grip.setScaleType(ImageView.ScaleType.CENTER);
        grip.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        grip.setOnTouchListener((view, event) -> drag(item, event));
        item.addView(grip, new LinearLayout.LayoutParams(dp(40), dp(48)));

        LinearLayout text = new LinearLayout(context);
        text.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams fill = new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1);
        fill.setMarginStart(dp(4));
        item.addView(text, fill);
        TextView name = new TextView(context);
        name.setText(L10n.isolate(proxy.label));
        name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        name.setTextColor(colors.title);
        name.setSingleLine(true);
        name.setEllipsize(android.text.TextUtils.TruncateAt.MIDDLE);
        text.addView(name);
        TextView state = new TextView(context);
        state.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        state.setTextColor(colors.summary);
        text.addView(state);

        TextView pin = new TextView(context);
        pin.setTag(PIN);
        pin.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        pin.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        pin.setTextColor(colors.accent);
        pin.setGravity(Gravity.CENTER);
        pin.setMinWidth(dp(64));
        pin.setMinHeight(dp(48));
        pin.setPaddingRelative(dp(12), 0, dp(12), 0);
        pin.setBackground(new RippleDrawable(ColorStateList.valueOf(ScreenColors.half(colors.accent)), null,
                new ColorDrawable(android.graphics.Color.WHITE)));
        pin.setOnClickListener(view -> togglePin(item));
        item.addView(pin, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));

        item.setScreenReaderFocusable(true);
        item.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                int at = list.indexOfChild(host);
                if (canSwap(at, at - 1)) info.addAction(new AccessibilityNodeInfo.AccessibilityAction(MOVE_UP, L10n.t("Move up")));
                if (canSwap(at, at + 1)) info.addAction(new AccessibilityNodeInfo.AccessibilityAction(MOVE_DOWN, L10n.t("Move down")));
                info.addAction(new AccessibilityNodeInfo.AccessibilityAction(TOGGLE_PIN,
                        ((ProxyOrder.Row) host.getTag()).pinned ? L10n.t("Unpin") : L10n.t("Pin")));
            }

            @Override
            public boolean performAccessibilityAction(View host, int action, Bundle arguments) {
                int at = list.indexOfChild(host);
                if (action == MOVE_UP || action == MOVE_DOWN) {
                    int to = action == MOVE_UP ? at - 1 : at + 1;
                    if (!canSwap(at, to)) return false;
                    View other = list.getChildAt(to);
                    list.removeView(other);
                    list.addView(other, at);
                    ownOrder = true;
                    changed();
                    host.post(() -> host.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
                    return true;
                }
                if (action == TOGGLE_PIN) {
                    togglePin(host);
                    return true;
                }
                return super.performAccessibilityAction(host, action, arguments);
            }
        });
        show(item);
        return item;
    }

    /** Whether the proxy at [at] can trade places with the one at [to]: both pinned, or neither. */
    private boolean canSwap(int at, int to) {
        if (at < 0 || to < 0 || at >= list.getChildCount() || to >= list.getChildCount()) return false;
        return pinned(list.getChildAt(at)) == pinned(list.getChildAt(to));
    }

    private static boolean pinned(View item) {
        return ((ProxyOrder.Row) item.getTag()).pinned;
    }

    /**
     * Follows a finger on [item]'s handle. The line under the finger stays in the list and the
     * ones it passes move around it, since taking it out would end the touch.
     */
    private boolean drag(View item, MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                // The page doesn't scroll while a proxy is being moved.
                item.getParent().requestDisallowInterceptTouchEvent(true);
                downY = event.getRawY();
                moved = false;
                item.setElevation(dp(6));
                return true;
            case MotionEvent.ACTION_MOVE: {
                float offset = event.getRawY() - downY;
                int at = list.indexOfChild(item);
                if (offset > 0 && canSwap(at, at + 1)) {
                    View next = list.getChildAt(at + 1);
                    if (offset > next.getHeight() / 2f) {
                        list.removeView(next);
                        list.addView(next, at);
                        downY += next.getHeight();
                        moved = true;
                    }
                } else if (offset < 0 && canSwap(at, at - 1)) {
                    View before = list.getChildAt(at - 1);
                    if (-offset > before.getHeight() / 2f) {
                        list.removeView(before);
                        list.addView(before, at);
                        downY -= before.getHeight();
                        moved = true;
                    }
                }
                item.setTranslationY(event.getRawY() - downY);
                return true;
            }
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                item.animate().translationY(0).setDuration(150).start();
                item.setElevation(0);
                if (moved) {
                    ownOrder = true;
                    changed();
                }
                return true;
            default:
                return false;
        }
    }

    /** Pins [item] at the end of the pinned ones, or unpins it to the top of the rest. */
    private void togglePin(View item) {
        ProxyOrder.Row proxy = (ProxyOrder.Row) item.getTag();
        proxy.pinned = !proxy.pinned;
        list.removeView(item);
        int pins = 0;
        for (int i = 0; i < list.getChildCount(); i++) if (pinned(list.getChildAt(i))) pins++;
        list.addView(item, pins);
        changed();
        Utils.showToastShort(proxy.pinned ? L10n.t("Pinned on top.") : L10n.t("Unpinned."));
    }

    /** The proxies in the order they're shown. */
    private List<ProxyOrder.Row> rows() {
        List<ProxyOrder.Row> rows = new ArrayList<>();
        for (int i = 0; i < list.getChildCount(); i++) rows.add((ProxyOrder.Row) list.getChildAt(i).getTag());
        return rows;
    }

    /** Keeps the order as it's shown now, and every line and the settings row say so. */
    private void changed() {
        if (!ProxyOrder.save(rows(), ownOrder)) Utils.showToastLong(L10n.t("Couldn't save the order. Try again."));
        for (int i = 0; i < list.getChildCount(); i++) show(list.getChildAt(i));
        row.setSummary(ProxyOrder.summary());
        showBySpeed();
    }

    /** Fills in [item]'s state line and Pin button from its proxy. */
    private static void show(View item) {
        ProxyOrder.Row proxy = (ProxyOrder.Row) item.getTag();
        LinearLayout text = (LinearLayout) ((LinearLayout) item).getChildAt(1);
        TextView state = (TextView) text.getChildAt(1);
        String said = proxy.pinned
                ? (proxy.inUse ? L10n.t("Pinned, in use") : L10n.t("Pinned"))
                : (proxy.inUse ? L10n.t("In use") : "");
        state.setText(said);
        state.setVisibility(said.isEmpty() ? View.GONE : View.VISIBLE);
        TextView pin = item.findViewWithTag(PIN);
        pin.setText(proxy.pinned ? L10n.t("Unpin") : L10n.t("Pin"));
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }

    /** Three short lines, the usual sign that a line can be dragged. */
    static final class Grip extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int thickness;

        Grip(int color, int thickness) {
            this.thickness = thickness;
            paint.setColor(color);
            paint.setStrokeWidth(thickness);
            paint.setStrokeCap(Paint.Cap.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect box = getBounds();
            float half = 8 * thickness / 2f;
            float left = box.exactCenterX() - half;
            float right = box.exactCenterX() + half;
            for (int line = -1; line <= 1; line++) {
                float y = box.exactCenterY() + line * 3 * thickness;
                canvas.drawLine(left, y, right, y, paint);
            }
        }

        @Override
        public int getIntrinsicWidth() {
            return 12 * thickness;
        }

        @Override
        public int getIntrinsicHeight() {
            return 12 * thickness;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(@Nullable ColorFilter filter) {
            paint.setColorFilter(filter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
