package app.patches.qqmusic.ldp924;

import android.content.Context;
import android.content.SharedPreferences;

/** 服务器配置（server_prefs），空值=走官方。 */
public final class ServerConfig {
    private static final String PREFS = "server_prefs";

    private ServerConfig() {}

    static Context ctx() { return QmLog.app(); }

    static String host() {
        try {
            SharedPreferences sp = ctx().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            return sp.getString("srv_host", "") != null ? sp.getString("srv_host", "") : "";
        } catch (Throwable t) {
            QmLog.p("[ServerConfig]", "host 读取异常: " + t);
            return "";
        }
    }

    static int port() {
        try {
            SharedPreferences sp = ctx().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            return sp.getInt("srv_port", 0);
        } catch (Throwable t) {
            QmLog.p("[ServerConfig]", "port 读取异常: " + t);
            return 0;
        }
    }

    static boolean configured() { return !host().isEmpty() && port() >= 1 && port() <= 65535; }

    /** 裸 host:port（IPv6 加方括号），未配置返回 null。 */
    static String hostPort() {
        if (!configured()) {
            QmLog.p("[ServerConfig]", "未配置，hostPort=null");
            return null;
        }
        String h = host();
        String wrapped = (h.indexOf(':') >= 0 && !h.startsWith("[")) ? "[" + h + "]" : h;
        String hp = wrapped + ":" + port();
        QmLog.p("[ServerConfig]", "hostPort=" + hp);
        return hp;
    }
}
