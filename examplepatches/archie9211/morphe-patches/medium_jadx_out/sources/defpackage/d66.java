package defpackage;

import com.drew.metadata.wav.WavDirectory;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d66 {
    public static final d66 DEBUG;
    public static final d66 ERROR;
    public static final d66 INFO;
    public static final d66 VERBOSE;
    public static final d66 WARN;
    public static final /* synthetic */ d66[] a;

    static {
        d66 d66Var = new d66("VERBOSE", 0);
        VERBOSE = d66Var;
        d66 d66Var2 = new d66("DEBUG", 1);
        DEBUG = d66Var2;
        d66 d66Var3 = new d66(WavDirectory.LIST_INFO, 2);
        INFO = d66Var3;
        d66 d66Var4 = new d66("WARN", 3);
        WARN = d66Var4;
        d66 d66Var5 = new d66("ERROR", 4);
        ERROR = d66Var5;
        a = new d66[]{d66Var, d66Var2, d66Var3, d66Var4, d66Var5};
    }

    public static d66 valueOf(String str) {
        return (d66) Enum.valueOf(d66.class, str);
    }

    public static d66[] values() {
        return (d66[]) a.clone();
    }
}
