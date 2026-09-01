package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d88 {
    public static final d88 CANT_MUTE;
    public static final d88 ERROR;
    public static final d88 MUTED;
    public static final d88 NOT_MUTED;
    public static final /* synthetic */ d88[] a;
    public static final /* synthetic */ i04 b;

    static {
        d88 d88Var = new d88("MUTED", 0);
        MUTED = d88Var;
        d88 d88Var2 = new d88("NOT_MUTED", 1);
        NOT_MUTED = d88Var2;
        d88 d88Var3 = new d88("CANT_MUTE", 2);
        CANT_MUTE = d88Var3;
        d88 d88Var4 = new d88("ERROR", 3);
        ERROR = d88Var4;
        d88[] d88VarArr = {d88Var, d88Var2, d88Var3, d88Var4};
        a = d88VarArr;
        b = new i04(d88VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static d88 valueOf(String str) {
        return (d88) Enum.valueOf(d88.class, str);
    }

    public static d88[] values() {
        return (d88[]) a.clone();
    }
}
