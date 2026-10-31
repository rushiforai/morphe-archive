package u1;

import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes.dex */
public abstract class d implements Iterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final q[] f90333a;

    /* renamed from: b, reason: collision with root package name */
    public int f90334b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f90335c = true;

    public d(p pVar, q[] qVarArr) {
        this.f90333a = qVarArr;
        qVarArr[0].a(pVar.f90357d, Integer.bitCount(pVar.f90354a) * 2, 0);
        this.f90334b = 0;
        a();
    }

    public final void a() {
        int i5 = this.f90334b;
        q[] qVarArr = this.f90333a;
        q qVar = qVarArr[i5];
        if (qVar.f90360c < qVar.f90359b) {
            return;
        }
        while (-1 < i5) {
            int iB = b(i5);
            if (iB == -1) {
                q qVar2 = qVarArr[i5];
                int i11 = qVar2.f90360c;
                Object[] objArr = qVar2.f90358a;
                if (i11 < objArr.length) {
                    int length = objArr.length;
                    qVar2.f90360c = i11 + 1;
                    iB = b(i5);
                }
            }
            if (iB != -1) {
                this.f90334b = iB;
                return;
            }
            if (i5 > 0) {
                q qVar3 = qVarArr[i5 - 1];
                int i12 = qVar3.f90360c;
                int length2 = qVar3.f90358a.length;
                qVar3.f90360c = i12 + 1;
            }
            qVarArr[i5].a(p.f90353e.f90357d, 0, 0);
            i5--;
        }
        this.f90335c = false;
    }

    public final int b(int i5) {
        q[] qVarArr = this.f90333a;
        q qVar = qVarArr[i5];
        int i11 = qVar.f90360c;
        if (i11 < qVar.f90359b) {
            return i5;
        }
        Object[] objArr = qVar.f90358a;
        if (i11 >= objArr.length) {
            return -1;
        }
        int length = objArr.length;
        Object obj = objArr[i11];
        Intrinsics.e(obj, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.TrieNode<K of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.TrieNodeBaseIterator, V of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.TrieNodeBaseIterator>");
        p pVar = (p) obj;
        if (i5 == 6) {
            q qVar2 = qVarArr[i5 + 1];
            Object[] objArr2 = pVar.f90357d;
            qVar2.a(objArr2, objArr2.length, 0);
        } else {
            qVarArr[i5 + 1].a(pVar.f90357d, Integer.bitCount(pVar.f90354a) * 2, 0);
        }
        return b(i5 + 1);
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f90335c;
    }

    @Override // java.util.Iterator
    public Object next() {
        if (!this.f90335c) {
            throw new NoSuchElementException();
        }
        Object next = this.f90333a[this.f90334b].next();
        a();
        return next;
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
