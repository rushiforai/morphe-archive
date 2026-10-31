package com.vungle.ads.internal.signals;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import com.vungle.ads.internal.ConfigManager;
import com.vungle.ads.internal.model.s3;
import com.vungle.ads.internal.persistence.FilePreferences;
import com.vungle.ads.internal.util.PathProvider;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializersKt;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonKt;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final Context f47503a;

    /* renamed from: b, reason: collision with root package name */
    public final Json f47504b;

    /* renamed from: c, reason: collision with root package name */
    public long f47505c;

    /* renamed from: d, reason: collision with root package name */
    public long f47506d;

    /* renamed from: e, reason: collision with root package name */
    public long f47507e;

    /* renamed from: f, reason: collision with root package name */
    public int f47508f;

    /* renamed from: g, reason: collision with root package name */
    public long f47509g;

    /* renamed from: h, reason: collision with root package name */
    public c f47510h;

    /* renamed from: i, reason: collision with root package name */
    public ConcurrentHashMap f47511i;

    /* renamed from: j, reason: collision with root package name */
    public final Lazy f47512j;

    /* renamed from: k, reason: collision with root package name */
    public com.vungle.ads.internal.session.b f47513k;

    public j(Context context) {
        Intrinsics.g(context, "context");
        this.f47503a = context;
        this.f47504b = JsonKt.Json$default(null, e.f47498a, 1, null);
        this.f47506d = System.currentTimeMillis();
        this.f47508f = -1;
        this.f47511i = new ConcurrentHashMap();
        LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71679a;
        this.f47512j = LazyKt.b(lazyThreadSafetyMode, new g(context));
        e();
        this.f47509g = c().a("vungle_signal_session_creation_time", -1L);
        f();
        this.f47510h = new c(this.f47508f);
        com.vungle.ads.internal.session.b bVar = new com.vungle.ads.internal.session.b(context, this.f47510h.a(), a(LazyKt.b(lazyThreadSafetyMode, new h(context))), b(LazyKt.b(lazyThreadSafetyMode, new i(context))));
        this.f47513k = bVar;
        this.f47510h.a(bVar.b());
        boolean z11 = u.f47714a;
        t.a("SignalManager", new d(this));
        try {
            this.f47510h.a(1 ^ (com.vungle.ads.internal.platform.e.a() ? 1 : 0));
            this.f47510h.e(com.vungle.ads.internal.platform.e.f(context) ? 1 : 0);
            this.f47510h.c(com.vungle.ads.internal.platform.e.d(context) ? 1 : 0);
            this.f47510h.d(com.vungle.ads.internal.platform.e.c(context));
            this.f47510h.b(com.vungle.ads.internal.platform.e.e(context) ? 1 : 0);
        } catch (Exception e3) {
            boolean z12 = u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Failed to collect device signals: ");
            sbA.append(e3.getLocalizedMessage());
            t.b("SignalManager", sbA.toString());
        }
    }

    public final c b() {
        return this.f47510h;
    }

    public final FilePreferences c() {
        return (FilePreferences) this.f47512j.getValue();
    }

    public final String d() {
        return this.f47510h.f47486b;
    }

    public final void e() {
        com.vungle.ads.internal.util.d dVar = com.vungle.ads.internal.util.d.f47677f;
        com.vungle.ads.internal.util.a.a(new f(this));
    }

    public final void f() {
        if (this.f47508f == -1) {
            this.f47508f = c().a("vungle_signal_session_count", 0);
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        long j11 = this.f47509g;
        long j12 = jCurrentTimeMillis - j11;
        if (j11 < 0 || j12 >= 86400000) {
            this.f47508f = 1;
            c().b("vungle_signal_session_creation_time", jCurrentTimeMillis);
            this.f47509g = jCurrentTimeMillis;
        } else {
            this.f47508f++;
        }
        c().b("vungle_signal_session_count", this.f47508f);
        c().b();
    }

    public static final com.vungle.ads.internal.executor.a a(Lazy lazy) {
        return (com.vungle.ads.internal.executor.a) lazy.getValue();
    }

    public static final PathProvider b(Lazy lazy) {
        return (PathProvider) lazy.getValue();
    }

    public final synchronized m a(String placementId) {
        long jCurrentTimeMillis;
        Long l9;
        try {
            Intrinsics.g(placementId, "placementId");
            jCurrentTimeMillis = System.currentTimeMillis();
            l9 = this.f47511i.containsKey(placementId) ? (Long) this.f47511i.get(placementId) : null;
            this.f47511i.put(placementId, Long.valueOf(jCurrentTimeMillis));
        } catch (Throwable th2) {
            throw th2;
        }
        return new m(l9, jCurrentTimeMillis);
    }

    public final void b(s3 unclosedAd) {
        Intrinsics.g(unclosedAd, "unclosedAd");
        ConfigManager.INSTANCE.getClass();
        if (ConfigManager.t()) {
            return;
        }
        this.f47513k.b(unclosedAd);
    }

    public final void b(String str) {
        if (str == null || str.length() == 0 || this.f47510h.f47488d.isEmpty()) {
            return;
        }
        ((m) this.f47510h.f47488d.get(0)).f47518c = str;
    }

    public final void a(s3 unclosedAd) {
        Intrinsics.g(unclosedAd, "unclosedAd");
        ConfigManager.INSTANCE.getClass();
        if (ConfigManager.t()) {
            return;
        }
        this.f47513k.a(unclosedAd);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0046 A[PHI: r2
      0x0046: PHI (r2v1 int) = (r2v0 int), (r2v2 int) binds: [B:19:0x0050, B:14:0x0044] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0048  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(Context context, m signaledAd) {
        int i5;
        Configuration configuration;
        Intrinsics.g(signaledAd, "signaledAd");
        this.f47510h.b().clear();
        this.f47510h.b().add(signaledAd);
        int i11 = 0;
        m mVar = (m) this.f47510h.b().get(0);
        if (context == null) {
            context = this.f47503a;
        }
        Resources resources = context.getResources();
        Integer numValueOf = (resources == null || (configuration = resources.getConfiguration()) == null) ? null : Integer.valueOf(configuration.orientation);
        if (numValueOf != null) {
            i5 = 2;
            if (numValueOf.intValue() == 2) {
            }
        } else {
            if (numValueOf != null) {
                i5 = 1;
                if (numValueOf.intValue() == 1) {
                    i11 = i5;
                }
            }
            if (numValueOf == null || numValueOf.intValue() != 0) {
                i11 = -1;
            }
        }
        mVar.a(i11);
    }

    public final String a() {
        this.f47510h.f47489e = (System.currentTimeMillis() + this.f47507e) - this.f47506d;
        try {
            StringBuilder sb2 = new StringBuilder("2:");
            Json json = this.f47504b;
            c cVar = this.f47510h;
            KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(json.getSerializersModule(), Reflection.b(c.class));
            Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
            sb2.append(json.encodeToString(kSerializerSerializer, cVar));
            return sb2.toString();
        } catch (Throwable unused) {
            return null;
        }
    }
}
