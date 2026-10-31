package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'zzb' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* loaded from: classes3.dex */
public final class zzaug {
    public static final zzaug zza;
    public static final zzaug zzb;
    public static final zzaug zzc;
    public static final zzaug zzd;
    public static final zzaug zze;
    public static final zzaug zzf;
    public static final zzaug zzg;
    public static final zzaug zzh;
    public static final zzaug zzi;
    public static final zzaug zzj;
    private static final /* synthetic */ zzaug[] zzk;
    private final Class zzl;
    private final Class zzm;
    private final Object zzn;

    static {
        zzaug zzaugVar = new zzaug("VOID", 0, Void.class, Void.class, null);
        zza = zzaugVar;
        Class cls = Integer.TYPE;
        zzaug zzaugVar2 = new zzaug("INT", 1, cls, Integer.class, 0);
        zzb = zzaugVar2;
        zzaug zzaugVar3 = new zzaug("LONG", 2, Long.TYPE, Long.class, 0L);
        zzc = zzaugVar3;
        zzaug zzaugVar4 = new zzaug("FLOAT", 3, Float.TYPE, Float.class, Float.valueOf(0.0f));
        zzd = zzaugVar4;
        zzaug zzaugVar5 = new zzaug("DOUBLE", 4, Double.TYPE, Double.class, Double.valueOf(0.0d));
        zze = zzaugVar5;
        zzaug zzaugVar6 = new zzaug("BOOLEAN", 5, Boolean.TYPE, Boolean.class, Boolean.FALSE);
        zzf = zzaugVar6;
        zzaug zzaugVar7 = new zzaug("STRING", 6, String.class, String.class, b.f42142b);
        zzg = zzaugVar7;
        zzaug zzaugVar8 = new zzaug("BYTE_STRING", 7, zzask.class, zzask.class, zzask.zzb);
        zzh = zzaugVar8;
        zzaug zzaugVar9 = new zzaug("ENUM", 8, cls, Integer.class, null);
        zzi = zzaugVar9;
        zzaug zzaugVar10 = new zzaug("MESSAGE", 9, Object.class, Object.class, null);
        zzj = zzaugVar10;
        zzk = new zzaug[]{zzaugVar, zzaugVar2, zzaugVar3, zzaugVar4, zzaugVar5, zzaugVar6, zzaugVar7, zzaugVar8, zzaugVar9, zzaugVar10};
    }

    private zzaug(String str, int i5, Class cls, Class cls2, Object obj) {
        this.zzl = cls;
        this.zzm = cls2;
        this.zzn = obj;
    }

    public static zzaug[] values() {
        return (zzaug[]) zzk.clone();
    }

    public final Class zza() {
        return this.zzm;
    }
}
