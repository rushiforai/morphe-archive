package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.util.RandomAccess;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class kqf extends fnf {
    private static final kqf zzv;
    private static volatile mof zzw;
    private int zza;
    private Object zze;
    private int zzf;
    private int zzg;
    private long zzl;
    private zmf zzm;
    private int zzn;
    private dqf zzo;
    private qqf zzp;
    private dpf zzr;
    private zmf zzs;
    private int zzu;
    private int zzd = 0;
    private String zzh = "";
    private String zzi = "";
    private String zzj = "";
    private String zzk = "";
    private String zzq = "";
    private qnf zzt = gnf.e;

    static {
        kqf kqfVar = new kqf();
        zzv = kqfVar;
        fnf.l(kqf.class, kqfVar);
    }

    public static kqf A() {
        return zzv;
    }

    public static jqf z() {
        return (jqf) zzv.h();
    }

    public final /* synthetic */ void B(String str) {
        str.getClass();
        this.zzh = str;
    }

    public final /* synthetic */ void C(String str) {
        str.getClass();
        this.zzi = str;
    }

    public final /* synthetic */ void D(String str) {
        str.getClass();
        this.zzj = str;
    }

    public final /* synthetic */ void E(zmf zmfVar) {
        this.zzm = zmfVar;
        this.zza |= 1;
    }

    public final /* synthetic */ void F(dqf dqfVar) {
        this.zzo = dqfVar;
        this.zza |= 2;
    }

    public final /* synthetic */ void G(qqf qqfVar) {
        this.zzp = qqfVar;
        this.zza |= 4;
    }

    public final /* synthetic */ void H(dpf dpfVar) {
        this.zzr = dpfVar;
        this.zza |= 8;
    }

    public final void I(int i) {
        RandomAccess randomAccess = this.zzt;
        boolean z = ((fmf) randomAccess).a;
        RandomAccess randomAccess2 = randomAccess;
        if (!z) {
            gnf gnfVar = (gnf) randomAccess;
            int i2 = gnfVar.c;
            gnf gnfVarN = gnfVar.n(i2 + i2);
            this.zzt = gnfVarN;
            randomAccess2 = gnfVarN;
        }
        ((gnf) randomAccess2).m(0);
    }

    public final /* synthetic */ void J(int i) {
        this.zza |= 32;
        this.zzu = i;
    }

    public final int K() {
        int i;
        switch (this.zzf) {
            case 0:
                i = 2;
                break;
            case 1:
                i = 3;
                break;
            case 2:
                i = 4;
                break;
            case 3:
                i = 5;
                break;
            case 4:
                i = 6;
                break;
            case 5:
                i = 7;
                break;
            case 6:
                i = 8;
                break;
            case 7:
                i = 9;
                break;
            case 8:
                i = 10;
                break;
            case 9:
                i = 11;
                break;
            case 10:
                i = 12;
                break;
            case 11:
                i = 13;
                break;
            case 12:
                i = 14;
                break;
            case 13:
                i = 15;
                break;
            case 14:
                i = 16;
                break;
            case 15:
                i = 17;
                break;
            case 16:
                i = 18;
                break;
            case 17:
                i = 19;
                break;
            case 18:
                i = 20;
                break;
            case 19:
                i = 21;
                break;
            case 20:
                i = 22;
                break;
            case 21:
                i = 23;
                break;
            case 22:
                i = 24;
                break;
            case 23:
                i = 25;
                break;
            case 24:
                i = 26;
                break;
            case 25:
                i = 27;
                break;
            case 26:
                i = 28;
                break;
            case 27:
                i = 29;
                break;
            case 28:
                i = 30;
                break;
            case 29:
                i = 31;
                break;
            case 30:
                i = 32;
                break;
            case 31:
                i = 33;
                break;
            case 32:
                i = 34;
                break;
            case 33:
                i = 35;
                break;
            case 34:
                i = 36;
                break;
            case 35:
                i = 37;
                break;
            case 36:
                i = 38;
                break;
            case 37:
                i = 39;
                break;
            case 38:
                i = 40;
                break;
            case 39:
                i = 41;
                break;
            case 40:
                i = 42;
                break;
            case 41:
                i = 43;
                break;
            case 42:
                i = 44;
                break;
            case 43:
                i = 45;
                break;
            case 44:
                i = 46;
                break;
            case 45:
                i = 47;
                break;
            case 46:
                i = 48;
                break;
            case 47:
                i = 49;
                break;
            case 48:
                i = 50;
                break;
            case 49:
                i = 51;
                break;
            case 50:
                i = 52;
                break;
            case 51:
                i = 53;
                break;
            case 52:
                i = 54;
                break;
            case 53:
                i = 55;
                break;
            case 54:
                i = 56;
                break;
            case 55:
                i = 57;
                break;
            case 56:
                i = 58;
                break;
            case 57:
                i = 59;
                break;
            case 58:
                i = 60;
                break;
            case 59:
                i = 61;
                break;
            case PanasonicMakernoteDirectory.TAG_PROGRAM_ISO /* 60 */:
                i = 62;
                break;
            case 61:
                i = 63;
                break;
            case 62:
                i = 64;
                break;
            case 63:
                i = 65;
                break;
            case 64:
                i = 66;
                break;
            case 65:
                i = 67;
                break;
            case 66:
                i = 68;
                break;
            case 67:
                i = 69;
                break;
            case 68:
                i = 70;
                break;
            case PanasonicMakernoteDirectory.TAG_BRACKET_SETTINGS /* 69 */:
                i = 71;
                break;
            case 70:
                i = 72;
                break;
            case PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM /* 71 */:
                i = 73;
                break;
            case 72:
                i = 74;
                break;
            case 73:
                i = 75;
                break;
            default:
                i = 0;
                break;
        }
        if (i == 0) {
            return 1;
        }
        return i;
    }

    public final void L(int i) {
        if (i != 1) {
            this.zzf = i - 2;
        } else {
            tnf.a();
            throw null;
        }
    }

    public final /* synthetic */ void M(int i) {
        this.zzg = i - 2;
    }

    public final zmf v() {
        zmf zmfVar = this.zzm;
        return zmfVar == null ? zmf.y() : zmfVar;
    }

    public final /* synthetic */ void w(int i) {
        this.zzn = i - 2;
    }

    public final boolean x() {
        return (this.zza & 32) != 0;
    }

    public final int y() {
        return this.zzu;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzv, "\u0000\u0011\u0001\u0001\u0001\u0013\u0011\u0000\u0001\u0000\u0001\f\u0002Ȉ\u0003\u0003\u0004\f\u0005ဉ\u0001\u0006ဉ\u0002\u0007Ȉ\bȈ\tȈ\nဉ\u0000\u000bဉ\u0003\rဉ\u0004\u000eȈ\u000f<\u0000\u0011'\u0012င\u0005\u0013\f", new Object[]{"zze", "zzd", dpBiLjNeNsiASg.BjZMgIjhq, "zzf", "zzi", "zzl", "zzn", "zzo", "zzp", "zzq", "zzj", "zzk", "zzm", "zzr", "zzs", "zzh", spf.class, "zzt", "zzu", "zzg"});
        }
        if (i2 == 3) {
            return new kqf();
        }
        if (i2 == 4) {
            return new jqf(zzv);
        }
        if (i2 == 5) {
            return zzv;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzw;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (kqf.class) {
            try {
                dnfVar = zzw;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzv);
                    zzw = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }
}
