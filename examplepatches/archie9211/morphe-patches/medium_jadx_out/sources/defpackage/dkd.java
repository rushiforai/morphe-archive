package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dkd {
    public static final dkd INDEX;
    public static final dkd PERCENT;
    public static final /* synthetic */ dkd[] a;

    static {
        dkd dkdVar = new dkd("PERCENT", 0);
        PERCENT = dkdVar;
        dkd dkdVar2 = new dkd("INDEX", 1);
        INDEX = dkdVar2;
        a = new dkd[]{dkdVar, dkdVar2};
    }

    public static dkd valueOf(String str) {
        return (dkd) Enum.valueOf(dkd.class, str);
    }

    public static dkd[] values() {
        return (dkd[]) a.clone();
    }
}
