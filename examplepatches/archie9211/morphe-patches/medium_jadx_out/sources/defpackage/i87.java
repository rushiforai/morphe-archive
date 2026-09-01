package defpackage;

import com.medium.android.explore.ui.vAWg.OphtYB;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class i87 {
    public static final i87 APP_EVENTS;
    public static final i87 CACHE;
    public static final i87 DEVELOPER_ERRORS;
    public static final i87 GRAPH_API_DEBUG_INFO;
    public static final i87 GRAPH_API_DEBUG_WARNING;
    public static final i87 INCLUDE_ACCESS_TOKENS;
    public static final i87 INCLUDE_RAW_RESPONSES;
    public static final i87 REQUESTS;
    public static final /* synthetic */ i87[] a;

    public static i87 valueOf(String str) {
        return (i87) Enum.valueOf(i87.class, str);
    }

    public static i87[] values() {
        return (i87[]) a.clone();
    }

    static {
        i87 i87Var = new i87("REQUESTS", 0);
        REQUESTS = i87Var;
        i87 i87Var2 = new i87("INCLUDE_ACCESS_TOKENS", 1);
        INCLUDE_ACCESS_TOKENS = i87Var2;
        i87 i87Var3 = new i87("INCLUDE_RAW_RESPONSES", 2);
        INCLUDE_RAW_RESPONSES = i87Var3;
        i87 i87Var4 = new i87("CACHE", 3);
        CACHE = i87Var4;
        i87 i87Var5 = new i87("APP_EVENTS", 4);
        APP_EVENTS = i87Var5;
        i87 i87Var6 = new i87(OphtYB.wkg, 5);
        DEVELOPER_ERRORS = i87Var6;
        i87 i87Var7 = new i87("GRAPH_API_DEBUG_WARNING", 6);
        GRAPH_API_DEBUG_WARNING = i87Var7;
        i87 i87Var8 = new i87("GRAPH_API_DEBUG_INFO", 7);
        GRAPH_API_DEBUG_INFO = i87Var8;
        a = new i87[]{i87Var, i87Var2, i87Var3, i87Var4, i87Var5, i87Var6, i87Var7, i87Var8};
    }
}
