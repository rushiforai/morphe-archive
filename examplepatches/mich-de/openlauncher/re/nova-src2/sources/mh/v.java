package mh;

import java.util.Iterator;

/* loaded from: classes3.dex */
public final class v extends l {

    /* renamed from: i, reason: collision with root package name */
    public static final Object[] f76387i;

    /* renamed from: j, reason: collision with root package name */
    public static final v f76388j;

    /* renamed from: d, reason: collision with root package name */
    public final transient Object[] f76389d;

    /* renamed from: e, reason: collision with root package name */
    public final transient int f76390e;

    /* renamed from: f, reason: collision with root package name */
    public final transient Object[] f76391f;

    /* renamed from: g, reason: collision with root package name */
    public final transient int f76392g;

    /* renamed from: h, reason: collision with root package name */
    public final transient int f76393h;

    static {
        Object[] objArr = new Object[0];
        f76387i = objArr;
        f76388j = new v(objArr, 0, objArr, 0, 0);
    }

    public v(Object[] objArr, int i5, Object[] objArr2, int i11, int i12) {
        this.f76389d = objArr;
        this.f76390e = i5;
        this.f76391f = objArr2;
        this.f76392g = i11;
        this.f76393h = i12;
    }

    @Override // mh.f
    public final int b(Object[] objArr) {
        Object[] objArr2 = this.f76389d;
        int i5 = this.f76393h;
        System.arraycopy(objArr2, 0, objArr, 0, i5);
        return i5;
    }

    @Override // mh.f
    public final int c() {
        return this.f76393h;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj == null) {
            return false;
        }
        Object[] objArr = this.f76391f;
        if (objArr.length == 0) {
            return false;
        }
        int iRotateLeft = (int) (Integer.rotateLeft((int) (obj.hashCode() * (-862048943)), 15) * 461845907);
        while (true) {
            int i5 = iRotateLeft & this.f76392g;
            Object obj2 = objArr[i5];
            if (obj2 == null) {
                return false;
            }
            if (obj2.equals(obj)) {
                return true;
            }
            iRotateLeft = i5 + 1;
        }
    }

    @Override // mh.f
    public final int d() {
        return 0;
    }

    @Override // mh.f
    public final a0 e() {
        return g().listIterator(0);
    }

    @Override // mh.f
    public final Object[] f() {
        return this.f76389d;
    }

    @Override // mh.l
    public final j h() {
        return j.j(this.f76393h, this.f76389d);
    }

    @Override // mh.l, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.f76390e;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return g().listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f76393h;
    }
}
