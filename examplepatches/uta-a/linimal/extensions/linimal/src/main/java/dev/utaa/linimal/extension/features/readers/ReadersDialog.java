package dev.utaa.linimal.extension.features.readers;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.List;

import dev.utaa.linimal.extension.config.LinimalConfig;
import dev.utaa.linimal.extension.i18n.LinimalText;
import dev.utaa.linimal.extension.settings.ui.LinimalPalette;

/**
 * 1 件のメッセージを読んだメンバーと、まだ読んでいないメンバーの一覧。
 *
 * <p>まず端末内の記録をすぐに表示し、同期の設定が ON なら LINE 自身の同期処理を 1 トーク分だけ
 * 実行してから表示し直します。LINE の theme resource は参照せず、{@link LinimalPalette} で配色します。</p>
 */
final class ReadersDialog {
    private final Context context;
    private final String chatId;
    private final long messageId;
    private final String senderMid;
    private final LinimalPalette palette;
    private final float density;
    private Dialog dialog;
    private Application.ActivityLifecycleCallbacks lifecycle;
    private TextView summary;
    private TextView status;
    private LinearLayout list;
    private int generation;

    private ReadersDialog(Context context, String chatId, long messageId, String senderMid) {
        this.context = context;
        this.chatId = chatId;
        this.messageId = messageId;
        this.senderMid = senderMid;
        this.palette = LinimalPalette.of(context);
        this.density = context.getResources().getDisplayMetrics().density;
    }

    /** 一覧を開きます。開けない状況（Activity の終了中など）では何もしません。 */
    static void show(Context context, String chatId, long messageId, String senderMid) {
        try {
            if (context == null || !ReadersChat.isMultiMemberChat(chatId)
                    || !ReadersChat.isServerMessage(messageId)) {
                return;
            }
            Activity activity = activityOf(context);
            if (activity != null && (activity.isFinishing() || activity.isDestroyed())) {
                return;
            }
            new ReadersDialog(activity != null ? activity : context, chatId, messageId, senderMid).open();
        } catch (Throwable ignored) {
            // 一覧を開けなくても LINE の操作は続けられます。
        }
    }

    private void open() {
        dialog = new Dialog(context);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setCanceledOnTouchOutside(true);
        dialog.setContentView(buildContent());
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            DisplayMetrics metrics = context.getResources().getDisplayMetrics();
            int width = Math.min(Math.round(metrics.widthPixels * 0.9f), dp(400));
            window.setLayout(width, WindowManager.LayoutParams.WRAP_CONTENT);
        }
        dialog.setOnDismissListener(shown -> unregisterLifecycle());
        registerLifecycle();
        dialog.show();
        load(false);
        if (isSyncEnabled()) {
            sync();
        }
    }

    private View buildContent() {
        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(20), dp(18), dp(20), dp(8));
        GradientDrawable background = new GradientDrawable();
        background.setColor(palette.background);
        background.setCornerRadius(dp(16));
        root.setBackground(background);

        TextView title = text(LinimalText.t("既読者"), 18, palette.primaryText);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        root.addView(title, wrap());

        summary = text("", 13, palette.secondaryText);
        LinearLayout.LayoutParams summaryParams = wrap();
        summaryParams.topMargin = dp(2);
        root.addView(summary, summaryParams);

        status = text(LinimalText.t("読み込んでいます…"), 13, palette.secondaryText);
        LinearLayout.LayoutParams statusParams = wrap();
        statusParams.topMargin = dp(8);
        root.addView(status, statusParams);

        MaxHeightScrollView scroll = new MaxHeightScrollView(context,
                Math.round(context.getResources().getDisplayMetrics().heightPixels * 0.55f));
        scroll.setVerticalScrollBarEnabled(true);
        list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(list, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout.LayoutParams scrollParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        scrollParams.topMargin = dp(4);
        root.addView(scroll, scrollParams);

        TextView note = text(LinimalText.t("LINE がこの端末に保存した既読の記録をもとに表示しています。"),
                12, palette.secondaryText);
        LinearLayout.LayoutParams noteParams = wrap();
        noteParams.topMargin = dp(12);
        root.addView(note, noteParams);

        TextView close = text(LinimalText.t("閉じる"), 15, palette.accent);
        close.setTypeface(Typeface.DEFAULT_BOLD);
        close.setGravity(Gravity.CENTER);
        close.setMinHeight(dp(48));
        close.setPadding(dp(16), 0, dp(16), 0);
        close.setOnClickListener(view -> dismiss());
        LinearLayout.LayoutParams closeParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        closeParams.gravity = Gravity.END;
        closeParams.topMargin = dp(4);
        root.addView(close, closeParams);
        return root;
    }

    private void load(boolean afterSync) {
        int requested = ++generation;
        ReadersRepository.get(context).load(
                ReadersRepository.key(chatId, messageId, "dialog#" + requested),
                chatId, messageId, senderMid, snapshot -> {
                    if (requested != generation || !isActive()) {
                        return;
                    }
                    if (snapshot == null) {
                        status.setText(LinimalText.t("既読の記録を読み取れませんでした。"));
                        status.setVisibility(View.VISIBLE);
                        return;
                    }
                    render(snapshot);
                    if (!afterSync && !isSyncEnabled()) {
                        status.setVisibility(View.GONE);
                    }
                });
    }

    private void sync() {
        status.setText(LinimalText.t("サーバーと同期しています…"));
        status.setVisibility(View.VISIBLE);
        ReadersRepository.get(context).sync(chatId, success -> {
            if (!isActive()) {
                return;
            }
            if (success) {
                status.setVisibility(View.GONE);
            } else {
                status.setText(LinimalText.t("サーバーと同期できませんでした。端末内の記録を表示しています。"));
                status.setVisibility(View.VISIBLE);
            }
            load(true);
        });
    }

    private void render(ReadersSnapshot snapshot) {
        List<ReadersSnapshot.Member> readers = snapshot.getReaders();
        List<ReadersSnapshot.Member> unread = snapshot.getUnreadMembers();
        if (snapshot.isMembersKnown()) {
            summary.setText(LinimalText.format("既読 %s・未読 %s",
                    String.valueOf(readers.size()), String.valueOf(unread.size())));
        } else {
            summary.setText(LinimalText.format("既読 %s", String.valueOf(readers.size())));
        }

        list.removeAllViews();
        addSection(LinimalText.format("既読（%s）", String.valueOf(readers.size())), readers,
                LinimalText.t("まだ誰も読んでいません。"));
        if (snapshot.isMembersKnown()) {
            addSection(LinimalText.format("未読（%s）", String.valueOf(unread.size())), unread,
                    LinimalText.t("全員が読みました。"));
        }
    }

    private void addSection(String heading, List<ReadersSnapshot.Member> members, String emptyText) {
        TextView header = text(heading, 13, palette.secondaryText);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        LinearLayout.LayoutParams headerParams = wrap();
        headerParams.topMargin = dp(14);
        headerParams.bottomMargin = dp(4);
        list.addView(header, headerParams);
        if (members.isEmpty()) {
            TextView empty = text(emptyText, 14, palette.secondaryText);
            LinearLayout.LayoutParams emptyParams = wrap();
            emptyParams.topMargin = dp(4);
            emptyParams.bottomMargin = dp(4);
            list.addView(empty, emptyParams);
            return;
        }
        for (ReadersSnapshot.Member member : members) {
            list.addView(memberRow(member), new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }
    }

    private View memberRow(ReadersSnapshot.Member member) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        // 大きい文字サイズでも名前が欠けないよう、高さは内容に合わせ、最小値だけを決めます。
        row.setMinimumHeight(dp(52));
        row.setPadding(0, dp(6), 0, dp(6));

        AvatarView avatar = new AvatarView(context, member);
        row.addView(avatar, new LinearLayout.LayoutParams(dp(36), dp(36)));

        String name = member.getDisplayName() != null
                ? member.getDisplayName() : LinimalText.t("不明なメンバー");
        TextView label = text(name, 15, member.getDisplayName() != null
                ? palette.primaryText : palette.secondaryText);
        label.setSingleLine(true);
        label.setEllipsize(android.text.TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelParams.leftMargin = dp(12);
        row.addView(label, labelParams);
        return row;
    }

    /** 表示中で、元の Activity も生きているかどうか。終わっていれば閉じます。 */
    private boolean isActive() {
        if (dialog == null || !dialog.isShowing()) {
            return false;
        }
        Activity activity = activityOf(context);
        if (activity != null && (activity.isFinishing() || activity.isDestroyed())) {
            dismiss();
            return false;
        }
        return true;
    }

    /** Activity が破棄されるときに閉じ、WindowLeaked と Activity の保持を避けます。 */
    private void registerLifecycle() {
        Activity owner = activityOf(context);
        if (owner == null) {
            return;
        }
        lifecycle = new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityDestroyed(Activity activity) {
                if (activity == owner) {
                    dismiss();
                    unregisterLifecycle();
                }
            }

            @Override
            public void onActivityCreated(Activity activity, android.os.Bundle state) {
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityResumed(Activity activity) {
            }

            @Override
            public void onActivityPaused(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, android.os.Bundle state) {
            }
        };
        owner.getApplication().registerActivityLifecycleCallbacks(lifecycle);
    }

    private void unregisterLifecycle() {
        Application.ActivityLifecycleCallbacks registered = lifecycle;
        lifecycle = null;
        Activity owner = activityOf(context);
        if (registered != null && owner != null) {
            try {
                owner.getApplication().unregisterActivityLifecycleCallbacks(registered);
            } catch (RuntimeException ignored) {
                // 登録解除に失敗しても表示には影響しません。
            }
        }
    }

    private void dismiss() {
        if (dialog != null) {
            try {
                dialog.dismiss();
            } catch (RuntimeException ignored) {
                // 既に閉じています。
            }
        }
    }

    private static boolean isSyncEnabled() {
        try {
            return LinimalConfig.get().isReadReceiptReadersServerSyncEnabled()
                    && ReadReceiptReadersBridge.isSyncAvailable();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private TextView text(String value, int sp, int color) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        return view;
    }

    private static LinearLayout.LayoutParams wrap() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private int dp(float value) {
        return Math.round(value * density);
    }

    private static Activity activityOf(Context context) {
        Context current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) {
                return (Activity) current;
            }
            current = ((ContextWrapper) current).getBaseContext();
        }
        return null;
    }

    /** 画面の高さに対する上限を超えない ScrollView。 */
    private static final class MaxHeightScrollView extends ScrollView {
        private final int maxHeight;

        MaxHeightScrollView(Context context, int maxHeight) {
            super(context);
            this.maxHeight = maxHeight;
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            super.onMeasure(widthMeasureSpec,
                    MeasureSpec.makeMeasureSpec(maxHeight, MeasureSpec.AT_MOST));
        }
    }

    /** 1 人分の丸いアバター。画像は取得でき次第差し替えます。 */
    private static final class AvatarView extends View {
        private final AvatarPainter painter = new AvatarPainter();
        private final ReadersSnapshot.Member member;
        private Bitmap bitmap;

        AvatarView(Context context, ReadersSnapshot.Member member) {
            super(context);
            this.member = member;
            bitmap = ReaderAvatars.get().request(member.getPicturePath(), (path, loaded) -> {
                bitmap = loaded;
                invalidate();
            });
            setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float radius = Math.min(getWidth(), getHeight()) / 2f;
            painter.draw(canvas, getWidth() / 2f, getHeight() / 2f, radius, bitmap,
                    member.getDisplayName(), member.getMid(), 0f, 0);
        }
    }
}
