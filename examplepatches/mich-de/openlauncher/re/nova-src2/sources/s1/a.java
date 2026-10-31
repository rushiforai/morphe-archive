package s1;

import java.util.List;
import kotlin.collections.AbstractList;
import p6.j;

/* loaded from: classes2.dex */
public final class a extends AbstractList implements b {

    /* renamed from: b, reason: collision with root package name */
    public final b f86562b;

    /* renamed from: c, reason: collision with root package name */
    public final int f86563c;

    /* renamed from: d, reason: collision with root package name */
    public final int f86564d;

    public a(b bVar, int i5, int i11) {
        this.f86562b = bVar;
        this.f86563c = i5;
        j.i(i5, i11, bVar.size());
        this.f86564d = i11 - i5;
    }

    @Override // kotlin.collections.AbstractCollection
    public final int c() {
        return this.f86564d;
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final Object get(int i5) {
        j.g(i5, this.f86564d);
        return this.f86562b.get(this.f86563c + i5);
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final List subList(int i5, int i11) {
        j.i(i5, i11, this.f86564d);
        int i12 = this.f86563c;
        return new a(this.f86562b, i5 + i12, i12 + i11);
    }
}
