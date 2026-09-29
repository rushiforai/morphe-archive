package app.patches.qqmusic.ldp924;

import android.content.Context;
import android.content.SharedPreferences;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/** 注入链路文件日志：/sdcard/qm/patch.log（scoped storage 下自动回落 App 外部私有目录）。 */
public final class QmLog {
    private static String sPath;
    private static final SimpleDateFormat TS = new SimpleDateFormat("MM-dd HH:mm:ss.SSS", Locale.US);

    private QmLog() {}

    public static void log(String msg) {
        try {
            File f = new File(path(), "patch.log");
            String line = "[" + TS.format(new Date()) + "] " + msg + "\n";
            java.io.FileOutputStream fos = new java.io.FileOutputStream(f, true);
            fos.write(line.getBytes("UTF-8"));
            fos.close();
        } catch (Throwable ignored) {
        }
    }

    public static void p(String tag, String msg) { log(tag + " " + msg); }

    private static synchronized File path() {
        if (sPath == null) {
            File f = new File("/sdcard/qm");
            try {
                if (!f.exists()) f.mkdirs();
                if (f.canWrite()) {
                    sPath = f.getAbsolutePath();
                    log("QmLog path=/sdcard/qm");
                    tryEnableAppDebug();
                    return f;
                }
            } catch (Throwable ignored) {
            }
            try {
                Context ctx = app();
                if (ctx != null) {
                    File ef = ctx.getExternalFilesDir("qm");
                    if (ef != null) {
                        sPath = ef.getAbsolutePath();
                        log("QmLog path(external-files)=" + sPath);
                        tryEnableAppDebug();
                        return ef;
                    }
                }
            } catch (Throwable ignored) {
            }
            sPath = "/sdcard/qm";
        }
        return new File(sPath);
    }

    /** 顺手开 App 自带调试/诊断开关（详细日志 KEY_OPEN_DETAIL_LOG→qqmusic_multi_shared_1、
     * 保存歌曲信息 KEY_SAVE_PART_LOCAL_FILE_FIX→qqmusic_multi_shared_0，均 mode 4；
     * 宿主可能走 MMKV，XML 写入不生效则静默无害）。 */
    private static void tryEnableAppDebug() {
        Context ctx = null;
        try {
            ctx = app();
            if (ctx == null) return;
            SharedPreferences sp = ctx.getSharedPreferences("SP_CGI_CONFIG", 4);
            sp.edit().putBoolean("SP_KEY_USER_DEBUG", true).apply();
            log("QmLog SP_KEY_USER_DEBUG=true 已尝试写入");
        } catch (Throwable t) {
            log("QmLog 开调试开关失败: " + t);
        }
        try {
            SharedPreferences s1 = ctx.getSharedPreferences("qqmusic_multi_shared_1", 4);
            s1.edit().putBoolean("KEY_OPEN_DETAIL_LOG", true).apply();
            SharedPreferences s0 = ctx.getSharedPreferences("qqmusic_multi_shared_0", 4);
            s0.edit().putBoolean("KEY_SAVE_PART_LOCAL_FILE_FIX", true).apply();
            log("QmLog 诊断开关已尝试写入（KEY_OPEN_DETAIL_LOG/KEY_SAVE_PART_LOCAL_FILE_FIX）");
        } catch (Throwable t) {
            log("QmLog 诊断开关写入失败: " + t);
        }
    }

    static Context app() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }
}
