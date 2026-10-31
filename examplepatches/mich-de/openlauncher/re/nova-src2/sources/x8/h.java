package x8;

import b.c0;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public abstract /* synthetic */ class h {
    public static int[] _values() {
        return c0.G(2);
    }

    public static /* synthetic */ String a(int i5) {
        if (i5 == 1 || i5 == 2) {
            return "disabled";
        }
        if (i5 == 3) {
            return "public";
        }
        if (i5 == 4) {
            return "private";
        }
        throw null;
    }

    public static /* synthetic */ String b(int i5) {
        if (i5 == 1) {
            return "BASE";
        }
        if (i5 == 2) {
            return "REALTIME";
        }
        throw null;
    }

    public static int c(Map map, int i5, int i11) {
        return (map.hashCode() + i5) * i11;
    }

    public static /* synthetic */ void d(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, y70.l lVar, y70.n nVar, y70.n nVar2) {
        while (!atomicReferenceFieldUpdater.compareAndSet(lVar, nVar, nVar2) && atomicReferenceFieldUpdater.get(lVar) == nVar) {
        }
    }

    public static /* synthetic */ boolean e(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, Object obj, Object obj2) {
        while (!atomicReferenceFieldUpdater.compareAndSet(obj, obj2, null)) {
            if (atomicReferenceFieldUpdater.get(obj) != obj2) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ boolean f(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, Object obj, Throwable th2) {
        w50.g gVar;
        do {
            gVar = y70.g.f96798b;
            if (atomicReferenceFieldUpdater.compareAndSet(obj, gVar, th2)) {
                return true;
            }
        } while (atomicReferenceFieldUpdater.get(obj) == gVar);
        return false;
    }

    public static /* synthetic */ boolean g(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, y70.c cVar) {
        while (!atomicReferenceFieldUpdater.compareAndSet(cVar, null, y70.b.f96787a)) {
            if (atomicReferenceFieldUpdater.get(cVar) != null) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ boolean h(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, y70.c cVar, Object obj, y70.c cVar2) {
        while (!atomicReferenceFieldUpdater.compareAndSet(cVar, obj, cVar2)) {
            if (atomicReferenceFieldUpdater.get(cVar) != obj) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ boolean i(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, y70.k kVar, y70.k kVar2, y70.k kVar3) {
        while (!atomicReferenceFieldUpdater.compareAndSet(kVar, kVar2, kVar3)) {
            if (atomicReferenceFieldUpdater.get(kVar) != kVar2) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ String j(int i5) {
        return i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? AbstractJsonLexerKt.NULL : "UNKNOWN" : "EMPTY" : "ERROR" : "TOKEN" : "CODE";
    }

    public static /* synthetic */ int k(String str) {
        if (str == null) {
            throw new NullPointerException("Name is null");
        }
        if (str.equals("MARKET")) {
            return 1;
        }
        if (str.equals("SELF")) {
            return 2;
        }
        if (str.equals("BETA")) {
            return 3;
        }
        if (str.equals("BETA_PRIVATE")) {
            return 4;
        }
        throw new IllegalArgumentException("No enum constant com.teslacoilsw.tesladirect.TeslaDirectPrefs.UpdateMethod.".concat(str));
    }
}
