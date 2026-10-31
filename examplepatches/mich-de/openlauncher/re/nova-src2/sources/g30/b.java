package g30;

import android.content.Context;
import android.os.Build;
import e10.y2;
import fl.d0;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import kotlin.UInt;
import kotlin.math.MathKt;
import tz.o;

/* loaded from: classes.dex */
public final class b implements d {

    /* renamed from: k, reason: collision with root package name */
    public static final int f57015k;

    /* renamed from: l, reason: collision with root package name */
    public static final x7.c f57016l;

    /* renamed from: a, reason: collision with root package name */
    public final Context f57017a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f57018b = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    public final f f57019c;

    /* renamed from: d, reason: collision with root package name */
    public int f57020d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f57021e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f57022f;

    /* renamed from: g, reason: collision with root package name */
    public o f57023g;

    /* renamed from: h, reason: collision with root package name */
    public a[] f57024h;

    /* renamed from: i, reason: collision with root package name */
    public og.i f57025i;

    /* renamed from: j, reason: collision with root package name */
    public c f57026j;

    static {
        UInt.Companion companion = UInt.f71696b;
        f57015k = -12566464;
        f57016l = new x7.c(new d0(9));
    }

    public b(Context context) {
        this.f57017a = context.getApplicationContext();
        f fVarB = f.b(context);
        this.f57019c = fVarB;
        this.f57020d = f57015k;
        this.f57023g = o.f90164b;
        this.f57024h = new a[0];
        this.f57026j = new c(0, 0, 0, 0);
        fVarB.a(this);
        c(fVarB.c());
    }

    @Override // g30.d
    public final void a(c cVar, int i5) {
        if ((i5 & 1) != 0) {
            c(cVar);
            a[] aVarArr = (a[]) this.f57018b.toArray(this.f57024h);
            this.f57024h = aVarArr;
            for (a aVar : aVarArr) {
                if (aVar != null) {
                    aVar.a(this);
                }
            }
            Arrays.fill(this.f57024h, (Object) null);
        }
    }

    public final o b() {
        Object obj;
        Object next;
        c cVar = this.f57026j;
        if (cVar.f57027a == 0) {
            return o.f90164b;
        }
        o oVar = o.f90164b;
        ArrayList arrayList = new ArrayList();
        arrayList.add(Integer.valueOf(cVar.f57027a));
        int i5 = cVar.f57028b;
        if (i5 != 0) {
            arrayList.add(Integer.valueOf(i5));
            int i11 = cVar.f57029c;
            if (i11 != 0) {
                arrayList.add(Integer.valueOf(i11));
            }
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(Integer.valueOf(((Number) it.next()).intValue()));
        }
        Iterator it2 = b70.g.P0(arrayList2).iterator();
        while (true) {
            obj = null;
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            int iIntValue = ((Number) next).intValue();
            if (uz.a.a(iIntValue).f91791b >= 15.0f && uz.b.c(iIntValue) >= 10.0f) {
                break;
            }
        }
        Integer num = (Integer) next;
        vz.a aVarA = vz.a.a(num != null ? num.intValue() : -14979341);
        ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it3 = arrayList.iterator();
        while (it3.hasNext()) {
            arrayList3.add(Integer.valueOf(((Number) it3.next()).intValue()));
        }
        Iterator it4 = b70.g.P0(arrayList3).iterator();
        while (true) {
            if (!it4.hasNext()) {
                break;
            }
            Object next2 = it4.next();
            int iIntValue2 = ((Number) next2).intValue();
            vz.a aVarA2 = vz.a.a(iIntValue2);
            o oVar2 = o.f90164b;
            if (180.0f - Math.abs(Math.abs(aVarA.f93388a - aVarA2.f93388a) - 180.0f) >= 30.0f && aVarA2.f93389b >= 15.0f && uz.b.c(iIntValue2) >= 10.0f) {
                obj = next2;
                break;
            }
        }
        if (((Integer) obj) == null) {
            int iB = MathKt.b(aVarA.f93388a + 60);
            if (iB < 0) {
                iB = (iB % 360) + 360;
            } else if (iB >= 360) {
                iB %= 360;
            }
            new vz.a(iB, aVarA.f93389b, aVarA.f93390c).b();
        }
        Integer numValueOf = Integer.valueOf(aVarA.b());
        o oVar3 = o.f90164b;
        int iIntValue3 = numValueOf.intValue();
        UInt.Companion companion = UInt.f71696b;
        return x7.f.z(iIntValue3);
    }

    public final void c(c cVar) {
        int iB;
        int iO0;
        y2 y2Var = y2.f51877a;
        y2Var.getClass();
        int iIntValue = ((Number) y2.q().l()).intValue();
        if (cVar == null || (iB = cVar.f57027a) == 0) {
            this.f57020d = f57015k;
            this.f57022f = false;
            this.f57021e = false;
            this.f57026j = new c(0, 0, 0, 0);
        } else {
            this.f57026j = cVar;
            int i5 = cVar.f57030d;
            boolean z11 = (i5 & 1) > 0;
            this.f57022f = z11;
            this.f57021e = (i5 & 2) > 0;
            if (z11 || y2Var.G1()) {
                tz.c.Companion.getClass();
                iO0 = -1;
            } else if (this.f57021e) {
                tz.c.Companion.getClass();
                iO0 = -16777216;
            } else {
                if (r4.a.h(iB) >= 0.18d) {
                    double[] dArr = new double[3];
                    r4.a.i(dArr, iB);
                    iB = r4.a.b(40.0d, dArr[1], dArr[2]);
                }
                UInt.Companion companion = UInt.f71696b;
                iO0 = ul.b.o0(iB, 255);
            }
            this.f57020d = iO0;
        }
        Context context = this.f57017a;
        if (iIntValue == 0 && Build.VERSION.SDK_INT >= 31) {
            o oVar = o.f90164b;
            this.f57023g = x7.f.A(context);
            this.f57025i = null;
        } else if (iIntValue == 0 || iIntValue == 1) {
            o oVarB = b();
            this.f57023g = oVarB;
            if (Build.VERSION.SDK_INT >= 31) {
                this.f57025i = ul.b.g0(oVarB, context);
            }
        } else {
            o oVar2 = o.f90164b;
            UInt.Companion companion2 = UInt.f71696b;
            o oVarZ = x7.f.z(ul.b.o0(iIntValue, 255));
            this.f57023g = oVarZ;
            if (Build.VERSION.SDK_INT >= 31) {
                this.f57025i = ul.b.g0(oVarZ, context);
            }
        }
        mc0.d.f76206a.m("Palette for mode " + iIntValue + " " + this.f57023g, new Object[0]);
    }
}
