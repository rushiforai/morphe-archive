package fp;

import b.c0;
import cp.x;
import cp.z;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* loaded from: classes4.dex */
public final class j extends z {

    /* renamed from: c, reason: collision with root package name */
    public static final h f55510c = new h(x.f47784a, 1);

    /* renamed from: a, reason: collision with root package name */
    public final cp.m f55511a;

    /* renamed from: b, reason: collision with root package name */
    public final x f55512b;

    public j(cp.m mVar, x xVar) {
        this.f55511a = mVar;
        this.f55512b = xVar;
    }

    @Override // cp.z
    public final Object b(kp.a aVar) {
        Object arrayList;
        Serializable arrayList2;
        int iF0 = aVar.f0();
        int iF = c0.F(iF0);
        if (iF == 0) {
            aVar.a();
            arrayList = new ArrayList();
        } else if (iF != 2) {
            arrayList = null;
        } else {
            aVar.b();
            arrayList = new ep.o(true);
        }
        if (arrayList == null) {
            return d(aVar, iF0);
        }
        ArrayDeque arrayDeque = new ArrayDeque();
        while (true) {
            if (aVar.p()) {
                String strP = arrayList instanceof Map ? aVar.P() : null;
                int iF02 = aVar.f0();
                int iF2 = c0.F(iF02);
                if (iF2 == 0) {
                    aVar.a();
                    arrayList2 = new ArrayList();
                } else if (iF2 != 2) {
                    arrayList2 = null;
                } else {
                    aVar.b();
                    arrayList2 = new ep.o(true);
                }
                boolean z11 = arrayList2 != null;
                if (arrayList2 == null) {
                    arrayList2 = d(aVar, iF02);
                }
                if (arrayList instanceof List) {
                    ((List) arrayList).add(arrayList2);
                } else {
                    ((Map) arrayList).put(strP, arrayList2);
                }
                if (z11) {
                    arrayDeque.addLast(arrayList);
                    arrayList = arrayList2;
                }
            } else {
                if (arrayList instanceof List) {
                    aVar.e();
                } else {
                    aVar.f();
                }
                if (arrayDeque.isEmpty()) {
                    return arrayList;
                }
                arrayList = arrayDeque.removeLast();
            }
        }
    }

    @Override // cp.z
    public final void c(kp.b bVar, Object obj) throws IOException {
        if (obj == null) {
            bVar.p();
            return;
        }
        Class<?> cls = obj.getClass();
        cp.m mVar = this.f55511a;
        mVar.getClass();
        z zVarC = mVar.c(new jp.a(cls));
        if (!(zVarC instanceof j)) {
            zVarC.c(bVar, obj);
        } else {
            bVar.c();
            bVar.f();
        }
    }

    public final Serializable d(kp.a aVar, int i5) {
        int iF = c0.F(i5);
        if (iF == 5) {
            return aVar.d0();
        }
        if (iF == 6) {
            return this.f55512b.a(aVar);
        }
        if (iF == 7) {
            return Boolean.valueOf(aVar.A());
        }
        if (iF != 8) {
            throw new IllegalStateException("Unexpected token: ".concat(fq.c.y(i5)));
        }
        aVar.V();
        return null;
    }
}
