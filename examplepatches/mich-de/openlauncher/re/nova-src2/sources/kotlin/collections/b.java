package kotlin.collections;

import java.util.RandomAccess;
import kotlin.collections.AbstractList;

/* loaded from: classes4.dex */
public final class b extends AbstractList implements RandomAccess {

    /* renamed from: b, reason: collision with root package name */
    public final AbstractList f71749b;

    /* renamed from: c, reason: collision with root package name */
    public final int f71750c;

    /* renamed from: d, reason: collision with root package name */
    public final int f71751d;

    public b(AbstractList abstractList, int i5, int i11) {
        this.f71749b = abstractList;
        this.f71750c = i5;
        int iC = abstractList.c();
        AbstractList.f71712a.getClass();
        AbstractList.Companion.d(i5, i11, iC);
        this.f71751d = i11 - i5;
    }

    @Override // kotlin.collections.AbstractCollection
    public final int c() {
        return this.f71751d;
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final Object get(int i5) {
        AbstractList.f71712a.getClass();
        AbstractList.Companion.b(i5, this.f71751d);
        return this.f71749b.get(this.f71750c + i5);
    }
}
