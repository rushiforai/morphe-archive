package na0;

import fa.t;
import ja0.m;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Iterator;

/* loaded from: classes5.dex */
public final class d implements ra0.a {

    /* renamed from: a, reason: collision with root package name */
    public final m f78076a;

    /* renamed from: b, reason: collision with root package name */
    public final int f78077b;

    /* renamed from: c, reason: collision with root package name */
    public final int f78078c;

    public d(m mVar, t tVar) {
        this.f78076a = mVar;
        int iM = tVar.m(false);
        this.f78077b = iM;
        this.f78078c = tVar.f54485a;
        for (int i5 = 0; i5 < iM; i5++) {
            ul.b.c0(tVar);
        }
    }

    public static void b(t tVar) {
        int iM = tVar.m(false);
        for (int i5 = 0; i5 < iM; i5++) {
            ul.b.c0(tVar);
        }
    }

    @Override // ra0.a
    public final int S() {
        return 28;
    }

    public final c a() {
        return new c(this, this.f78076a.f69343b, this.f78078c, this.f78077b);
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        ra0.a aVar = (ra0.a) obj;
        int iT = ul.b.t(28, aVar.S());
        if (iT != 0) {
            return iT;
        }
        c cVarA = a();
        c cVarA2 = ((d) aVar).a();
        int iT2 = ul.b.t(cVarA.f78074c, cVarA2.f78074c);
        if (iT2 != 0) {
            return iT2;
        }
        Iterator it = cVarA2.iterator();
        Iterator it2 = cVarA.iterator();
        while (it2.hasNext()) {
            int iCompareTo = ((Comparable) it2.next()).compareTo(it.next());
            if (iCompareTo != 0) {
                return iCompareTo;
            }
        }
        return 0;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof d) {
            return a().equals(((d) obj).a());
        }
        return false;
    }

    public final int hashCode() {
        return a().hashCode();
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
