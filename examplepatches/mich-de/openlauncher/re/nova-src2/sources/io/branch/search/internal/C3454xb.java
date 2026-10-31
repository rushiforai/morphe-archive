package io.branch.search.internal;

import android.app.ActivityManager;
import android.content.Context;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import io.branch.requery.android.database.sqlite.SQLiteGlobal;
import io.branch.search.internal.AbstractC3393u1;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.Y2;
import io.branch.search.internal.Z6;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.collections.EmptyList;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.xb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3454xb {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f66277a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3352rb f66278b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Be f66279c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final P1 f66280d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final C3282n8 f66281e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final Z1 f66282f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final A9 f66283g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final Context f66284h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final C3211j5 f66285i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final C3184hb f66286j;

    /* renamed from: io.branch.search.internal.xb$a */
    public static final class a {
        @JvmStatic
        @NotNull
        public static C3454xb a(@NotNull F4 contextDelegate, @NotNull C3352rb rawSQLiteDB, @NotNull Z6.a storageMonitor, @NotNull P1 branchConfiguration, @NotNull C3282n8 remoteConfiguration, @NotNull Z1 branchDeviceInfo, @NotNull B9 networkRepository) {
            Intrinsics.g(contextDelegate, "contextDelegate");
            Intrinsics.g(rawSQLiteDB, "rawSQLiteDB");
            Intrinsics.g(storageMonitor, "storageMonitor");
            Intrinsics.g(branchConfiguration, "branchConfiguration");
            Intrinsics.g(remoteConfiguration, "remoteConfiguration");
            Intrinsics.g(branchDeviceInfo, "branchDeviceInfo");
            Intrinsics.g(networkRepository, "networkRepository");
            return new C3454xb(contextDelegate, rawSQLiteDB, storageMonitor, branchConfiguration, remoteConfiguration, branchDeviceInfo, networkRepository, new HashSet(ul.b.Q(EnumC3285nb.AdsLocalSearch, EnumC3285nb.AppStore, EnumC3285nb.AdsZeroState)), null);
        }
    }

    @JvmOverloads
    public C3454xb(@NotNull F4 contextDelegate, @NotNull C3352rb rawSQLiteDB, @NotNull Z6.a storageMonitor, @NotNull P1 branchConfiguration, @NotNull C3282n8 remoteConfiguration, @NotNull Z1 branchDeviceInfo, @NotNull B9 networkRepository, @NotNull Set cacheQueries, @Nullable C3184hb c3184hb) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(rawSQLiteDB, "rawSQLiteDB");
        Intrinsics.g(storageMonitor, "storageMonitor");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(remoteConfiguration, "remoteConfiguration");
        Intrinsics.g(branchDeviceInfo, "branchDeviceInfo");
        Intrinsics.g(networkRepository, "networkRepository");
        Intrinsics.g(cacheQueries, "cacheQueries");
        this.f66277a = contextDelegate;
        this.f66278b = rawSQLiteDB;
        this.f66279c = storageMonitor;
        this.f66280d = branchConfiguration;
        this.f66281e = remoteConfiguration;
        this.f66282f = branchDeviceInfo;
        this.f66283g = networkRepository;
        Context contextB = contextDelegate.b();
        this.f66284h = contextB;
        a(contextB);
        Gson gsonCreate = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
        Intrinsics.f(gsonCreate, "GsonBuilder()\n          …n()\n            .create()");
        Y2.a aVar = Y2.Companion;
        Y2.b bVar = Y2.b.RawDb;
        aVar.getClass();
        this.f66285i = new C3211j5(gsonCreate, Y2.a.a(contextB, bVar));
        this.f66286j = c3184hb == null ? new C3184hb(cacheQueries, new C3471yb(this)) : c3184hb;
    }

    public final void a() {
        C3352rb c3352rb;
        try {
            C3184hb c3184hb = this.f66286j;
            for (EnumC3285nb enumC3285nb : c3184hb.f64659a) {
                K7 k72 = c3184hb.f64661c.get(enumC3285nb);
                if (k72 != null && (c3352rb = k72.f62785a) != null) {
                    c3352rb.a(EmptyList.f71733a);
                }
                c3184hb.f64661c.remove(enumC3285nb);
            }
        } catch (Throwable th2) {
            C3296o5.a aVar = C3296o5.f65426a;
            C3296o5.a(new F6("RawSqliteState.clearPrecompute", "Unable to clear precompute", null, th2, null));
        }
    }

    @JvmOverloads
    public final <T, R> R a(@NotNull String sessionId, @NotNull EnumC3285nb queryType, @NotNull AbstractC3393u1 binding, @NotNull InterfaceC3167gb<T, R> accum, @NotNull N1 cancellationSignal, boolean z11) {
        boolean z12;
        K7 k7PutIfAbsent;
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(queryType, "queryType");
        Intrinsics.g(binding, "binding");
        Intrinsics.g(accum, "accum");
        Intrinsics.g(cancellationSignal, "cancellationSignal");
        C3309p1 logger = C3309p1.f65465a;
        String message = "Query " + queryType.name();
        EnumC3131e9 tag = EnumC3131e9.Latency;
        Intrinsics.g(tag, "tag");
        Intrinsics.g(logger, "logger");
        long jCurrentTimeMillis = System.currentTimeMillis();
        C3446x3 c3446x3A = C3446x3.Companion.a(this.f66284h);
        synchronized (c3446x3A) {
            z12 = c3446x3A.f66255a.getBoolean("KEY_REMOTE_BUNDLE", false);
        }
        Context context = this.f66284h;
        Intrinsics.g(context, "context");
        if (z12) {
            C3184hb c3184hb = this.f66286j;
            c3184hb.getClass();
            ConcurrentHashMap<EnumC3285nb, K7> concurrentHashMap = c3184hb.f64661c;
            K7 k7A = concurrentHashMap.get(queryType);
            if (k7A == null && (k7PutIfAbsent = concurrentHashMap.putIfAbsent(queryType, (k7A = c3184hb.a(sessionId, queryType, cancellationSignal)))) != null) {
                k7A = k7PutIfAbsent;
            }
            Intrinsics.f(k7A, "cache.getOrPut(queryType…ellationSignal)\n        }");
            R r11 = (R) k7A.a(sessionId, binding, accum, cancellationSignal, z11);
            Intrinsics.g(message, "message");
            long jCurrentTimeMillis2 = System.currentTimeMillis();
            StringBuilder sbK = com.google.android.gms.internal.measurement.k2.k(message, " took ");
            sbK.append(jCurrentTimeMillis2 - jCurrentTimeMillis);
            sbK.append("ms");
            C3309p1.c(tag, sbK.toString());
            return r11;
        }
        throw new IllegalStateException("Db not initialized. Remote bundle not processed!");
    }

    public final Object a(@NotNull String sessionId, @NotNull String query, @NotNull String params, @NotNull AbstractC3393u1.c binder, @NotNull InterfaceC3167gb accum, @NotNull N1 cancellationSignal) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(query, "query");
        Intrinsics.g(params, "params");
        Intrinsics.g(binder, "binder");
        Intrinsics.g(accum, "accum");
        Intrinsics.g(cancellationSignal, "cancellationSignal");
        return this.f66278b.a(sessionId, query, binder.b(params), accum, cancellationSignal);
    }

    @JvmOverloads
    public final Object a(@NotNull String sessionId, @NotNull String dbName, @NotNull String mainQuery, @NotNull String params, @NotNull r binder, @NotNull InterfaceC3167gb accum, @NotNull N1 cancellationSignal, @Nullable Jd jd2, boolean z11) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(dbName, "dbName");
        Intrinsics.g(mainQuery, "mainQuery");
        Intrinsics.g(params, "params");
        Intrinsics.g(binder, "binder");
        Intrinsics.g(accum, "accum");
        Intrinsics.g(cancellationSignal, "cancellationSignal");
        K7 k72 = new K7(this.f66278b, mainQuery, params, jd2);
        C3309p1.a("perform query on db: ".concat(dbName));
        return k72.a(sessionId, binder, accum, cancellationSignal, z11);
    }

    public final C3352rb a(C3352rb c3352rb) {
        String str;
        String str2;
        if (c3352rb != null && (str = c3352rb.f65634d) != null) {
            C3184hb c3184hb = this.f66286j;
            c3184hb.getClass();
            Set<EnumC3285nb> set = c3184hb.f64659a;
            try {
                for (EnumC3285nb enumC3285nb : set) {
                    c3184hb.f64661c.put(enumC3285nb, c3184hb.a("io.branch.search", enumC3285nb, new N1()));
                }
                str2 = str;
            } catch (Exception e3) {
                C3309p1.a(EnumC3131e9.Init, "Unable to initialize statements for " + str + " - " + set, e3);
                str2 = null;
            }
            c3184hb.a();
            if (Intrinsics.b(str2, str)) {
                return c3352rb;
            }
        }
        return null;
    }

    public static void a(Context context) {
        SQLiteGlobal.f61800c = ((ActivityManager) context.getSystemService(ActivityManager.class)).isLowRamDevice();
    }
}
