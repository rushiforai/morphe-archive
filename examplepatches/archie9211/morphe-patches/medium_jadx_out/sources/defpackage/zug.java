package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zug {
    public static final /* synthetic */ zug[] a;
    public static final zug zza;
    public static final zug zzb;
    public static final zug zzc;

    static {
        zug zugVar = new zug("UNCOMPRESSED", 0);
        zza = zugVar;
        zug zugVar2 = new zug("COMPRESSED", 1);
        zzb = zugVar2;
        zug zugVar3 = new zug("DO_NOT_USE_CRUNCHY_UNCOMPRESSED", 2);
        zzc = zugVar3;
        a = new zug[]{zugVar, zugVar2, zugVar3};
    }

    public static zug[] values() {
        return (zug[]) a.clone();
    }
}
