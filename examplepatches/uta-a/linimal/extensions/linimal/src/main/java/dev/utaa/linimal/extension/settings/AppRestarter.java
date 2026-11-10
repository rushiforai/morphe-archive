package dev.utaa.linimal.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.widget.Toast;

import dev.utaa.linimal.extension.i18n.LinimalText;

/** 表示系の設定を変えたあと、反映に必要な LINE の再起動を確認して行います。 */
final class AppRestarter {
    static final String TITLE = "再起動が必要です";
    static final String MESSAGE = "この設定の変更にはアプリの再起動が必要です。今すぐ再起動しますか？\n"
            + "送信中のメッセージなど、実行中の処理は中断されます。";
    static final String MANUAL_RESTART = "再起動できませんでした。LINE を閉じて開き直してください。";


    private AppRestarter() {
    }

    static void confirm(Activity activity) {
        try {
            if (activity.isFinishing() || activity.isDestroyed()) {
                return;
            }
            new AlertDialog.Builder(activity)
                    .setTitle(LinimalText.t(TITLE))
                    .setMessage(LinimalText.t(MESSAGE))
                    .setPositiveButton(LinimalText.t("再起動"), (dialog, which) -> restart(activity))
                    .setNegativeButton(LinimalText.t("あとで"), null)
                    .show();
        } catch (Throwable ignored) {
            // 確認を出せなくても、保存した設定は次回の起動で反映されます。
        }
    }

    /**
     * 別プロセスの中継画面（{@link LinimalRestartActivity}）を開き、このプロセスを終了します。
     * 中継画面が LINE の起動画面を新しいプロセスで開きます。
     */
    static void restart(Activity activity) {
        try {
            Intent restart = new Intent(activity, LinimalRestartActivity.class)
                    .putExtra(LinimalRestartActivity.EXTRA_MAIN_PID, android.os.Process.myPid())
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_ANIMATION);
            if (activity.getPackageManager().resolveActivity(restart, 0) == null) {
                showManualRestart(activity);
                return;
            }
            activity.startActivity(restart);
            activity.finishAffinity();
        } catch (Throwable ignored) {
            // 再起動できなければ、利用者が手動で再起動するまで今の値を使い続けます。
            showManualRestart(activity);
        }
    }

    private static void showManualRestart(Activity activity) {
        try {
            Toast.makeText(activity, LinimalText.t(MANUAL_RESTART), Toast.LENGTH_LONG).show();
        } catch (Throwable ignored) {
            // 案内を出せなくても、保存した設定は次回の起動で反映されます。
        }
    }
}
