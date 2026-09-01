package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class lxd {
    public static final lxd COMMON;
    public static final lxd SUPERTYPE;
    public static final /* synthetic */ lxd[] a;

    static {
        lxd lxdVar = new lxd("SUPERTYPE", 0);
        SUPERTYPE = lxdVar;
        lxd lxdVar2 = new lxd("COMMON", 1);
        COMMON = lxdVar2;
        a = new lxd[]{lxdVar, lxdVar2};
    }

    public static lxd valueOf(String str) {
        return (lxd) Enum.valueOf(lxd.class, str);
    }

    public static lxd[] values() {
        return (lxd[]) a.clone();
    }
}
