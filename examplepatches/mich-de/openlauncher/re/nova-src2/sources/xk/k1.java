package xk;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.NavigableSet;
import java.util.SortedSet;

/* loaded from: classes3.dex */
public abstract class k1 extends d1 implements NavigableSet, h3 {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ int f95949f = 0;

    /* renamed from: d, reason: collision with root package name */
    public final transient Comparator f95950d;

    /* renamed from: e, reason: collision with root package name */
    public transient k1 f95951e;

    public k1(Comparator comparator) {
        this.f95950d = comparator;
    }

    public static a3 s(i2 i2Var, int i5, Object... objArr) {
        if (i5 == 0) {
            return u(i2Var);
        }
        w20.e.c(i5, objArr);
        Arrays.sort(objArr, 0, i5, i2Var);
        int i11 = 1;
        for (int i12 = 1; i12 < i5; i12++) {
            Object obj = objArr[i12];
            if (i2Var.compare(obj, objArr[i11 - 1]) != 0) {
                objArr[i11] = obj;
                i11++;
            }
        }
        Arrays.fill(objArr, i11, i5, (Object) null);
        if (i11 < objArr.length / 2) {
            objArr = Arrays.copyOf(objArr, i11);
        }
        return new a3(v0.k(i11, objArr), i2Var);
    }

    public static a3 u(Comparator comparator) {
        return i2.f95937b.equals(comparator) ? a3.f95859h : new a3(r2.f96007e, comparator);
    }

    @Override // java.util.SortedSet
    public final Comparator comparator() {
        return this.f95950d;
    }

    @Override // java.util.NavigableSet
    public final NavigableSet headSet(Object obj, boolean z11) {
        obj.getClass();
        a3 a3Var = (a3) this;
        return a3Var.w(0, a3Var.x(obj, z11));
    }

    @Override // java.util.NavigableSet
    public final Object pollFirst() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.NavigableSet
    public final Object pollLast() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.NavigableSet
    /* renamed from: t, reason: merged with bridge method [inline-methods] */
    public final k1 descendingSet() {
        k1 k1VarU = this.f95951e;
        if (k1VarU == null) {
            a3 a3Var = (a3) this;
            Comparator comparatorReverseOrder = Collections.reverseOrder(a3Var.f95950d);
            k1VarU = a3Var.isEmpty() ? u(comparatorReverseOrder) : new a3(a3Var.f95860g.u(), comparatorReverseOrder);
            this.f95951e = k1VarU;
            k1VarU.f95951e = this;
        }
        return k1VarU;
    }

    @Override // java.util.NavigableSet
    public final NavigableSet tailSet(Object obj, boolean z11) {
        obj.getClass();
        a3 a3Var = (a3) this;
        return a3Var.w(a3Var.y(obj, z11), a3Var.f95860g.size());
    }

    @Override // java.util.NavigableSet
    /* renamed from: v, reason: merged with bridge method [inline-methods] */
    public final a3 subSet(Object obj, boolean z11, Object obj2, boolean z12) {
        obj.getClass();
        obj2.getClass();
        vk.b0.c(this.f95950d.compare(obj, obj2) <= 0);
        a3 a3Var = (a3) this;
        a3 a3VarW = a3Var.w(a3Var.y(obj, z11), a3Var.f95860g.size());
        return a3VarW.w(0, a3VarW.x(obj2, z12));
    }

    @Override // java.util.NavigableSet, java.util.SortedSet
    public final SortedSet subSet(Object obj, Object obj2) {
        return subSet(obj, true, obj2, false);
    }

    @Override // java.util.NavigableSet, java.util.SortedSet
    public final SortedSet headSet(Object obj) {
        obj.getClass();
        a3 a3Var = (a3) this;
        return a3Var.w(0, a3Var.x(obj, false));
    }

    @Override // java.util.NavigableSet, java.util.SortedSet
    public final SortedSet tailSet(Object obj) {
        obj.getClass();
        a3 a3Var = (a3) this;
        return a3Var.w(a3Var.y(obj, true), a3Var.f95860g.size());
    }
}
