package com.google.android.libraries.places.internal;

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
/* loaded from: classes3.dex */
public final class zzaxd {
    public static final zzaxd zza;
    public static final zzaxd zzb;
    public static final zzaxd zzc;
    public static final zzaxd zzd;
    public static final zzaxd zze;
    public static final zzaxd zzf;
    public static final zzaxd zzg;
    public static final zzaxd zzh;
    public static final zzaxd zzi;
    public static final zzaxd zzj;
    public static final zzaxd zzk;
    public static final zzaxd zzl;
    public static final zzaxd zzm;
    public static final zzaxd zzn;
    public static final zzaxd zzo;
    public static final zzaxd zzp;
    public static final zzaxd zzq;
    public static final zzaxd zzr;
    private static final /* synthetic */ zzaxd[] zzs;
    private final zzaxe zzt;

    static {
        zzaxd zzaxdVar = new zzaxd("DOUBLE", 0, zzaxe.DOUBLE, 1);
        zza = zzaxdVar;
        zzaxd zzaxdVar2 = new zzaxd("FLOAT", 1, zzaxe.FLOAT, 5);
        zzb = zzaxdVar2;
        zzaxe zzaxeVar = zzaxe.LONG;
        zzaxd zzaxdVar3 = new zzaxd("INT64", 2, zzaxeVar, 0);
        zzc = zzaxdVar3;
        zzaxd zzaxdVar4 = new zzaxd("UINT64", 3, zzaxeVar, 0);
        zzd = zzaxdVar4;
        zzaxe zzaxeVar2 = zzaxe.INT;
        zzaxd zzaxdVar5 = new zzaxd("INT32", 4, zzaxeVar2, 0);
        zze = zzaxdVar5;
        zzaxd zzaxdVar6 = new zzaxd("FIXED64", 5, zzaxeVar, 1);
        zzf = zzaxdVar6;
        zzaxd zzaxdVar7 = new zzaxd("FIXED32", 6, zzaxeVar2, 5);
        zzg = zzaxdVar7;
        zzaxd zzaxdVar8 = new zzaxd("BOOL", 7, zzaxe.BOOLEAN, 0);
        zzh = zzaxdVar8;
        zzaxd zzaxdVar9 = new zzaxd("STRING", 8, zzaxe.STRING, 2);
        zzi = zzaxdVar9;
        zzaxe zzaxeVar3 = zzaxe.MESSAGE;
        zzaxd zzaxdVar10 = new zzaxd("GROUP", 9, zzaxeVar3, 3);
        zzj = zzaxdVar10;
        zzaxd zzaxdVar11 = new zzaxd("MESSAGE", 10, zzaxeVar3, 2);
        zzk = zzaxdVar11;
        zzaxd zzaxdVar12 = new zzaxd("BYTES", 11, zzaxe.BYTE_STRING, 2);
        zzl = zzaxdVar12;
        zzaxd zzaxdVar13 = new zzaxd("UINT32", 12, zzaxeVar2, 0);
        zzm = zzaxdVar13;
        zzaxd zzaxdVar14 = new zzaxd("ENUM", 13, zzaxe.ENUM, 0);
        zzn = zzaxdVar14;
        zzaxd zzaxdVar15 = new zzaxd("SFIXED32", 14, zzaxeVar2, 5);
        zzo = zzaxdVar15;
        zzaxd zzaxdVar16 = new zzaxd("SFIXED64", 15, zzaxeVar, 1);
        zzp = zzaxdVar16;
        zzaxd zzaxdVar17 = new zzaxd("SINT32", 16, zzaxeVar2, 0);
        zzq = zzaxdVar17;
        zzaxd zzaxdVar18 = new zzaxd("SINT64", 17, zzaxeVar, 0);
        zzr = zzaxdVar18;
        zzs = new zzaxd[]{zzaxdVar, zzaxdVar2, zzaxdVar3, zzaxdVar4, zzaxdVar5, zzaxdVar6, zzaxdVar7, zzaxdVar8, zzaxdVar9, zzaxdVar10, zzaxdVar11, zzaxdVar12, zzaxdVar13, zzaxdVar14, zzaxdVar15, zzaxdVar16, zzaxdVar17, zzaxdVar18};
    }

    private zzaxd(String str, int i5, zzaxe zzaxeVar, int i11) {
        this.zzt = zzaxeVar;
    }

    public static zzaxd[] values() {
        return (zzaxd[]) zzs.clone();
    }

    public final zzaxe zza() {
        return this.zzt;
    }
}
