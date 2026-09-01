package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vtf {
    public static final /* synthetic */ vtf[] a;
    public static final vtf zza;
    public static final vtf zzb;
    public static final vtf zzc;
    public static final vtf zzd;

    static {
        vtf vtfVar = new vtf("SCALAR", 0);
        zza = vtfVar;
        vtf vtfVar2 = new vtf("VECTOR", 1);
        zzb = vtfVar2;
        vtf vtfVar3 = new vtf("PACKED_VECTOR", 2);
        zzc = vtfVar3;
        vtf vtfVar4 = new vtf("MAP", 3);
        zzd = vtfVar4;
        a = new vtf[]{vtfVar, vtfVar2, vtfVar3, vtfVar4};
    }

    public static vtf[] values() {
        return (vtf[]) a.clone();
    }
}
