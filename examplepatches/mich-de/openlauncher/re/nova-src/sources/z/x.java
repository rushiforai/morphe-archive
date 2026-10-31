package z;

import b.i8;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public class x {

    /* renamed from: a, reason: collision with root package name */
    public int f97857a;

    /* renamed from: b, reason: collision with root package name */
    public final a0.b f97858b;

    /* renamed from: c, reason: collision with root package name */
    public final i8 f97859c;

    /* renamed from: d, reason: collision with root package name */
    public int f97860d;

    /* renamed from: e, reason: collision with root package name */
    public int f97861e;

    /* renamed from: f, reason: collision with root package name */
    public int f97862f;

    public x(int i5) {
        this.f97857a = i5;
        if (i5 <= 0) {
            android.support.v4.media.session.b.k0("maxSize <= 0");
            throw null;
        }
        this.f97858b = new a0.b(0);
        this.f97859c = new i8(1);
    }

    public Object a(Object key) {
        Intrinsics.g(key, "key");
        return null;
    }

    public void b(Object key, Object oldValue, Object obj) {
        Intrinsics.g(key, "key");
        Intrinsics.g(oldValue, "oldValue");
    }

    public final Object c(Object key) {
        Object objPut;
        Intrinsics.g(key, "key");
        synchronized (this.f97859c) {
            a0.b bVar = this.f97858b;
            bVar.getClass();
            Object obj = bVar.f57a.get(key);
            if (obj != null) {
                this.f97861e++;
                return obj;
            }
            this.f97862f++;
            Object objA = a(key);
            if (objA == null) {
                return null;
            }
            synchronized (this.f97859c) {
                try {
                    a0.b bVar2 = this.f97858b;
                    bVar2.getClass();
                    objPut = bVar2.f57a.put(key, objA);
                    if (objPut != null) {
                        a0.b bVar3 = this.f97858b;
                        bVar3.getClass();
                        bVar3.f57a.put(key, objPut);
                    } else {
                        this.f97860d += f(key, objA);
                        Unit unit = Unit.f71706a;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            if (objPut != null) {
                b(key, objA, objPut);
                return objPut;
            }
            i(this.f97857a);
            return objA;
        }
    }

    public final Object d(Object key, Object obj) {
        Object objPut;
        Intrinsics.g(key, "key");
        synchronized (this.f97859c) {
            try {
                this.f97860d += f(key, obj);
                a0.b bVar = this.f97858b;
                bVar.getClass();
                objPut = bVar.f57a.put(key, obj);
                if (objPut != null) {
                    this.f97860d -= f(key, objPut);
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (objPut != null) {
            b(key, objPut, obj);
        }
        i(this.f97857a);
        return objPut;
    }

    public final Object e(Object key) {
        Object objRemove;
        Intrinsics.g(key, "key");
        synchronized (this.f97859c) {
            try {
                a0.b bVar = this.f97858b;
                bVar.getClass();
                objRemove = bVar.f57a.remove(key);
                if (objRemove != null) {
                    this.f97860d -= f(key, objRemove);
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (objRemove != null) {
            b(key, objRemove, null);
        }
        return objRemove;
    }

    public final int f(Object obj, Object obj2) {
        int iG = g(obj, obj2);
        if (iG >= 0) {
            return iG;
        }
        android.support.v4.media.session.b.l0("Negative size: " + obj + '=' + obj2);
        throw null;
    }

    public int g(Object key, Object value) {
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        return 1;
    }

    public final LinkedHashMap h() {
        LinkedHashMap linkedHashMap;
        synchronized (this.f97859c) {
            Set setEntrySet = this.f97858b.f57a.entrySet();
            Intrinsics.f(setEntrySet, "<get-entries>(...)");
            linkedHashMap = new LinkedHashMap(setEntrySet.size());
            Set<Map.Entry> setEntrySet2 = this.f97858b.f57a.entrySet();
            Intrinsics.f(setEntrySet2, "<get-entries>(...)");
            for (Map.Entry entry : setEntrySet2) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        return linkedHashMap;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0067, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0068, code lost:
    
        android.support.v4.media.session.b.l0("LruCache.sizeOf() is reporting inconsistent results!");
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x006d, code lost:
    
        throw null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void i(int i5) {
        Object key;
        Object value;
        while (true) {
            synchronized (this.f97859c) {
                try {
                    if (this.f97860d < 0 || (this.f97858b.f57a.isEmpty() && this.f97860d != 0)) {
                        break;
                    }
                    if (this.f97860d <= i5 || this.f97858b.f57a.isEmpty()) {
                        break;
                    }
                    Set setEntrySet = this.f97858b.f57a.entrySet();
                    Intrinsics.f(setEntrySet, "<get-entries>(...)");
                    Map.Entry entry = (Map.Entry) b70.g.X0(setEntrySet);
                    if (entry == null) {
                        return;
                    }
                    key = entry.getKey();
                    value = entry.getValue();
                    a0.b bVar = this.f97858b;
                    bVar.getClass();
                    Intrinsics.g(key, "key");
                    bVar.f57a.remove(key);
                    this.f97860d -= f(key, value);
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            b(key, value, null);
        }
    }

    public final String toString() {
        String str;
        synchronized (this.f97859c) {
            try {
                int i5 = this.f97861e;
                int i11 = this.f97862f + i5;
                str = "LruCache[maxSize=" + this.f97857a + ",hits=" + this.f97861e + ",misses=" + this.f97862f + ",hitRate=" + (i11 != 0 ? (i5 * 100) / i11 : 0) + "%]";
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return str;
    }
}
