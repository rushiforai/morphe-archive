package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pag {
    public static final /* synthetic */ pag[] a;
    public static final pag zza;
    public static final pag zzb;
    public static final pag zzc;
    public static final pag zzd;
    public static final pag zze;
    public static final pag zzf;
    public static final pag zzg;
    public static final pag zzh;
    public static final pag zzi;

    static {
        pag pagVar = new pag("INT", 0);
        zza = pagVar;
        pag pagVar2 = new pag("LONG", 1);
        zzb = pagVar2;
        pag pagVar3 = new pag("FLOAT", 2);
        zzc = pagVar3;
        pag pagVar4 = new pag("DOUBLE", 3);
        zzd = pagVar4;
        pag pagVar5 = new pag("BOOLEAN", 4);
        zze = pagVar5;
        pag pagVar6 = new pag("STRING", 5);
        zzf = pagVar6;
        u3g u3gVar = t3g.b;
        pag pagVar7 = new pag("BYTE_STRING", 6);
        zzg = pagVar7;
        pag pagVar8 = new pag("ENUM", 7);
        zzh = pagVar8;
        pag pagVar9 = new pag("MESSAGE", 8);
        zzi = pagVar9;
        a = new pag[]{pagVar, pagVar2, pagVar3, pagVar4, pagVar5, pagVar6, pagVar7, pagVar8, pagVar9};
    }

    public static pag[] values() {
        return (pag[]) a.clone();
    }
}
