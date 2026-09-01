package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v4b {
    public static final v4b Restart;
    public static final v4b Reverse;
    public static final /* synthetic */ v4b[] a;
    public static final /* synthetic */ i04 b;

    static {
        v4b v4bVar = new v4b("Restart", 0);
        Restart = v4bVar;
        v4b v4bVar2 = new v4b("Reverse", 1);
        Reverse = v4bVar2;
        v4b[] v4bVarArr = {v4bVar, v4bVar2};
        a = v4bVarArr;
        b = new i04(v4bVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static v4b valueOf(String str) {
        return (v4b) Enum.valueOf(v4b.class, str);
    }

    public static v4b[] values() {
        return (v4b[]) a.clone();
    }
}
