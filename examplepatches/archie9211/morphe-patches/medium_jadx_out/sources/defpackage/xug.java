package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xug {
    public static final /* synthetic */ xug[] a;
    public static final xug zza;
    public static final xug zzb;
    public static final xug zzc;

    static {
        xug xugVar = new xug("NIST_P256", 0);
        zza = xugVar;
        xug xugVar2 = new xug("NIST_P384", 1);
        zzb = xugVar2;
        xug xugVar3 = new xug("NIST_P521", 2);
        zzc = xugVar3;
        a = new xug[]{xugVar, xugVar2, xugVar3};
    }

    public static xug[] values() {
        return (xug[]) a.clone();
    }
}
