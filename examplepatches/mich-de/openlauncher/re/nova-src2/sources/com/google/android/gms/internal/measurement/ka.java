package com.google.android.gms.internal.measurement;

import android.os.Build;
import androidx.compose.ui.node.LayoutNode;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes3.dex */
public final class ka extends o1 {
    private static final ka zzaw;
    private static volatile o2 zzax;
    private long zzA;
    private int zzB;
    private String zzC;
    private String zzD;
    private boolean zzE;
    private y1 zzF;
    private String zzG;
    private int zzH;
    private int zzI;
    private int zzJ;
    private String zzK;
    private long zzL;
    private long zzM;
    private String zzN;
    private String zzO;
    private int zzP;
    private String zzQ;
    private la zzR;
    private t1 zzS;
    private long zzT;
    private long zzU;
    private String zzV;
    private String zzW;
    private int zzX;
    private boolean zzY;
    private String zzZ;
    private boolean zzaa;
    private ga zzab;
    private String zzac;
    private y1 zzad;
    private String zzae;
    private long zzaf;
    private boolean zzag;
    private String zzah;
    private boolean zzai;
    private String zzaj;
    private int zzak;
    private String zzal;
    private s9 zzam;
    private int zzan;
    private p9 zzao;
    private String zzap;
    private ra zzaq;
    private long zzar;
    private String zzas;
    private y9 zzat;
    private String zzau;
    private y1 zzav;
    private int zzb;
    private int zze;
    private int zzf;
    private y1 zzg;
    private y1 zzh;
    private long zzi;
    private long zzj;
    private long zzk;
    private long zzl;
    private long zzm;
    private String zzn;
    private String zzo;
    private String zzp;
    private String zzq;
    private int zzr;
    private String zzs;
    private String zzt;
    private String zzu;
    private long zzv;
    private long zzw;
    private String zzx;
    private boolean zzy;
    private String zzz;

    static {
        ka kaVar = new ka();
        zzaw = kaVar;
        o1.p(ka.class, kaVar);
    }

    public ka() {
        r2 r2Var = r2.f33023e;
        this.zzg = r2Var;
        this.zzh = r2Var;
        this.zzn = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzo = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzp = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzq = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzs = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzt = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzu = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzx = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzz = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzC = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzD = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzF = r2Var;
        this.zzG = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzK = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzN = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzO = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzQ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzS = p1.f32946e;
        this.zzV = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzW = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzZ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzac = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzad = r2Var;
        this.zzae = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzah = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzaj = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzal = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzap = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzas = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzau = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzav = r2Var;
    }

    public static ja c0() {
        return (ja) zzaw.k();
    }

    public static ja d0(ka kaVar) {
        l1 l1VarK = zzaw.k();
        l1VarK.g(kaVar);
        return (ja) l1VarK;
    }

    public final long A() {
        return this.zzv;
    }

    public final long A0() {
        return this.zzT;
    }

    public final /* synthetic */ void A1(int i5) {
        this.zzb |= 1024;
        this.zzr = i5;
    }

    public final boolean B() {
        return (this.zzb & SQLiteDatabase.OPEN_NOMUTEX) != 0;
    }

    public final boolean B0() {
        return (this.zze & 128) != 0;
    }

    public final /* synthetic */ void B1(String str) {
        str.getClass();
        this.zzb |= 2048;
        this.zzs = str;
    }

    public final long C() {
        return this.zzw;
    }

    public final String C0() {
        return this.zzW;
    }

    public final /* synthetic */ void C1(String str) {
        str.getClass();
        this.zzb |= androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
        this.zzt = str;
    }

    public final String D() {
        return this.zzx;
    }

    public final boolean D0() {
        return (this.zze & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0;
    }

    public final /* synthetic */ void D1(String str) {
        str.getClass();
        this.zzb |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
        this.zzu = str;
    }

    public final boolean E() {
        return (this.zzb & SQLiteDatabase.OPEN_SHAREDCACHE) != 0;
    }

    public final String E0() {
        return this.zzac;
    }

    public final /* synthetic */ void E1(long j11) {
        this.zzb |= ReaderJsonLexerKt.BATCH_SIZE;
        this.zzv = j11;
    }

    public final boolean F() {
        return this.zzy;
    }

    public final boolean F0() {
        return (this.zze & SQLiteDatabase.OPEN_NOMUTEX) != 0;
    }

    public final /* synthetic */ void F1() {
        this.zzb |= SQLiteDatabase.OPEN_NOMUTEX;
        this.zzw = 161000L;
    }

    public final String G() {
        return this.zzz;
    }

    public final long G0() {
        return this.zzaf;
    }

    public final /* synthetic */ void G1(String str) {
        str.getClass();
        this.zzb |= SQLiteDatabase.OPEN_FULLMUTEX;
        this.zzx = str;
    }

    public final boolean H() {
        return (this.zzb & 524288) != 0;
    }

    public final boolean H0() {
        return this.zzag;
    }

    public final /* synthetic */ void H1() {
        this.zzb &= -65537;
        this.zzx = zzaw.zzx;
    }

    public final long I() {
        return this.zzA;
    }

    public final boolean I0() {
        return (this.zze & SQLiteDatabase.OPEN_SHAREDCACHE) != 0;
    }

    public final /* synthetic */ void I1(boolean z11) {
        this.zzb |= SQLiteDatabase.OPEN_SHAREDCACHE;
        this.zzy = z11;
    }

    public final boolean J() {
        return (this.zzb & 1048576) != 0;
    }

    public final String J0() {
        return this.zzah;
    }

    public final /* synthetic */ void J1() {
        this.zzb &= -131073;
        this.zzy = false;
    }

    public final int K() {
        return this.zzB;
    }

    public final boolean K0() {
        return (this.zze & SQLiteDatabase.OPEN_PRIVATECACHE) != 0;
    }

    public final /* synthetic */ void K1(String str) {
        this.zzb |= SQLiteDatabase.OPEN_PRIVATECACHE;
        this.zzz = str;
    }

    public final String L() {
        return this.zzC;
    }

    public final boolean L0() {
        return this.zzai;
    }

    public final /* synthetic */ void L1() {
        this.zzb &= -262145;
        this.zzz = zzaw.zzz;
    }

    public final String M() {
        return this.zzD;
    }

    public final boolean M0() {
        return (this.zze & 524288) != 0;
    }

    public final /* synthetic */ void M1(long j11) {
        this.zzb |= 524288;
        this.zzA = j11;
    }

    public final boolean N() {
        return (this.zzb & 8388608) != 0;
    }

    public final String N0() {
        return this.zzaj;
    }

    public final /* synthetic */ void N1(int i5) {
        this.zzb |= 1048576;
        this.zzB = i5;
    }

    public final boolean O() {
        return this.zzE;
    }

    public final int O0() {
        return this.zzak;
    }

    public final /* synthetic */ void O1(String str) {
        this.zzb |= 2097152;
        this.zzC = str;
    }

    public final y1 P() {
        return this.zzF;
    }

    public final boolean P0() {
        return (this.zze & 4194304) != 0;
    }

    public final /* synthetic */ void P1() {
        this.zzb &= -2097153;
        this.zzC = zzaw.zzC;
    }

    public final String Q() {
        return this.zzG;
    }

    public final s9 Q0() {
        s9 s9Var = this.zzam;
        return s9Var == null ? s9.F() : s9Var;
    }

    public final /* synthetic */ void Q1(String str) {
        str.getClass();
        this.zzb |= 4194304;
        this.zzD = str;
    }

    public final boolean R() {
        return (this.zzb & 33554432) != 0;
    }

    public final boolean R0() {
        return (this.zze & 8388608) != 0;
    }

    public final /* synthetic */ void R1() {
        this.zzb |= 8388608;
        this.zzE = false;
    }

    public final int S() {
        return this.zzH;
    }

    public final int S0() {
        return this.zzan;
    }

    public final void S1(ArrayList arrayList) {
        y1 y1Var = this.zzF;
        if (!((o0) y1Var).f32868a) {
            this.zzF = b.c9.i(y1Var);
        }
        n0.d(arrayList, this.zzF);
    }

    public final boolean T() {
        return (this.zzb & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0;
    }

    public final boolean T0() {
        return (this.zze & 16777216) != 0;
    }

    public final void T1() {
        this.zzF = r2.f33023e;
    }

    public final long U() {
        return this.zzL;
    }

    public final p9 U0() {
        p9 p9Var = this.zzao;
        return p9Var == null ? p9.d0() : p9Var;
    }

    public final /* synthetic */ void U1(String str) {
        this.zzb |= 16777216;
        this.zzG = str;
    }

    public final boolean V() {
        return (this.zzb & Integer.MIN_VALUE) != 0;
    }

    public final boolean V0() {
        return (this.zze & 67108864) != 0;
    }

    public final /* synthetic */ void V1(int i5) {
        this.zzb |= 33554432;
        this.zzH = i5;
    }

    public final String W() {
        return this.zzN;
    }

    public final ra W0() {
        ra raVar = this.zzaq;
        return raVar == null ? ra.z() : raVar;
    }

    public final /* synthetic */ void W1() {
        this.zzb &= -268435457;
        this.zzK = zzaw.zzK;
    }

    public final boolean X() {
        return (this.zzb & 1) != 0;
    }

    public final int X0() {
        return this.zzf;
    }

    public final List X1() {
        return this.zzg;
    }

    public final boolean Y() {
        return (this.zze & 134217728) != 0;
    }

    public final /* synthetic */ void Y0(long j11) {
        this.zzb |= SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING;
        this.zzL = j11;
    }

    public final void Y1() {
        y1 y1Var = this.zzg;
        if (((o0) y1Var).f32868a) {
            return;
        }
        this.zzg = b.c9.i(y1Var);
    }

    public final long Z() {
        return this.zzar;
    }

    public final /* synthetic */ void Z0(String str) {
        str.getClass();
        this.zzb |= Integer.MIN_VALUE;
        this.zzN = str;
    }

    public final void Z1() {
        y1 y1Var = this.zzh;
        if (((o0) y1Var).f32868a) {
            return;
        }
        this.zzh = b.c9.i(y1Var);
    }

    public final boolean a0() {
        return (this.zze & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0;
    }

    public final /* synthetic */ void a1() {
        this.zzb &= LayoutNode.NotPlacedPlaceOrder;
        this.zzN = zzaw.zzN;
    }

    public final void a2(List list) {
        y1 y1Var = this.zzav;
        if (!((o0) y1Var).f32868a) {
            this.zzav = b.c9.i(y1Var);
        }
        n0.d(list, this.zzav);
    }

    public final y9 b0() {
        y9 y9Var = this.zzat;
        return y9Var == null ? y9.z() : y9Var;
    }

    public final /* synthetic */ void b1(int i5) {
        this.zze |= 2;
        this.zzP = i5;
    }

    public final int b2() {
        return this.zzg.size();
    }

    public final void c1(List list) {
        List list2 = this.zzS;
        if (!((o0) list2).f32868a) {
            int size = list2.size();
            this.zzS = ((p1) list2).zzg(size + size);
        }
        n0.d(list, this.zzS);
    }

    public final ca c2(int i5) {
        return (ca) this.zzg.get(i5);
    }

    public final /* synthetic */ void d1(long j11) {
        this.zze |= 16;
        this.zzT = j11;
    }

    public final y1 d2() {
        return this.zzh;
    }

    public final /* synthetic */ void e0() {
        this.zzb |= 1;
        this.zzf = 1;
    }

    public final /* synthetic */ void e1(long j11) {
        this.zze |= 32;
        this.zzU = j11;
    }

    public final int e2() {
        return this.zzh.size();
    }

    public final /* synthetic */ void f0(int i5, ca caVar) {
        Y1();
        this.zzg.set(i5, caVar);
    }

    public final /* synthetic */ void f1(String str) {
        this.zze |= 128;
        this.zzW = str;
    }

    public final ta f2(int i5) {
        return (ta) this.zzh.get(i5);
    }

    public final /* synthetic */ void g0(ca caVar) {
        Y1();
        this.zzg.add(caVar);
    }

    public final /* synthetic */ void g1(String str) {
        str.getClass();
        this.zze |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
        this.zzac = str;
    }

    public final boolean g2() {
        return (this.zzb & 2) != 0;
    }

    public final /* synthetic */ void h0(Iterable iterable) {
        Y1();
        n0.d(iterable, this.zzg);
    }

    public final /* synthetic */ void h1() {
        this.zze &= -8193;
        this.zzac = zzaw.zzac;
    }

    public final long h2() {
        return this.zzi;
    }

    public final void i0() {
        this.zzg = r2.f33023e;
    }

    public final void i1(Set set) {
        y1 y1Var = this.zzad;
        if (!((o0) y1Var).f32868a) {
            this.zzad = b.c9.i(y1Var);
        }
        n0.d(set, this.zzad);
    }

    public final boolean i2() {
        return (this.zzb & 4) != 0;
    }

    public final /* synthetic */ void j0(int i5) {
        Y1();
        this.zzg.remove(i5);
    }

    public final /* synthetic */ void j1(String str) {
        str.getClass();
        this.zze |= ReaderJsonLexerKt.BATCH_SIZE;
        this.zzae = str;
    }

    public final long j2() {
        return this.zzj;
    }

    public final /* synthetic */ void k0(int i5, ta taVar) {
        Z1();
        this.zzh.set(i5, taVar);
    }

    public final /* synthetic */ void k1(long j11) {
        this.zze |= SQLiteDatabase.OPEN_NOMUTEX;
        this.zzaf = j11;
    }

    public final boolean k2() {
        return (this.zzb & 8) != 0;
    }

    public final /* synthetic */ void l0(ta taVar) {
        Z1();
        this.zzh.add(taVar);
    }

    public final /* synthetic */ void l1(boolean z11) {
        this.zze |= SQLiteDatabase.OPEN_FULLMUTEX;
        this.zzag = z11;
    }

    public final long l2() {
        return this.zzk;
    }

    public final /* synthetic */ void m0(int i5) {
        Z1();
        this.zzh.remove(i5);
    }

    public final /* synthetic */ void m1(String str) {
        this.zze |= SQLiteDatabase.OPEN_SHAREDCACHE;
        this.zzah = str;
    }

    public final boolean m2() {
        return (this.zzb & 16) != 0;
    }

    public final /* synthetic */ void n0(long j11) {
        this.zzb |= 2;
        this.zzi = j11;
    }

    public final /* synthetic */ void n1(boolean z11) {
        this.zze |= SQLiteDatabase.OPEN_PRIVATECACHE;
        this.zzai = z11;
    }

    public final long n2() {
        return this.zzl;
    }

    public final /* synthetic */ void o0() {
        this.zzb &= -3;
        this.zzi = 0L;
    }

    public final /* synthetic */ void o1(String str) {
        str.getClass();
        this.zze |= 524288;
        this.zzaj = str;
    }

    public final boolean o2() {
        return (this.zzb & 32) != 0;
    }

    public final /* synthetic */ void p0(long j11) {
        this.zzb |= 4;
        this.zzj = j11;
    }

    public final /* synthetic */ void p1(int i5) {
        this.zze |= 1048576;
        this.zzak = i5;
    }

    public final long p2() {
        return this.zzm;
    }

    public final /* synthetic */ void q0(long j11) {
        this.zzb |= 8;
        this.zzk = j11;
    }

    public final /* synthetic */ void q1(s9 s9Var) {
        this.zzam = s9Var;
        this.zze |= 4194304;
    }

    public final String q2() {
        return this.zzn;
    }

    public final /* synthetic */ void r0(long j11) {
        this.zzb |= 16;
        this.zzl = j11;
    }

    public final /* synthetic */ void r1(int i5) {
        this.zze |= 8388608;
        this.zzan = i5;
    }

    public final String r2() {
        return this.zzo;
    }

    public final /* synthetic */ void s0() {
        this.zzb &= -17;
        this.zzl = 0L;
    }

    public final /* synthetic */ void s1(p9 p9Var) {
        this.zzao = p9Var;
        this.zze |= 16777216;
    }

    public final String s2() {
        return this.zzp;
    }

    public final /* synthetic */ void t0(long j11) {
        this.zzb |= 32;
        this.zzm = j11;
    }

    public final /* synthetic */ void t1(ra raVar) {
        this.zzaq = raVar;
        this.zze |= 67108864;
    }

    public final String t2() {
        return this.zzq;
    }

    public final /* synthetic */ void u0() {
        this.zzb &= -33;
        this.zzm = 0L;
    }

    public final /* synthetic */ void u1(long j11) {
        this.zze |= 134217728;
        this.zzar = j11;
    }

    public final boolean u2() {
        return (this.zzb & 1024) != 0;
    }

    public final /* synthetic */ void v0() {
        this.zzb |= 64;
        this.zzn = "android";
    }

    public final /* synthetic */ void v1(y9 y9Var) {
        this.zzat = y9Var;
        this.zze |= SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING;
    }

    public final int v2() {
        return this.zzr;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzaw, "\u0004E\u0000\u0002\u0001YE\u0000\u0006\u0000\u0001င\u0000\u0002\u001b\u0003\u001b\u0004ဂ\u0001\u0005ဂ\u0002\u0006ဂ\u0003\u0007ဂ\u0005\bဈ\u0006\tဈ\u0007\nဈ\b\u000bဈ\t\fင\n\rဈ\u000b\u000eဈ\f\u0010ဈ\r\u0011ဂ\u000e\u0012ဂ\u000f\u0013ဈ\u0010\u0014ဇ\u0011\u0015ဈ\u0012\u0016ဂ\u0013\u0017င\u0014\u0018ဈ\u0015\u0019ဈ\u0016\u001aဂ\u0004\u001cဇ\u0017\u001d\u001b\u001eဈ\u0018\u001fင\u0019 င\u001a!င\u001b\"ဈ\u001c#ဂ\u001d$ဂ\u001e%ဈ\u001f&ဈ 'င!)ဈ\",ဉ#-\u001d.ဂ$/ဂ%2ဈ&4ဈ'5᠌(7ဇ)9ဈ*:ဇ+;ဉ,?ဈ-@\u001aAဈ.Cဂ/Dဇ0Gဈ1Hဇ2Iဈ3Jင4Kဈ5Lဉ6Mင7Oဉ8Pဈ9Qဉ:Rဂ;Sဈ<Vဉ=Xဈ>Y\u001b", new Object[]{"zzb", "zze", "zzf", "zzg", ca.class, "zzh", ta.class, "zzi", "zzj", "zzk", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs", "zzt", "zzu", "zzv", "zzw", "zzx", "zzy", "zzz", "zzA", "zzB", "zzC", "zzD", "zzl", "zzE", "zzF", u9.class, "zzG", "zzH", "zzI", "zzJ", "zzK", "zzL", "zzM", "zzN", "zzO", "zzP", "zzQ", "zzR", "zzS", "zzT", "zzU", "zzV", "zzW", "zzX", k0.f32713h, "zzY", "zzZ", "zzaa", "zzab", "zzac", "zzad", "zzae", "zzaf", "zzag", "zzah", "zzai", "zzaj", "zzak", "zzal", "zzam", "zzan", "zzao", "zzap", "zzaq", "zzar", "zzas", "zzat", "zzau", "zzav", l8.class});
        }
        if (i11 == 3) {
            return new ka();
        }
        if (i11 == 4) {
            return new ja(zzaw);
        }
        if (i11 == 5) {
            return zzaw;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzax;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (ka.class) {
            try {
                m1Var = zzax;
                if (m1Var == null) {
                    m1Var = new m1(zzaw);
                    zzax = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }

    public final /* synthetic */ void w0(String str) {
        str.getClass();
        this.zzb |= 128;
        this.zzo = str;
    }

    public final /* synthetic */ void w1(String str) {
        str.getClass();
        this.zze |= 1073741824;
        this.zzau = str;
    }

    public final String w2() {
        return this.zzs;
    }

    public final String x() {
        return this.zzt;
    }

    public final boolean x0() {
        return (this.zze & 2) != 0;
    }

    public final /* synthetic */ void x1() {
        String str = Build.MODEL;
        str.getClass();
        this.zzb |= 256;
        this.zzp = str;
    }

    public final String y() {
        return this.zzu;
    }

    public final int y0() {
        return this.zzP;
    }

    public final /* synthetic */ void y1() {
        this.zzb &= -257;
        this.zzp = zzaw.zzp;
    }

    public final boolean z() {
        return (this.zzb & ReaderJsonLexerKt.BATCH_SIZE) != 0;
    }

    public final boolean z0() {
        return (this.zze & 16) != 0;
    }

    public final /* synthetic */ void z1(String str) {
        str.getClass();
        this.zzb |= EventBridgeChannel.QUEUE_CAPACITY;
        this.zzq = str;
    }
}
