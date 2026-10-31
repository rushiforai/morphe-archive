package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzaqs extends zzatu implements zzavg {
    private static final zzaqs zzb;
    private static volatile zzavn zze;
    private zzauc zzf = zzatu.zzax();

    static {
        zzaqs zzaqsVar = new zzaqs();
        zzb = zzaqsVar;
        zzatu.zzaE(zzaqs.class, zzaqsVar);
    }

    private zzaqs() {
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b", new Object[]{"zzf", zzaqr.class});
        }
        if (i11 == 3) {
            return new zzaqs();
        }
        zzaqo zzaqoVar = null;
        if (i11 == 4) {
            return new zzaqp(zzaqoVar);
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
        synchronized (zzaqs.class) {
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
