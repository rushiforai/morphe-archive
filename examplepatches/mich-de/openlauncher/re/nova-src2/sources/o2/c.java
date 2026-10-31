package o2;

import i2.x0;
import java.util.ArrayList;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class c extends f0 {

    /* renamed from: b, reason: collision with root package name */
    public float[] f79209b;

    /* renamed from: h, reason: collision with root package name */
    public i2.h f79215h;

    /* renamed from: i, reason: collision with root package name */
    public Function1 f79216i;

    /* renamed from: l, reason: collision with root package name */
    public float f79219l;

    /* renamed from: m, reason: collision with root package name */
    public float f79220m;
    public float n;

    /* renamed from: q, reason: collision with root package name */
    public float f79222q;

    /* renamed from: r, reason: collision with root package name */
    public float f79223r;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f79210c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public boolean f79211d = true;

    /* renamed from: e, reason: collision with root package name */
    public long f79212e = i2.s.f61147m;

    /* renamed from: f, reason: collision with root package name */
    public List f79213f = k0.f79316a;

    /* renamed from: g, reason: collision with root package name */
    public boolean f79214g = true;

    /* renamed from: j, reason: collision with root package name */
    public final b0.x f79217j = new b0.x(this, 16);

    /* renamed from: k, reason: collision with root package name */
    public String f79218k = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    public float o = 1.0f;

    /* renamed from: p, reason: collision with root package name */
    public float f79221p = 1.0f;

    /* renamed from: s, reason: collision with root package name */
    public boolean f79224s = true;

    @Override // o2.f0
    public final void a(k2.f fVar) {
        if (this.f79224s) {
            float[] fArrA = this.f79209b;
            if (fArrA == null) {
                fArrA = i2.h0.a();
                this.f79209b = fArrA;
            } else {
                i2.h0.d(fArrA);
            }
            i2.h0.f(fArrA, this.f79222q + this.f79220m, this.f79223r + this.n);
            float f11 = this.f79219l;
            if (fArrA.length >= 16) {
                double d5 = f11 * 0.017453292519943295d;
                float fSin = (float) Math.sin(d5);
                float fCos = (float) Math.cos(d5);
                float f12 = fArrA[0];
                float f13 = fArrA[4];
                float f14 = (fSin * f13) + (fCos * f12);
                float f15 = -fSin;
                float f16 = (f13 * fCos) + (f12 * f15);
                float f17 = fArrA[1];
                float f18 = fArrA[5];
                float f19 = (fSin * f18) + (fCos * f17);
                float f21 = (f18 * fCos) + (f17 * f15);
                float f22 = fArrA[2];
                float f23 = fArrA[6];
                float f24 = (fSin * f23) + (fCos * f22);
                float f25 = (f23 * fCos) + (f22 * f15);
                float f26 = fArrA[3];
                float f27 = fArrA[7];
                fArrA[0] = f14;
                fArrA[1] = f19;
                fArrA[2] = f24;
                fArrA[3] = (fSin * f27) + (fCos * f26);
                fArrA[4] = f16;
                fArrA[5] = f21;
                fArrA[6] = f25;
                fArrA[7] = (fCos * f27) + (f15 * f26);
            }
            float f28 = this.o;
            float f29 = this.f79221p;
            if (fArrA.length >= 16) {
                fArrA[0] = fArrA[0] * f28;
                fArrA[1] = fArrA[1] * f28;
                fArrA[2] = fArrA[2] * f28;
                fArrA[3] = fArrA[3] * f28;
                fArrA[4] = fArrA[4] * f29;
                fArrA[5] = fArrA[5] * f29;
                fArrA[6] = fArrA[6] * f29;
                fArrA[7] = fArrA[7] * f29;
                fArrA[8] = fArrA[8] * 1.0f;
                fArrA[9] = fArrA[9] * 1.0f;
                fArrA[10] = fArrA[10] * 1.0f;
                fArrA[11] = fArrA[11] * 1.0f;
            }
            i2.h0.f(fArrA, -this.f79220m, -this.n);
            this.f79224s = false;
        }
        if (this.f79214g) {
            if (!this.f79213f.isEmpty()) {
                i2.h hVarA = this.f79215h;
                if (hVarA == null) {
                    hVarA = i2.k.a();
                    this.f79215h = hVarA;
                }
                e0.b(this.f79213f, hVarA);
            }
            this.f79214g = false;
        }
        k2.d drawContext = fVar.getDrawContext();
        long jMo111getSizeNHjbRc = drawContext.mo111getSizeNHjbRc();
        drawContext.getCanvas().save();
        try {
            k2.h transform = drawContext.getTransform();
            float[] fArr = this.f79209b;
            if (fArr != null) {
                transform.mo141transform58bKbWc(fArr);
            }
            i2.h hVar = this.f79215h;
            if (!this.f79213f.isEmpty() && hVar != null) {
                transform.mo135clipPathmtrdDE(hVar, 1);
            }
            ArrayList arrayList = this.f79210c;
            int size = arrayList.size();
            for (int i5 = 0; i5 < size; i5++) {
                ((f0) arrayList.get(i5)).a(fVar);
            }
            a2.c.x(drawContext, jMo111getSizeNHjbRc);
        } catch (Throwable th2) {
            a2.c.x(drawContext, jMo111getSizeNHjbRc);
            throw th2;
        }
    }

    @Override // o2.f0
    public final Function1 b() {
        return this.f79216i;
    }

    @Override // o2.f0
    public final void d(b0.x xVar) {
        this.f79216i = xVar;
    }

    public final void e(int i5, f0 f0Var) {
        ArrayList arrayList = this.f79210c;
        if (i5 < arrayList.size()) {
            arrayList.set(i5, f0Var);
        } else {
            arrayList.add(f0Var);
        }
        g(f0Var);
        f0Var.d(this.f79217j);
        c();
    }

    public final void f(long j11) {
        if (this.f79211d && j11 != 16) {
            long j12 = this.f79212e;
            if (j12 == 16) {
                this.f79212e = j11;
                return;
            }
            EmptyList emptyList = k0.f79316a;
            if (i2.s.g(j12) == i2.s.g(j11) && i2.s.f(j12) == i2.s.f(j11) && i2.s.d(j12) == i2.s.d(j11)) {
                return;
            }
            this.f79211d = false;
            this.f79212e = i2.s.f61147m;
        }
    }

    public final void g(f0 f0Var) {
        if (!(f0Var instanceof j)) {
            if (f0Var instanceof c) {
                c cVar = (c) f0Var;
                if (cVar.f79211d && this.f79211d) {
                    f(cVar.f79212e);
                    return;
                } else {
                    this.f79211d = false;
                    this.f79212e = i2.s.f61147m;
                    return;
                }
            }
            return;
        }
        j jVar = (j) f0Var;
        i2.p pVar = jVar.f79282b;
        if (this.f79211d && pVar != null) {
            if (pVar instanceof x0) {
                f(((x0) pVar).f61189a);
            } else {
                this.f79211d = false;
                this.f79212e = i2.s.f61147m;
            }
        }
        i2.p pVar2 = jVar.f79287g;
        if (this.f79211d && pVar2 != null) {
            if (pVar2 instanceof x0) {
                f(((x0) pVar2).f61189a);
            } else {
                this.f79211d = false;
                this.f79212e = i2.s.f61147m;
            }
        }
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("VGroup: ");
        sb2.append(this.f79218k);
        ArrayList arrayList = this.f79210c;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            f0 f0Var = (f0) arrayList.get(i5);
            sb2.append("\t");
            sb2.append(f0Var.toString());
            sb2.append("\n");
        }
        return sb2.toString();
    }
}
