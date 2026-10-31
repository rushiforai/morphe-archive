package ll;

import android.content.ComponentName;
import android.content.Context;
import android.graphics.Canvas;
import android.view.View;
import android.view.ViewParent;
import bm.t;
import com.android.launcher3.BubbleTextView;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.crypto.tink.shaded.protobuf.InvalidProtocolBufferException;
import com.google.firebase.abt.component.AbtRegistrar;
import com.google.firebase.installations.FirebaseInstallationsRegistrar;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.workspace.CrosshairsCellLayout;
import java.security.GeneralSecurityException;
import java.util.Set;
import kl.e0;
import kl.g0;
import kl.l0;
import kl.p0;
import kl.q0;
import kl.s;
import kl.s0;
import o9.s2;
import o9.t1;
import pl.a1;
import pl.b1;
import pl.b2;
import pl.c1;
import pl.d1;
import pl.f1;
import pl.i1;
import pl.j1;
import pl.x0;
import pl.y0;
import pl.z0;
import t5.d0;
import x7.u;
import ya.w;
import ya.z;

/* loaded from: classes.dex */
public final /* synthetic */ class i implements l0, z, g0, e0, kl.o, kl.m, w, bm.e, qd.h, fi.i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75009a;

    public /* synthetic */ i(int i5) {
        this.f75009a = i5;
    }

    @Override // qd.h
    public void a(Exception exc) {
    }

    public void b(float f11, float f12, Object obj) {
        ((Canvas) obj).translate(f11, f12);
    }

    @Override // kl.e0
    public el.g c(q0 q0Var) throws GeneralSecurityException {
        switch (this.f75009a) {
            case 4:
                j1 j1Var = (j1) q0Var.f71630b;
                if (!j1Var.A().equals("type.googleapis.com/google.crypto.tink.AesCmacKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to AesCmacProtoSerialization.parseParameters: " + j1Var.A());
                }
                try {
                    pl.d dVarA = pl.d.A(j1Var.B(), com.google.crypto.tink.shaded.protobuf.p.a());
                    u uVarB = d.b();
                    uVarB.w(dVarA.x());
                    uVarB.x(dVarA.y().x());
                    uVarB.f95210c = ml.a.b(j1Var.z());
                    return uVarB.c();
                } catch (InvalidProtocolBufferException e3) {
                    throw new GeneralSecurityException("Parsing AesCmacParameters failed: ", e3);
                }
            default:
                j1 j1Var2 = (j1) q0Var.f71630b;
                if (!j1Var2.A().equals("type.googleapis.com/google.crypto.tink.HmacKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to HmacProtoSerialization.parseParameters: " + j1Var2.A());
                }
                try {
                    b1 b1VarC = b1.C(j1Var2.B(), com.google.crypto.tink.shaded.protobuf.p.a());
                    if (b1VarC.A() != 0) {
                        throw new GeneralSecurityException("Parsing HmacParameters failed: unknown Version " + b1VarC.A());
                    }
                    x7.h hVarB = m.b();
                    hVarB.f95137b = Integer.valueOf(b1VarC.y());
                    hVarB.f95138c = Integer.valueOf(b1VarC.z().z());
                    hVarB.f95139d = (k) ml.b.f76499b.f(b1VarC.z().y());
                    hVarB.f95140e = (l) ml.b.f76498a.f(j1Var2.z());
                    return hVarB.e();
                } catch (InvalidProtocolBufferException e11) {
                    throw new GeneralSecurityException("Parsing HmacParameters failed: ", e11);
                }
        }
    }

    @Override // kl.g0
    public q0 d(el.g gVar) {
        switch (this.f75009a) {
            case 3:
                d dVar = (d) gVar;
                i1 i1VarC = j1.C();
                i1VarC.g("type.googleapis.com/google.crypto.tink.AesCmacKey");
                pl.c cVarZ = pl.d.z();
                pl.e eVarY = pl.f.y();
                eVarY.f(dVar.f74999b);
                cVarZ.g((pl.f) eVarY.a());
                cVarZ.f(dVar.f74998a);
                i1VarC.h(((pl.d) cVarZ.a()).e());
                i1VarC.f(ml.a.a(dVar.f75000c));
                return q0.c((j1) i1VarC.a());
            default:
                m mVar = (m) gVar;
                i1 i1VarC2 = j1.C();
                i1VarC2.g("type.googleapis.com/google.crypto.tink.HmacKey");
                a1 a1VarB = b1.B();
                c1 c1VarA = d1.A();
                c1VarA.g(mVar.f75028b);
                c1VarA.f((x0) ml.b.f76499b.j(mVar.f75030d));
                a1VarB.g((d1) c1VarA.a());
                a1VarB.f(mVar.f75027a);
                i1VarC2.h(((b1) a1VarB.a()).e());
                i1VarC2.f((b2) ml.b.f76498a.j(mVar.f75029c));
                return q0.c((j1) i1VarC2.a());
        }
    }

    @Override // kl.l0
    public Object e(bh.g gVar) {
        switch (this.f75009a) {
            case 0:
                return sl.m.b((h) gVar);
            default:
                return q.a((s) gVar);
        }
    }

    @Override // kl.o
    public p0 f(bh.g gVar) {
        switch (this.f75009a) {
            case 5:
                a aVar = (a) gVar;
                pl.a aVarB = pl.b.B();
                d dVar = aVar.f74985c;
                pl.e eVarY = pl.f.y();
                eVarY.f(dVar.f74999b);
                aVarB.g((pl.f) eVarY.a());
                byte[] bArrJ = aVar.f74986d.J(el.j.f52808a);
                aVarB.f(com.google.crypto.tink.shaded.protobuf.i.e(0, bArrJ.length, bArrJ));
                return p0.a("type.googleapis.com/google.crypto.tink.AesCmacKey", ((pl.b) aVarB.a()).e(), f1.SYMMETRIC, ml.a.a(aVar.f74985c.f75000c), aVar.f74988f);
            default:
                h hVar = (h) gVar;
                y0 y0VarC = z0.C();
                m mVar = hVar.f75005c;
                c1 c1VarA = d1.A();
                c1VarA.g(mVar.f75028b);
                c1VarA.f((x0) ml.b.f76499b.j(mVar.f75030d));
                y0VarC.g((d1) c1VarA.a());
                byte[] bArrJ2 = hVar.f75006d.J(el.j.f52808a);
                y0VarC.f(com.google.crypto.tink.shaded.protobuf.i.e(0, bArrJ2.length, bArrJ2));
                return p0.a("type.googleapis.com/google.crypto.tink.HmacKey", ((z0) y0VarC.a()).e(), f1.SYMMETRIC, (b2) ml.b.f76498a.j(hVar.f75005c.f75029c), hVar.f75008f);
        }
    }

    @Override // ya.z
    public Object g(Context context) {
        switch (this.f75009a) {
            case 2:
                return new lz.i(context);
            case 12:
                return new mx.l0(context);
            case 13:
                return new t1(context);
            default:
                return new wa.a();
        }
    }

    @Override // kl.m
    public bh.g h(s0 s0Var) throws GeneralSecurityException {
        switch (this.f75009a) {
            case 6:
                el.j jVar = el.j.f52808a;
                p0 p0Var = (p0) s0Var;
                if (!p0Var.f71620a.equals("type.googleapis.com/google.crypto.tink.AesCmacKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to AesCmacProtoSerialization.parseKey");
                }
                try {
                    pl.b bVarC = pl.b.C(p0Var.f71622c, com.google.crypto.tink.shaded.protobuf.p.a());
                    if (bVarC.A() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    u uVarB = d.b();
                    uVarB.w(bVarC.y().size());
                    uVarB.x(bVarC.z().x());
                    uVarB.f95210c = ml.a.b(p0Var.f71624e);
                    d dVarC = uVarB.c();
                    fl.l lVar = new fl.l(25, false);
                    lVar.y(dVarC);
                    lVar.s(d0.h(bVarC.y().h(), jVar));
                    lVar.t(p0Var.f71625f);
                    return lVar.e();
                } catch (InvalidProtocolBufferException | IllegalArgumentException unused) {
                    throw new GeneralSecurityException("Parsing AesCmacKey failed");
                }
            default:
                el.j jVar2 = el.j.f52808a;
                p0 p0Var2 = (p0) s0Var;
                if (!p0Var2.f71620a.equals("type.googleapis.com/google.crypto.tink.HmacKey")) {
                    throw new IllegalArgumentException("Wrong type URL in call to HmacProtoSerialization.parseKey");
                }
                try {
                    z0 z0VarD = z0.D(p0Var2.f71622c, com.google.crypto.tink.shaded.protobuf.p.a());
                    if (z0VarD.B() != 0) {
                        throw new GeneralSecurityException("Only version 0 keys are accepted");
                    }
                    x7.h hVarB = m.b();
                    hVarB.f95137b = Integer.valueOf(z0VarD.z().size());
                    hVarB.f95138c = Integer.valueOf(z0VarD.A().z());
                    hVarB.f95139d = (k) ml.b.f76499b.f(z0VarD.A().y());
                    hVarB.f95140e = (l) ml.b.f76498a.f(p0Var2.f71624e);
                    m mVarE = hVarB.e();
                    fl.l lVar2 = new fl.l(26, false);
                    lVar2.z(mVarE);
                    lVar2.u(d0.h(z0VarD.z().h(), jVar2));
                    lVar2.t(p0Var2.f71625f);
                    return lVar2.f();
                } catch (InvalidProtocolBufferException | IllegalArgumentException unused2) {
                    throw new GeneralSecurityException("Parsing HmacKey failed");
                }
        }
    }

    public void i(s2 s2Var, int i5, int i11) {
        switch (this.f75009a) {
            case 17:
                s2Var.scrollBy(i5, i11);
                break;
            default:
                s2Var.scrollTo(i5, i11);
                break;
        }
    }

    @Override // ya.w
    public boolean k(View view, ga.e eVar) {
        ComponentName componentName = NovaLauncher.f45646r1;
        if (!(view instanceof BubbleTextView)) {
            return false;
        }
        BubbleTextView bubbleTextView = (BubbleTextView) view;
        ViewParent parent = bubbleTextView.getParent().getParent();
        CrosshairsCellLayout crosshairsCellLayout = parent instanceof CrosshairsCellLayout ? (CrosshairsCellLayout) parent : null;
        if (crosshairsCellLayout == null) {
            return false;
        }
        bubbleTextView.r(crosshairsCellLayout.f46495k0);
        return false;
    }

    @Override // bm.e
    public Object q(t tVar) {
        switch (this.f75009a) {
            case 15:
                return FirebaseInstallationsRegistrar.lambda$getComponents$0(tVar);
            case 24:
                Set setG = tVar.g(bm.r.a(vm.a.class));
                vm.c cVar = vm.c.f92855c;
                if (cVar == null) {
                    synchronized (vm.c.class) {
                        try {
                            cVar = vm.c.f92855c;
                            if (cVar == null) {
                                cVar = new vm.c(0);
                                vm.c.f92855c = cVar;
                            }
                        } finally {
                        }
                    }
                }
                return new vm.b(setG, cVar);
            default:
                return AbtRegistrar.lambda$getComponents$0(tVar);
        }
    }

    @Override // fi.i
    public Task then(Object obj) {
        switch (this.f75009a) {
            case 27:
                break;
            default:
                break;
        }
        return Tasks.d(null);
    }
}
