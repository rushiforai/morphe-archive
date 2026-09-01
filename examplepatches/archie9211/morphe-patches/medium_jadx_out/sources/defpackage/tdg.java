package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class tdg {
    public static final isg a;

    static {
        byte[] bArr = new byte[0];
        ypg ypgVar = ypg.NIST_P256;
        iqg iqgVar = iqg.SHA256;
        pog pogVar = pog.UNCOMPRESSED;
        isg isgVar = n0g.a;
        ntg ntgVar = ntg.TINK;
        a = a(ypgVar, iqgVar, pogVar, isgVar, ntgVar, bArr);
        a(ypgVar, iqgVar, pog.COMPRESSED, isgVar, ntg.RAW, bArr);
        a(ypgVar, iqgVar, pogVar, n0g.c, ntgVar, bArr);
    }

    public static isg a(ypg ypgVar, iqg iqgVar, pog pogVar, isg isgVar, ntg ntgVar, byte[] bArr) {
        sog sogVarT = uog.t();
        rpg rpgVarT = tpg.t();
        rpgVarT.c();
        ((tpg) rpgVarT.b).zze = ypgVar.zza();
        rpgVarT.c();
        ((tpg) rpgVarT.b).zzf = iqgVar.zza();
        rsf rsfVarP = hsf.p(bArr, 0, bArr.length);
        rpgVarT.c();
        tpg.u((tpg) rpgVarT.b, rsfVarP);
        tpg tpgVar = (tpg) rpgVarT.b();
        mog mogVarT = oog.t();
        mogVarT.c();
        oog.u((oog) mogVarT.b, isgVar);
        oog oogVar = (oog) mogVarT.b();
        yog yogVarY = zog.y();
        yogVarY.c();
        zog.w((zog) yogVarY.b, tpgVar);
        yogVarY.c();
        zog.u((zog) yogVarY.b, oogVar);
        yogVarY.c();
        ((zog) yogVarY.b).zzh = pogVar.zza();
        zog zogVar = (zog) yogVarY.b();
        sogVarT.c();
        uog.v((uog) sogVarT.b, zogVar);
        uog uogVar = (uog) sogVarT.b();
        hsg hsgVarT = isg.t();
        cig cigVar = acg.a;
        hsgVarT.g("type.googleapis.com/google.crypto.tink.EciesAeadHkdfPrivateKey");
        hsgVarT.e(ntgVar);
        hsgVarT.h(uogVar.b());
        return (isg) hsgVarT.b();
    }
}
