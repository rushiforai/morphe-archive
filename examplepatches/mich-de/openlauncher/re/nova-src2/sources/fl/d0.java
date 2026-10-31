package fl;

import android.content.Context;
import com.google.crypto.tink.shaded.protobuf.InvalidProtocolBufferException;
import java.security.GeneralSecurityException;
import kl.p0;
import kl.q0;
import kl.s0;
import pl.a1;
import pl.a2;
import pl.b1;
import pl.f1;
import pl.i1;
import pl.j1;
import pl.t1;
import pl.u1;
import pl.v1;
import pl.w1;
import pl.x1;
import pl.y0;
import pl.y1;
import pl.z0;

/* loaded from: classes.dex */
public final /* synthetic */ class d0 implements kl.e0, kl.o, kl.m, kl.g0, kl.l0, ya.z {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55298a;

    public /* synthetic */ d0(int i5) {
        this.f55298a = i5;
    }

    @Override // kl.e0
    public el.g c(q0 q0Var) throws GeneralSecurityException {
        switch (this.f55298a) {
            case 0:
                j1 j1Var = (j1) q0Var.f71630b;
                if (j1Var.A().equals("type.googleapis.com/google.crypto.tink.KmsAeadKey")) {
                    try {
                        return new c0(w1.z(j1Var.B(), com.google.crypto.tink.shaded.protobuf.p.a()).x(), e0.b(j1Var.z()));
                    } catch (InvalidProtocolBufferException e3) {
                        throw new GeneralSecurityException("Parsing KmsAeadKeyFormat failed: ", e3);
                    }
                }
                throw new IllegalArgumentException("Wrong type URL in call to LegacyKmsAeadProtoSerialization.parseParameters: " + j1Var.A());
            case 4:
                j1 j1Var2 = (j1) q0Var.f71630b;
                if (!j1Var2.A().equals("type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to LegacyKmsEnvelopeAeadProtoSerialization.parseParameters: " + j1Var2.A());
                }
                try {
                    return h0.a(a2.B(j1Var2.B(), com.google.crypto.tink.shaded.protobuf.p.a()), j1Var2.z());
                } catch (InvalidProtocolBufferException e11) {
                    throw new GeneralSecurityException("Parsing KmsEnvelopeAeadKeyFormat failed: ", e11);
                }
            case 11:
                j1 j1Var3 = (j1) q0Var.f71630b;
                if (!j1Var3.A().equals("type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to AesCtrHmacAeadProtoSerialization.parseParameters: " + j1Var3.A());
                }
                try {
                    pl.j jVarA = pl.j.A(j1Var3.B(), com.google.crypto.tink.shaded.protobuf.p.a());
                    if (jVarA.y().A() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    bm.t tVarB = k.b();
                    tVarB.t(jVarA.x().y());
                    tVarB.u(jVarA.y().y());
                    tVarB.v(jVarA.x().z().x());
                    tVarB.w(jVarA.y().z().z());
                    tVarB.f18114f = gl.a.b(jVarA.y().z().y());
                    tVarB.f18115g = gl.a.d(j1Var3.z());
                    return tVarB.j();
                } catch (InvalidProtocolBufferException e12) {
                    throw new GeneralSecurityException("Parsing AesCtrHmacAeadParameters failed: ", e12);
                }
            case 15:
                j1 j1Var4 = (j1) q0Var.f71630b;
                if (!j1Var4.A().equals("type.googleapis.com/google.crypto.tink.AesEaxKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to AesEaxProtoSerialization.parseParameters: " + j1Var4.A());
                }
                try {
                    pl.t tVarA = pl.t.A(j1Var4.B(), com.google.crypto.tink.shaded.protobuf.p.a());
                    x7.n nVarB = o.b();
                    nVarB.q(tVarA.x());
                    nVarB.o(tVarA.y().x());
                    nVarB.r();
                    nVarB.f95152d = gl.b.c(j1Var4.z());
                    return nVarB.d();
                } catch (InvalidProtocolBufferException e13) {
                    throw new GeneralSecurityException("Parsing AesEaxParameters failed: ", e13);
                }
            case 19:
                j1 j1Var5 = (j1) q0Var.f71630b;
                if (!j1Var5.A().equals("type.googleapis.com/google.crypto.tink.AesGcmKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to AesGcmProtoSerialization.parseParameters: " + j1Var5.A());
                }
                try {
                    pl.z zVarZ = pl.z.z(j1Var5.B(), com.google.crypto.tink.shaded.protobuf.p.a());
                    if (zVarZ.x() != 0) {
                        throw new GeneralSecurityException("Only version 0 parameters are accepted");
                    }
                    x7.h hVarB = r.b();
                    hVarB.p(zVarZ.w());
                    hVarB.o();
                    hVarB.q();
                    hVarB.f95140e = gl.d.b(j1Var5.z());
                    return hVarB.d();
                } catch (InvalidProtocolBufferException e14) {
                    throw new GeneralSecurityException("Parsing AesGcmParameters failed: ", e14);
                }
            case 23:
                j1 j1Var6 = (j1) q0Var.f71630b;
                if (!j1Var6.A().equals("type.googleapis.com/google.crypto.tink.AesGcmSivKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to AesGcmSivProtoSerialization.parseParameters: " + j1Var6.A());
                }
                try {
                    pl.d0 d0VarZ = pl.d0.z(j1Var6.B(), com.google.crypto.tink.shaded.protobuf.p.a());
                    if (d0VarZ.x() != 0) {
                        throw new GeneralSecurityException("Only version 0 parameters are accepted");
                    }
                    q0 q0VarB = u.b();
                    q0VarB.i(d0VarZ.w());
                    q0VarB.f71630b = gl.f.b(j1Var6.z());
                    return q0VarB.a();
                } catch (InvalidProtocolBufferException e15) {
                    throw new GeneralSecurityException("Parsing AesGcmSivParameters failed: ", e15);
                }
            default:
                j1 j1Var7 = (j1) q0Var.f71630b;
                if (!j1Var7.A().equals("type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key")) {
                    throw new IllegalArgumentException("Wrong type URL in call to ChaCha20Poly1305ProtoSerialization.parseParameters: " + j1Var7.A());
                }
                try {
                    pl.h0.w(j1Var7.B(), com.google.crypto.tink.shaded.protobuf.p.a());
                    return new x(gl.h.b(j1Var7.z()));
                } catch (InvalidProtocolBufferException e16) {
                    throw new GeneralSecurityException("Parsing ChaCha20Poly1305Parameters failed: ", e16);
                }
        }
    }

    @Override // kl.g0
    public q0 d(el.g gVar) {
        switch (this.f55298a) {
            case 3:
                g0 g0Var = (g0) gVar;
                i1 i1VarC = j1.C();
                i1VarC.g("type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey");
                i1VarC.h(h0.b(g0Var).e());
                i1VarC.f(h0.c(g0Var.f55313a));
                return q0.c((j1) i1VarC.a());
            case 10:
                k kVar = (k) gVar;
                i1 i1VarC2 = j1.C();
                i1VarC2.g("type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey");
                pl.i iVarZ = pl.j.z();
                pl.m mVarA = pl.n.A();
                pl.o oVarY = pl.p.y();
                oVarY.f(kVar.f55366c);
                mVarA.g((pl.p) oVarY.a());
                mVarA.f(kVar.f55364a);
                iVarZ.f((pl.n) mVarA.a());
                a1 a1VarB = b1.B();
                a1VarB.g(gl.a.a(kVar));
                a1VarB.f(kVar.f55365b);
                iVarZ.g((b1) a1VarB.a());
                i1VarC2.h(((pl.j) iVarZ.a()).e());
                i1VarC2.f(gl.a.c(kVar.f55368e));
                return q0.c((j1) i1VarC2.a());
            case 14:
                o oVar = (o) gVar;
                i1 i1VarC3 = j1.C();
                i1VarC3.g("type.googleapis.com/google.crypto.tink.AesEaxKey");
                pl.s sVarZ = pl.t.z();
                sVarZ.g(gl.b.a(oVar));
                sVarZ.f(oVar.f55394a);
                i1VarC3.h(((pl.t) sVarZ.a()).e());
                i1VarC3.f(gl.b.b(oVar.f55397d));
                return q0.c((j1) i1VarC3.a());
            case 18:
                r rVar = (r) gVar;
                gl.d.c(rVar);
                i1 i1VarC4 = j1.C();
                i1VarC4.g("type.googleapis.com/google.crypto.tink.AesGcmKey");
                pl.y yVarY = pl.z.y();
                yVarY.f(rVar.f55408a);
                i1VarC4.h(((pl.z) yVarY.a()).e());
                i1VarC4.f(gl.d.a(rVar.f55411d));
                return q0.c((j1) i1VarC4.a());
            case 22:
                u uVar = (u) gVar;
                i1 i1VarC5 = j1.C();
                i1VarC5.g("type.googleapis.com/google.crypto.tink.AesGcmSivKey");
                pl.c0 c0VarY = pl.d0.y();
                c0VarY.f(uVar.f55420a);
                i1VarC5.h(((pl.d0) c0VarY.a()).e());
                i1VarC5.f(gl.f.a(uVar.f55421b));
                return q0.c((j1) i1VarC5.a());
            default:
                i1 i1VarC6 = j1.C();
                i1VarC6.g("type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key");
                i1VarC6.h(pl.h0.v().e());
                i1VarC6.f(gl.h.a(((x) gVar).f55429a));
                return q0.c((j1) i1VarC6.a());
        }
    }

    @Override // kl.l0
    public Object e(bh.g gVar) {
        switch (this.f55298a) {
            case 7:
                return d.a((j0) gVar);
            default:
                m0 m0Var = (m0) gVar;
                return d.d() ? d.b(m0Var) : sl.t.a(m0Var);
        }
    }

    @Override // kl.o
    public p0 f(bh.g gVar) {
        switch (this.f55298a) {
            case 1:
                a0 a0Var = (a0) gVar;
                t1 t1VarZ = u1.z();
                v1 v1VarY = w1.y();
                v1VarY.f(a0Var.f55281c.f55296a);
                t1VarZ.f((w1) v1VarY.a());
                return p0.a("type.googleapis.com/google.crypto.tink.KmsAeadKey", ((u1) t1VarZ.a()).e(), f1.REMOTE, e0.a(a0Var.f55281c.f55297b), a0Var.f55283e);
            case 5:
                f0 f0Var = (f0) gVar;
                x1 x1VarZ = y1.z();
                x1VarZ.f(h0.b(f0Var.f55310c));
                return p0.a("type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey", ((y1) x1VarZ.a()).e(), f1.REMOTE, h0.c(f0Var.f55310c.f55313a), f0Var.f55312e);
            case 12:
                f fVar = (f) gVar;
                pl.g gVarB = pl.h.B();
                pl.k kVarB = pl.l.B();
                pl.o oVarY = pl.p.y();
                oVarY.f(fVar.f55305c.f55366c);
                kVarB.g((pl.p) oVarY.a());
                t5.d0 d0Var = fVar.f55306d;
                el.j jVar = el.j.f52808a;
                byte[] bArrJ = d0Var.J(jVar);
                kVarB.f(com.google.crypto.tink.shaded.protobuf.i.e(0, bArrJ.length, bArrJ));
                gVarB.f((pl.l) kVarB.a());
                y0 y0VarC = z0.C();
                k kVar = fVar.f55305c;
                y0VarC.g(gl.a.a(kVar));
                byte[] bArrJ2 = fVar.f55307e.J(jVar);
                y0VarC.f(com.google.crypto.tink.shaded.protobuf.i.e(0, bArrJ2.length, bArrJ2));
                gVarB.g((z0) y0VarC.a());
                return p0.a("type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey", ((pl.h) gVarB.a()).e(), f1.SYMMETRIC, gl.a.c(kVar.f55368e), fVar.f55309g);
            case 16:
                m mVar = (m) gVar;
                pl.q qVarB = pl.r.B();
                qVarB.g(gl.b.a(mVar.f55379c));
                byte[] bArrJ3 = mVar.f55380d.J(el.j.f52808a);
                qVarB.f(com.google.crypto.tink.shaded.protobuf.i.e(0, bArrJ3.length, bArrJ3));
                return p0.a("type.googleapis.com/google.crypto.tink.AesEaxKey", ((pl.r) qVarB.a()).e(), f1.SYMMETRIC, gl.b.b(mVar.f55379c.f55397d), mVar.f55382f);
            case 20:
                p pVar = (p) gVar;
                gl.d.c(pVar.f55399c);
                pl.w wVarZ = pl.x.z();
                byte[] bArrJ4 = pVar.f55400d.J(el.j.f52808a);
                wVarZ.f(com.google.crypto.tink.shaded.protobuf.i.e(0, bArrJ4.length, bArrJ4));
                return p0.a("type.googleapis.com/google.crypto.tink.AesGcmKey", ((pl.x) wVarZ.a()).e(), f1.SYMMETRIC, gl.d.a(pVar.f55399c.f55411d), pVar.f55402f);
            case 24:
                s sVar = (s) gVar;
                pl.a0 a0VarZ = pl.b0.z();
                byte[] bArrJ5 = sVar.f55413d.J(el.j.f52808a);
                a0VarZ.f(com.google.crypto.tink.shaded.protobuf.i.e(0, bArrJ5.length, bArrJ5));
                return p0.a("type.googleapis.com/google.crypto.tink.AesGcmSivKey", ((pl.b0) a0VarZ.a()).e(), f1.SYMMETRIC, gl.f.a(sVar.f55412c.f55421b), sVar.f55415f);
            default:
                v vVar = (v) gVar;
                pl.e0 e0VarZ = pl.f0.z();
                byte[] bArrJ6 = vVar.f55423d.J(el.j.f52808a);
                e0VarZ.f(com.google.crypto.tink.shaded.protobuf.i.e(0, bArrJ6.length, bArrJ6));
                return p0.a("type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key", ((pl.f0) e0VarZ.a()).e(), f1.SYMMETRIC, gl.h.a(vVar.f55422c.f55429a), vVar.f55425f);
        }
    }

    @Override // ya.z
    public Object g(Context context) {
        return new g30.b(context);
    }

    @Override // kl.m
    public bh.g h(s0 s0Var) throws GeneralSecurityException {
        switch (this.f55298a) {
            case 2:
                p0 p0Var = (p0) s0Var;
                if (!p0Var.f71620a.equals("type.googleapis.com/google.crypto.tink.KmsAeadKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to LegacyKmsAeadProtoSerialization.parseKey");
                }
                try {
                    u1 u1VarA = u1.A(p0Var.f71622c, com.google.crypto.tink.shaded.protobuf.p.a());
                    if (u1VarA.y() == 0) {
                        return a0.p0(new c0(u1VarA.x().x(), e0.b(p0Var.f71624e)), p0Var.f71625f);
                    }
                    throw new GeneralSecurityException("KmsAeadKey are only accepted with version 0, got " + u1VarA);
                } catch (InvalidProtocolBufferException e3) {
                    throw new GeneralSecurityException("Parsing KmsAeadKey failed: ", e3);
                }
            case 6:
                p0 p0Var2 = (p0) s0Var;
                if (!p0Var2.f71620a.equals("type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to LegacyKmsEnvelopeAeadProtoSerialization.parseKey");
                }
                try {
                    y1 y1VarA = y1.A(p0Var2.f71622c, com.google.crypto.tink.shaded.protobuf.p.a());
                    if (y1VarA.y() == 0) {
                        return f0.p0(h0.a(y1VarA.x(), p0Var2.f71624e), p0Var2.f71625f);
                    }
                    throw new GeneralSecurityException("KmsEnvelopeAeadKeys are only accepted with version 0, got " + y1VarA);
                } catch (InvalidProtocolBufferException e11) {
                    throw new GeneralSecurityException("Parsing KmsEnvelopeAeadKey failed: ", e11);
                }
            case 13:
                el.j jVar = el.j.f52808a;
                p0 p0Var3 = (p0) s0Var;
                if (!p0Var3.f71620a.equals("type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to AesCtrHmacAeadProtoSerialization.parseKey");
                }
                try {
                    pl.h hVarC = pl.h.C(p0Var3.f71622c, com.google.crypto.tink.shaded.protobuf.p.a());
                    if (hVarC.A() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    if (hVarC.y().A() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys inner AES CTR keys are accepted");
                    }
                    if (hVarC.z().B() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys inner HMAC keys are accepted");
                    }
                    bm.t tVarB = k.b();
                    tVarB.t(hVarC.y().y().size());
                    tVarB.u(hVarC.z().z().size());
                    tVarB.v(hVarC.y().z().x());
                    tVarB.w(hVarC.z().A().z());
                    tVarB.f18114f = gl.a.b(hVarC.z().A().y());
                    tVarB.f18115g = gl.a.d(p0Var3.f71624e);
                    k kVarJ = tVarB.j();
                    tm.o oVar = new tm.o(16);
                    oVar.D0(kVarJ);
                    oVar.x0(t5.d0.h(hVarC.y().y().h(), jVar));
                    oVar.A0(t5.d0.h(hVarC.z().z().h(), jVar));
                    oVar.B0(p0Var3.f71625f);
                    return oVar.P();
                } catch (InvalidProtocolBufferException unused) {
                    throw new GeneralSecurityException("Parsing AesCtrHmacAeadKey failed");
                }
            case 17:
                el.j jVar2 = el.j.f52808a;
                p0 p0Var4 = (p0) s0Var;
                if (!p0Var4.f71620a.equals("type.googleapis.com/google.crypto.tink.AesEaxKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to AesEaxProtoSerialization.parseKey");
                }
                try {
                    pl.r rVarC = pl.r.C(p0Var4.f71622c, com.google.crypto.tink.shaded.protobuf.p.a());
                    if (rVarC.A() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    x7.n nVarB = o.b();
                    nVarB.q(rVarC.y().size());
                    nVarB.o(rVarC.z().x());
                    nVarB.r();
                    nVarB.f95152d = gl.b.c(p0Var4.f71624e);
                    o oVarD = nVarB.d();
                    l lVar = new l(0, false);
                    lVar.v(oVarD);
                    lVar.u(t5.d0.h(rVarC.y().h(), jVar2));
                    lVar.t(p0Var4.f71625f);
                    return lVar.a();
                } catch (InvalidProtocolBufferException unused2) {
                    throw new GeneralSecurityException("Parsing AesEaxcKey failed");
                }
            case 21:
                el.j jVar3 = el.j.f52808a;
                p0 p0Var5 = (p0) s0Var;
                if (!p0Var5.f71620a.equals("type.googleapis.com/google.crypto.tink.AesGcmKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to AesGcmProtoSerialization.parseKey");
                }
                try {
                    pl.x xVarA = pl.x.A(p0Var5.f71622c, com.google.crypto.tink.shaded.protobuf.p.a());
                    if (xVarA.y() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    x7.h hVarB = r.b();
                    hVarB.p(xVarA.x().size());
                    hVarB.o();
                    hVarB.q();
                    hVarB.f95140e = gl.d.b(p0Var5.f71624e);
                    r rVarD = hVarB.d();
                    l lVar2 = new l(1, false);
                    lVar2.w(rVarD);
                    lVar2.u(t5.d0.h(xVarA.x().h(), jVar3));
                    lVar2.t(p0Var5.f71625f);
                    return lVar2.b();
                } catch (InvalidProtocolBufferException unused3) {
                    throw new GeneralSecurityException("Parsing AesGcmKey failed");
                }
            case 25:
                el.j jVar4 = el.j.f52808a;
                p0 p0Var6 = (p0) s0Var;
                if (!p0Var6.f71620a.equals("type.googleapis.com/google.crypto.tink.AesGcmSivKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to AesGcmSivProtoSerialization.parseKey");
                }
                try {
                    pl.b0 b0VarA = pl.b0.A(p0Var6.f71622c, com.google.crypto.tink.shaded.protobuf.p.a());
                    if (b0VarA.y() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    q0 q0VarB = u.b();
                    q0VarB.i(b0VarA.x().size());
                    q0VarB.f71630b = gl.f.b(p0Var6.f71624e);
                    u uVarA = q0VarB.a();
                    l lVar3 = new l(2, false);
                    lVar3.x(uVarA);
                    lVar3.u(t5.d0.h(b0VarA.x().h(), jVar4));
                    lVar3.t(p0Var6.f71625f);
                    return lVar3.d();
                } catch (InvalidProtocolBufferException unused4) {
                    throw new GeneralSecurityException("Parsing AesGcmSivKey failed");
                }
            default:
                el.j jVar5 = el.j.f52808a;
                p0 p0Var7 = (p0) s0Var;
                if (!p0Var7.f71620a.equals("type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key")) {
                    throw new IllegalArgumentException("Wrong type URL in call to ChaCha20Poly1305ProtoSerialization.parseKey");
                }
                try {
                    pl.f0 f0VarA = pl.f0.A(p0Var7.f71622c, com.google.crypto.tink.shaded.protobuf.p.a());
                    if (f0VarA.y() == 0) {
                        return v.p0(gl.h.b(p0Var7.f71624e), t5.d0.h(f0VarA.x().h(), jVar5), p0Var7.f71625f);
                    }
                    throw new GeneralSecurityException("Only version 0 keys are accepted");
                } catch (InvalidProtocolBufferException unused5) {
                    throw new GeneralSecurityException("Parsing ChaCha20Poly1305Key failed");
                }
        }
    }
}
