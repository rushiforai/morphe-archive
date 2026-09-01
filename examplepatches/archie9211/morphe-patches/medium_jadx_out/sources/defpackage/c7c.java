package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c7c {
    public static final c7c FALLBACK;
    public static final c7c GENERAL;
    public static final /* synthetic */ c7c[] a;
    public static final /* synthetic */ i04 b;

    static {
        c7c c7cVar = new c7c("GENERAL", 0);
        GENERAL = c7cVar;
        c7c c7cVar2 = new c7c("FALLBACK", 1);
        FALLBACK = c7cVar2;
        c7c[] c7cVarArr = {c7cVar, c7cVar2};
        a = c7cVarArr;
        b = new i04(c7cVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static c7c valueOf(String str) {
        return (c7c) Enum.valueOf(c7c.class, str);
    }

    public static c7c[] values() {
        return (c7c[]) a.clone();
    }
}
