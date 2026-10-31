package t00;

import java.util.Iterator;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function2;
import ou.i1;
import p1.e1;
import p1.s2;
import t70.j0;
import t70.m0;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final m0.b0 f88349a;

    /* renamed from: b, reason: collision with root package name */
    public final q2.a f88350b;

    /* renamed from: c, reason: collision with root package name */
    public final j0 f88351c;

    /* renamed from: d, reason: collision with root package name */
    public final Function2 f88352d;

    /* renamed from: e, reason: collision with root package name */
    public final e1 f88353e = androidx.compose.runtime.d.k(null);

    /* renamed from: f, reason: collision with root package name */
    public final v70.i f88354f = v70.o.b(0, 7, null);

    /* renamed from: g, reason: collision with root package name */
    public final e1 f88355g = androidx.compose.runtime.d.k(Float.valueOf(0.0f));

    /* renamed from: h, reason: collision with root package name */
    public final e1 f88356h = androidx.compose.runtime.d.k(0);

    /* renamed from: i, reason: collision with root package name */
    public final e1 f88357i = androidx.compose.runtime.d.k(null);

    /* renamed from: j, reason: collision with root package name */
    public final c0.e f88358j = c0.f.a(0.0f);

    public h(m0.b0 b0Var, q2.a aVar, j0 j0Var, Function2 function2) {
        this.f88349a = b0Var;
        this.f88350b = aVar;
        this.f88351c = j0Var;
        this.f88352d = function2;
    }

    public final m0.h a() {
        Object next;
        Iterator it = this.f88349a.h().f75476k.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            int i5 = ((m0.r) ((m0.h) next)).f75481a;
            Integer num = (Integer) ((s2) this.f88353e).getValue();
            if (num != null && i5 == num.intValue()) {
                break;
            }
        }
        return (m0.h) next;
    }

    public final float b() {
        if (a() == null) {
            return 0.0f;
        }
        return (((Number) ((s2) this.f88355g).getValue()).floatValue() + ((Number) ((s2) this.f88356h).getValue()).intValue()) - ((m0.r) r0).o;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0103  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(long j11) {
        Object next;
        float f11;
        Integer num;
        Integer numValueOf;
        h hVar;
        e1 e1Var = this.f88355g;
        ((s2) e1Var).setValue(Float.valueOf(Float.intBitsToFloat((int) (j11 & 4294967295L)) + ((Number) ((s2) e1Var).getValue()).floatValue()));
        m0.h hVarA = a();
        if (hVarA == null) {
            return;
        }
        int i5 = ((m0.r) hVarA).f75481a;
        float fB = b() + r14.o;
        float f12 = r14.f75494p + fB;
        float fZ = a2.c.z(f12, fB, 2.0f, fB);
        m0.b0 b0Var = this.f88349a;
        m0.q qVarH = b0Var.h();
        e20.r rVar = b0Var.f75397e;
        Iterator it = qVarH.f75476k.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            m0.r rVar2 = (m0.r) ((m0.h) next);
            int i11 = rVar2.o;
            int i12 = rVar2.f75494p + i11;
            int i13 = (int) fZ;
            if (i11 <= i13 && i13 <= i12 && i5 != rVar2.f75481a) {
                break;
            }
        }
        m0.h hVar2 = (m0.h) next;
        if (hVar2 == null) {
            if (((Number) ((s2) e1Var).getValue()).floatValue() > 0.0f) {
                f11 = f12 - b0Var.h().f75478m;
                if (f11 < 0.0f) {
                    f11 = 0.0f;
                }
            } else if (((Number) ((s2) e1Var).getValue()).floatValue() < 0.0f) {
                float f13 = fB - b0Var.h().f75477l;
                if (f13 <= 0.0f) {
                    f11 = f13;
                }
            }
            if (f11 == 0.0f) {
                return;
            }
            this.f88354f.j(Float.valueOf(f11));
            return;
        }
        int i14 = ((m0.r) hVar2).f75481a;
        if (i14 == rVar.c()) {
            numValueOf = Integer.valueOf(i5);
        } else {
            if (i5 != rVar.c()) {
                num = null;
                if (num == null) {
                    hVar = this;
                    m0.t(hVar.f88351c, null, null, new i1(this, num, hVarA, hVar2, (Continuation) null, 6), 3);
                } else {
                    hVar = this;
                    hVar.f88352d.invoke(Integer.valueOf(i5), Integer.valueOf(i14));
                }
                ((s2) hVar.f88353e).setValue(Integer.valueOf(i14));
            }
            numValueOf = Integer.valueOf(i14);
        }
        num = numValueOf;
        if (num == null) {
        }
        ((s2) hVar.f88353e).setValue(Integer.valueOf(i14));
    }

    public final void d() {
        e1 e1Var = this.f88353e;
        Continuation continuation = null;
        if (((Integer) ((s2) e1Var).getValue()) != null) {
            ((s2) this.f88357i).setValue((Integer) ((s2) e1Var).getValue());
            m0.t(this.f88351c, null, null, new f1.i(this, b(), continuation, 3), 3);
        }
        ((s2) this.f88355g).setValue(Float.valueOf(0.0f));
        ((s2) e1Var).setValue(null);
        ((s2) this.f88356h).setValue(0);
    }

    public final void e(long j11) {
        Object next;
        Iterator it = this.f88349a.h().f75476k.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            m0.r rVar = (m0.r) ((m0.h) next);
            int i5 = rVar.o;
            int i11 = rVar.f75494p + i5;
            int iIntBitsToFloat = (int) Float.intBitsToFloat((int) (4294967295L & j11));
            if (i5 <= iIntBitsToFloat && iIntBitsToFloat <= i11) {
                break;
            }
        }
        m0.h hVar = (m0.h) next;
        if (hVar != null) {
            m0.r rVar2 = (m0.r) hVar;
            ((s2) this.f88353e).setValue(Integer.valueOf(rVar2.f75481a));
            ((s2) this.f88356h).setValue(Integer.valueOf(rVar2.o));
            this.f88350b.a(0);
        }
    }
}
