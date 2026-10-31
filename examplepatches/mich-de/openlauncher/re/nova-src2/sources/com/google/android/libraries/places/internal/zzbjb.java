package com.google.android.libraries.places.internal;

import a80.m;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'zza' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* loaded from: classes3.dex */
public final class zzbjb {
    public static final zzbjb zza;
    public static final zzbjb zzb;
    public static final zzbjb zzc;
    public static final zzbjb zzd;
    public static final zzbjb zze;
    public static final zzbjb zzf;
    public static final zzbjb zzg;
    public static final zzbjb zzh;
    public static final zzbjb zzi;
    public static final zzbjb zzj;
    public static final zzbjb zzk;
    public static final zzbjb zzl;
    public static final zzbjb zzm;
    public static final zzbjb zzn;
    private static final zzbjb[] zzo;
    private static final /* synthetic */ zzbjb[] zzp;
    private final int zzq;
    private final zzbdo zzr;

    /*  JADX ERROR: NullPointerException in pass: LoopRegionVisitor
        java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.SSAVar.use(jadx.core.dex.instructions.args.RegisterArg)" because "ssaVar" is null
        	at jadx.core.dex.nodes.InsnNode.rebindArgs(InsnNode.java:493)
        	at jadx.core.dex.nodes.InsnNode.rebindArgs(InsnNode.java:496)
        	at jadx.core.dex.visitors.regions.LoopRegionVisitor.checkArrayForEach(LoopRegionVisitor.java:230)
        	at jadx.core.dex.visitors.regions.LoopRegionVisitor.checkForIndexedLoop(LoopRegionVisitor.java:144)
        	at jadx.core.dex.visitors.regions.LoopRegionVisitor.processLoopRegion(LoopRegionVisitor.java:81)
        	at jadx.core.dex.visitors.regions.LoopRegionVisitor.enterRegion(LoopRegionVisitor.java:65)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:67)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverse(DepthRegionTraversal.java:19)
        	at jadx.core.dex.visitors.regions.LoopRegionVisitor.visit(LoopRegionVisitor.java:55)
        */
    static {
        /*
            Method dump skipped, instructions count: 225
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.libraries.places.internal.zzbjb.<clinit>():void");
    }

    private zzbjb(String str, int i5, int i11, zzbdo zzbdoVar) {
        this.zzq = i11;
        String strConcat = "HTTP/2 error code: ".concat(String.valueOf(name()));
        this.zzr = zzbdoVar.zzg(zzbdoVar.zzi() != null ? m.h(strConcat, " (", zzbdoVar.zzi(), ")") : strConcat);
    }

    public static zzbjb[] values() {
        return (zzbjb[]) zzp.clone();
    }

    public static zzbdo zza(long j11) {
        zzbjb[] zzbjbVarArr = zzo;
        zzbjb zzbjbVar = null;
        if (j11 < zzbjbVarArr.length && j11 >= 0) {
            zzbjbVar = zzbjbVarArr[(int) j11];
        }
        if (zzbjbVar != null) {
            return zzbjbVar.zzr;
        }
        return zzbdo.zzd(zzc.zzr.zza().zza()).zzg("Unrecognized HTTP/2 error code: " + j11);
    }
}
