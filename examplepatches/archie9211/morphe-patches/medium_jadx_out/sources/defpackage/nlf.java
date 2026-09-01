package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nlf {
    public static final /* synthetic */ nlf[] a;
    public static final nlf zza;
    public static final nlf zzb;
    public static final nlf zzc;

    static {
        nlf nlfVar = new nlf("NIST_P256", 0);
        zza = nlfVar;
        nlf nlfVar2 = new nlf("NIST_P384", 1);
        zzb = nlfVar2;
        nlf nlfVar3 = new nlf("NIST_P521", 2);
        zzc = nlfVar3;
        a = new nlf[]{nlfVar, nlfVar2, nlfVar3};
    }

    public static nlf[] values() {
        return (nlf[]) a.clone();
    }
}
