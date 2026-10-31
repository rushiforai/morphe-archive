package com.google.android.libraries.places.internal;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes3.dex */
public final class zzagi extends zzatu implements zzavg {
    private static final zzagi zzb;
    private static volatile zzavn zze;
    private zzafy zzA;
    private zzafm zzB;
    private zzaep zzC;
    private zzajc zzD;
    private boolean zzE;
    private zzaez zzG;
    private boolean zzH;
    private int zzJ;
    private int zzM;
    private int zzO;
    private int zzP;
    private int zzf;
    private int zzg;
    private int zzh;
    private zzst zzj;
    private zzwd zzk;
    private int zzl;
    private float zzm;
    private zzahu zzo;
    private zzafc zzq;
    private zzafj zzr;
    private zzahm zzs;
    private zzagw zzt;
    private zzahf zzu;
    private zzahb zzv;
    private zzahr zzw;
    private zzafv zzx;
    private zzagk zzy;
    private zzahh zzz;
    private byte zzQ = 2;
    private int zzi = 1;
    private zzauc zzn = zzatu.zzax();
    private zzauc zzp = zzatu.zzax();
    private String zzF = b.f42142b;
    private String zzI = b.f42142b;
    private String zzK = b.f42142b;
    private String zzL = b.f42142b;
    private String zzN = b.f42142b;

    static {
        zzagi zzagiVar = new zzagi();
        zzb = zzagiVar;
        zzatu.zzaE(zzagi.class, zzagiVar);
    }

    private zzagi() {
    }

    public static zzagb zza() {
        return (zzagb) zzb.zzar();
    }

    public static /* synthetic */ void zzd(zzagi zzagiVar, zzahu zzahuVar) {
        zzahuVar.getClass();
        zzagiVar.zzo = zzahuVar;
        zzagiVar.zzf |= 64;
    }

    public static /* synthetic */ void zze(zzagi zzagiVar, zzahm zzahmVar) {
        zzahmVar.getClass();
        zzagiVar.zzs = zzahmVar;
        zzagiVar.zzf |= EventBridgeChannel.QUEUE_CAPACITY;
    }

    public static /* synthetic */ void zzf(zzagi zzagiVar, zzagw zzagwVar) {
        zzagwVar.getClass();
        zzagiVar.zzt = zzagwVar;
        zzagiVar.zzf |= 1024;
    }

    public static /* synthetic */ void zzg(zzagi zzagiVar, zzst zzstVar) {
        zzstVar.getClass();
        zzagiVar.zzj = zzstVar;
        zzagiVar.zzf |= 4;
    }

    public static /* synthetic */ void zzh(zzagi zzagiVar, zzafv zzafvVar) {
        zzafvVar.getClass();
        zzagiVar.zzx = zzafvVar;
        zzagiVar.zzf |= ReaderJsonLexerKt.BATCH_SIZE;
    }

    public static /* synthetic */ void zzi(zzagi zzagiVar, zzaez zzaezVar) {
        zzaezVar.getClass();
        zzagiVar.zzG = zzaezVar;
        zzagiVar.zzf |= 8388608;
    }

    public static /* synthetic */ void zzj(zzagi zzagiVar, boolean z11) {
        zzagiVar.zzf |= 16777216;
        zzagiVar.zzH = z11;
    }

    public static /* synthetic */ void zzk(zzagi zzagiVar, String str) {
        str.getClass();
        zzagiVar.zzf |= 33554432;
        zzagiVar.zzI = str;
    }

    public static /* synthetic */ void zzl(zzagi zzagiVar, String str) {
        zzagiVar.zzf |= 134217728;
        zzagiVar.zzK = "3.5.0";
    }

    public static /* synthetic */ void zzm(zzagi zzagiVar, String str) {
        str.getClass();
        zzagiVar.zzf |= 1073741824;
        zzagiVar.zzN = str;
    }

    public static /* synthetic */ void zzn(zzagi zzagiVar, int i5) {
        zzagiVar.zzP = 2;
        zzagiVar.zzg |= 1;
    }

    public static /* synthetic */ void zzo(zzagi zzagiVar, int i5) {
        zzagiVar.zzi = i5;
        zzagiVar.zzf |= 2;
    }

    public static /* synthetic */ void zzp(zzagi zzagiVar, int i5) {
        zzagiVar.zzM = i5 - 1;
        zzagiVar.zzf |= SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING;
    }

    public static /* synthetic */ void zzq(zzagi zzagiVar, int i5) {
        zzagiVar.zzO = i5 - 1;
        zzagiVar.zzf |= Integer.MIN_VALUE;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return Byte.valueOf(this.zzQ);
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0001#\u0000\u0002\u0001##\u0000\u0002\u0003\u0001᠌\u0001\u0002ဉ\u0002\u0003ᐉ\u0003\u0004\u001b\u0005ᐉ\u0006\u0006\u001b\u0007ဉ\u0007\bᐉ\b\t᠌\u0004\nခ\u0005\u000bဇ\u0015\fဉ\t\rဈ\u0016\u000eဉ\n\u000fဉ\u000b\u0010ဉ\f\u0011ဉ\r\u0012ဉ\u000e\u0013ဉ\u000f\u0014ဉ\u0010\u0015ဉ\u0011\u0016ဉ\u0012\u0017ဉ\u0013\u0018ဉ\u0017\u0019င\u0000\u001aဉ\u0014\u001bဇ\u0018\u001cဈ\u0019\u001d᠌\u001a\u001eဈ\u001b\u001fဈ\u001c ᠌\u001d!ဈ\u001e\"᠌\u001f#᠌ ", new Object[]{"zzf", "zzg", "zzi", zzagd.zza, "zzj", "zzk", "zzn", zzajg.class, "zzo", "zzp", zzafc.class, "zzq", "zzr", "zzl", zzagc.zza, "zzm", "zzE", "zzs", "zzF", "zzt", "zzu", "zzv", "zzw", "zzx", "zzy", "zzz", "zzA", "zzB", "zzC", "zzG", "zzh", "zzD", "zzH", "zzI", "zzJ", zzage.zza, "zzK", "zzL", "zzM", zzagh.zza, "zzN", "zzO", zzagg.zza, "zzP", zzagf.zza});
        }
        if (i11 == 3) {
            return new zzagi();
        }
        zzadu zzaduVar = null;
        if (i11 == 4) {
            return new zzagb(zzaduVar);
        }
        if (i11 == 5) {
            return zzb;
        }
        if (i11 != 6) {
            this.zzQ = obj == null ? (byte) 0 : (byte) 1;
            return null;
        }
        zzavn zzavnVar = zze;
        if (zzavnVar != null) {
            return zzavnVar;
        }
        synchronized (zzagi.class) {
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
