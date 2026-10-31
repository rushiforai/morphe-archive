package io.branch.search.internal;

import com.amplitude.core.events.Plan;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import io.branch.search.AnalyticsEvent;
import io.branch.search.internal.util.CorosKt;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class I implements H {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3282n8 f62597a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Function2<F4, String, S> f62598b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final K5 f62599c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final t70.c0 f62600d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final AtomicBoolean f62601e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final String f62602f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final String f62603g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f62604h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final String f62605i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final String f62606j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final String f62607k;

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public final String f62608l;

    /* renamed from: m, reason: collision with root package name */
    @NotNull
    public final Q3<S> f62609m;

    @NotNull
    public final Q3<C3350r9<JSONObject>> n;

    @NotNull
    public final Q3<C3350r9<JSONObject>> o;

    /* renamed from: p, reason: collision with root package name */
    @NotNull
    public final Q3<C3350r9<String>> f62610p;

    /* renamed from: q, reason: collision with root package name */
    @NotNull
    public final Q3<C3350r9<JSONArray>> f62611q;

    /* renamed from: r, reason: collision with root package name */
    @NotNull
    public final Q3<C3271me<JSONObject>> f62612r;

    /* renamed from: s, reason: collision with root package name */
    @NotNull
    public final Q3<C3271me<String>> f62613s;

    /* renamed from: t, reason: collision with root package name */
    @NotNull
    public final Q3<C3271me<JSONArray>> f62614t;

    /* renamed from: u, reason: collision with root package name */
    @NotNull
    public final List<Q3<? extends Ke<? extends Object, ? extends Object>>> f62615u;

    /* renamed from: v, reason: collision with root package name */
    @NotNull
    public final List<Q3<? extends Ke<? extends Object, ? extends Object>>> f62616v;

    public static final class a {

        /* renamed from: io.branch.search.internal.I$a$a, reason: collision with other inner class name */
        public static final class C0323a extends Lambda implements Function2<F4, String, S> {

            /* renamed from: a, reason: collision with root package name */
            public static final C0323a f62617a = new C0323a();

            public C0323a() {
                super(2);
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                F4 delegate = (F4) obj;
                String suffix = (String) obj2;
                Intrinsics.g(delegate, "delegate");
                Intrinsics.g(suffix, "suffix");
                return new T(delegate, suffix);
            }
        }

        @JvmStatic
        @NotNull
        public static I a(@NotNull F4 contextDelegate, @NotNull C3282n8 remoteConfiguration, @NotNull C3190i0 analyticsSessionDataSource, @NotNull K5 decider) {
            Intrinsics.g(contextDelegate, "contextDelegate");
            Intrinsics.g(remoteConfiguration, "remoteConfiguration");
            Intrinsics.g(analyticsSessionDataSource, "analyticsSessionDataSource");
            Intrinsics.g(decider, "decider");
            return new I(contextDelegate, remoteConfiguration, analyticsSessionDataSource, C0323a.f62617a, decider, CorosKt.getBNCScope(), a80.d.f488c);
        }
    }

    public static final class b extends Lambda implements Function1<String, S> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ F4 f62619b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(F4 f42) {
            super(1);
            this.f62619b = f42;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            String suffix = (String) obj;
            Intrinsics.g(suffix, "suffix");
            return (S) I.this.f62598b.invoke(this.f62619b, suffix);
        }
    }

    public static final class c extends Lambda implements Function1<String, C3350r9<JSONObject>> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ t70.j0 f62621b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(t70.j0 j0Var) {
            super(1);
            this.f62621b = j0Var;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            String callerId = (String) obj;
            Intrinsics.g(callerId, "callerId");
            I i5 = I.this;
            return new C3350r9(i5.f62597a, i5.f62602f, this.f62621b, i5.f62609m.a(callerId), 5L, J.f62694a, null);
        }
    }

    public static final class d extends Lambda implements Function1<String, C3350r9<JSONArray>> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ t70.j0 f62623b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(t70.j0 j0Var) {
            super(1);
            this.f62623b = j0Var;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            String callerId = (String) obj;
            Intrinsics.g(callerId, "callerId");
            I i5 = I.this;
            return new C3350r9(i5.f62597a, i5.f62605i, this.f62623b, i5.f62609m.a(callerId), 300L, K.f62767a, null);
        }
    }

    public static final class e extends Lambda implements Function1<String, C3350r9<JSONObject>> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ t70.j0 f62625b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public e(t70.j0 j0Var) {
            super(1);
            this.f62625b = j0Var;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            String callerId = (String) obj;
            Intrinsics.g(callerId, "callerId");
            I i5 = I.this;
            return new C3350r9(i5.f62597a, i5.f62603g, this.f62625b, i5.f62609m.a(callerId), 300L, L.f62805a, M.f62856a);
        }
    }

    public static final class f extends Lambda implements Function1<String, C3350r9<String>> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ t70.j0 f62627b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public f(t70.j0 j0Var) {
            super(1);
            this.f62627b = j0Var;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            String callerId = (String) obj;
            Intrinsics.g(callerId, "callerId");
            I i5 = I.this;
            return new C3350r9(i5.f62597a, i5.f62604h, this.f62627b, i5.f62609m.a(callerId), 300L, N.f62949a, null);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.data.repository.AnalyticalBufferRepositoryImpl$removeAnalyticsForRequest$2", f = "AnalyticalBufferRepository.kt", l = {}, m = "invokeSuspend")
    public static final class g extends SuspendLambda implements Function2<t70.j0, Continuation<? super Integer>, Object> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ String f62629b;

        public static final class a extends Lambda implements Function1<C3350r9<JSONObject>, Integer> {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ String f62630a;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(String str) {
                super(1);
                this.f62630a = str;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                C3350r9 tracked = (C3350r9) obj;
                Intrinsics.g(tracked, "tracked");
                O o = new O(this.f62630a);
                ReentrantLock reentrantLock = tracked.f65623g;
                reentrantLock.lock();
                try {
                    Ref.IntRef intRef = new Ref.IntRef();
                    tracked.a(new C3317p9(intRef, o));
                    int i5 = intRef.f71861a;
                    reentrantLock.unlock();
                    return Integer.valueOf(i5);
                } catch (Throwable th2) {
                    reentrantLock.unlock();
                    throw th2;
                }
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public g(String str, Continuation<? super g> continuation) {
            super(2, continuation);
            this.f62629b = str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return I.this.new g(this.f62629b, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return I.this.new g(this.f62629b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            Q3<C3350r9<JSONObject>> q32 = I.this.o;
            a aVar = new a(this.f62629b);
            q32.getClass();
            ConcurrentHashMap<String, C3350r9<JSONObject>> concurrentHashMap = q32.f63211c;
            ArrayList arrayList = new ArrayList(concurrentHashMap.size());
            Iterator<Map.Entry<String, C3350r9<JSONObject>>> it = concurrentHashMap.entrySet().iterator();
            while (it.hasNext()) {
                arrayList.add(Integer.valueOf(((Number) aVar.invoke(it.next().getValue())).intValue()));
            }
            Iterator it2 = arrayList.iterator();
            int iIntValue = 0;
            while (it2.hasNext()) {
                iIntValue += ((Number) it2.next()).intValue();
            }
            return new Integer(iIntValue);
        }
    }

    public static final class h extends Lambda implements Function1<String, C3271me<JSONArray>> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ t70.j0 f62632b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public h(t70.j0 j0Var) {
            super(1);
            this.f62632b = j0Var;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            String callerId = (String) obj;
            Intrinsics.g(callerId, "callerId");
            I i5 = I.this;
            return new C3271me(i5.f62608l, this.f62632b, i5.f62609m.a(callerId));
        }
    }

    public static final class i extends Lambda implements Function1<String, C3271me<JSONObject>> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ t70.j0 f62634b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public i(t70.j0 j0Var) {
            super(1);
            this.f62634b = j0Var;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            String callerId = (String) obj;
            Intrinsics.g(callerId, "callerId");
            I i5 = I.this;
            return new C3271me(i5.f62606j, this.f62634b, i5.f62609m.a(callerId));
        }
    }

    public static final class j extends Lambda implements Function1<String, C3271me<String>> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ t70.j0 f62636b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public j(t70.j0 j0Var) {
            super(1);
            this.f62636b = j0Var;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            String callerId = (String) obj;
            Intrinsics.g(callerId, "callerId");
            I i5 = I.this;
            return new C3271me(i5.f62607k, this.f62636b, i5.f62609m.a(callerId));
        }
    }

    public static final class k extends Lambda implements Function1<Ke<JSONObject, Collection<? extends JSONObject>>, Unit> {

        /* renamed from: a, reason: collision with root package name */
        public static final k f62637a = new k();

        public k() {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            Ke it = (Ke) obj;
            Intrinsics.g(it, "it");
            it.e();
            return Unit.f71706a;
        }
    }

    public static final class l extends Lambda implements Function1<Ke<JSONObject, JSONObject>, Unit> {

        /* renamed from: a, reason: collision with root package name */
        public static final l f62638a = new l();

        public l() {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            Ke it = (Ke) obj;
            Intrinsics.g(it, "it");
            it.e();
            return Unit.f71706a;
        }
    }

    public static final class m extends Lambda implements Function1<Ke<JSONObject, Collection<? extends JSONObject>>, Unit> {

        /* renamed from: a, reason: collision with root package name */
        public static final m f62639a = new m();

        public m() {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            Ke it = (Ke) obj;
            Intrinsics.g(it, "it");
            it.e();
            return Unit.f71706a;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public I(@NotNull F4 contextDelegate, @NotNull C3282n8 remoteConfiguration, @NotNull C3190i0 analyticsSessionDataSource, @NotNull Function2<? super F4, ? super String, ? extends S> analyticsBufferDataSourceFactory, @NotNull K5 decider, @NotNull t70.j0 scope, @NotNull t70.c0 ioDispatchers) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(remoteConfiguration, "remoteConfiguration");
        Intrinsics.g(analyticsSessionDataSource, "analyticsSessionDataSource");
        Intrinsics.g(analyticsBufferDataSourceFactory, "analyticsBufferDataSourceFactory");
        Intrinsics.g(decider, "decider");
        Intrinsics.g(scope, "scope");
        Intrinsics.g(ioDispatchers, "ioDispatchers");
        this.f62597a = remoteConfiguration;
        this.f62598b = analyticsBufferDataSourceFactory;
        this.f62599c = decider;
        this.f62600d = ioDispatchers;
        this.f62601e = new AtomicBoolean(false);
        this.f62602f = "multi_api_clicks";
        this.f62603g = "multi_objects";
        this.f62604h = "multi_strings";
        this.f62605i = "multi_arrays";
        this.f62606j = "single_objects";
        this.f62607k = "single_strings";
        this.f62608l = "single_arrays";
        this.f62609m = new Q3<>(analyticsSessionDataSource, new b(contextDelegate));
        Q3<C3350r9<JSONObject>> q32 = new Q3<>(analyticsSessionDataSource, new c(scope));
        this.n = q32;
        Q3<C3350r9<JSONObject>> q33 = new Q3<>(analyticsSessionDataSource, new e(scope));
        this.o = q33;
        Q3<C3350r9<String>> q34 = new Q3<>(analyticsSessionDataSource, new f(scope));
        this.f62610p = q34;
        Q3<C3350r9<JSONArray>> q35 = new Q3<>(analyticsSessionDataSource, new d(scope));
        this.f62611q = q35;
        Q3<C3271me<JSONObject>> q36 = new Q3<>(analyticsSessionDataSource, new i(scope));
        this.f62612r = q36;
        Q3<C3271me<String>> q37 = new Q3<>(analyticsSessionDataSource, new j(scope));
        this.f62613s = q37;
        Q3<C3271me<JSONArray>> q38 = new Q3<>(analyticsSessionDataSource, new h(scope));
        this.f62614t = q38;
        this.f62615u = ul.b.Q(q33, q34, q35, q36, q37, q38);
        this.f62616v = ul.b.Q(q32, q33, q34, q35, q36, q37, q38);
    }

    @Override // io.branch.search.internal.H
    public final void a(@NotNull String sessionId, boolean z11) {
        Intrinsics.g(sessionId, "sessionId");
        this.n.b(sessionId).f65624h.clear();
        for (Q3<? extends Ke<? extends Object, ? extends Object>> q32 : this.f62615u) {
            if (!z11 || !Intrinsics.b(q32, this.o)) {
                q32.b(sessionId).clear();
            }
        }
        S sB = this.f62609m.b(sessionId);
        List<Q3<? extends Ke<? extends Object, ? extends Object>>> list = this.f62616v;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add((Ke) ((Q3) it.next()).b(sessionId));
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            arrayList2.add(((Ke) it2.next()).a());
        }
        sB.a(arrayList2);
    }

    @Override // io.branch.search.internal.H
    @NotNull
    public final C3350r9<JSONObject> b(@NotNull String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        return this.o.b(sessionId);
    }

    @Override // io.branch.search.internal.H
    public final C3350r9 c(String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        return this.n.b(sessionId);
    }

    @Override // io.branch.search.internal.H
    @NotNull
    public final ArrayList d(@NotNull String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        List<Q3<? extends Ke<? extends Object, ? extends Object>>> list = this.f62615u;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add((Ke) ((Q3) it.next()).b(sessionId));
        }
        return arrayList;
    }

    @Override // io.branch.search.internal.H
    public final boolean e(@NotNull String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        return this.f62610p.b(sessionId).f65624h.isEmpty() && this.f62611q.b(sessionId).f65624h.isEmpty();
    }

    @Override // io.branch.search.internal.H
    public final boolean f(@NotNull String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        return this.n.b(sessionId).f65624h.isEmpty();
    }

    @Override // io.branch.search.internal.H
    public final void b(@NotNull String sessionId, @Nullable String str, @NotNull Throwable e3) throws JSONException {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(e3, "e");
        a(sessionId, "NetworkRequests", a2.c.g(' ', str, e3.getClass().getSimpleName() + ": " + e3.getMessage()));
    }

    @Override // io.branch.search.internal.H
    public final boolean a(@NotNull String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        return this.f62612r.b(sessionId).f65200d.isEmpty() && this.f62613s.b(sessionId).f65200d.isEmpty() && this.f62614t.b(sessionId).f65200d.isEmpty();
    }

    @Override // io.branch.search.internal.H
    public final boolean a() {
        return this.f62601e.get();
    }

    @Override // io.branch.search.internal.H
    @Nullable
    public final Object a(@NotNull String str, @NotNull Continuation<? super Integer> continuation) {
        return t70.m0.y(this.f62600d, new g(str, null), continuation);
    }

    @Override // io.branch.search.internal.H
    public final void a(@NotNull String sessionId, @NotNull AnalyticsEvent event) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(event, "event");
        a(sessionId, event.f61883a, event.f61885c, false);
    }

    @Override // io.branch.search.internal.H
    public final void a(@NotNull String sessionId, @NotNull String apiName, @NotNull JSONObject clickJson) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(apiName, "apiName");
        Intrinsics.g(clickJson, "clickJson");
        this.n.b(sessionId).a(apiName, clickJson, k.f62637a);
    }

    @Override // io.branch.search.internal.H
    public final void a(@NotNull String sessionId, @NotNull String source, @NotNull Exception e3, @Nullable Map map) throws JSONException {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(source, "source");
        Intrinsics.g(e3, "e");
        a(sessionId, source, e3.getClass().getSimpleName() + ": " + e3.getMessage(), (Map<String, String>) map);
    }

    @Override // io.branch.search.internal.H
    public final void a(@NotNull String sessionId, @NotNull String source, @Nullable String str) throws JSONException {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(source, "source");
        a(sessionId, source, str, new HashMap());
    }

    @Override // io.branch.search.internal.H
    public final void a(@NotNull String sessionId, @NotNull String source, @Nullable String str, @Nullable Map<String, String> map) throws JSONException {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(source, "source");
        C3309p1.a("BRANCH_FAIL", source + " | " + str);
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.putOpt(Plan.AMP_PLAN_SOURCE, source);
            if (str != null) {
                String strSubstring = str.substring(0, (int) Math.min(str.length(), 1024.0d));
                Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
                jSONObject.putOpt(PglCryptUtils.KEY_MESSAGE, strSubstring);
            }
            jSONObject.put("timestamp", System.currentTimeMillis());
            if (map != null && !map.isEmpty()) {
                jSONObject.putOpt("extras", new JSONObject(map));
            }
        } catch (JSONException e3) {
            C3308p0.a(e3.getMessage());
        }
        a(sessionId, "failures", jSONObject, false);
    }

    @Override // io.branch.search.internal.H
    public final void a(@NotNull String sessionId, @NotNull Throwable e3, @NotNull String source) throws JSONException {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(source, "source");
        Intrinsics.g(e3, "e");
        a(sessionId, source, e3.getClass().getSimpleName() + ": " + e3.getMessage());
    }

    @Override // io.branch.search.internal.H
    public final void a(@NotNull String sessionId, @Nullable String str, @Nullable Throwable th2) throws JSONException {
        Intrinsics.g(sessionId, "sessionId");
        if (th2 != null) {
            b(sessionId, str, th2);
        } else {
            a(sessionId, "NetworkRequests", str);
        }
    }

    @Override // io.branch.search.internal.H
    public final void a(@NotNull String sessionId, @NotNull String key, @NotNull JSONObject value, boolean z11) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        if (this.f62601e.get()) {
            K5 k52 = this.f62599c;
            k52.getClass();
            if (k52.a() || k52.f62781a.a().f65359f0.contains(key)) {
                if (z11) {
                    C3271me<JSONObject> c3271meB = this.f62612r.b(sessionId);
                    l postStored = l.f62638a;
                    c3271meB.getClass();
                    Intrinsics.g(postStored, "postStored");
                    ReentrantLock reentrantLock = c3271meB.f65202f;
                    reentrantLock.lock();
                    try {
                        c3271meB.f65200d.put(key, value);
                        C3472yc c3472yc = c3271meB.f65198b;
                        C3254le c3254le = new C3254le(postStored, c3271meB);
                        c3472yc.getClass();
                        t70.m0.u(EmptyCoroutineContext.f71803a, new C3455xc(c3472yc, c3254le, null));
                        Unit unit = Unit.f71706a;
                        return;
                    } finally {
                        reentrantLock.unlock();
                    }
                }
                this.o.b(sessionId).a(key, value, m.f62639a);
            }
        }
    }

    @Override // io.branch.search.internal.H
    public final void a(boolean z11) {
        this.f62601e.set(z11);
    }
}
