package io.branch.search.internal;

import io.branch.search.internal.Ke;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Unit;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.r9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3350r9<T> implements Ke<T, Collection<? extends T>> {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final C3282n8 f65617a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f65618b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3472yc f65619c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final S f65620d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final Function0<Collection<T>> f65621e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final Function3<String, Collection<T>, T, Collection<T>> f65622f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final ReentrantLock f65623g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap<String, Collection<T>> f65624h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap<String, Collection<T>> f65625i;

    /* renamed from: io.branch.search.internal.r9$a */
    public static final class a extends Lambda implements Function0<Unit> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ Function1<Ke<T, Collection<? extends T>>, Unit> f65626a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ C3350r9<T> f65627b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public a(Function1<? super Ke<T, Collection<T>>, Unit> function1, C3350r9<T> c3350r9) {
            super(0);
            this.f65626a = function1;
            this.f65627b = c3350r9;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            this.f65626a.invoke(this.f65627b);
            return Unit.f71706a;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public C3350r9(@Nullable C3282n8 c3282n8, @NotNull String key, @NotNull C3472yc sampledQueue, @Nullable S s11, @NotNull Function0<? extends Collection<T>> collectionBuilder, @Nullable Function3<? super String, ? super Collection<T>, ? super T, ? extends Collection<T>> function3) {
        Intrinsics.g(key, "key");
        Intrinsics.g(sampledQueue, "sampledQueue");
        Intrinsics.g(collectionBuilder, "collectionBuilder");
        this.f65617a = c3282n8;
        this.f65618b = key;
        this.f65619c = sampledQueue;
        this.f65620d = s11;
        this.f65621e = collectionBuilder;
        this.f65622f = function3;
        this.f65623g = new ReentrantLock();
        this.f65624h = new ConcurrentHashMap<>();
        this.f65625i = new ConcurrentHashMap<>();
    }

    /* JADX WARN: Finally extract failed */
    public final void a(C3317p9 c3317p9) {
        ReentrantLock reentrantLock = this.f65623g;
        reentrantLock.lock();
        try {
            try {
                c();
                c3317p9.invoke(this.f65625i);
                this.f65624h.putAll(this.f65625i);
                this.f65625i.clear();
                S s11 = this.f65620d;
                if (s11 != null) {
                    s11.a(this.f65618b);
                }
                Ke.a.a(this);
                Unit unit = Unit.f71706a;
                reentrantLock.unlock();
            } catch (Throwable th2) {
                this.f65624h.putAll(this.f65625i);
                this.f65625i.clear();
                S s12 = this.f65620d;
                if (s12 != null) {
                    s12.a(this.f65618b);
                }
                Ke.a.a(this);
                throw th2;
            }
        } catch (Throwable th3) {
            reentrantLock.unlock();
            throw th3;
        }
    }

    @Override // io.branch.search.internal.Ke
    @NotNull
    public final JSONObject b() {
        ReentrantLock reentrantLock = this.f65623g;
        reentrantLock.lock();
        try {
            JSONObject jSONObject = new JSONObject();
            Enumeration<String> enumerationKeys = this.f65624h.keys();
            Intrinsics.f(enumerationKeys, "state.keys()");
            Enumeration enumeration = b70.c.w0(enumerationKeys).f71730a;
            while (enumeration.hasMoreElements()) {
                String str = (String) enumeration.nextElement();
                try {
                    Object objRemove = this.f65624h.remove(str);
                    if (objRemove instanceof Collection) {
                        objRemove = new JSONArray((Collection) objRemove);
                    }
                    jSONObject.putOpt(str, objRemove);
                } catch (Exception e3) {
                    C3309p1.a(EnumC3131e9.Others, "jsonStringify was passed a non-json-compliant structure.", e3);
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
        ReentrantLock reentrantLock = this.f65623g;
        reentrantLock.lock();
        try {
            Ke.a.a(this);
            S s11 = this.f65620d;
            if (s11 != null) {
                s11.a(this.f65618b, new C3334q9(this));
                Unit unit = Unit.f71706a;
            }
            reentrantLock.unlock();
            return this.f65625i;
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    @Override // io.branch.search.internal.Ke
    public final void clear() {
        this.f65624h.clear();
    }

    @Override // io.branch.search.internal.Ke
    public final void d() {
        this.f65625i.clear();
    }

    @Override // io.branch.search.internal.Ke
    public final void e() {
        Ke.a.a(this);
    }

    @Override // io.branch.search.internal.Ke
    @Nullable
    public final S f() {
        return this.f65620d;
    }

    @NotNull
    public final String g() {
        return this.f65618b;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public C3350r9(@Nullable C3282n8 c3282n8, @NotNull String key, @NotNull t70.j0 scope, @Nullable S s11, long j11, @NotNull Function0<? extends Collection<T>> collectionBuilder, @Nullable Function3<? super String, ? super Collection<T>, ? super T, ? extends Collection<T>> function3) {
        this(c3282n8, key, new C3472yc(10, j11, scope), s11, collectionBuilder, function3);
        Intrinsics.g(key, "key");
        Intrinsics.g(scope, "scope");
        Intrinsics.g(collectionBuilder, "collectionBuilder");
    }

    public /* synthetic */ C3350r9(C3282n8 c3282n8, String str, t70.j0 j0Var, S s11, Function0 function0, M m11) {
        this(c3282n8, str, j0Var, s11, 300L, function0, m11);
    }

    @Override // io.branch.search.internal.Ke
    @NotNull
    public final String a() {
        return g();
    }

    @NotNull
    public final void a(@NotNull JSONObject payload) throws JSONException {
        Intrinsics.g(payload, "payload");
        Iterator<String> itKeys = payload.keys();
        while (itKeys.hasNext()) {
            try {
                String next = itKeys.next();
                Intrinsics.e(next, "null cannot be cast to non-null type kotlin.String");
                String str = next;
                Collection collection = this.f65625i.get(str);
                if (collection == null) {
                    collection = (Collection) this.f65621e.invoke();
                }
                Intrinsics.f(collection, "restoredState[key] ?: collectionBuilder()");
                Object obj = payload.get(str);
                Intrinsics.e(obj, "null cannot be cast to non-null type org.json.JSONArray");
                JSONArray jSONArray = (JSONArray) obj;
                int length = jSONArray.length();
                for (int i5 = 0; i5 < length; i5++) {
                    int size = collection.size();
                    C3282n8 c3282n8 = this.f65617a;
                    if (size > (c3282n8 != null ? c3282n8.f65379v : 200)) {
                        collection.remove(collection.iterator().next());
                    }
                    collection.add(jSONArray.get(i5));
                }
                this.f65625i.put(str, collection);
            } catch (Exception e3) {
                C3309p1.a(EnumC3131e9.Others, "Failure on restoring Json object for TrackingAnalytics r9.parseInto", e3);
            }
        }
    }

    public final void a(@NotNull String key, T t6, @NotNull Function1<? super Ke<T, Collection<T>>, Unit> postStored) {
        Intrinsics.g(key, "key");
        Intrinsics.g(postStored, "postStored");
        ReentrantLock reentrantLock = this.f65623g;
        reentrantLock.lock();
        try {
            Collection<T> collection = this.f65624h.get(key);
            if (collection == null) {
                collection = (Collection) this.f65621e.invoke();
            }
            Intrinsics.f(collection, "state[key] ?: collectionBuilder()");
            ConcurrentHashMap<String, Collection<T>> concurrentHashMap = this.f65624h;
            Function3<String, Collection<T>, T, Collection<T>> function3 = this.f65622f;
            if (function3 == null) {
                collection.add(t6);
            } else {
                collection = (Collection) function3.invoke(key, collection, t6);
            }
            concurrentHashMap.put(key, collection);
            C3472yc c3472yc = this.f65619c;
            a aVar = new a(postStored, this);
            c3472yc.getClass();
            t70.m0.u(EmptyCoroutineContext.f71803a, new C3455xc(c3472yc, aVar, null));
            Unit unit = Unit.f71706a;
            reentrantLock.unlock();
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }
}
