package t1;

import java.util.NoSuchElementException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class j extends a {

    /* renamed from: c, reason: collision with root package name */
    public int f88457c;

    /* renamed from: d, reason: collision with root package name */
    public Object[] f88458d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f88459e;

    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v2, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r5v3 */
    public j(Object[] objArr, int i5, int i11, int i12) {
        super(i5, i11);
        this.f88457c = i12;
        Object[] objArr2 = new Object[i12];
        this.f88458d = objArr2;
        ?? r52 = i5 == i11 ? 1 : 0;
        this.f88459e = r52;
        objArr2[0] = objArr;
        b(i5 - r52, 1);
    }

    public final Object a() {
        int i5 = this.f88431a & 31;
        Object obj = this.f88458d[this.f88457c - 1];
        Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Array<E of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableList.TrieIterator>");
        return ((Object[]) obj)[i5];
    }

    public final void b(int i5, int i11) {
        int i12 = (this.f88457c - i11) * 5;
        while (i11 < this.f88457c) {
            Object[] objArr = this.f88458d;
            Object obj = objArr[i11 - 1];
            Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>");
            objArr[i11] = ((Object[]) obj)[bh.g.b0(i5, i12)];
            i12 -= 5;
            i11++;
        }
    }

    public final void c(int i5) {
        int i11 = 0;
        while (bh.g.b0(this.f88431a, i11) == i5) {
            i11 += 5;
        }
        if (i11 > 0) {
            b(this.f88431a, ((this.f88457c - 1) - (i11 / 5)) + 1);
        }
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        Object objA = a();
        int i5 = this.f88431a + 1;
        this.f88431a = i5;
        if (i5 == this.f88432b) {
            this.f88459e = true;
            return objA;
        }
        c(0);
        return objA;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        if (!hasPrevious()) {
            throw new NoSuchElementException();
        }
        this.f88431a--;
        if (this.f88459e) {
            this.f88459e = false;
            return a();
        }
        c(31);
        return a();
    }
}
