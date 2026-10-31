package gl;

import android.content.Context;
import com.google.crypto.tink.shaded.protobuf.InvalidProtocolBufferException;
import fl.j0;
import fl.m0;
import fl.o0;
import hn.p;
import java.security.GeneralSecurityException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentSkipListMap;
import kl.e0;
import kl.g0;
import kl.l0;
import kl.o;
import kl.p0;
import kl.q0;
import kl.s;
import kl.s0;
import pl.a3;
import pl.b3;
import pl.f1;
import pl.i1;
import pl.j1;
import pl.t2;
import pl.u2;
import pl.v2;
import pl.w2;
import pl.x2;
import pl.y2;
import pl.z2;
import t5.d0;
import ya.z;

/* loaded from: classes.dex */
public final /* synthetic */ class l implements g0, e0, o, kl.m, p, j2.i, z, l0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57738a;

    public /* synthetic */ l(int i5) {
        this.f57738a = i5;
    }

    @Override // hn.p
    public Object a() {
        switch (this.f57738a) {
            case 8:
                return new hn.o(true);
            case 9:
                return new LinkedHashMap();
            case 10:
                return new TreeMap();
            case 11:
                return new ConcurrentHashMap();
            case 12:
                return new ConcurrentSkipListMap();
            case 13:
                return new ArrayList();
            case 14:
                return new LinkedHashSet();
            case 15:
                return new TreeSet();
            default:
                return new ArrayDeque();
        }
    }

    @Override // j2.i
    public double b(double d5) {
        switch (this.f57738a) {
            case 17:
                double d11 = d5 < 0.0d ? -d5 : d5;
                return Math.copySign(d11 >= 0.0031308049535603718d ? (Math.pow(d11, 0.4166666666666667d) - 0.05213270142180095d) / 0.9478672985781991d : d11 / 0.07739938080495357d, d5);
            case 18:
                double d12 = d5 < 0.0d ? -d5 : d5;
                return Math.copySign(d12 >= 0.04045d ? Math.pow((0.9478672985781991d * d12) + 0.05213270142180095d, 2.4d) : d12 * 0.07739938080495357d, d5);
            case 19:
                float[] fArr = j2.d.f68658a;
                return j2.d.b(j2.d.f68660c, d5);
            case 20:
                float[] fArr2 = j2.d.f68658a;
                return j2.d.a(j2.d.f68660c, d5);
            case 21:
                float[] fArr3 = j2.d.f68658a;
                return j2.d.d(j2.d.f68661d, d5);
            case 22:
                float[] fArr4 = j2.d.f68658a;
                return j2.d.c(j2.d.f68661d, d5);
            default:
                return d5;
        }
    }

    @Override // kl.e0
    public el.g c(q0 q0Var) throws GeneralSecurityException {
        switch (this.f57738a) {
            case 1:
                j1 j1Var = (j1) q0Var.f71630b;
                if (!j1Var.A().equals("type.googleapis.com/google.crypto.tink.XAesGcmKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to XAesGcmProtoSerialization.parseParameters: " + j1Var.A());
                }
                try {
                    w2 w2VarZ = w2.z(j1Var.B(), com.google.crypto.tink.shaded.protobuf.p.a());
                    if (w2VarZ.x() != 0) {
                        throw new GeneralSecurityException("Only version 0 parameters are accepted");
                    }
                    return fl.l0.b(w2VarZ.w().x(), m.b(j1Var.z()));
                } catch (InvalidProtocolBufferException e3) {
                    throw new GeneralSecurityException("Parsing XAesGcmParameters failed: ", e3);
                }
            default:
                j1 j1Var2 = (j1) q0Var.f71630b;
                if (!j1Var2.A().equals("type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key")) {
                    throw new IllegalArgumentException("Wrong type URL in call to XChaCha20Poly1305ProtoSerialization.parseParameters: " + j1Var2.A());
                }
                try {
                    if (b3.x(j1Var2.B(), com.google.crypto.tink.shaded.protobuf.p.a()).w() == 0) {
                        return new o0(n.b(j1Var2.z()));
                    }
                    throw new GeneralSecurityException("Only version 0 parameters are accepted");
                } catch (InvalidProtocolBufferException e11) {
                    throw new GeneralSecurityException("Parsing XChaCha20Poly1305Parameters failed: ", e11);
                }
        }
    }

    @Override // kl.g0
    public q0 d(el.g gVar) {
        switch (this.f57738a) {
            case 0:
                fl.l0 l0Var = (fl.l0) gVar;
                i1 i1VarC = j1.C();
                i1VarC.g("type.googleapis.com/google.crypto.tink.XAesGcmKey");
                v2 v2VarY = w2.y();
                x2 x2VarY = y2.y();
                x2VarY.f(l0Var.f55378b);
                v2VarY.f((y2) x2VarY.a());
                i1VarC.h(((w2) v2VarY.a()).e());
                i1VarC.f(m.a(l0Var.f55377a));
                return q0.c((j1) i1VarC.a());
            default:
                i1 i1VarC2 = j1.C();
                i1VarC2.g("type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key");
                i1VarC2.h(b3.v().e());
                i1VarC2.f(n.a(((o0) gVar).f55398a));
                return q0.c((j1) i1VarC2.a());
        }
    }

    @Override // kl.l0
    public Object e(bh.g gVar) throws GeneralSecurityException {
        switch (this.f57738a) {
            case 27:
                ll.a aVar = (ll.a) gVar;
                if (aVar.f74985c.f74998a == 32) {
                    return ll.f.a(aVar);
                }
                throw new GeneralSecurityException("AesCmacKey size wrong, must be 32 bytes");
            case 28:
                ll.a aVar2 = (ll.a) gVar;
                if (aVar2.f74985c.f74998a == 32) {
                    return sl.m.a(aVar2);
                }
                throw new GeneralSecurityException("AesCmacKey size wrong, must be 32 bytes");
            default:
                return new ll.f(3);
        }
    }

    @Override // kl.o
    public p0 f(bh.g gVar) {
        switch (this.f57738a) {
            case 2:
                j0 j0Var = (j0) gVar;
                t2 t2VarA = u2.A();
                byte[] bArrJ = j0Var.f55361d.J(el.j.f52808a);
                t2VarA.f(com.google.crypto.tink.shaded.protobuf.i.e(0, bArrJ.length, bArrJ));
                x2 x2VarY = y2.y();
                fl.l0 l0Var = j0Var.f55360c;
                x2VarY.f(l0Var.f55378b);
                t2VarA.g((y2) x2VarY.a());
                return p0.a("type.googleapis.com/google.crypto.tink.XAesGcmKey", ((u2) t2VarA.a()).e(), f1.SYMMETRIC, m.a(l0Var.f55377a), j0Var.f55363f);
            case 6:
                m0 m0Var = (m0) gVar;
                z2 z2VarZ = a3.z();
                byte[] bArrJ2 = m0Var.f55384d.J(el.j.f52808a);
                z2VarZ.f(com.google.crypto.tink.shaded.protobuf.i.e(0, bArrJ2.length, bArrJ2));
                return p0.a("type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key", ((a3) z2VarZ.a()).e(), f1.SYMMETRIC, n.a(m0Var.f55383c.f55398a), m0Var.f55386f);
            default:
                p0 p0Var = ((s) gVar).f71634c;
                f1 f1Var = p0Var.f71623d;
                return p0Var;
        }
    }

    @Override // ya.z
    public Object g(Context context) {
        switch (this.f57738a) {
            case 24:
                return new ja.a(context);
            default:
                return new ja.h(context);
        }
    }

    @Override // kl.m
    public bh.g h(s0 s0Var) throws GeneralSecurityException {
        switch (this.f57738a) {
            case 3:
                el.j jVar = el.j.f52808a;
                p0 p0Var = (p0) s0Var;
                if (!p0Var.f71620a.equals("type.googleapis.com/google.crypto.tink.XAesGcmKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to XAesGcmProtoSerialization.parseKey");
                }
                try {
                    u2 u2VarB = u2.B(p0Var.f71622c, com.google.crypto.tink.shaded.protobuf.p.a());
                    if (u2VarB.z() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    if (u2VarB.x().size() != 32) {
                        throw new GeneralSecurityException("Only 32 byte key size is accepted");
                    }
                    return j0.p0(fl.l0.b(u2VarB.y().x(), m.b(p0Var.f71624e)), d0.h(u2VarB.x().h(), jVar), p0Var.f71625f);
                } catch (InvalidProtocolBufferException unused) {
                    throw new GeneralSecurityException("Parsing XAesGcmKey failed");
                }
            default:
                el.j jVar2 = el.j.f52808a;
                p0 p0Var2 = (p0) s0Var;
                if (!p0Var2.f71620a.equals("type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key")) {
                    throw new IllegalArgumentException("Wrong type URL in call to XChaCha20Poly1305ProtoSerialization.parseKey");
                }
                try {
                    a3 a3VarA = a3.A(p0Var2.f71622c, com.google.crypto.tink.shaded.protobuf.p.a());
                    if (a3VarA.y() == 0) {
                        return m0.p0(n.b(p0Var2.f71624e), d0.h(a3VarA.x().h(), jVar2), p0Var2.f71625f);
                    }
                    throw new GeneralSecurityException("Only version 0 keys are accepted");
                } catch (InvalidProtocolBufferException unused2) {
                    throw new GeneralSecurityException("Parsing XChaCha20Poly1305Key failed");
                }
        }
    }
}
