package r1;

import java.util.Collection;
import java.util.List;
import java.util.RandomAccess;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e implements RandomAccess {

    /* renamed from: a, reason: collision with root package name */
    public Object[] f85077a;

    /* renamed from: b, reason: collision with root package name */
    public b f85078b;

    /* renamed from: c, reason: collision with root package name */
    public int f85079c = 0;

    public e(Object[] objArr) {
        this.f85077a = objArr;
    }

    public final void a(int i5, Object obj) {
        int i11 = this.f85079c + 1;
        if (this.f85077a.length < i11) {
            n(i11);
        }
        Object[] objArr = this.f85077a;
        int i12 = this.f85079c;
        if (i5 != i12) {
            System.arraycopy(objArr, i5, objArr, i5 + 1, i12 - i5);
        }
        objArr[i5] = obj;
        this.f85079c++;
    }

    public final void b(Object obj) {
        int i5 = this.f85079c + 1;
        if (this.f85077a.length < i5) {
            n(i5);
        }
        Object[] objArr = this.f85077a;
        int i11 = this.f85079c;
        objArr[i11] = obj;
        this.f85079c = i11 + 1;
    }

    public final void c(int i5, List list) {
        if (list.isEmpty()) {
            return;
        }
        int size = list.size();
        int i11 = this.f85079c + size;
        if (this.f85077a.length < i11) {
            n(i11);
        }
        Object[] objArr = this.f85077a;
        int i12 = this.f85079c;
        if (i5 != i12) {
            System.arraycopy(objArr, i5, objArr, i5 + size, i12 - i5);
        }
        int size2 = list.size();
        for (int i13 = 0; i13 < size2; i13++) {
            objArr[i5 + i13] = list.get(i13);
        }
        this.f85079c += size;
    }

    public final void d(int i5, e eVar) {
        int i11 = eVar.f85079c;
        if (i11 == 0) {
            return;
        }
        int i12 = this.f85079c + i11;
        if (this.f85077a.length < i12) {
            n(i12);
        }
        Object[] objArr = this.f85077a;
        int i13 = this.f85079c;
        if (i5 != i13) {
            System.arraycopy(objArr, i5, objArr, i5 + i11, i13 - i5);
        }
        System.arraycopy(eVar.f85077a, 0, objArr, i5, i11);
        this.f85079c += i11;
    }

    public final boolean e(int i5, Collection collection) {
        int i11 = 0;
        if (collection.isEmpty()) {
            return false;
        }
        int size = collection.size();
        int i12 = this.f85079c + size;
        if (this.f85077a.length < i12) {
            n(i12);
        }
        Object[] objArr = this.f85077a;
        int i13 = this.f85079c;
        if (i5 != i13) {
            System.arraycopy(objArr, i5, objArr, i5 + size, i13 - i5);
        }
        for (Object obj : collection) {
            int i14 = i11 + 1;
            if (i11 < 0) {
                ul.b.e0();
                throw null;
            }
            objArr[i11 + i5] = obj;
            i11 = i14;
        }
        this.f85079c += size;
        return true;
    }

    public final List f() {
        b bVar = this.f85078b;
        if (bVar != null) {
            return bVar;
        }
        b bVar2 = new b(this);
        this.f85078b = bVar2;
        return bVar2;
    }

    public final void g() {
        Object[] objArr = this.f85077a;
        int i5 = this.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            objArr[i11] = null;
        }
        this.f85079c = 0;
    }

    public final boolean h(Object obj) {
        int i5 = this.f85079c - 1;
        if (i5 >= 0) {
            for (int i11 = 0; !Intrinsics.b(this.f85077a[i11], obj); i11++) {
                if (i11 != i5) {
                }
            }
            return true;
        }
        return false;
    }

    public final int i(Object obj) {
        Object[] objArr = this.f85077a;
        int i5 = this.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (Intrinsics.b(obj, objArr[i11])) {
                return i11;
            }
        }
        return -1;
    }

    public final boolean j(Object obj) {
        int i5 = i(obj);
        if (i5 < 0) {
            return false;
        }
        k(i5);
        return true;
    }

    public final Object k(int i5) {
        Object[] objArr = this.f85077a;
        Object obj = objArr[i5];
        int i11 = this.f85079c;
        if (i5 != i11 - 1) {
            int i12 = i5 + 1;
            System.arraycopy(objArr, i12, objArr, i5, i11 - i12);
        }
        int i13 = this.f85079c - 1;
        this.f85079c = i13;
        objArr[i13] = null;
        return obj;
    }

    public final void l(int i5, int i11) {
        if (i11 > i5) {
            int i12 = this.f85079c;
            if (i11 < i12) {
                Object[] objArr = this.f85077a;
                System.arraycopy(objArr, i11, objArr, i5, i12 - i11);
            }
            int i13 = this.f85079c;
            int i14 = i13 - (i11 - i5);
            int i15 = i13 - 1;
            if (i14 <= i15) {
                int i16 = i14;
                while (true) {
                    this.f85077a[i16] = null;
                    if (i16 == i15) {
                        break;
                    } else {
                        i16++;
                    }
                }
            }
            this.f85079c = i14;
        }
    }

    public final void n(int i5) {
        Object[] objArr = this.f85077a;
        int length = objArr.length;
        Object[] objArr2 = new Object[Math.max(i5, length * 2)];
        System.arraycopy(objArr, 0, objArr2, 0, length);
        this.f85077a = objArr2;
    }
}
