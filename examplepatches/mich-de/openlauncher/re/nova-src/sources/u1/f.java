package u1;

import java.util.ConcurrentModificationException;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.jvm.internal.markers.KMutableIterator;

/* loaded from: classes2.dex */
public class f extends d implements KMutableIterator {

    /* renamed from: d, reason: collision with root package name */
    public final e f90342d;

    /* renamed from: e, reason: collision with root package name */
    public Object f90343e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f90344f;

    /* renamed from: g, reason: collision with root package name */
    public int f90345g;

    public f(e eVar, q[] qVarArr) {
        super(eVar.f90338c, qVarArr);
        this.f90342d = eVar;
        this.f90345g = eVar.f90340e;
    }

    public final void c(int i5, p pVar, Object obj, int i11) {
        int i12 = i11 * 5;
        q[] qVarArr = this.f90333a;
        if (i12 <= 30) {
            int iC0 = 1 << bh.g.c0(i5, i12);
            if (pVar.h(iC0)) {
                qVarArr[i11].a(pVar.f90357d, Integer.bitCount(pVar.f90354a) * 2, pVar.f(iC0));
                this.f90334b = i11;
                return;
            } else {
                int iT = pVar.t(iC0);
                p pVarS = pVar.s(iT);
                qVarArr[i11].a(pVar.f90357d, Integer.bitCount(pVar.f90354a) * 2, iT);
                c(i5, pVarS, obj, i11 + 1);
                return;
            }
        }
        q qVar = qVarArr[i11];
        Object[] objArr = pVar.f90357d;
        qVar.a(objArr, objArr.length, 0);
        while (true) {
            q qVar2 = qVarArr[i11];
            if (Intrinsics.b(qVar2.f90358a[qVar2.f90360c], obj)) {
                this.f90334b = i11;
                return;
            } else {
                qVarArr[i11].f90360c += 2;
            }
        }
    }

    @Override // u1.d, java.util.Iterator
    public final Object next() {
        if (this.f90342d.f90340e != this.f90345g) {
            throw new ConcurrentModificationException();
        }
        if (!this.f90335c) {
            throw new NoSuchElementException();
        }
        q qVar = this.f90333a[this.f90334b];
        this.f90343e = qVar.f90358a[qVar.f90360c];
        this.f90344f = true;
        return super.next();
    }

    @Override // u1.d, java.util.Iterator
    public final void remove() {
        if (!this.f90344f) {
            throw new IllegalStateException();
        }
        boolean z11 = this.f90335c;
        e eVar = this.f90342d;
        if (!z11) {
            TypeIntrinsics.c(eVar).remove(this.f90343e);
        } else {
            if (!z11) {
                throw new NoSuchElementException();
            }
            q qVar = this.f90333a[this.f90334b];
            Object obj = qVar.f90358a[qVar.f90360c];
            TypeIntrinsics.c(eVar).remove(this.f90343e);
            c(obj != null ? obj.hashCode() : 0, eVar.f90338c, obj, 0);
        }
        this.f90343e = null;
        this.f90344f = false;
        this.f90345g = eVar.f90340e;
    }
}
