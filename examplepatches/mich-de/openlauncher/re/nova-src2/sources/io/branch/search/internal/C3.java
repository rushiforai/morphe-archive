package io.branch.search.internal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.sequences.TransformingSequence;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class C3 {

    /* renamed from: a, reason: collision with root package name */
    public final long f62189a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Function0<Long> f62190b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final t70.j0 f62191c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final AtomicLong f62192d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap f62193e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap<Object, Long> f62194f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap<Object, Long> f62195g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap<Object, Long> f62196h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final AtomicLong f62197i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final AtomicBoolean f62198j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final I3 f62199k;

    public /* synthetic */ class a extends FunctionReferenceImpl implements Function0<Unit> {
        public a(Object obj) {
            super(0, 0, C3.class, obj, "gcCache", "gcCache()V");
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            ((C3) this.receiver).a();
            return Unit.f71706a;
        }
    }

    public static final class b extends Lambda implements Function1<String, Object> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ Object f62200a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(Object obj) {
            super(1);
            this.f62200a = obj;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            return ((JSONObject) this.f62200a).get((String) obj);
        }
    }

    public static final class c extends Lambda implements Function0<String> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ long f62202b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(long j11) {
            super(0);
            this.f62202b = j11;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            StringBuilder sb2 = new StringBuilder("Memory released : ");
            C3 c32 = C3.this;
            long j11 = this.f62202b;
            c32.getClass();
            sb2.append(C3.a(j11));
            return sb2.toString();
        }
    }

    public C3(long j11, @NotNull Function0<Long> getCurrentTime, @NotNull t70.j0 coroutineScope) {
        Intrinsics.g(getCurrentTime, "getCurrentTime");
        Intrinsics.g(coroutineScope, "coroutineScope");
        this.f62189a = j11;
        this.f62190b = getCurrentTime;
        this.f62191c = coroutineScope;
        this.f62192d = new AtomicLong(-1L);
        this.f62193e = new ConcurrentHashMap();
        this.f62194f = new ConcurrentHashMap<>();
        this.f62195g = new ConcurrentHashMap<>();
        this.f62196h = new ConcurrentHashMap<>();
        this.f62197i = new AtomicLong(0L);
        this.f62198j = new AtomicBoolean(false);
        this.f62199k = new I3(coroutineScope, getCurrentTime, new a(this));
    }

    public static long a(Object obj) throws JSONException {
        int length;
        if (obj instanceof String) {
            length = ((String) obj).length();
        } else {
            long jA = 0;
            if (obj instanceof Map) {
                long jA2 = 0;
                for (Map.Entry entry : ((Map) obj).entrySet()) {
                    Object key = entry.getKey();
                    long jA3 = key != null ? a(key) : 0L;
                    Object value = entry.getValue();
                    jA2 += jA3 + (value != null ? a(value) : 0L);
                }
                return jA2;
            }
            if (obj instanceof Collection) {
                Iterator it = ((Iterable) obj).iterator();
                long jA4 = 0;
                while (it.hasNext()) {
                    Object next = it.next();
                    jA4 += next != null ? a(next) : 0L;
                }
                return jA4;
            }
            if ((obj instanceof Number) || (obj instanceof Boolean)) {
                return 4L;
            }
            if (!(obj instanceof P5)) {
                if (obj instanceof JSONObject) {
                    Iterator<String> itKeys = ((JSONObject) obj).keys();
                    Intrinsics.f(itKeys, "value.keys()");
                    TransformingSequence.AnonymousClass1 anonymousClass1 = new TransformingSequence.AnonymousClass1();
                    while (anonymousClass1.f71993a.hasNext()) {
                        jA += a(anonymousClass1.next());
                    }
                    return jA;
                }
                if (!(obj instanceof JSONArray)) {
                    throw new RuntimeException("Unknow type of : " + obj.getClass());
                }
                JSONArray jSONArray = (JSONArray) obj;
                int length2 = jSONArray.length();
                for (int i5 = 0; i5 < length2; i5++) {
                    Object obj2 = jSONArray.get(i5);
                    Intrinsics.f(obj2, "value[i]");
                    jA += a(obj2);
                }
                return jA;
            }
            length = obj.toString().length();
        }
        return length;
    }

    public final long b(Object obj) {
        this.f62193e.remove(obj);
        Long lRemove = this.f62194f.remove(obj);
        if (lRemove == null) {
            lRemove = 0L;
        }
        long jLongValue = lRemove.longValue();
        this.f62197i.addAndGet(-jLongValue);
        this.f62195g.remove(obj);
        this.f62196h.remove(obj);
        this.f62194f.remove(obj);
        C3309p1.c(EnumC3131e9.Cache, "Free cached " + jLongValue + " bytes");
        return jLongValue;
    }

    public final void a() {
        if (this.f62198j.compareAndSet(false, true)) {
            C3309p1.c(EnumC3131e9.Cache, "GC Clearing cache");
            long jLongValue = ((Number) this.f62190b.invoke()).longValue();
            Set<Map.Entry<Object, Long>> setEntrySet = this.f62195g.entrySet();
            Intrinsics.f(setEntrySet, "lastUsageTime\n            .entries");
            ArrayList arrayList = new ArrayList();
            for (Object obj : setEntrySet) {
                Map.Entry entry = (Map.Entry) obj;
                long jLongValue2 = ((Number) entry.getValue()).longValue();
                Object key = entry.getKey();
                Intrinsics.f(key, "it.key");
                Long lValueOf = this.f62196h.get(key);
                if (lValueOf == null) {
                    lValueOf = Long.valueOf(this.f62189a);
                }
                if (lValueOf.longValue() + jLongValue2 < jLongValue) {
                    arrayList.add(obj);
                }
            }
            ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                arrayList2.add(((Map.Entry) it.next()).getKey());
            }
            Iterator it2 = arrayList2.iterator();
            long jB = 0;
            long jB2 = 0;
            while (it2.hasNext()) {
                jB2 += b(it2.next());
            }
            long j11 = this.f62192d.get();
            if (j11 >= 0 && this.f62197i.get() > j11) {
                Set<Map.Entry<Object, Long>> setEntrySet2 = this.f62195g.entrySet();
                Intrinsics.f(setEntrySet2, "lastUsageTime\n                .entries");
                List listD1 = b70.g.D1(new D3(), setEntrySet2);
                ArrayList arrayList3 = new ArrayList(b70.c.u0(listD1, 10));
                Iterator it3 = listD1.iterator();
                while (it3.hasNext()) {
                    arrayList3.add(((Map.Entry) it3.next()).getKey());
                }
                Iterator it4 = arrayList3.iterator();
                while (it4.hasNext() && this.f62197i.get() > j11) {
                    Object next = it4.next();
                    Intrinsics.f(next, "iter.next()");
                    jB += b(next);
                }
            }
            C3309p1.a(EnumC3131e9.Cache, new c(jB2 + jB));
            this.f62198j.set(false);
        }
    }

    @NotNull
    public static String a(long j11) {
        if (j11 < 1024) {
            return com.google.android.gms.internal.measurement.k2.i(j11, " bytes");
        }
        int i5 = 0;
        double d5 = 1.0d;
        if (j11 < 512000) {
            StringBuilder sb2 = new StringBuilder();
            double d11 = j11 / 1024.0d;
            while (i5 < 2) {
                d5 *= 10;
                i5++;
            }
            sb2.append(Math.rint(d11 * d5) / d5);
            sb2.append(" kb");
            return sb2.toString();
        }
        StringBuilder sb3 = new StringBuilder();
        double d12 = j11 / 1048576.0d;
        while (i5 < 2) {
            d5 *= 10;
            i5++;
        }
        sb3.append(Math.rint(d12 * d5) / d5);
        sb3.append(" mb");
        return sb3.toString();
    }
}
