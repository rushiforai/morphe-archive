package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zbd {
    public static final zbd FOLLOW;
    public static final /* synthetic */ zbd[] a;
    public static final /* synthetic */ i04 b;

    static {
        zbd zbdVar = new zbd("FOLLOW", 0);
        FOLLOW = zbdVar;
        zbd[] zbdVarArr = {zbdVar};
        a = zbdVarArr;
        b = new i04(zbdVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static zbd valueOf(String str) {
        return (zbd) Enum.valueOf(zbd.class, str);
    }

    public static zbd[] values() {
        return (zbd[]) a.clone();
    }
}
