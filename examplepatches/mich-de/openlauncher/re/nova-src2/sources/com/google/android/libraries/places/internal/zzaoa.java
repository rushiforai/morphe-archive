package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzaoa extends zzatu implements zzavg {
    private static final zzaoa zzb;
    private static volatile zzavn zze;
    private String zzf = b.f42142b;
    private String zzg = b.f42142b;
    private String zzh = b.f42142b;
    private String zzi = b.f42142b;

    static {
        zzaoa zzaoaVar = new zzaoa();
        zzb = zzaoaVar;
        zzatu.zzaE(zzaoa.class, zzaoaVar);
    }

    private zzaoa() {
    }

    public static zzanz zza() {
        return (zzanz) zzb.zzar();
    }

    public static zzaoa zzd() {
        return zzb;
    }

    public static /* synthetic */ void zzf(zzaoa zzaoaVar, String str) {
        str.getClass();
        zzaoaVar.zzi = str;
    }

    public static /* synthetic */ void zzg(zzaoa zzaoaVar, String str) {
        str.getClass();
        zzaoaVar.zzg = str;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0003Ȉ\u0004Ȉ", new Object[]{"zzf", "zzg", "zzh", "zzi"});
        }
        if (i11 == 3) {
            return new zzaoa();
        }
        zzany zzanyVar = null;
        if (i11 == 4) {
            return new zzanz(zzanyVar);
        }
        if (i11 == 5) {
            return zzb;
        }
        if (i11 != 6) {
            return null;
        }
        zzavn zzavnVar = zze;
        if (zzavnVar != null) {
            return zzavnVar;
        }
        synchronized (zzaoa.class) {
            try {
                zzatpVar = zze;
                if (zzatpVar == null) {
                    zzatpVar = new zzatp(zzb);
                    zze = zzatpVar;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return zzatpVar;
    }
}
