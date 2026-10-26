package dev.goodlight999.taobaolingo.overlay;

import android.app.Activity;
import android.app.NotificationManager;
import android.content.Intent;
import android.content.Context;
import android.media.projection.MediaProjectionManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Build;
import android.provider.Settings;
import android.graphics.Color;
import android.view.Gravity;
import android.view.View;
import android.widget.*;
import android.graphics.Typeface;
import android.view.WindowManager;

public final class MainActivity extends Activity {
    private static final int CAPTURE_REQUEST = 2101;
    private Spinner language;
    private TextView status;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().setStatusBarColor(Color.WHITE);
        getWindow().setNavigationBarColor(Color.WHITE);
        getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        LinearLayout main = new LinearLayout(this);
        main.setOrientation(LinearLayout.VERTICAL);
        main.setPadding(dp(22), dp(35), dp(22), dp(24));
        main.setBackgroundColor(Color.WHITE);
        TextView title = new TextView(this);
        title.setText("TaobaoLingo");
        title.setTextSize(29);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(Color.BLACK);
        main.addView(title);

        TextView subtitle = text("Taobaoを改造せず、画面上の中国語を翻訳します。\nスクリーンショットは保存・送信しません。", 15);
        LinearLayout.LayoutParams sp = new LinearLayout.LayoutParams(-1, -2);
        sp.topMargin = dp(14);
        main.addView(subtitle, sp);

        TextView label = text("翻訳先", 15);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2);
        lp.topMargin = dp(28);
        main.addView(label, lp);

        language = new Spinner(this);
        ArrayAdapter<String> options = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item,
                new String[]{"日本語", "English"});
        options.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        language.setAdapter(options);
        main.addView(language);

        Button start = new Button(this);
        start.setText("画面翻訳を開始");
        LinearLayout.LayoutParams bp = new LinearLayout.LayoutParams(-1, dp(52));
        bp.topMargin = dp(25);
        main.addView(start, bp);
        start.setOnClickListener(v -> begin());

        Button stop = new Button(this);
        stop.setText("翻訳を停止");
        main.addView(stop, new LinearLayout.LayoutParams(-1, dp(52)));
        stop.setOnClickListener(v -> {
            Intent i = new Intent(this, CaptureService.class);
            i.setAction(CaptureService.ACTION_STOP);
            startService(i);
            status.setText("停止を要求しました");
        });

        status = text("待機中", 14);
        LinearLayout.LayoutParams tp = new LinearLayout.LayoutParams(-1, -2);
        tp.topMargin = dp(20);
        main.addView(status, tp);

        TextView help = text("初回のみ、重ねて表示・画面共有・翻訳モデルの取得を許可してください。\n" +
            "起動後はTaobaoへ切り替えてお使いください。画面保護された領域は翻訳できません。", 13);
        LinearLayout.LayoutParams hp = new LinearLayout.LayoutParams(-1, -2);
        hp.topMargin = dp(28);
        main.addView(help, hp);
        setContentView(main);
    }

    private TextView text(String value, int size) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextColor(0xff373737);
        view.setTextSize(size);
        view.setLineSpacing(dp(4), 1.08f);
        return view;
    }
    private int dp(int v) { return Math.round(v * getResources().getDisplayMetrics().density); }

    private void begin() {
        if (!Settings.canDrawOverlays(this)) {
            status.setText("「他のアプリの上に重ねて表示」を許可してから、もう一度開始してください");
            Intent i = new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                    Uri.parse("package:" + getPackageName()));
            startActivity(i);
            return;
        }
        status.setText("Androidの画面共有許可を確認中");
        MediaProjectionManager mgr = (MediaProjectionManager)
                getSystemService(Context.MEDIA_PROJECTION_SERVICE);
        startActivityForResult(mgr.createScreenCaptureIntent(), CAPTURE_REQUEST);
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != CAPTURE_REQUEST) return;
        if (result != RESULT_OK || data == null) {
            status.setText("画面共有が許可されませんでした");
            return;
        }
        Intent svc = new Intent(this, CaptureService.class);
        svc.setAction(CaptureService.ACTION_START);
        svc.putExtra(CaptureService.EXTRA_RESULT, result);
        svc.putExtra(CaptureService.EXTRA_DATA, data);
        svc.putExtra(CaptureService.EXTRA_LANGUAGE,
            language.getSelectedItemPosition() == 0 ? "ja" : "en");
        startForegroundService(svc);
        status.setText("翻訳処理を開始しました。Taobaoを開きます");
        Intent taobao = getPackageManager().getLaunchIntentForPackage("com.taobao.taobao");
        if (taobao != null) {
            startActivity(taobao);
        } else {
            status.setText("翻訳を開始しました。Taobaoを手動で開いてください");
        }
    }
}
