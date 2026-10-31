package s50;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final ConcurrentHashMap f86681a = new ConcurrentHashMap();

    public final Object a(a key, Function0 function0) {
        Intrinsics.g(key, "key");
        ConcurrentHashMap concurrentHashMap = this.f86681a;
        Object obj = concurrentHashMap.get(key);
        if (obj != null) {
            return obj;
        }
        Object objInvoke = function0.invoke();
        Object objPutIfAbsent = concurrentHashMap.putIfAbsent(key, objInvoke);
        if (objPutIfAbsent != null) {
            objInvoke = objPutIfAbsent;
        }
        Intrinsics.e(objInvoke, "null cannot be cast to non-null type T of io.ktor.util.ConcurrentSafeAttributes.computeIfAbsent");
        return objInvoke;
    }

    public final Object b(a key) {
        Intrinsics.g(key, "key");
        Object objD = d(key);
        if (objD != null) {
            return objD;
        }
        throw new IllegalStateException("No instance for key " + key);
    }

    public final Map c() {
        return this.f86681a;
    }

    public final Object d(a key) {
        Intrinsics.g(key, "key");
        return c().get(key);
    }

    public final void e(a key, Object value) {
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        c().put(key, value);
    }
}
