package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class n0g {
    public static final isg a = a(16);
    public static final isg b = a(32);
    public static final isg c;

    static {
        c(16);
        c(32);
        iqg iqgVar = iqg.SHA256;
        c = b(16, 16, iqgVar);
        b(32, 32, iqgVar);
        hsg hsgVarT = isg.t();
        cig cigVar = a3g.a;
        hsgVarT.g("type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key");
        ntg ntgVar = ntg.TINK;
        hsgVarT.e(ntgVar);
        hsg hsgVarT2 = isg.t();
        cig cigVar2 = d5g.a;
        hsgVarT2.g("type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key");
        hsgVarT2.e(ntgVar);
    }

    public static isg a(int i) {
        dng dngVarX = fng.x();
        dngVarX.c();
        ((fng) dngVarX.b).zze = i;
        fng fngVar = (fng) dngVarX.b();
        hsg hsgVarT = isg.t();
        hsgVarT.h(fngVar.b());
        cig cigVar = z1g.a;
        hsgVarT.g("type.googleapis.com/google.crypto.tink.AesGcmKey");
        hsgVarT.e(ntg.TINK);
        return (isg) hsgVarT.b();
    }

    public static isg b(int i, int i2, iqg iqgVar) {
        emg emgVarW = fmg.w();
        jmg jmgVarV = lmg.v();
        jmgVarV.c();
        ((lmg) jmgVarV.b).zze = 16;
        lmg lmgVar = (lmg) jmgVarV.b();
        emgVarW.c();
        fmg.v((fmg) emgVarW.b, lmgVar);
        emgVarW.c();
        ((fmg) emgVarW.b).zzg = i;
        fmg fmgVar = (fmg) emgVarW.b();
        lqg lqgVarY = nqg.y();
        rqg rqgVarX = tqg.x();
        rqgVarX.c();
        ((tqg) rqgVarX.b).zze = iqgVar.zza();
        rqgVarX.c();
        ((tqg) rqgVarX.b).zzf = i2;
        tqg tqgVar = (tqg) rqgVarX.b();
        lqgVarY.c();
        nqg.w((nqg) lqgVarY.b, tqgVar);
        lqgVarY.c();
        ((nqg) lqgVarY.b).zzg = 32;
        nqg nqgVar = (nqg) lqgVarY.b();
        rlg rlgVarT = tlg.t();
        rlgVarT.c();
        tlg.v((tlg) rlgVarT.b, fmgVar);
        rlgVarT.c();
        tlg.w((tlg) rlgVarT.b, nqgVar);
        tlg tlgVar = (tlg) rlgVarT.b();
        hsg hsgVarT = isg.t();
        hsgVarT.h(tlgVar.b());
        cig cigVar = y0g.a;
        hsgVarT.g("type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey");
        hsgVarT.e(ntg.TINK);
        return (isg) hsgVarT.b();
    }

    public static void c(int i) {
        rmg rmgVarX = smg.x();
        rmgVarX.c();
        ((smg) rmgVarX.b).zzg = i;
        umg umgVarV = wmg.v();
        umgVarV.c();
        ((wmg) umgVarV.b).zze = 16;
        wmg wmgVar = (wmg) umgVarV.b();
        rmgVarX.c();
        smg.w((smg) rmgVarX.b, wmgVar);
        smg smgVar = (smg) rmgVarX.b();
        hsg hsgVarT = isg.t();
        hsgVarT.h(smgVar.b());
        cig cigVar = n1g.a;
        hsgVarT.g("type.googleapis.com/google.crypto.tink.AesEaxKey");
        hsgVarT.e(ntg.TINK);
    }
}
