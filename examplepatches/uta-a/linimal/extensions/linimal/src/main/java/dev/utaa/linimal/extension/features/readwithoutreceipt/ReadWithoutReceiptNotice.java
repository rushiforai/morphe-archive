package dev.utaa.linimal.extension.features.readwithoutreceipt;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Insets;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;

import dev.utaa.linimal.extension.config.LinimalConfig;
import dev.utaa.linimal.extension.settings.ui.LinimalPalette;
import dev.utaa.linimal.extension.i18n.LinimalText;

/** 確定済み閲覧セッションの案内と全体既読ボタン。公式画面と重ならない余白を確保します。 */
final class ReadWithoutReceiptNotice {
    private static final String MESSAGE = "現在、既読は無効です。メッセージを送信すると既読になります";
    private static final String KEEP_UNREAD_MESSAGE = "現在、既読は無効です。送信しても既読はつきません";
    // LINE 26.11.0 の chat_ui_history_main → chat_ui_input_area のルート。
    private static final int COMPOSER_ID = 0x7f0b0731; // chat_ui_message
    // ヘッダー直下の本文コンテナと、その中のメッセージ一覧。
    private static final int HISTORY_BODY_ID = 0x7f0b0728;
    private static final int MESSAGE_LIST_ID = 0x7f0b0925; // chathistory_message_list

    private long pendingToken;
    private WeakReference<Activity> owner;
    private WeakReference<FrameLayout> decor;
    private final ListHeightFollower heightFollower = new ListHeightFollower();
    private LinearLayout notice;
    private TextView messageText;
    private Button markAll;
    private String chatId;
    private WeakReference<View> messageList;
    private WeakReference<View> composerAnchor;
    private int originalListBottom;
    private int appliedListBottom;
    private Configuration configuration;
    private final Rect visibleFrame = new Rect();
    private final Rect composerBounds = new Rect();
    private final Rect windowBounds = new Rect();
    private int metricsWidth = -1;
    private int metricsHeight;
    private int metricsX;
    private int metricsY;
    private final int[] location = new int[2];
    private final Runnable show = this::showPending;
    private final ViewTreeObserver.OnPreDrawListener checkSession = () -> {
        try {
            Activity activity = owner == null ? null : owner.get();
            if (!isCurrent(activity, pendingToken)) {
                dismiss();
            } else if (configuration != null
                    && !configuration.equals(activity.getResources().getConfiguration())) {
                onResumed(activity);
            } else if (messageText != null) {
                String message = currentMessage();
                if (!message.contentEquals(messageText.getText())) {
                    messageText.setText(message);
                }
                markAll.setEnabled(ReadWithoutReceiptManualHooks.isReady(activity));
                positionMarkAll(activity);
                reserveMarkAllSpace(activity);
                followListHeight();
            }
        } catch (Throwable ignored) {
            dismiss();
        }
        return true;
    };

    void onResumed(Activity activity) {
        try {
            dismiss();
            if (activity == null) {
                return;
            }
            long token = ReadWithoutReceiptHooks.sessionTokenFor(activity);
            if (token == 0L) {
                return;
            }
            View root = activity.getWindow().getDecorView();
            if (!(root instanceof FrameLayout)) {
                return;
            }
            owner = new WeakReference<>(activity);
            decor = new WeakReference<>((FrameLayout) root);
            pendingToken = token;
            // resume の処理が終わり、LINE の画面が用意されてから所有者を再検証します。
            if (!root.post(show)) {
                dismiss();
            }
        } catch (Throwable ignored) {
            dismiss();
        }
    }

    void onHidden(Activity activity) {
        if (owner != null && owner.get() == activity) {
            dismiss();
        }
    }

    private boolean isCurrent(Activity activity, long token) {
        return activity != null && token != 0L
                && ReadWithoutReceiptHooks.sessionTokenFor(activity) == token
                && chatId != null && ReadWithoutReceiptHooks.shouldBlockMarkAsRead(chatId);
    }

    private void showPending() {
        try {
            Activity activity = owner == null ? null : owner.get();
            FrameLayout root = decor == null ? null : decor.get();
            if (activity == null || root == null || !root.isAttachedToWindow()
                    || activity.isFinishing() || activity.isDestroyed()) {
                dismiss();
                return;
            }
            Bundle extras = activity.getIntent().getExtras();
            Object request = extras == null ? null : extras.getParcelable("chatHistoryRequest");
            chatId = ReadWithoutReceiptHooks.chatIdFromRequest(request);
            if (!isCurrent(activity, pendingToken)) {
                dismiss();
                return;
            }
            View body = activity.findViewById(HISTORY_BODY_ID);
            if (!(body instanceof ViewGroup)) {
                dismiss();
                return;
            }
            View first = ((ViewGroup) body).getChildAt(0);
            if (!(first instanceof LinearLayout)
                    || ((LinearLayout) first).getOrientation() != LinearLayout.VERTICAL) {
                dismiss();
                return;
            }
            LinearLayout host = (LinearLayout) first;
            LinimalPalette palette = LinimalPalette.of(activity);
            configuration = new Configuration(activity.getResources().getConfiguration());
            LinearLayout panel = new LinearLayout(activity);
            notice = panel;
            panel.setOrientation(LinearLayout.VERTICAL);
            panel.setPadding(dp(root, 16), dp(root, 4), dp(root, 16), dp(root, 4));
            TextView text = new TextView(activity);
            messageText = text;
            text.setText(currentMessage());
            text.setTextSize(14);
            text.setTextColor(palette.primaryText);
            text.setGravity(Gravity.START);
            text.setPadding(0, dp(root, 4), 0, dp(root, 4));
            text.setLineSpacing(dp(root, 3), 1f);
            text.setClickable(false);
            text.setFocusable(false);
            text.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
            text.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            panel.addView(text);
            Button button = new Button(activity);
            markAll = button;
            button.setText(LinimalText.t("すべて既読にする"));
            button.setTextSize(14);
            button.setTextColor(new ColorStateList(
                    new int[][] {new int[] {android.R.attr.state_enabled}, new int[0]},
                    new int[] {palette.primaryText, palette.disabledText}));
            // 端末がダークでも LINE の Activity theme は明色になり得るため両方を明示します。
            button.setBackgroundTintList(ColorStateList.valueOf(palette.background));
            GradientDrawable pill = new GradientDrawable();
            pill.setColor(palette.background);
            pill.setCornerRadius(dp(root, 32));
            pill.setStroke(dp(root, 1), palette.divider);
            button.setBackground(pill);
            button.setElevation(dp(root, 6));
            button.setAllCaps(false);
            button.setSingleLine(false);
            button.setMaxLines(Integer.MAX_VALUE);
            button.setEllipsize(null);
            button.setGravity(Gravity.CENTER);
            button.setPadding(dp(root, 20), dp(root, 10), dp(root, 20), dp(root, 10));
            button.setMinHeight(dp(root, 48));
            button.setMinimumHeight(dp(root, 48));
            button.setVisibility(View.INVISIBLE);
            button.setEnabled(ReadWithoutReceiptManualHooks.isReady(activity));
            final long token = pendingToken;
            button.setOnClickListener(view -> {
                if (isCurrent(activity, token)
                        && ReadWithoutReceiptManualHooks.isReady(activity)) {
                    ReadWithoutReceiptManualHooks.markAll(activity);
                }
            });
            GradientDrawable background = new GradientDrawable();
            background.setColor(palette.background);
            background.setCornerRadius(dp(root, 10));
            background.setStroke(dp(root, 1), palette.divider);
            panel.setBackground(background);
            panel.setElevation(dp(root, 6));

            LinearLayout.LayoutParams layout = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            int margin = dp(root, 16);
            layout.setMargins(margin, dp(root, 8), margin, dp(root, 8));
            // 本文の縦レイアウトに入れ、Window 全体やヘッダーの余白は変更しません。
            host.addView(panel, 0, layout);
            root.addView(button, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.TOP | Gravity.LEFT));
            root.getViewTreeObserver().addOnPreDrawListener(checkSession);
            // 送信などで token が消えた場合は、次の描画より前に案内も取り除きます。
            if (!isCurrent(activity, pendingToken)) {
                dismiss();
                return;
            }
        } catch (Throwable ignored) {
            // 案内の失敗では抑制状態を変更せず、公式画面の操作を続けます。
            dismiss();
        }
    }

    private void reserveMarkAllSpace(Activity activity) {
        View list = messageList == null ? null : messageList.get();
        if (list == null || !list.isAttachedToWindow()) {
            restoreMarkAllSpace();
            heightFollower.reset();
            list = activity.findViewById(MESSAGE_LIST_ID);
            if (list == null) {
                return;
            }
            messageList = new WeakReference<>(list);
            originalListBottom = list.getPaddingBottom();
            appliedListBottom = originalListBottom;
        }
        int padding = originalListBottom;
        if (markAll != null && markAll.getVisibility() == View.VISIBLE && list.isShown()) {
            list.getLocationOnScreen(location);
            int listBottom = location[1] + list.getHeight();
            markAll.getLocationOnScreen(location);
            padding = Math.max(padding, listBottom - location[1] + dp(list, 8));
        }
        if (padding != appliedListBottom) {
            appliedListBottom = padding;
            // 一覧の末尾をボタンより上までスクロールできるようにし、入力欄は動かしません。
            list.setPadding(list.getPaddingLeft(), list.getPaddingTop(), list.getPaddingRight(), padding);
        }
    }

    /** キーボードや入力欄の拡大で一覧が縮んだ分だけ送り、表示中のメッセージを隠しません。 */
    private void followListHeight() {
        View list = messageList == null ? null : messageList.get();
        if (list == null || !list.isShown()) {
            return;
        }
        int distance = heightFollower.onHeight(list.getHeight());
        if (distance > 0) {
            list.scrollBy(0, distance);
        }
    }

    private void restoreMarkAllSpace() {
        View list = messageList == null ? null : messageList.get();
        messageList = null;
        if (list != null && list.getPaddingBottom() == appliedListBottom) {
            list.setPadding(list.getPaddingLeft(), list.getPaddingTop(),
                    list.getPaddingRight(), originalListBottom);
        }
    }

    private void positionMarkAll(Activity activity) {
        FrameLayout root = decor == null ? null : decor.get();
        Button button = markAll;
        View composer = composerAnchor == null ? null : composerAnchor.get();
        if (composer == null || !composer.isAttachedToWindow()) {
            composer = activity.findViewById(COMPOSER_ID);
            composerAnchor = composer == null ? null : new WeakReference<>(composer);
        }
        if (root == null || button == null) {
            return;
        }
        // アンカーを確認できない画面では公式入力欄の位置を推測しません。
        if (composer == null || !composer.isShown() || composer.getHeight() == 0
                || !composer.getGlobalVisibleRect(composerBounds)) {
            button.setVisibility(View.INVISIBLE);
            return;
        }
        root.getWindowVisibleDisplayFrame(visibleFrame);
        root.getLocationOnScreen(location);
        int rootX = location[0];
        int rootY = location[1];
        int left = Math.max(0, visibleFrame.left - rootX);
        int top = Math.max(0, visibleFrame.top - rootY);
        int right = Math.min(root.getWidth(), visibleFrame.right - rootX);
        int bottom = Math.min(root.getHeight(), visibleFrame.bottom - rootY);
        WindowInsets insets = root.getRootWindowInsets();
        if (insets != null) {
            if (Build.VERSION.SDK_INT >= 30) {
                Insets safe = insets.getInsets(WindowInsets.Type.systemBars()
                        | WindowInsets.Type.displayCutout() | WindowInsets.Type.ime());
                // adjustResize 済みの decor 高さから IME 高さを二重に引かず、
                // 分割画面も含め Window 自体の画面座標から安全範囲を求めます。
                if (metricsWidth != root.getWidth() || metricsHeight != root.getHeight()
                        || metricsX != rootX || metricsY != rootY) {
                    windowBounds.set(activity.getWindowManager().getCurrentWindowMetrics().getBounds());
                    metricsWidth = root.getWidth();
                    metricsHeight = root.getHeight();
                    metricsX = rootX;
                    metricsY = rootY;
                }
                left = Math.max(left, windowBounds.left - rootX + safe.left);
                top = Math.max(top, windowBounds.top - rootY + safe.top);
                right = Math.min(right, windowBounds.right - rootX - safe.right);
                bottom = Math.min(bottom, windowBounds.bottom - rootY - safe.bottom);
            } else {
                left = Math.max(left, insets.getSystemWindowInsetLeft());
                top = Math.max(top, insets.getSystemWindowInsetTop());
                right = Math.min(right, root.getWidth() - insets.getSystemWindowInsetRight());
                bottom = Math.min(bottom, root.getHeight() - insets.getSystemWindowInsetBottom());
                if (Build.VERSION.SDK_INT >= 28 && insets.getDisplayCutout() != null) {
                    left = Math.max(left, insets.getDisplayCutout().getSafeInsetLeft());
                    top = Math.max(top, insets.getDisplayCutout().getSafeInsetTop());
                    right = Math.min(right,
                            root.getWidth() - insets.getDisplayCutout().getSafeInsetRight());
                    bottom = Math.min(bottom,
                            root.getHeight() - insets.getDisplayCutout().getSafeInsetBottom());
                }
            }
        }
        int margin = dp(root, 12);
        left += margin;
        right -= margin;
        composer.getLocationOnScreen(location);
        bottom = Math.min(bottom, location[1] - rootY) - dp(root, 8);
        if (notice != null) {
            notice.getLocationOnScreen(location);
            top = Math.max(top, location[1] - rootY + notice.getHeight() + dp(root, 8));
        }
        int availableWidth = right - left;
        if (availableWidth <= 0) {
            button.setVisibility(View.INVISIBLE);
            return;
        }
        if (button.getMaxWidth() != availableWidth) {
            button.setMaxWidth(availableWidth);
        }
        FrameLayout.LayoutParams layout = (FrameLayout.LayoutParams) button.getLayoutParams();
        // 幅だけを制約し、文字拡大時は省略せず折り返して高さを増やします。
        if (layout.leftMargin != left || layout.rightMargin != root.getWidth() - right) {
            layout.leftMargin = left;
            layout.rightMargin = root.getWidth() - right;
            button.setLayoutParams(layout);
        }
        int height = button.getHeight();
        if (button.isLayoutRequested() || height < dp(root, 48)
                || button.getWidth() > availableWidth || bottom - height < top) {
            button.setVisibility(View.INVISIBLE);
            return;
        }
        boolean rtl = root.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
        button.setX(rtl ? left : right - button.getWidth());
        button.setY(bottom - height);
        button.setVisibility(View.VISIBLE);
    }

    private void dismiss() {
        FrameLayout root = decor == null ? null : decor.get();
        LinearLayout previous = notice;
        Button previousButton = markAll;
        try {
            restoreMarkAllSpace();
        } catch (Throwable ignored) {
            // Window の破棄中でも、残りの参照と listener は解放します。
        }
        owner = null;
        decor = null;
        notice = null;
        messageText = null;
        markAll = null;
        configuration = null;
        composerAnchor = null;
        metricsWidth = -1;
        chatId = null;
        pendingToken = 0L;
        if (root == null) {
            return;
        }
        try {
            // Window の破棄中に removeView が失敗してもクリック参照は残しません。
            if (previousButton != null) {
                previousButton.setOnClickListener(null);
            }
            root.removeCallbacks(show);
            ViewTreeObserver observer = root.getViewTreeObserver();
            if (observer.isAlive()) {
                observer.removeOnPreDrawListener(checkSession);
            }
            if (previous != null) {
                if (previous.getParent() instanceof ViewGroup) {
                    ((ViewGroup) previous.getParent()).removeView(previous);
                }
            }
            if (previousButton != null) {
                root.removeView(previousButton);
            }
        } catch (Throwable ignored) {
            // 破棄中の Window から案内を外せなくても、Activity の参照は残しません。
        }
    }

    private static String currentMessage() {
        return LinimalText.t(LinimalConfig.get().isKeepUnreadAfterSendEnabled() ? KEEP_UNREAD_MESSAGE : MESSAGE);
    }

    private static int dp(View view, int value) {
        return Math.round(value * view.getResources().getDisplayMetrics().density);
    }
}
