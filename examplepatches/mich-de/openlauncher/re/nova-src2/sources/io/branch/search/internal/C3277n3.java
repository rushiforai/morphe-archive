package io.branch.search.internal;

import android.app.ActivityManager;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import io.branch.search.internal.AbstractC3196i6;
import io.branch.search.internal.AbstractC3393u1;
import io.branch.search.internal.C3171gf;
import io.branch.search.internal.C3463y3;
import io.branch.search.internal.EnumC3285nb;
import io.branch.search.internal.InterfaceC3167gb;
import io.branch.search.internal.shared.IBranchOnRawSQLEvents;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.ExceptionsKt;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;

/* renamed from: io.branch.search.internal.n3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3277n3 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f65303a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3446x3 f65304b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final P1 f65305c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final F2 f65306d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final Z1 f65307e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final C3454xb f65308f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final H3 f65309g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final C3269mc f65310h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final C3240l0 f65311i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final H f65312j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final Cif f65313k;

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public final C3366s8 f65314l;

    /* renamed from: m, reason: collision with root package name */
    @NotNull
    public final A9 f65315m;

    @NotNull
    public final ActivityManager n;

    public C3277n3(@NotNull F4 contextDelegate, @NotNull C3446x3 bundleUpdateSharedPrefLock, @NotNull P1 branchConfiguration, @NotNull G2 remoteConfigManager, @NotNull Z1 branchDeviceInfo, @NotNull C3454xb state, @NotNull H3 cacheSystem, @NotNull C3269mc ssml, @NotNull C3240l0 analyticsSessionRepository, @NotNull I analyticalBufferRepository, @NotNull Cif updateRemoteConfigUseCase, @NotNull C3366s8 networkInterfaceImpl, @NotNull B9 networkRepository) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(bundleUpdateSharedPrefLock, "bundleUpdateSharedPrefLock");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(branchDeviceInfo, "branchDeviceInfo");
        Intrinsics.g(state, "state");
        Intrinsics.g(cacheSystem, "cacheSystem");
        Intrinsics.g(ssml, "ssml");
        Intrinsics.g(analyticsSessionRepository, "analyticsSessionRepository");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(updateRemoteConfigUseCase, "updateRemoteConfigUseCase");
        Intrinsics.g(networkInterfaceImpl, "networkInterfaceImpl");
        Intrinsics.g(networkRepository, "networkRepository");
        this.f65303a = contextDelegate;
        this.f65304b = bundleUpdateSharedPrefLock;
        this.f65305c = branchConfiguration;
        this.f65306d = remoteConfigManager;
        this.f65307e = branchDeviceInfo;
        this.f65308f = state;
        this.f65309g = cacheSystem;
        this.f65310h = ssml;
        this.f65311i = analyticsSessionRepository;
        this.f65312j = analyticalBufferRepository;
        this.f65313k = updateRemoteConfigUseCase;
        this.f65314l = networkInterfaceImpl;
        this.f65315m = networkRepository;
        Object systemService = contextDelegate.b().getSystemService((Class<Object>) ActivityManager.class);
        Intrinsics.f(systemService, "contextDelegate.context.…ivityManager::class.java)");
        this.n = (ActivityManager) systemService;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0115 A[Catch: all -> 0x0119, TryCatch #3 {all -> 0x0119, blocks: (B:44:0x010e, B:46:0x0115, B:49:0x011b), top: B:73:0x010e, outer: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0132 A[Catch: Exception -> 0x0136, TryCatch #4 {Exception -> 0x0136, blocks: (B:52:0x012a, B:54:0x0132, B:57:0x0139, B:58:0x014a, B:60:0x0150, B:61:0x0160, B:51:0x0123, B:42:0x0101, B:66:0x016e, B:67:0x016f, B:44:0x010e, B:46:0x0115, B:49:0x011b, B:12:0x0064), top: B:75:0x0064, inners: #3, #6 }] */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0150 A[Catch: Exception -> 0x0136, LOOP:1: B:58:0x014a->B:60:0x0150, LOOP_END, TryCatch #4 {Exception -> 0x0136, blocks: (B:52:0x012a, B:54:0x0132, B:57:0x0139, B:58:0x014a, B:60:0x0150, B:61:0x0160, B:51:0x0123, B:42:0x0101, B:66:0x016e, B:67:0x016f, B:44:0x010e, B:46:0x0115, B:49:0x011b, B:12:0x0064), top: B:75:0x0064, inners: #3, #6 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(@NotNull AbstractC3196i6 bundleInput, @NotNull C3171gf.b callback) {
        Exception exc;
        long j11;
        C3277n3 c3277n3;
        boolean z11;
        Iterator it;
        Intrinsics.g(bundleInput, "bundleInput");
        Intrinsics.g(callback, "callback");
        EnumC3131e9 enumC3131e9 = EnumC3131e9.BundleUpdates;
        C3309p1.a(enumC3131e9, "startBundleUpdate");
        C3240l0 c3240l0 = this.f65311i;
        c3240l0.getClass();
        String sessionId = c3240l0.f64939d.b("io.branch.search");
        try {
            this.f65308f.a();
            C3309p1.a(enumC3131e9, "Executing bundle update: " + new Date());
            Iterator it2 = this.f65305c.D.iterator();
            while (it2.hasNext()) {
                try {
                    ((IBranchOnRawSQLEvents) it2.next()).onBundleUpdateInit();
                } catch (Exception e3) {
                    exc = e3;
                    C3296o5.a(sessionId, exc, "UpdateBundleRepository.bundle");
                    C3309p1.a(EnumC3131e9.BundleUpdates, "Failed to load bundle", exc);
                    return;
                }
            }
            ArrayList arrayList = new ArrayList();
            String[] strArr = {"error"};
            C3446x3 c3446x3 = this.f65304b;
            synchronized (c3446x3) {
                try {
                    j11 = c3446x3.f66255a.getLong("bundle_update_min_delay", 86400000L);
                } catch (Exception e11) {
                    e = e11;
                    exc = e;
                    C3296o5.a(sessionId, exc, "UpdateBundleRepository.bundle");
                    C3309p1.a(EnumC3131e9.BundleUpdates, "Failed to load bundle", exc);
                    return;
                }
            }
            Long[] lArr = {Long.valueOf(j11)};
            try {
                try {
                } catch (Exception e12) {
                    e = e12;
                    Exception exc2 = e;
                    C3296o5.a(sessionId, exc2, "UpdateBundleRepository.bundleInner");
                    C3309p1.a(EnumC3131e9.BundleUpdates, "Failed loading the bundle", exc2);
                    z11 = false;
                    try {
                        c3277n3.f65309g.a();
                        if (z11) {
                        }
                        C3309p1.c(EnumC3131e9.Init, "REBUILD QUERIES SUCCESS");
                    } catch (Throwable th2) {
                        C3309p1.a(EnumC3131e9.Init, "Unable to rebuild queries", th2);
                    }
                    if (c3277n3.n.isLowRamDevice()) {
                    }
                    callback.onBundleUpdateComplete(z11, lArr[0].longValue());
                    it = c3277n3.f65305c.D.iterator();
                    while (it.hasNext()) {
                    }
                    C3309p1.a(EnumC3131e9.BundleUpdates, "Finished updating bundle");
                }
            } catch (Exception e13) {
                e = e13;
                c3277n3 = this;
            }
            if (!(bundleInput instanceof AbstractC3196i6.b)) {
                c3277n3 = this;
                if (!(bundleInput instanceof AbstractC3196i6.a)) {
                    throw new NoWhenBranchMatchedException();
                }
                C3309p1.a("UpdateBundleRepository", "(bundle) load: got BranchSearchError. " + ((J2) ((AbstractC3196i6.a) bundleInput).f64738a).f62699b);
                z11 = false;
                c3277n3.f65309g.a();
                if (z11) {
                }
                C3309p1.c(EnumC3131e9.Init, "REBUILD QUERIES SUCCESS");
                if (c3277n3.n.isLowRamDevice()) {
                }
                callback.onBundleUpdateComplete(z11, lArr[0].longValue());
                it = c3277n3.f65305c.D.iterator();
                while (it.hasNext()) {
                }
                C3309p1.a(EnumC3131e9.BundleUpdates, "Finished updating bundle");
            }
            InputStream bundleStream = (InputStream) ((AbstractC3196i6.b) bundleInput).f64739a;
            C3463y3.a aVar = C3463y3.Companion;
            c3277n3 = this;
            C3243l3 c3243l3 = new C3243l3(c3277n3, sessionId, arrayList, strArr, lArr);
            aVar.getClass();
            Intrinsics.g(sessionId, "sessionId");
            Intrinsics.g(bundleStream, "bundleStream");
            try {
                try {
                    C3463y3.a.a(bundleStream, c3243l3);
                    z11 = true;
                } catch (JSONException e14) {
                    C3296o5.a(sessionId, e14, "BRANCH_BundlerLoader.load");
                    C3309p1.a(EnumC3131e9.BundleUpdates, "Failed to load from stream", e14);
                    z11 = false;
                    a(sessionId, strArr[0], arrayList);
                    c3277n3.f65309g.a();
                    if (z11) {
                    }
                    C3309p1.c(EnumC3131e9.Init, "REBUILD QUERIES SUCCESS");
                    if (c3277n3.n.isLowRamDevice()) {
                    }
                    callback.onBundleUpdateComplete(z11, lArr[0].longValue());
                    it = c3277n3.f65305c.D.iterator();
                    while (it.hasNext()) {
                    }
                    C3309p1.a(EnumC3131e9.BundleUpdates, "Finished updating bundle");
                }
            } catch (IOException e15) {
                C3296o5.a(sessionId, e15, "BRANCH_BundlerLoader.load");
                C3309p1.a(EnumC3131e9.BundleUpdates, "Failed to load from stream", e15);
                z11 = false;
                a(sessionId, strArr[0], arrayList);
                c3277n3.f65309g.a();
                if (z11) {
                }
                C3309p1.c(EnumC3131e9.Init, "REBUILD QUERIES SUCCESS");
                if (c3277n3.n.isLowRamDevice()) {
                }
                callback.onBundleUpdateComplete(z11, lArr[0].longValue());
                it = c3277n3.f65305c.D.iterator();
                while (it.hasNext()) {
                }
                C3309p1.a(EnumC3131e9.BundleUpdates, "Finished updating bundle");
            } catch (IllegalStateException e16) {
                C3296o5.a(sessionId, e16, "BRANCH_BundlerLoader.load");
                C3309p1.a(EnumC3131e9.BundleUpdates, "Failed to load from stream", e16);
                z11 = false;
                a(sessionId, strArr[0], arrayList);
                c3277n3.f65309g.a();
                if (z11) {
                }
                C3309p1.c(EnumC3131e9.Init, "REBUILD QUERIES SUCCESS");
                if (c3277n3.n.isLowRamDevice()) {
                }
                callback.onBundleUpdateComplete(z11, lArr[0].longValue());
                it = c3277n3.f65305c.D.iterator();
                while (it.hasNext()) {
                }
                C3309p1.a(EnumC3131e9.BundleUpdates, "Finished updating bundle");
            }
            a(sessionId, strArr[0], arrayList);
            c3277n3.f65309g.a();
            if (z11) {
                a(sessionId);
            }
            C3309p1.c(EnumC3131e9.Init, "REBUILD QUERIES SUCCESS");
            if (c3277n3.n.isLowRamDevice()) {
                SQLiteDatabase.releaseMemory();
            }
            callback.onBundleUpdateComplete(z11, lArr[0].longValue());
            it = c3277n3.f65305c.D.iterator();
            while (it.hasNext()) {
                ((IBranchOnRawSQLEvents) it.next()).onBundleUpdateComplete(z11, lArr[0].longValue());
            }
            C3309p1.a(EnumC3131e9.BundleUpdates, "Finished updating bundle");
        } catch (Exception e17) {
            e = e17;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0182 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x017a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(String sessionId, C3159g3 action) {
        Throwable th2;
        String str;
        InterfaceC3365s7 interfaceC3365s7Q;
        Exception e3;
        C3454xb c3454xb = this.f65308f;
        c3454xb.getClass();
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(action, "action");
        String str2 = action.f64552b;
        String str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (str2 == null) {
            str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        InterfaceC3365s7 interfaceC3365s7 = null;
        exc = null;
        exc = null;
        Exception exc = null;
        C3352rb c3352rb = str2.equals(c3454xb.f66278b.f65634d) ? c3454xb.f66278b : null;
        if (c3352rb == null) {
            String str4 = action.f64552b;
            if (str4 != null) {
                str3 = str4;
            }
            throw new IllegalStateException("Attempting to update unknown DB: ".concat(str3));
        }
        C3195i5 c3195i5A = c3454xb.f66285i.a();
        Ib ib2 = new Ib(action);
        c3352rb.f65632b.lock();
        try {
            interfaceC3365s7Q = c3352rb.f65631a.q();
            try {
                ((C3178h5) interfaceC3365s7Q).f64647a.beginTransactionNonExclusive();
                ib2.a(interfaceC3365s7Q);
                ((C3178h5) interfaceC3365s7Q).f64647a.setTransactionSuccessful();
                try {
                    try {
                        if (((C3178h5) interfaceC3365s7Q).f64647a.isOpen() && ((C3178h5) interfaceC3365s7Q).f64647a.inTransaction()) {
                            ((C3178h5) interfaceC3365s7Q).f64647a.endTransaction();
                        }
                    } catch (Throwable th3) {
                        c3352rb.f65632b.unlock();
                        throw th3;
                    }
                } catch (Exception e11) {
                    e3 = e11;
                    C3296o5.a(sessionId, e3, "BRANCH_RawSQLiteDB.update.finally");
                }
            } catch (Exception e12) {
                e = e12;
                exc = e;
                try {
                    C3296o5.a(sessionId, exc, "BRANCH_RawSQLiteDB.update");
                    if (interfaceC3365s7Q != null) {
                        try {
                            try {
                                if (((C3178h5) interfaceC3365s7Q).f64647a.isOpen() && ((C3178h5) interfaceC3365s7Q).f64647a.inTransaction()) {
                                    ((C3178h5) interfaceC3365s7Q).f64647a.endTransaction();
                                }
                                c3352rb.f65632b.unlock();
                                e3 = exc;
                            } catch (Exception e13) {
                                ExceptionsKt.a(e13, exc);
                                C3296o5.a(new F6(sessionId, "BRANCH_RawSQLiteDB.update.finally", null, e13, null));
                                c3352rb.f65632b.unlock();
                                e3 = e13;
                            }
                        } finally {
                            c3352rb.f65632b.unlock();
                        }
                    } else {
                        c3352rb.f65632b.unlock();
                        e3 = exc;
                    }
                    if (e3 == null) {
                    }
                } catch (Throwable th4) {
                    str = sessionId;
                    th2 = th4;
                    interfaceC3365s7 = interfaceC3365s7Q;
                    try {
                        if (interfaceC3365s7 != null) {
                            try {
                                if (((C3178h5) interfaceC3365s7).f64647a.isOpen() && ((C3178h5) interfaceC3365s7).f64647a.inTransaction()) {
                                    ((C3178h5) interfaceC3365s7).f64647a.endTransaction();
                                }
                            } catch (Exception e14) {
                                C3296o5.a(str, e14, "BRANCH_RawSQLiteDB.update.finally");
                                c3352rb.f65632b.unlock();
                                throw th2;
                            }
                        }
                        c3352rb.f65632b.unlock();
                        throw th2;
                    } catch (Throwable th5) {
                        c3352rb.f65632b.unlock();
                        throw th5;
                    }
                }
            } catch (Throwable th6) {
                th2 = th6;
                str = sessionId;
                interfaceC3365s7 = interfaceC3365s7Q;
                if (interfaceC3365s7 != null) {
                }
                c3352rb.f65632b.unlock();
                throw th2;
            }
        } catch (Exception e15) {
            e = e15;
            interfaceC3365s7Q = null;
        } catch (Throwable th7) {
            th2 = th7;
            str = sessionId;
            if (interfaceC3365s7 != null) {
            }
            c3352rb.f65632b.unlock();
            throw th2;
        }
        c3352rb.f65632b.unlock();
        e3 = exc;
        if (e3 == null) {
            throw e3;
        }
        Map map = action.f64555e;
        Map map2 = b70.h.f17594a;
        if (map == null) {
            map = map2;
        }
        ArrayList arrayList = new ArrayList(map.size());
        for (Map.Entry<String, Map<String, Object>> entry : map.entrySet()) {
            EnumC3285nb.a aVar = EnumC3285nb.Companion;
            String key = entry.getKey();
            aVar.getClass();
            arrayList.add(EnumC3285nb.a.a(key));
        }
        LinkedHashSet linkedHashSetB0 = b70.n.b0(b70.g.N1(arrayList), c3195i5A.f64736b);
        Map map3 = action.f64556f;
        if (map3 != null) {
            map2 = map3;
        }
        ArrayList arrayList2 = new ArrayList(map2.size());
        for (Map.Entry<String, Map<String, Object>> entry2 : map2.entrySet()) {
            EnumC3285nb.a aVar2 = EnumC3285nb.Companion;
            String key2 = entry2.getKey();
            aVar2.getClass();
            arrayList2.add(EnumC3285nb.a.a(key2));
        }
        LinkedHashSet linkedHashSetB02 = b70.n.b0(b70.g.N1(arrayList2), c3195i5A.f64737c);
        C3211j5 c3211j5 = c3454xb.f66285i;
        String str5 = c3195i5A.f64735a;
        if (str5 == null) {
            str5 = c3454xb.f66278b.f65634d;
        }
        c3211j5.a(new C3195i5(str5, linkedHashSetB0, linkedHashSetB02));
    }

    public final void a(String str, String str2, ArrayList arrayList) {
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            String str3 = (String) it.next();
            HashMap map = new HashMap();
            map.put("request_id", str2);
            H h5 = this.f65312j;
            StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
            h5.a(str, "UpdateBundleRepository.processUpdates", String.format(str3, Arrays.copyOf(new Object[]{str2}, 1)), map);
        }
    }

    public final void a(String str, C3159g3 c3159g3) {
        String str2;
        Map map = c3159g3.f64558h;
        if (map == null) {
            map = b70.h.f17594a;
        }
        for (Map.Entry entry : map.entrySet()) {
            String str3 = (String) entry.getKey();
            C3150fb c3150fb = (C3150fb) entry.getValue();
            String str4 = c3150fb.f64488a;
            if (str4 != null && (str2 = c3150fb.f64489b) != null) {
                C3454xb c3454xb = this.f65308f;
                AbstractC3393u1.b bVar = new AbstractC3393u1.b(this.f65303a, this.f65305c, this.f65306d.a(), this.f65307e, this.f65315m);
                InterfaceC3167gb.Companion.getClass();
                String str5 = str;
                List list = (List) c3454xb.a(str5, str4, str2, bVar, InterfaceC3167gb.a.f64590b, new N1());
                D7 d7A = D7.Companion.a(this.f65303a, this.f65314l);
                H2 h2ValueOf = H2.valueOf(str3);
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    d7A.a(new C3074b3((String) it.next(), h2ValueOf));
                }
                str = str5;
            }
        }
    }

    public final void a(String sessionId) {
        C3454xb c3454xb = this.f65308f;
        c3454xb.getClass();
        Intrinsics.g(sessionId, "sessionId");
        C3184hb c3184hb = c3454xb.f66286j;
        c3184hb.getClass();
        for (EnumC3285nb enumC3285nb : c3184hb.f64659a) {
            c3184hb.f64661c.put(enumC3285nb, c3184hb.a(sessionId, enumC3285nb, new N1()));
        }
        ConcurrentHashMap<EnumC3285nb, K7> concurrentHashMap = c3184hb.f64661c;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry<EnumC3285nb, K7> entry : concurrentHashMap.entrySet()) {
            if (!c3184hb.f64659a.contains(entry.getKey())) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        Iterator it = linkedHashMap.entrySet().iterator();
        while (it.hasNext()) {
            c3184hb.f64661c.remove(((Map.Entry) it.next()).getKey());
        }
        c3184hb.a();
    }
}
