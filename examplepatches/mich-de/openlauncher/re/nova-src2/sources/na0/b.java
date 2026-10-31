package na0;

import com.google.android.gms.internal.measurement.mi;
import fa.t;
import ja0.m;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Comparator;
import java.util.Iterator;
import java.util.SortedSet;
import xk.i2;
import xk.k1;
import xk.w;

/* loaded from: classes5.dex */
public final class b implements ra0.a {

    /* renamed from: a, reason: collision with root package name */
    public final m f78068a;

    /* renamed from: b, reason: collision with root package name */
    public final String f78069b;

    /* renamed from: c, reason: collision with root package name */
    public final int f78070c;

    /* renamed from: d, reason: collision with root package name */
    public final int f78071d;

    public b(m mVar, t tVar) {
        this.f78068a = mVar;
        this.f78069b = (String) mVar.f69357r.get(tVar.m(false));
        int iM = tVar.m(false);
        this.f78070c = iM;
        this.f78071d = tVar.f54485a;
        c(tVar, iM);
    }

    public static void c(t tVar, int i5) {
        for (int i11 = 0; i11 < i5; i11++) {
            tVar.p();
            ul.b.c0(tVar);
        }
    }

    public static void d(t tVar) {
        tVar.p();
        c(tVar, tVar.m(false));
    }

    @Override // ra0.a
    public final int S() {
        return 29;
    }

    public final a a() {
        return new a(this, this.f78068a.f69343b, this.f78071d, this.f78070c);
    }

    public final String b() {
        return this.f78069b;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        int iCompareTo;
        Comparator comparator;
        Comparator comparator2;
        ra0.a aVar = (ra0.a) obj;
        int iT = ul.b.t(29, aVar.S());
        if (iT != 0) {
            return iT;
        }
        b bVar = (b) aVar;
        int iCompareTo2 = this.f78069b.compareTo(bVar.f78069b);
        if (iCompareTo2 != 0) {
            return iCompareTo2;
        }
        a aVarA = a();
        a aVarA2 = bVar.a();
        int iT2 = ul.b.t(aVarA.f78066c, aVarA2.f78066c);
        if (iT2 != 0) {
            return iT2;
        }
        i2 i2Var = i2.f95937b;
        if (!(aVarA instanceof SortedSet) || ((comparator2 = ((SortedSet) aVarA).comparator()) != null && !comparator2.equals(i2Var))) {
            int i5 = k1.f95949f;
            w.k(i2Var, aVarA);
            Object[] array = aVarA.toArray();
            k1.s(i2Var, array.length, array);
        }
        if (!(aVarA2 instanceof SortedSet) || ((comparator = ((SortedSet) aVarA2).comparator()) != null && !comparator.equals(i2Var))) {
            int i11 = k1.f95949f;
            w.k(i2Var, aVarA2);
            Object[] array2 = aVarA2.toArray();
            k1.s(i2Var, array2.length, array2);
        }
        Iterator it = aVarA2.iterator();
        Iterator it2 = aVarA.iterator();
        do {
            mi miVar = (mi) it2;
            if (!miVar.hasNext()) {
                return 0;
            }
            iCompareTo = ((Comparable) miVar.next()).compareTo((Comparable) ((mi) it).next());
        } while (iCompareTo == 0);
        return iCompareTo;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f78069b.equals(bVar.f78069b) && a().equals(bVar.a());
    }

    public final int hashCode() {
        return a().hashCode() + (this.f78069b.hashCode() * 31);
    }

    public final String toString() {
        StringWriter stringWriter = new StringWriter();
        try {
            new oa0.a(stringWriter).b(this);
            return stringWriter.toString();
        } catch (IOException unused) {
            throw new AssertionError("Unexpected IOException");
        }
    }
}
