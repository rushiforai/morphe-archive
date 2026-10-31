package ads_mobile_sdk;

import androidx.datastore.preferences.protobuf.e1;
import java.util.AbstractMap;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* loaded from: classes2.dex */
public final class ob3 extends AbstractMap {

    /* renamed from: d, reason: collision with root package name */
    public volatile e1 f7811d;

    /* renamed from: c, reason: collision with root package name */
    public boolean f7810c = false;

    /* renamed from: a, reason: collision with root package name */
    public Object[] f7808a = null;

    /* renamed from: b, reason: collision with root package name */
    public int f7809b = 0;

    /* renamed from: e, reason: collision with root package name */
    public volatile boolean f7812e = true;

    public final void a() {
        if (this.f7810c) {
            throw new UnsupportedOperationException();
        }
    }

    public final void b$1() {
        if (this.f7810c || this.f7812e) {
            return;
        }
        synchronized (this) {
            try {
                if (this.f7812e) {
                    return;
                }
                int i5 = this.f7809b;
                if (i5 <= 1) {
                    return;
                }
                int i11 = 0;
                Arrays.sort(this.f7808a, 0, i5);
                int i12 = 0;
                while (true) {
                    int i13 = this.f7809b;
                    if (i11 >= i13) {
                        if (i12 < i13) {
                            this.f7809b = i12;
                            Object[] objArr = this.f7808a;
                            Arrays.fill(objArr, i12, objArr.length, (Object) null);
                        }
                        this.f7812e = true;
                        return;
                    }
                    Object[] objArr2 = this.f7808a;
                    if (objArr2[i11] != null) {
                        throw new ClassCastException();
                    }
                    if (i12 > 0) {
                        if (objArr2[i12 - 1] != null) {
                            throw new ClassCastException();
                        }
                        throw null;
                    }
                    objArr2[i12] = null;
                    i12++;
                    i11++;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        a();
        if (this.f7809b != 0) {
            this.f7808a = null;
            this.f7809b = 0;
            this.f7812e = true;
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        if (obj != null) {
            throw new ClassCastException();
        }
        b$1();
        int i5 = this.f7809b - 1;
        if (i5 < 0) {
            return false;
        }
        throw b.u4.d(this.f7808a[i5 >>> 1]);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        b$1();
        if (this.f7811d == null) {
            this.f7811d = new e1(this, 1);
        }
        return this.f7811d;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ob3)) {
            return super.equals(obj);
        }
        ob3 ob3Var = (ob3) obj;
        b$1();
        int i5 = this.f7809b;
        ob3Var.b$1();
        if (i5 == ob3Var.f7809b) {
            Object[] objArr = this.f7808a;
            Object[] objArr2 = ob3Var.f7808a;
            for (int i11 = 0; i11 < i5; i11++) {
                if (objArr[i11].equals(objArr2[i11])) {
                }
            }
            return true;
        }
        return false;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        if (obj != null) {
            throw new ClassCastException();
        }
        b$1();
        int i5 = this.f7809b - 1;
        if (i5 < 0) {
            return null;
        }
        throw b.u4.d(this.f7808a[i5 >>> 1]);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int hashCode() {
        b$1();
        int i5 = this.f7809b;
        int iHashCode = 0;
        for (int i11 = 0; i11 < i5; i11++) {
            iHashCode += this.f7808a[i11].hashCode();
        }
        return iHashCode;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean isEmpty() {
        return this.f7809b == 0;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        if (obj != null) {
            throw new ClassCastException();
        }
        a();
        throw null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void putAll(Map map) {
        a();
        if (map instanceof ob3) {
            ob3 ob3Var = (ob3) map;
            a(this.f7809b + ob3Var.f7809b);
            int i5 = this.f7809b;
            if (i5 < ob3Var.f7809b + i5) {
                throw b.u4.d(ob3Var.f7808a[0]);
            }
            return;
        }
        a(map.size() + this.f7809b);
        Iterator it = map.entrySet().iterator();
        if (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            if (entry.getKey() != null) {
                throw new ClassCastException();
            }
            entry.getValue();
            a();
            throw null;
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        a();
        b$1();
        if (obj != null) {
            throw new ClassCastException();
        }
        int i5 = this.f7809b - 1;
        if (i5 < 0) {
            return null;
        }
        throw b.u4.d(this.f7808a[i5 >>> 1]);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        b$1();
        return this.f7809b;
    }

    public final void a(int i5) {
        Object[] objArr = this.f7808a;
        if (objArr != null && objArr.length != 0) {
            if (i5 > objArr.length) {
                if (!this.f7812e) {
                    b$1();
                    if (i5 <= this.f7808a.length) {
                        return;
                    }
                }
                Object[] objArr2 = this.f7808a;
                int length = objArr2.length;
                int i11 = length + (length >> 1);
                if (i11 - i5 >= 0) {
                    i5 = i11;
                }
                if (i5 - 2147483639 > 0) {
                    i5 = 2147483639;
                }
                this.f7808a = Arrays.copyOf(objArr2, i5);
                return;
            }
            return;
        }
        this.f7808a = new Object[Math.max(16, i5)];
    }
}
