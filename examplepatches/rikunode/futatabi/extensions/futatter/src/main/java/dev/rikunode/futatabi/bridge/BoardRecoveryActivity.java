package dev.rikunode.futatabi.bridge;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Looper;

/** Opened by the exact empty-OK signal from ItaAddDialog. */
public final class BoardRecoveryActivity extends Activity {
    private static final String SIGNAL = "URL／空欄OKで復活";

    public static boolean tryLaunch(Context context, String message) {
        if (!SIGNAL.equals(message)) return false;
        if (context == null || Looper.myLooper() != Looper.getMainLooper()) return false;
        try {
            Intent intent = new Intent(context, BoardRecoveryActivity.class);
            if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            return true;
        } catch (RuntimeException ex) {
            android.widget.Toast.makeText(context, "追加板の復活画面を開けませんでした", android.widget.Toast.LENGTH_LONG).show();
            return true;
        }
    }

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        boolean[] found = null;
        try {
            found = FutatabiProvider.externalBoardStatus(
                getSharedPreferences("FlutterSharedPreferences", MODE_PRIVATE).getString("flutter.itaList", null));
        } catch (Exception ignored) { }
        String message;
        if (found == null) {
            message = "現在の登録状態を確認できません。";
        } else {
            String[] names = {"めぶきちゃんねる", "あいもげ", "あにまん"};
            StringBuilder text = new StringBuilder();
            boolean all = true;
            for (int i = 0; i < names.length; i++) {
                text.append(names[i]).append("：").append(found[i] ? "登録済み" : "未登録").append("\n");
                all &= found[i];
            }
            if (all) text.append("すべて登録済みです。二重登録はしません。");
            message = text.toString();
        }
        new AlertDialog.Builder(this).setTitle("追加板を復活")
            .setMessage(message + "\n\nアプリを終了します。起動し直すと、削除した標準板と追加板も含めて不足分を再登録します。")
            .setNegativeButton("閉じる", (dialog, which) -> finish())
            .setOnCancelListener(dialog -> finish())
            .setPositiveButton("終了して復活", (dialog, which) -> {
                if (!FutatabiProvider.requestBoardRecovery(this)) {
                    android.widget.Toast.makeText(this, "復活の設定を保存できませんでした", android.widget.Toast.LENGTH_LONG).show();
                    finish();
                    return;
                }
                finishAffinity();
                android.os.Process.killProcess(android.os.Process.myPid());
            }).show();
    }
}
