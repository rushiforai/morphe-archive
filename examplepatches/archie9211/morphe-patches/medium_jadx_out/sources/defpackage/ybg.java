package defpackage;

import java.security.GeneralSecurityException;
import java.security.Provider;
import java.util.Map;
import javax.crypto.KeyAgreement;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ybg implements yfg, jvg {
    @Override // defpackage.jvg
    public /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? KeyAgreement.getInstance(str) : KeyAgreement.getInstance(str, provider);
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) throws GeneralSecurityException {
        vag vagVar = (vag) gr7Var;
        sng sngVarW = ung.w();
        byte[] bArrB = ((qvg) vagVar.i.b).b();
        rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
        sngVarW.c();
        ung.v((ung) sngVarW.b, rsfVarP);
        rsf rsfVarB = ((ung) sngVarW.b()).b();
        zrg zrgVar = zrg.SYMMETRIC;
        bbg bbgVar = vagVar.h.b;
        Map map = nbg.e;
        if (map.containsKey(bbgVar)) {
            return nig.I("type.googleapis.com/google.crypto.tink.AesSivKey", rsfVarB, zrgVar, (ntg) map.get(bbgVar), vagVar.k);
        }
        throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(bbgVar)));
    }
}
