package com.google.android.libraries.places.internal;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.List;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes3.dex */
public final class zzaps extends zzatu implements zzavg {
    private static final zzaps zzb;
    private static volatile zzavn zze;
    private int zzA;
    private int zzD;
    private int zzE;
    private int zzG;
    private boolean zzJ;
    private boolean zzK;
    private boolean zzL;
    private boolean zzM;
    private boolean zzN;
    private boolean zzO;
    private boolean zzP;
    private boolean zzQ;
    private boolean zzR;
    private boolean zzS;
    private boolean zzT;
    private boolean zzU;
    private zzapj zzV;
    private zzaxs zzY;
    private boolean zzZ;
    private boolean zzaa;
    private boolean zzab;
    private boolean zzac;
    private boolean zzad;
    private boolean zzae;
    private boolean zzaf;
    private boolean zzag;
    private boolean zzah;
    private boolean zzai;
    private boolean zzaj;
    private boolean zzak;
    private zzapn zzal;
    private zzapl zzam;
    private zzaom zzao;
    private boolean zzap;
    private boolean zzaq;
    private boolean zzar;
    private boolean zzas;
    private boolean zzat;
    private zzanu zzau;
    private zzanp zzav;
    private zzaoz zzaw;
    private zzaoq zzax;
    private int zzf;
    private int zzg;
    private zzaxs zzj;
    private zzaxs zzm;
    private zzapp zzs;
    private zzaxp zzt;
    private zzaki zzu;
    private double zzv;
    private zzapj zzz;
    private String zzh = b.f42142b;
    private String zzi = b.f42142b;
    private zzauc zzk = zzatu.zzax();
    private String zzl = b.f42142b;
    private String zzn = b.f42142b;
    private String zzo = b.f42142b;
    private String zzp = b.f42142b;
    private String zzq = b.f42142b;
    private zzauc zzr = zzatu.zzax();
    private String zzw = b.f42142b;
    private String zzx = b.f42142b;
    private zzauc zzy = zzatu.zzax();
    private zzauc zzB = zzatu.zzax();
    private String zzC = b.f42142b;
    private zzauc zzF = zzatu.zzax();
    private String zzH = b.f42142b;
    private String zzI = b.f42142b;
    private zzauc zzW = zzatu.zzax();
    private zzauc zzX = zzatu.zzax();
    private zzauc zzan = zzatu.zzax();
    private zzauc zzay = zzatu.zzax();

    static {
        zzaps zzapsVar = new zzaps();
        zzb = zzapsVar;
        zzatu.zzaE(zzaps.class, zzapsVar);
    }

    private zzaps() {
    }

    public static zzaps zzl() {
        return zzb;
    }

    public final List zzA() {
        return this.zzX;
    }

    public final List zzB() {
        return this.zzy;
    }

    public final List zzC() {
        return this.zzk;
    }

    public final boolean zzD() {
        return this.zzM;
    }

    public final boolean zzE() {
        return this.zzK;
    }

    public final boolean zzF() {
        return this.zzL;
    }

    public final boolean zzG() {
        return this.zzN;
    }

    public final boolean zzH() {
        return this.zzR;
    }

    public final boolean zzI() {
        return this.zzO;
    }

    public final boolean zzJ() {
        return this.zzT;
    }

    public final boolean zzK() {
        return this.zzQ;
    }

    public final boolean zzL() {
        return this.zzP;
    }

    public final boolean zzM() {
        return this.zzU;
    }

    public final boolean zzN() {
        return this.zzS;
    }

    public final boolean zzO() {
        return this.zzJ;
    }

    public final boolean zzP() {
        return (this.zzf & 2048) != 0;
    }

    public final boolean zzQ() {
        return (this.zzf & 1048576) != 0;
    }

    public final boolean zzR() {
        return (this.zzf & EventBridgeChannel.QUEUE_CAPACITY) != 0;
    }

    public final boolean zzS() {
        return (this.zzf & 1024) != 0;
    }

    public final boolean zzT() {
        return (this.zzf & 1) != 0;
    }

    public final boolean zzU() {
        return (this.zzf & 2097152) != 0;
    }

    public final boolean zzV() {
        return (this.zzf & 8) != 0;
    }

    public final boolean zzW() {
        return (this.zzf & 4) != 0;
    }

    public final boolean zzX() {
        return (this.zzf & 32) != 0;
    }

    public final boolean zzY() {
        return (this.zzf & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0;
    }

    public final boolean zzZ() {
        return (this.zzf & SQLiteDatabase.OPEN_FULLMUTEX) != 0;
    }

    public final double zza() {
        return this.zzv;
    }

    public final boolean zzaa() {
        return (this.zzf & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0;
    }

    public final boolean zzab() {
        return (this.zzf & SQLiteDatabase.OPEN_PRIVATECACHE) != 0;
    }

    public final boolean zzac() {
        return (this.zzf & SQLiteDatabase.OPEN_NOMUTEX) != 0;
    }

    public final boolean zzad() {
        return (this.zzf & ReaderJsonLexerKt.BATCH_SIZE) != 0;
    }

    public final boolean zzae() {
        return (this.zzf & 524288) != 0;
    }

    public final boolean zzaf() {
        return (this.zzf & SQLiteDatabase.OPEN_SHAREDCACHE) != 0;
    }

    public final boolean zzag() {
        return (this.zzf & 256) != 0;
    }

    public final boolean zzah() {
        return (this.zzf & 128) != 0;
    }

    public final boolean zzai() {
        return (this.zzf & 64) != 0;
    }

    public final boolean zzaj() {
        return (this.zzf & 16) != 0;
    }

    @Override // com.google.android.libraries.places.internal.zzatu
    public final Object zzb(int i5, Object obj, Object obj2) {
        zzavn zzatpVar;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return zzatu.zzaB(zzb, "\u0000F\u0000\u0002\u0001RF\u0000\t\u0000\u0001Ȉ\u0002Ȉ\u0005Ț\u0007Ȉ\bȈ\tȈ\n\u001b\u000bဉ\u0002\fဉ\u0003\rဉ\u0004\u000e\u0000\u000fȈ\u0010Ȉ\u0015ဉ\u0005\u0016င\u0006\u0018Ȉ\u0019\f\u001a\f\u001b\u001b\u001cင\u0007\u001dȈ\u001eȈ\u001fဉ\u0000 ဉ\u0001!ဇ\b\"ဇ\t#ဇ\n$ဇ\u000b&ဇ\f'ဇ\r(ဇ\u000e)ဇ\u000f*ဇ\u0010+ဇ\u0011,ဇ\u0012-ဇ\u0013.ဉ\u0014/\u001b1\u001b2Ȉ3Ȉ4ဉ\u00155\u001b6\u001b7ဇ\u00168ဇ\u00179ဇ\u0018:ဇ\u0019;ဇ\u001a<ဇ\u001b=ဇ\u001c>ဇ\u001d?ဇ\u001e@ဇ\u001fAဇ Bဇ!Cဉ\"Fဉ#G\u001bHဉ$Iဇ%Jဇ&Kဇ'Lဇ(Mဇ)Nဉ*Oဉ+Pဉ,Qဉ-R\u001b", new Object[]{"zzf", "zzg", "zzh", "zzi", "zzk", "zzn", "zzo", "zzp", "zzr", zzaoo.class, "zzs", "zzt", "zzu", "zzv", "zzw", "zzx", "zzz", "zzA", "zzC", "zzD", "zzE", "zzF", zzaos.class, "zzG", "zzH", "zzI", "zzj", "zzm", "zzJ", "zzK", "zzL", "zzM", "zzN", "zzO", "zzP", "zzQ", "zzR", "zzS", "zzT", "zzU", "zzV", "zzW", zzapj.class, "zzX", zzapj.class, "zzl", "zzq", "zzY", "zzy", zzaqh.class, "zzB", zzaog.class, "zzZ", "zzaa", "zzab", "zzac", "zzad", "zzae", "zzaf", "zzag", "zzah", "zzai", "zzaj", "zzak", "zzal", "zzam", "zzan", zzapr.class, "zzao", "zzap", "zzaq", "zzar", "zzas", "zzat", "zzau", "zzav", "zzaw", "zzax", "zzay", zzaox.class});
        }
        if (i11 == 3) {
            return new zzaps();
        }
        zzaok zzaokVar = null;
        if (i11 == 4) {
            return new zzaot(zzaokVar);
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
        synchronized (zzaps.class) {
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

    public final int zzc() {
        return this.zzG;
    }

    public final int zzd() {
        return this.zzA;
    }

    public final zzaki zze() {
        zzaki zzakiVar = this.zzu;
        return zzakiVar == null ? zzaki.zzd() : zzakiVar;
    }

    public final zzaom zzf() {
        zzaom zzaomVar = this.zzao;
        return zzaomVar == null ? zzaom.zzc() : zzaomVar;
    }

    public final zzaov zzg() {
        int i5 = this.zzD;
        zzaov zzaovVar = zzaov.BUSINESS_STATUS_UNSPECIFIED;
        zzaov zzaovVar2 = i5 != 0 ? i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? null : zzaov.FUTURE_OPENING : zzaov.CLOSED_PERMANENTLY : zzaov.CLOSED_TEMPORARILY : zzaov.OPERATIONAL : zzaov.BUSINESS_STATUS_UNSPECIFIED;
        return zzaovVar2 == null ? zzaov.UNRECOGNIZED : zzaovVar2;
    }

    public final zzapj zzh() {
        zzapj zzapjVar = this.zzV;
        return zzapjVar == null ? zzapj.zzd() : zzapjVar;
    }

    public final zzapj zzi() {
        zzapj zzapjVar = this.zzz;
        return zzapjVar == null ? zzapj.zzd() : zzapjVar;
    }

    public final zzapp zzj() {
        zzapp zzappVar = this.zzs;
        return zzappVar == null ? zzapp.zzc() : zzappVar;
    }

    public final zzaqb zzm() {
        int i5 = this.zzE;
        zzaqb zzaqbVar = zzaqb.PRICE_LEVEL_UNSPECIFIED;
        zzaqb zzaqbVar2 = i5 != 0 ? i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? null : zzaqb.PRICE_LEVEL_VERY_EXPENSIVE : zzaqb.PRICE_LEVEL_EXPENSIVE : zzaqb.PRICE_LEVEL_MODERATE : zzaqb.PRICE_LEVEL_INEXPENSIVE : zzaqb.PRICE_LEVEL_FREE : zzaqb.PRICE_LEVEL_UNSPECIFIED;
        return zzaqbVar2 == null ? zzaqb.UNRECOGNIZED : zzaqbVar2;
    }

    public final zzaxp zzn() {
        zzaxp zzaxpVar = this.zzt;
        return zzaxpVar == null ? zzaxp.zzh() : zzaxpVar;
    }

    public final zzaxs zzo() {
        zzaxs zzaxsVar = this.zzj;
        return zzaxsVar == null ? zzaxs.zze() : zzaxsVar;
    }

    public final zzaxs zzp() {
        zzaxs zzaxsVar = this.zzY;
        return zzaxsVar == null ? zzaxs.zze() : zzaxsVar;
    }

    public final String zzq() {
        return this.zzp;
    }

    public final String zzr() {
        return this.zzI;
    }

    public final String zzs() {
        return this.zzH;
    }

    public final String zzt() {
        return this.zzi;
    }

    public final String zzu() {
        return this.zzo;
    }

    public final String zzv() {
        return this.zzl;
    }

    public final String zzw() {
        return this.zzx;
    }

    public final List zzx() {
        return this.zzr;
    }

    public final List zzy() {
        return this.zzF;
    }

    public final List zzz() {
        return this.zzB;
    }
}
