package io.branch.search.internal;

import io.branch.search.internal.Ke;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.me, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3271me<T> implements Ke<T, T> {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f65197a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3472yc f65198b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final S f65199c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap<String, T> f65200d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap<String, T> f65201e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final ReentrantLock f65202f;

    public C3271me(@NotNull String key, @NotNull C3472yc sampledQueue, @Nullable S s11) {
        Intrinsics.g(key, "key");
        Intrinsics.g(sampledQueue, "sampledQueue");
        this.f65197a = key;
        this.f65198b = sampledQueue;
        this.f65199c = s11;
        this.f65200d = new ConcurrentHashMap<>();
        this.f65201e = new ConcurrentHashMap<>();
        this.f65202f = new ReentrantLock();
    }

    @Override // io.branch.search.internal.Ke
    @NotNull
    public final String a() {
        return g();
    }

    @Override // io.branch.search.internal.Ke
    @NotNull
    public final JSONObject b() {
        ReentrantLock reentrantLock = this.f65202f;
        reentrantLock.lock();
        try {
            JSONObject jSONObject = new JSONObject();
            Enumeration<String> enumerationKeys = this.f65200d.keys();
            Intrinsics.f(enumerationKeys, "state.keys()");
            Enumeration enumeration = b70.c.w0(enumerationKeys).f71730a;
            while (enumeration.hasMoreElements()) {
                String str = (String) enumeration.nextElement();
                try {
                    Object objRemove = this.f65200d.remove(str);
                    if (objRemove instanceof Collection) {
                        objRemove = new JSONArray((Collection) objRemove);
                    }
                    jSONObject.putOpt(str, objRemove);
                } catch (Exception unused) {
                    C3309p1.a("me#" + this.f65197a + ".jsonStringify", "jsonStringify was passed a non-json-compliant structure.");
                }
            }
            reentrantLock.unlock();
            return jSONObject;
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    @Override // io.branch.search.internal.Ke
    @NotNull
    public final ConcurrentHashMap c() {
        ReentrantLock reentrantLock = this.f65202f;
        reentrantLock.lock();
        try {
            Ke.a.a(this);
            S s11 = this.f65199c;
            if (s11 != null) {
                s11.a(this.f65197a, new C3237ke(this));
                Unit unit = Unit.f71706a;
            }
            reentrantLock.unlock();
            return this.f65201e;
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    @Override // io.branch.search.internal.Ke
    public final void clear() {
        this.f65200d.clear();
    }

    @Override // io.branch.search.internal.Ke
    public final void d() {
        this.f65201e.clear();
    }

    @Override // io.branch.search.internal.Ke
    public final void e() {
        Ke.a.a(this);
    }

    @Override // io.branch.search.internal.Ke
    @Nullable
    public final S f() {
        return this.f65199c;
    }

    @NotNull
    public final String g() {
        return this.f65197a;
    }

    @NotNull
    public final void a(@NotNull JSONObject payload) {
        Intrinsics.g(payload, "payload");
        Iterator<String> itKeys = payload.keys();
        while (itKeys.hasNext()) {
            try {
                String next = itKeys.next();
                Intrinsics.e(next, "null cannot be cast to non-null type kotlin.String");
                String str = next;
                this.f65201e.put(str, payload.get(str));
            } catch (Exception e3) {
                C3309p1.a(EnumC3131e9.Others, "Failure on restoring Json object for TrackingAnalytics me.parseInto", e3);
            }
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public C3271me(@NotNull String key, @NotNull t70.j0 scope, @Nullable S s11) {
        this(key, new C3472yc(10, 300L, scope), s11);
        Intrinsics.g(key, "key");
        Intrinsics.g(scope, "scope");
    }
}
