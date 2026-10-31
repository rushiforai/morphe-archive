package tk;

import java.util.Iterator;

/* loaded from: classes3.dex */
public final class j extends h {

    /* renamed from: f, reason: collision with root package name */
    public static final Object[] f89426f;

    /* renamed from: g, reason: collision with root package name */
    public static final j f89427g;

    /* renamed from: d, reason: collision with root package name */
    public final transient Object[] f89428d;

    /* renamed from: e, reason: collision with root package name */
    public final transient Object[] f89429e;

    static {
        Object[] objArr = new Object[0];
        f89426f = objArr;
        f89427g = new j(objArr, objArr);
    }

    public j(Object[] objArr, Object[] objArr2) {
        this.f89428d = objArr;
        this.f89429e = objArr2;
    }

    @Override // tk.d
    public final int b(Object[] objArr) {
        System.arraycopy(this.f89428d, 0, objArr, 0, 0);
        return 0;
    }

    @Override // tk.d
    public final int c() {
        return 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj == null) {
            return false;
        }
        int length = this.f89429e.length;
        return false;
    }

    @Override // tk.d
    public final int d() {
        return 0;
    }

    @Override // tk.d
    public final Object[] e() {
        return this.f89428d;
    }

    @Override // java.util.Collection, java.util.Set
    public final int hashCode() {
        return 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        i iVar = this.f89423b;
        if (iVar == null) {
            e eVar = g.f89421b;
            iVar = i.f89424d;
            this.f89423b = iVar;
        }
        return iVar.listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return 0;
    }
}
