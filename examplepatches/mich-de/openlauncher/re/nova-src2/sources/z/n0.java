package z;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
import kotlin.jvm.internal.markers.KMutableSet;

/* loaded from: classes2.dex */
public final class n0 implements KMutableSet, Set, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final k0 f97804a;

    /* renamed from: b, reason: collision with root package name */
    public final k0 f97805b;

    public n0(k0 parent) {
        Intrinsics.g(parent, "parent");
        this.f97804a = parent;
        this.f97805b = parent;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean add(Object obj) {
        return this.f97805b.b(obj);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean addAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        k0 k0Var = this.f97805b;
        k0Var.getClass();
        int i5 = k0Var.f97856g;
        for (Object obj : elements) {
            int iD = k0Var.d(obj);
            k0Var.f97851b[iD] = obj;
            long[] jArr = k0Var.f97852c;
            int i11 = k0Var.f97853d;
            jArr[iD] = (i11 & 2147483647L) | 4611686016279904256L;
            if (i11 != Integer.MAX_VALUE) {
                jArr[i11] = ((iD & 2147483647L) << 31) | (jArr[i11] & (-4611686016279904257L));
            }
            k0Var.f97853d = iD;
            if (k0Var.f97854e == Integer.MAX_VALUE) {
                k0Var.f97854e = iD;
            }
        }
        return i5 != k0Var.f97856g;
    }

    @Override // java.util.Set, java.util.Collection
    public final void clear() {
        this.f97805b.c();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean contains(Object obj) {
        return this.f97804a.a(obj);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean containsAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        Iterator it = elements.iterator();
        while (it.hasNext()) {
            if (!this.f97804a.a(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || n0.class != obj.getClass()) {
            return false;
        }
        return Intrinsics.b(this.f97804a, ((n0) obj).f97804a);
    }

    @Override // java.util.Set, java.util.Collection
    public final int hashCode() {
        return this.f97804a.hashCode();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean isEmpty() {
        return this.f97804a.f97856g == 0;
    }

    @Override // java.util.Set, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new m0(this);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean remove(Object obj) {
        return this.f97805b.g(obj);
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x0093, code lost:
    
        if (((r5 & ((~r5) << 6)) & r12) == 0) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0095, code lost:
    
        r14 = -1;
     */
    @Override // java.util.Set, java.util.Collection
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean removeAll(Collection elements) {
        int iNumberOfTrailingZeros;
        Intrinsics.g(elements, "elements");
        k0 k0Var = this.f97805b;
        k0Var.getClass();
        int i5 = k0Var.f97856g;
        Iterator it = elements.iterator();
        while (true) {
            int i11 = 1;
            int i12 = 0;
            if (!it.hasNext()) {
                break;
            }
            Object next = it.next();
            int iHashCode = (next != null ? next.hashCode() : 0) * (-862048943);
            int i13 = iHashCode ^ (iHashCode << 16);
            int i14 = i13 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
            int i15 = k0Var.f97855f;
            int i16 = (i13 >>> 7) & i15;
            while (true) {
                long[] jArr = k0Var.f97850a;
                int i17 = i16 >> 3;
                int i18 = (i16 & 7) << 3;
                int i19 = i11;
                int i21 = i12;
                long j11 = (((-i18) >> 63) & (jArr[i17 + i11] << (64 - i18))) | (jArr[i17] >>> i18);
                long j12 = (i14 * 72340172838076673L) ^ j11;
                long j13 = -9187201950435737472L;
                long j14 = (~j12) & (j12 - 72340172838076673L) & (-9187201950435737472L);
                while (true) {
                    if (j14 == 0) {
                        break;
                    }
                    iNumberOfTrailingZeros = ((Long.numberOfTrailingZeros(j14) >> 3) + i16) & i15;
                    long j15 = j13;
                    if (Intrinsics.b(k0Var.f97851b[iNumberOfTrailingZeros], next)) {
                        break;
                    }
                    j14 &= j14 - 1;
                    j13 = j15;
                }
                i12 = i21 + 8;
                i16 = (i16 + i12) & i15;
                i11 = i19;
            }
            if (iNumberOfTrailingZeros >= 0) {
                k0Var.h(iNumberOfTrailingZeros);
            }
        }
        return i5 != k0Var.f97856g;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean retainAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        return this.f97805b.i(elements);
    }

    @Override // java.util.Set, java.util.Collection
    public final int size() {
        return this.f97804a.f97856g;
    }

    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray() {
        return CollectionToArray.a(this);
    }

    public final String toString() {
        return this.f97804a.toString();
    }

    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray(Object[] array) {
        Intrinsics.g(array, "array");
        return CollectionToArray.b(this, array);
    }
}
