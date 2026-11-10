package dev.utaa.linimal.extension.settings;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.os.Process;

import dev.utaa.linimal.extension.i18n.LinimalText;

/**
 * LINE を再起動するための中継画面。LINE とは別のプロセス（{@code :linimal_restart}）と task で動きます。
 *
 * <p>同じプロセスから起動画面を開いてから終了すると、Android はプロセスの終了と一緒にその起動画面も閉じ、
 * ホーム画面に戻ります（XIG07、HyperOS で確認）。この画面は元のプロセスを終了させてから、
 * LINE の起動画面を新しいプロセスで開き、自分のプロセスも終了します。</p>
 */
public final class LinimalRestartActivity extends Activity {
    static final String EXTRA_MAIN_PID = "dev.utaa.linimal.extra.MAIN_PID";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        boolean started = false;
        try {
            // 起動先を確かめてから元のプロセスを終了します。
            Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
            ComponentName component = launch == null ? null : launch.getComponent();
            if (component != null) {
                int mainPid = getIntent().getIntExtra(EXTRA_MAIN_PID, 0);
                if (mainPid > 0 && mainPid != Process.myPid()) {
                    Process.killProcess(mainPid);
                }
                startActivity(Intent.makeRestartActivityTask(component));
                started = true;
            }
        } catch (Throwable ignored) {
            started = false;
        }
        if (!started) {
            try {
                android.widget.Toast.makeText(getApplicationContext(), LinimalText.t(AppRestarter.MANUAL_RESTART),
                        android.widget.Toast.LENGTH_LONG).show();
            } catch (Throwable ignored) {
                // 案内を出せなくても、LINE はランチャーから起動すれば保存した設定で動きます。
            }
            // 案内を表示する間はプロセスを残し、画面だけ閉じます。
            finish();
            return;
        }
        finish();
        Runtime.getRuntime().exit(0);
    }
}
