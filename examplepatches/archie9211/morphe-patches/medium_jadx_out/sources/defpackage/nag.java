package defpackage;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'zzc' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nag {
    public static final /* synthetic */ nag[] c;
    public static final nag zza;
    public static final nag zzb;
    public static final nag zzc;
    public static final nag zzd;
    public static final nag zze;
    public static final nag zzf;
    public static final nag zzg;
    public static final nag zzh;
    public static final nag zzi;
    public static final nag zzj;
    public static final nag zzk;
    public static final nag zzl;
    public static final nag zzm;
    public static final nag zzn;
    public static final nag zzo;
    public static final nag zzp;
    public static final nag zzq;
    public static final nag zzr;
    public final pag a;
    public final int b;

    static {
        nag nagVar = new nag("DOUBLE", 0, pag.zzd, 1);
        zza = nagVar;
        nag nagVar2 = new nag("FLOAT", 1, pag.zzc, 5);
        zzb = nagVar2;
        pag pagVar = pag.zzb;
        nag nagVar3 = new nag("INT64", 2, pagVar, 0);
        zzc = nagVar3;
        nag nagVar4 = new nag("UINT64", 3, pagVar, 0);
        zzd = nagVar4;
        pag pagVar2 = pag.zza;
        nag nagVar5 = new nag("INT32", 4, pagVar2, 0);
        zze = nagVar5;
        nag nagVar6 = new nag("FIXED64", 5, pagVar, 1);
        zzf = nagVar6;
        nag nagVar7 = new nag("FIXED32", 6, pagVar2, 5);
        zzg = nagVar7;
        nag nagVar8 = new nag("BOOL", 7, pag.zze, 0);
        zzh = nagVar8;
        nag nagVar9 = new nag("STRING", 8, pag.zzf, 2);
        zzi = nagVar9;
        pag pagVar3 = pag.zzi;
        nag nagVar10 = new nag("GROUP", 9, pagVar3, 3);
        zzj = nagVar10;
        nag nagVar11 = new nag("MESSAGE", 10, pagVar3, 2);
        zzk = nagVar11;
        nag nagVar12 = new nag("BYTES", 11, pag.zzg, 2);
        zzl = nagVar12;
        nag nagVar13 = new nag("UINT32", 12, pagVar2, 0);
        zzm = nagVar13;
        nag nagVar14 = new nag("ENUM", 13, pag.zzh, 0);
        zzn = nagVar14;
        nag nagVar15 = new nag("SFIXED32", 14, pagVar2, 5);
        zzo = nagVar15;
        nag nagVar16 = new nag("SFIXED64", 15, pagVar, 1);
        zzp = nagVar16;
        nag nagVar17 = new nag("SINT32", 16, pagVar2, 0);
        zzq = nagVar17;
        nag nagVar18 = new nag("SINT64", 17, pagVar, 0);
        zzr = nagVar18;
        c = new nag[]{nagVar, nagVar2, nagVar3, nagVar4, nagVar5, nagVar6, nagVar7, nagVar8, nagVar9, nagVar10, nagVar11, nagVar12, nagVar13, nagVar14, nagVar15, nagVar16, nagVar17, nagVar18};
    }

    public nag(String str, int i, pag pagVar, int i2) {
        this.a = pagVar;
        this.b = i2;
    }

    public static nag[] values() {
        return (nag[]) c.clone();
    }

    public final int zza() {
        return this.b;
    }

    public final pag zzb() {
        return this.a;
    }
}
