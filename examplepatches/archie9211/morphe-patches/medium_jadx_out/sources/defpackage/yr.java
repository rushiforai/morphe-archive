package defpackage;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yr extends q28 implements u22, xl3, fp6 {
    public final d56 o;
    public final boolean p;
    public final float q;
    public final dv1 r;
    public final m45 s;
    public ms t;
    public float u;
    public boolean w;
    public nkb y;
    public okb z;
    public long v = 0;
    public final x68 x = new x68();

    public yr(d56 d56Var, boolean z, float f, dv1 dv1Var, m45 m45Var) {
        this.o = d56Var;
        this.p = z;
        this.q = f;
        this.r = dv1Var;
        this.s = m45Var;
    }

    @Override // defpackage.q28
    public final void A0() {
        nkb nkbVar = this.y;
        if (nkbVar != null) {
            this.z = null;
            wgf.y(this);
            a1a a1aVar = nkbVar.d;
            okb okbVar = (okb) ((LinkedHashMap) a1aVar.b).get(this);
            if (okbVar != null) {
                okbVar.c();
                LinkedHashMap linkedHashMap = (LinkedHashMap) a1aVar.b;
                okb okbVar2 = (okb) linkedHashMap.get(this);
                if (okbVar2 != null) {
                }
                linkedHashMap.remove(this);
                nkbVar.c.add(okbVar);
            }
        }
    }

    public final void I0(j0a j0aVar) {
        okb okbVar;
        if (!(j0aVar instanceof h0a)) {
            if (j0aVar instanceof i0a) {
                okb okbVar2 = this.z;
                if (okbVar2 != null) {
                    okbVar2.d();
                    return;
                }
                return;
            }
            if (!(j0aVar instanceof g0a) || (okbVar = this.z) == null) {
                return;
            }
            okbVar.d();
            return;
        }
        h0a h0aVar = (h0a) j0aVar;
        long j = this.v;
        float f = this.u;
        nkb nkbVar = this.y;
        if (nkbVar == null) {
            Object obj = (View) bo.K(this, eo.f);
            while (!(obj instanceof ViewGroup)) {
                ViewParent parent = ((View) obj).getParent();
                if (!(parent instanceof View)) {
                    rd6.v("Couldn't find a valid parent for ", obj, ". Are you overriding LocalView and providing a View that is not attached to the view hierarchy?");
                    return;
                }
                obj = parent;
            }
            ViewGroup viewGroup = (ViewGroup) obj;
            int childCount = viewGroup.getChildCount();
            int i = 0;
            while (true) {
                if (i >= childCount) {
                    nkb nkbVar2 = new nkb(viewGroup.getContext());
                    viewGroup.addView(nkbVar2);
                    nkbVar = nkbVar2;
                    break;
                } else {
                    View childAt = viewGroup.getChildAt(i);
                    if (childAt instanceof nkb) {
                        nkbVar = (nkb) childAt;
                        break;
                    }
                    i++;
                }
            }
            this.y = nkbVar;
        }
        ArrayList arrayList = nkbVar.b;
        a1a a1aVar = nkbVar.d;
        LinkedHashMap linkedHashMap = (LinkedHashMap) a1aVar.b;
        LinkedHashMap linkedHashMap2 = (LinkedHashMap) a1aVar.b;
        LinkedHashMap linkedHashMap3 = (LinkedHashMap) a1aVar.c;
        okb okbVar3 = (okb) linkedHashMap.get(this);
        if (okbVar3 == null) {
            ArrayList arrayList2 = nkbVar.c;
            arrayList2.getClass();
            okbVar3 = (okb) (arrayList2.isEmpty() ? null : arrayList2.remove(0));
            if (okbVar3 == null) {
                if (nkbVar.e > d46.K(arrayList)) {
                    okbVar3 = new okb(nkbVar.getContext());
                    nkbVar.addView(okbVar3);
                    arrayList.add(okbVar3);
                } else {
                    okbVar3 = (okb) arrayList.get(nkbVar.e);
                    yr yrVar = (yr) linkedHashMap3.get(okbVar3);
                    if (yrVar != null) {
                        yrVar.z = null;
                        wgf.y(yrVar);
                        okb okbVar4 = (okb) linkedHashMap2.get(yrVar);
                        if (okbVar4 != null) {
                        }
                        linkedHashMap2.remove(yrVar);
                        okbVar3.c();
                    }
                }
                int i2 = nkbVar.e;
                if (i2 < nkbVar.a - 1) {
                    nkbVar.e = i2 + 1;
                } else {
                    nkbVar.e = 0;
                }
            }
            linkedHashMap2.put(this, okbVar3);
            linkedHashMap3.put(okbVar3, this);
        }
        okb okbVar5 = okbVar3;
        okbVar5.b(h0aVar, this.p, j, nk7.w0(f), this.r.a(), ((kkb) this.s.invoke()).d, new l8(8, this));
        this.z = okbVar5;
        wgf.y(this);
    }

    @Override // defpackage.xl3
    public final void e0(cq6 cq6Var) {
        g61 g61Var = cq6Var.a;
        cq6Var.a();
        ms msVar = this.t;
        if (msVar != null) {
            float f = this.u;
            long jA = this.r.a();
            float fFloatValue = ((Number) ((ou) msVar.c).d()).floatValue();
            if (fFloatValue > 0.0f) {
                long jB = uu1.b(fFloatValue, jA);
                if (msVar.a) {
                    float fD = dfc.d(cq6Var.f());
                    float fB = dfc.b(cq6Var.f());
                    m50 m50Var = g61Var.b;
                    long jB2 = m50Var.B();
                    m50Var.x().h();
                    try {
                        ((m50) ((md5) m50Var.b).b).x().o(0.0f, 0.0f, fD, fB, 1);
                        ho2.k(cq6Var, jB, f, 0L, null, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                    } finally {
                        y30.x(m50Var, jB2);
                    }
                } else {
                    ho2.k(cq6Var, jB, f, 0L, null, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                }
            }
        }
        e61 e61VarX = g61Var.b.x();
        okb okbVar = this.z;
        if (okbVar != null) {
            okbVar.e(this.v, nk7.w0(this.u), this.r.a(), ((kkb) this.s.invoke()).d);
            okbVar.draw(qm.a(e61VarX));
        }
    }

    @Override // defpackage.fl7
    public final void p(long j) {
        float fZ;
        this.w = true;
        m73 m73Var = flb.v0(this).y;
        this.v = nk7.C0(j);
        float f = this.q;
        if (Float.isNaN(f)) {
            long j2 = this.v;
            float fD = dfc.d(j2);
            fZ = ip8.c((((long) Float.floatToRawIntBits(dfc.b(j2))) & 4294967295L) | (Float.floatToRawIntBits(fD) << 32)) / 2.0f;
            if (this.p) {
                fZ += m73Var.Z(10.0f);
            }
        } else {
            fZ = m73Var.Z(f);
        }
        this.u = fZ;
        x68 x68Var = this.x;
        Object[] objArr = x68Var.a;
        int i = x68Var.b;
        for (int i2 = 0; i2 < i; i2++) {
            I0((j0a) objArr[i2]);
        }
        x68Var.d();
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }

    @Override // defpackage.q28
    public final void y0() {
        vx0.c0(u0(), null, null, new nx9(this, null, 27), 3);
    }

    @Override // defpackage.xl3
    public final void L() {
    }

    @Override // defpackage.fp6
    public final void l(hp6 hp6Var) {
    }
}
