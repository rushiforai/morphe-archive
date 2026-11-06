package app.ayufa.extension.simeji;

import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

/**
 * The "Ayufaパッチ設定" screen for Simeji, styled after the app's own
 * settings screens: a full-screen white page with a back-arrow header,
 * hairline-separated rows and switches tinted with the app's accent
 * colour. Shown as a dialog because the extension manifest is not
 * merged by the patcher, so a real activity cannot be declared. All
 * switches write through {@link SimejiSettings} immediately, so
 * changes apply without re-patching.
 */
public final class SimejiSettingsUi {

    private static final int TEXT_PRIMARY = 0xFF333333;
    private static final int TEXT_SECONDARY = 0xFF999999;
    private static final int DIVIDER = 0xFFE6E6E6;
    private static final int ACCENT = 0xFFEE5544;

    private static final class Row {
        final String key;
        final String title;
        final String description;

        Row(String key, String title, String description) {
            this.key = key;
            this.title = title;
            this.description = description;
        }
    }

    private static final Row[] ROWS = {
            new Row(SimejiSettings.KEY_HIDE_ADS,
                    "広告を非表示",
                    "候補欄・ストア入口・Webキャンペーンの広告を出しません"),
            new Row(SimejiSettings.KEY_BLOCK_REWARDED_ADS,
                    "リワード広告もブロック",
                    "広告の視聴で解放される機能（お試し等）は使えなくなります"),
            new Row(SimejiSettings.KEY_HIDE_PROMOTIONS,
                    "プロモーションを非表示",
                    "全画面のキャンペーン・宣伝ページを開きません"),
            new Row(SimejiSettings.KEY_BLOCK_VIP_GUIDE,
                    "VIP案内画面をブロック",
                    "この画面は購入画面も兼ねるため、アプリ内での契約もできなくなります"),
            new Row(SimejiSettings.KEY_DISABLE_PUSH_POPUPS,
                    "プッシュポップアップを無効化",
                    "プッシュ通知のポップアップだけを止めます（通常の通知は影響なし）"),
            new Row(SimejiSettings.KEY_SKIP_SUBSCRIPTION_RETENTION,
                    "解約時の引き止め画面をスキップ",
                    "VIP解約時の確認画面を飛ばして解約フローへ進みます"),
            new Row(SimejiSettings.KEY_DISABLE_ANALYTICS,
                    "解析レポートを無効化",
                    "利用状況イベントの送信を止めます"),
            new Row(SimejiSettings.KEY_HIDE_POINT_ENTRY,
                    "ポイント入口を非表示",
                    "ポイントストアへの入口を出しません"),
            new Row(SimejiSettings.KEY_DISABLE_REVIEW_PROMPTS,
                    "レビュー依頼を無効化",
                    "Google Play の評価依頼ダイアログを出しません"),
            new Row(SimejiSettings.KEY_HIDE_AI_ASSISTANT,
                    "AIアシスタントを非表示",
                    "キーボード右上のロボットと、一番上の帯そのものを消します"),
            new Row(SimejiSettings.KEY_SPOOF_VIP,
                    "VIPを偽装",
                    "端末内のVIP判定だけを有効にします。ツールバーのカスタマイズや"
                            + "自作きせかえのVIPパーツが使えるようになりますが、"
                            + "クラウド系の特典は使えません"),
    };

    private SimejiSettingsUi() {
    }

    /** Opens the settings as a full-screen, stock-styled dialog page. */
    public static void show(final Context context) {
        SimejiSettings.init(context);
        try {
            final Dialog dialog = new Dialog(
                    context, android.R.style.Theme_Material_Light_NoActionBar);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            dialog.setContentView(buildPage(context, new Runnable() {
                @Override
                public void run() {
                    dialog.dismiss();
                }
            }));
            Window window = dialog.getWindow();
            if (window != null) {
                window.setLayout(WindowManager.LayoutParams.MATCH_PARENT,
                        WindowManager.LayoutParams.MATCH_PARENT);
                window.setBackgroundDrawable(
                        new android.graphics.drawable.ColorDrawable(Color.WHITE));
            }
            dialog.show();
        } catch (Throwable ignored) {
            // Never crash the host app because of the settings UI.
        }
    }

    private static View buildPage(final Context context, final Runnable onBack) {
        float density = context.getResources().getDisplayMetrics().density;

        LinearLayout page = new LinearLayout(context);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(Color.WHITE);

        // Header: back arrow + centred title, like the stock screens.
        LinearLayout header = new LinearLayout(context);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        int headerPad = (int) (8 * density);
        header.setPadding(headerPad, headerPad, headerPad, headerPad);

        TextView back = new TextView(context);
        back.setText("‹");
        back.setTextSize(30);
        back.setTextColor(TEXT_PRIMARY);
        back.setGravity(Gravity.CENTER);
        int backSize = (int) (44 * density);
        back.setLayoutParams(new LinearLayout.LayoutParams(backSize, backSize));
        back.setClickable(true);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                onBack.run();
            }
        });
        header.addView(back);

        TextView title = new TextView(context);
        title.setText("Ayufaパッチ設定");
        title.setTextSize(17);
        title.setTextColor(TEXT_PRIMARY);
        title.setGravity(Gravity.CENTER);
        title.setTypeface(null, android.graphics.Typeface.BOLD);
        header.addView(title, new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        // Spacer balancing the back button so the title stays centred.
        View spacer = new View(context);
        spacer.setLayoutParams(new LinearLayout.LayoutParams(backSize, backSize));
        header.addView(spacer);

        page.addView(header);
        page.addView(hairline(context, 0));

        ScrollView scroller = new ScrollView(context);
        scroller.addView(createContentView(context));
        page.addView(scroller, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f));
        return page;
    }

    private static View hairline(Context context, int leftInsetDp) {
        float density = context.getResources().getDisplayMetrics().density;
        View line = new View(context);
        line.setBackgroundColor(DIVIDER);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, Math.max(1, (int) density));
        params.leftMargin = (int) (leftInsetDp * density);
        line.setLayoutParams(params);
        return line;
    }

    /** The settings list itself, in the stock rows-and-dividers style. */
    public static View createContentView(final Context context) {
        SimejiSettings.init(context);
        float density = context.getResources().getDisplayMetrics().density;
        int padH = (int) (16 * density);
        int padV = (int) (14 * density);

        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(Color.WHITE);

        for (final Row row : ROWS) {
            LinearLayout line = new LinearLayout(context);
            line.setOrientation(LinearLayout.HORIZONTAL);
            line.setGravity(Gravity.CENTER_VERTICAL);
            line.setPadding(padH, padV, padH, padV);
            line.setClickable(true);

            LinearLayout texts = new LinearLayout(context);
            texts.setOrientation(LinearLayout.VERTICAL);
            TextView title = new TextView(context);
            title.setText(row.title);
            title.setTextSize(15);
            title.setTextColor(TEXT_PRIMARY);
            texts.addView(title);
            if (row.description != null && row.description.length() > 0) {
                TextView description = new TextView(context);
                description.setText(row.description);
                description.setTextSize(12);
                description.setTextColor(TEXT_SECONDARY);
                description.setPadding(0, (int) (3 * density), 0, 0);
                texts.addView(description);
            }
            line.addView(texts, new LinearLayout.LayoutParams(
                    0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

            final Switch toggle = new Switch(context);
            toggle.setChecked(SimejiSettings.isOn(row.key));
            tintSwitch(toggle);
            toggle.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton button, boolean checked) {
                    SimejiSettings.set(context, row.key, checked);
                }
            });
            line.addView(toggle);

            line.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    toggle.toggle();
                }
            });

            root.addView(line);
            root.addView(hairline(context, 16));
        }

        TextView note = new TextView(context);
        note.setText("変更は即時反映されます。キーボード表示中に切り替えた場合は、"
                + "次にキーボードを開いたときから反映されます。");
        note.setTextSize(12);
        note.setTextColor(TEXT_SECONDARY);
        note.setPadding(padH, padV, padH, padV);
        root.addView(note);

        return root;
    }

    private static void tintSwitch(Switch toggle) {
        try {
            int[][] states = new int[][]{
                    new int[]{android.R.attr.state_checked},
                    new int[]{}
            };
            toggle.setThumbTintList(new ColorStateList(
                    states, new int[]{ACCENT, 0xFFF8F8F8}));
            toggle.setTrackTintList(new ColorStateList(
                    states, new int[]{0x5BEE5544, 0xFFD9D9D9}));
        } catch (Throwable ignored) {
            // Older runtimes keep the default switch colours.
        }
    }
}
