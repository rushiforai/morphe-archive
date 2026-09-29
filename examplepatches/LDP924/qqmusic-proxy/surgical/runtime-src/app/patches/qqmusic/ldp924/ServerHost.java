package app.patches.qqmusic.ldp924;

/** 宿主域名替换出口：未配置/任何异常时回官方原值。 */
public final class ServerHost {
    static {
        QmLog.p("[ServerHost]", "class loaded（注入类加载链通）");
    }

    private ServerHost() {}

    public static String t_y_qq_com() { return safe("t.y.qq.com"); }

    public static String vc_y_qq_com() { return safe("vc.y.qq.com"); }

    private static String safe(String official) {
        try {
            String hp = ServerConfig.hostPort();
            if (hp != null) {
                QmLog.p("[ServerHost]", "getter 返回自定义 " + hp);
                return hp;
            }
            QmLog.p("[ServerHost]", "getter 返回官方 " + official);
            return official;
        } catch (Throwable t) {
            QmLog.p("[ServerHost]", "getter 异常回落官方 " + official + " : " + t);
            return official;
        }
    }
}
