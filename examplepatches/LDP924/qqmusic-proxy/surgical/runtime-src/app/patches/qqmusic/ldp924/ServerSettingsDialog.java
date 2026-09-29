package app.patches.qqmusic.ldp924;

import android.app.AlertDialog;
import android.content.Context;
import android.text.InputType;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

/** 关于页（连点 logo 出诊断入口处）寄生的服务器设置弹窗。 */
public final class ServerSettingsDialog {
    private ServerSettingsDialog() {}

    public static void show(Object fragment) {
        QmLog.p("[Dialog]", "show() 进入, fragment=" + (fragment == null ? "null" : fragment.getClass().getName()));
        try {
            if (fragment == null) {
                QmLog.p("[Dialog]", "fragment 为 null, return");
                return;
            }
            Context resolved;
            try {
                resolved = (Context) fragment.getClass().getMethod("getActivity").invoke(fragment);
            } catch (Throwable e) {
                QmLog.p("[Dialog]", "getActivity 反射失败: " + e + " (降级 currentApplication)");
                resolved = QmLog.app();
            }
            final Context ctx = resolved;
            QmLog.p("[Dialog]", "ctx=" + (ctx == null ? "null" : ctx.getPackageName()));
            if (ctx == null) {
                QmLog.p("[Dialog]", "ctx null, return");
                return;
            }
            int pad = (int) (16 * ctx.getResources().getDisplayMetrics().density);
            final EditText host = new EditText(ctx);
            host.setHint("Server host (IPv4/IPv6)");
            host.setText(ServerConfig.host());
            host.setSingleLine();
            final EditText port = new EditText(ctx);
            port.setHint("Port (1-65535)");
            if (ServerConfig.port() > 0) port.setText(String.valueOf(ServerConfig.port()));
            port.setInputType(InputType.TYPE_CLASS_NUMBER);
            port.setSingleLine();
            LinearLayout box = new LinearLayout(ctx);
            box.setOrientation(LinearLayout.VERTICAL);
            box.setPadding(pad, pad, pad, pad);
            box.addView(host);
            box.addView(port);
            new AlertDialog.Builder(ctx)
                    .setTitle("Server")
                    .setView(box)
                    .setPositiveButton("Save", new android.content.DialogInterface.OnClickListener() {
                        @Override public void onClick(android.content.DialogInterface d, int w) {
                            try {
                                String h = host.getText().toString().trim();
                                int p = 0;
                                try { p = Integer.parseInt(port.getText().toString().trim()); } catch (Throwable ignored) {}
                                ctx.getSharedPreferences("server_prefs", Context.MODE_PRIVATE)
                                        .edit().putString("srv_host", h).putInt("srv_port", p).apply();
                                String msg = (!h.isEmpty() && p > 0) ? ("Server " + h + ":" + p + " OK") : "Reset to official";
                                Toast.makeText(ctx, msg, Toast.LENGTH_LONG).show();
                                QmLog.p("[Dialog]", "保存: host='" + h + "' port=" + p);
                            } catch (Throwable t) {
                                QmLog.p("[Dialog]", "保存异常: " + t);
                            }
                        }
                    })
                    .setNegativeButton("Cancel", null)
                    .show();
            QmLog.p("[Dialog]", "弹窗 show 完成");
        } catch (Throwable t) {
            QmLog.p("[Dialog]", "show 异常: " + t);
        }
    }
}
