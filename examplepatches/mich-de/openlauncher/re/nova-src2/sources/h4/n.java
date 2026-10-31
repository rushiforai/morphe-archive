package h4;

import b.c0;
import com.google.android.gms.internal.measurement.k2;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class n {

    /* renamed from: f, reason: collision with root package name */
    public static int f59126f;

    /* renamed from: a, reason: collision with root package name */
    public ArrayList f59127a;

    /* renamed from: b, reason: collision with root package name */
    public int f59128b;

    /* renamed from: c, reason: collision with root package name */
    public int f59129c;

    /* renamed from: d, reason: collision with root package name */
    public ArrayList f59130d;

    /* renamed from: e, reason: collision with root package name */
    public int f59131e;

    public final void a(ArrayList arrayList) {
        int size = this.f59127a.size();
        if (this.f59131e != -1 && size > 0) {
            for (int i5 = 0; i5 < arrayList.size(); i5++) {
                n nVar = (n) arrayList.get(i5);
                if (this.f59131e == nVar.f59128b) {
                    c(this.f59129c, nVar);
                }
            }
        }
        if (size == 0) {
            arrayList.remove(this);
        }
    }

    public final int b(e4.c cVar, int i5) {
        int iN;
        int iN2;
        ArrayList arrayList = this.f59127a;
        if (arrayList.size() == 0) {
            return 0;
        }
        g4.e eVar = (g4.e) ((g4.d) arrayList.get(0)).S;
        cVar.t();
        eVar.b(cVar, false);
        for (int i11 = 0; i11 < arrayList.size(); i11++) {
            ((g4.d) arrayList.get(i11)).b(cVar, false);
        }
        if (i5 == 0 && eVar.f57130y0 > 0) {
            g4.j.a(eVar, cVar, arrayList, 0);
        }
        if (i5 == 1 && eVar.f57131z0 > 0) {
            g4.j.a(eVar, cVar, arrayList, 1);
        }
        try {
            cVar.p();
        } catch (Exception e3) {
            System.err.println(e3.toString() + "\n" + Arrays.toString(e3.getStackTrace()).replace("[", "   at ").replace(",", "\n   at").replace("]", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
        }
        this.f59130d = new ArrayList();
        for (int i12 = 0; i12 < arrayList.size(); i12++) {
            g4.d dVar = (g4.d) arrayList.get(i12);
            b6.e eVar2 = new b6.e(7);
            new WeakReference(dVar);
            e4.c.n(dVar.H);
            e4.c.n(dVar.I);
            e4.c.n(dVar.J);
            e4.c.n(dVar.K);
            e4.c.n(dVar.L);
            this.f59130d.add(eVar2);
        }
        if (i5 == 0) {
            iN = e4.c.n(eVar.H);
            iN2 = e4.c.n(eVar.J);
            cVar.t();
        } else {
            iN = e4.c.n(eVar.I);
            iN2 = e4.c.n(eVar.K);
            cVar.t();
        }
        return iN2 - iN;
    }

    public final void c(int i5, n nVar) {
        int i11 = nVar.f59128b;
        Iterator it = this.f59127a.iterator();
        while (it.hasNext()) {
            g4.d dVar = (g4.d) it.next();
            ArrayList arrayList = nVar.f59127a;
            if (!arrayList.contains(dVar)) {
                arrayList.add(dVar);
            }
            if (i5 == 0) {
                dVar.f57107m0 = i11;
            } else {
                dVar.f57108n0 = i11;
            }
        }
        this.f59131e = i11;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        int i5 = this.f59129c;
        sb2.append(i5 == 0 ? "Horizontal" : i5 == 1 ? "Vertical" : i5 == 2 ? "Both" : "Unknown");
        sb2.append(" [");
        String strO = c0.o(sb2, this.f59128b, "] <");
        Iterator it = this.f59127a.iterator();
        while (it.hasNext()) {
            g4.d dVar = (g4.d) it.next();
            StringBuilder sbK = k2.k(strO, " ");
            sbK.append(dVar.f57095g0);
            strO = sbK.toString();
        }
        return c0.E(strO, " >");
    }
}
