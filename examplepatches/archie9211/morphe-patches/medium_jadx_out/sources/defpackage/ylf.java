package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ylf {
    public static final /* synthetic */ ylf[] a;
    public static final ylf zza;
    public static final ylf zzb;
    public static final ylf zzc;
    public static final ylf zzd;
    public static final ylf zze;

    static {
        ylf ylfVar = new ylf("SHA1", 0);
        zza = ylfVar;
        ylf ylfVar2 = new ylf("SHA224", 1);
        zzb = ylfVar2;
        ylf ylfVar3 = new ylf("SHA256", 2);
        zzc = ylfVar3;
        ylf ylfVar4 = new ylf("SHA384", 3);
        zzd = ylfVar4;
        ylf ylfVar5 = new ylf("SHA512", 4);
        zze = ylfVar5;
        a = new ylf[]{ylfVar, ylfVar2, ylfVar3, ylfVar4, ylfVar5};
    }

    public static ylf[] values() {
        return (ylf[]) a.clone();
    }
}
