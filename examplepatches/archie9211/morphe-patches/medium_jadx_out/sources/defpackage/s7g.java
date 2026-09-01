package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import j$.util.DesugarCollections;
import java.security.GeneralSecurityException;
import java.security.Provider;
import java.util.HashSet;
import javax.crypto.Mac;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class s7g implements vfg, vwf, jvg {
    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        if (!((String) nigVar.a).equals("type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key")) {
            ay0.e("Wrong type URL in call to ChaCha20Poly1305ProtoSerialization.parseKey");
            return null;
        }
        try {
            eog eogVarU = eog.u((hsf) nigVar.c, ptf.a);
            if (eogVarU.t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            return u2g.L(m7g.a((ntg) nigVar.e), new ujf(28, qvg.a(eogVarU.x().x())), (Integer) nigVar.f);
        } catch (zzale unused) {
            ygf.l("Parsing ChaCha20Poly1305Key failed");
            return null;
        }
    }

    public Object a() throws GeneralSecurityException {
        HashSet hashSet = new HashSet();
        o2b o2bVarB = g2g.b();
        o2bVarB.R();
        o2bVarB.W(16);
        o2bVarB.Y();
        d2g d2gVar = d2g.e;
        o2bVarB.e = d2gVar;
        hashSet.add(o2bVarB.P());
        o2b o2bVarB2 = g2g.b();
        o2bVarB2.R();
        o2bVarB2.W(32);
        o2bVarB2.Y();
        o2bVarB2.e = d2gVar;
        hashSet.add(o2bVarB2.P());
        ing ingVarB = f1g.b();
        ingVarB.l(16);
        ingVarB.n(32);
        ingVarB.p(16);
        ingVarB.o(16);
        e1g e1gVar = e1g.e;
        ingVarB.d = e1gVar;
        d1g d1gVar = d1g.e;
        ingVarB.e = d1gVar;
        hashSet.add(ingVarB.i());
        ing ingVarB2 = f1g.b();
        ingVarB2.l(32);
        ingVarB2.n(32);
        ingVarB2.p(32);
        ingVarB2.o(16);
        ingVarB2.d = e1gVar;
        ingVarB2.e = d1gVar;
        hashSet.add(ingVarB2.i());
        hashSet.add(new m5g(d1g.r));
        d2f d2fVarB = dbg.b();
        d2fVarB.E0(64);
        d2fVarB.c = bbg.d;
        hashSet.add(d2fVarB.B0());
        return DesugarCollections.unmodifiableSet(hashSet);
    }

    @Override // defpackage.jvg
    public /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? Mac.getInstance(str) : Mac.getInstance(str, provider);
    }
}
