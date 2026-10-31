package com.google.android.libraries.places.internal;

import java.util.List;

/* loaded from: classes3.dex */
public final class zzapj extends zzatu implements zzavg {
    private static final zzapj zzb;
    private static volatile zzavn zze;
    private int zzf;
    private boolean zzg;
    private int zzj;
    private zzauc zzh = zzatu.zzax();
    private zzauc zzi = zzatu.zzax();
    private zzauc zzk = zzatu.zzax();

    static {
        zzapj zzapjVar = new zzapj();
        zzb = zzapjVar;
        zzatu.zzaE(zzapj.class, zzapjVar);
    }

    private zzapj() {
    }

    public static zzapj zzd() {
        return zzb;
    }

    public final zzapg zza() {
        zzapg zzapgVar;
        int i5 = this.zzj;
        zzapg zzapgVar2 = zzapg.SECONDARY_HOURS_TYPE_UNSPECIFIED;
        switch (i5) {
            case 0:
                zzapgVar = zzapg.SECONDARY_HOURS_TYPE_UNSPECIFIED;
                break;
            case 1:
                zzapgVar = zzapg.DRIVE_THROUGH;
                break;
            case 2:
                zzapgVar = zzapg.HAPPY_HOUR;
                break;
            case 3:
                zzapgVar = zzapg.DELIVERY;
                break;
            case 4:
                zzapgVar = zzapg.TAKEOUT;
                break;
            case 5:
                zzapgVar = zzapg.KITCHEN;
                break;
            case 6:
                zzapgVar = zzapg.BREAKFAST;
                break;
            case 7:
                zzapgVar = zzapg.LUNCH;
                break;
            case 8:
                zzapgVar = zzapg.DINNER;
                break;
            case 9:
                zzapgVar = zzapg.BRUNCH;
                break;
            case 10:
                zzapgVar = zzapg.PICKUP;
                break;
            case 11:
                zzapgVar = zzapg.ACCESS;
                break;
            case 12:
                zzapgVar = zzapg.SENIOR_HOURS;
                break;
            case 13:
                zzapgVar = zzapg.ONLINE_SERVICE_HOURS;
                break;
            default:
                zzapgVar = null;
                break;
        }
        return zzapgVar == null ? zzapg.UNRECOGNIZED : zzapgVar;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0003\u0000\u0001ဇ\u0000\u0002\u001b\u0003Ț\u0004\f\u0005\u001b", new Object[]{"zzf", "zzg", "zzh", zzape.class, "zzi", "zzj", "zzk", zzapi.class});
        }
        if (i11 == 3) {
            return new zzapj();
        }
        zzaok zzaokVar = null;
        if (i11 == 4) {
            return new zzapa(zzaokVar);
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
        synchronized (zzapj.class) {
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

    public final List zze() {
        return this.zzh;
    }

    public final List zzf() {
        return this.zzk;
    }

    public final List zzg() {
        return this.zzi;
    }
}
