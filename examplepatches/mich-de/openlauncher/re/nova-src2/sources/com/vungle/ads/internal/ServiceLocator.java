package com.vungle.ads.internal;

import android.annotation.SuppressLint;
import android.content.Context;
import com.vungle.ads.internal.network.VungleApiClient;
import com.vungle.ads.internal.persistence.FilePreferences;
import com.vungle.ads.internal.util.PathProvider;
import java.util.HashMap;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(bv = {}, d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0000\u0018\u00002\u00020\u0001:\u0002\u0007\bJ!\u0010\u0005\u001a\u00028\u0000\"\u0004\b\u0000\u0010\u00022\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00028\u00000\u0003¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\t"}, d2 = {"Lcom/vungle/ads/internal/ServiceLocator;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "T", "Ljava/lang/Class;", "serviceClass", "getService", "(Ljava/lang/Class;)Ljava/lang/Object;", "com/vungle/ads/internal/s1", "com/vungle/ads/internal/t1", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class ServiceLocator {

    @SuppressLint({"StaticFieldLeak"})
    @Nullable
    private static volatile ServiceLocator INSTANCE;

    /* renamed from: d, reason: collision with root package name */
    public static final s1 f46726d = new s1();

    /* renamed from: a, reason: collision with root package name */
    public final Context f46727a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f46728b;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f46729c;

    public /* synthetic */ ServiceLocator(Context context, int i5) {
        this(context);
    }

    public final void b() {
        this.f46728b.put(com.vungle.ads.internal.task.d.class, new b2(this));
        this.f46728b.put(com.vungle.ads.internal.task.g.class, new c2(this));
        this.f46728b.put(VungleApiClient.class, new d2(this));
        this.f46728b.put(com.vungle.ads.internal.platform.f.class, new e2(this));
        this.f46728b.put(com.vungle.ads.internal.executor.a.class, new f2());
        this.f46728b.put(com.vungle.ads.internal.omsdk.c.class, new g2(this));
        this.f46728b.put(com.vungle.ads.internal.omsdk.d.class, new h2());
        this.f46728b.put(FilePreferences.class, new i2(this));
        this.f46728b.put(com.vungle.ads.internal.locale.a.class, new j2());
        this.f46728b.put(com.vungle.ads.internal.bidding.e.class, new u1(this));
        this.f46728b.put(PathProvider.class, new v1(this));
        this.f46728b.put(com.vungle.ads.internal.downloader.n.class, new w1(this));
        this.f46728b.put(com.vungle.ads.internal.downloader.t.class, new x1(this));
        this.f46728b.put(com.vungle.ads.internal.util.k.class, new y1());
        this.f46728b.put(com.vungle.ads.internal.signals.j.class, new z1(this));
        this.f46728b.put(com.vungle.ads.internal.network.r.class, new a2(this));
    }

    public final synchronized boolean c() {
        HashMap map;
        map = this.f46729c;
        for (Class cls : this.f46728b.keySet()) {
            if (cls.isAssignableFrom(com.vungle.ads.internal.downloader.t.class)) {
            }
        }
        throw new IllegalArgumentException("Unknown dependency for " + com.vungle.ads.internal.downloader.t.class);
        return map.containsKey(cls);
    }

    public final synchronized <T> T getService(@NotNull Class<T> serviceClass) {
        Intrinsics.g(serviceClass, "serviceClass");
        return (T) a(serviceClass);
    }

    public ServiceLocator(Context context) {
        Context applicationContext = context.getApplicationContext();
        Intrinsics.f(applicationContext, "context.applicationContext");
        this.f46727a = applicationContext;
        this.f46728b = new HashMap();
        this.f46729c = new HashMap();
        b();
    }

    public final Object a(Class cls) {
        for (Class cls2 : this.f46728b.keySet()) {
            if (cls2.isAssignableFrom(cls)) {
                Object obj = this.f46729c.get(cls2);
                if (obj != null) {
                    return obj;
                }
                t1 t1Var = (t1) this.f46728b.get(cls2);
                if (t1Var != null) {
                    Object objA = t1Var.a();
                    if (t1Var.f47526a) {
                        this.f46729c.put(cls2, objA);
                    }
                    return objA;
                }
                throw new IllegalArgumentException("Unknown class");
            }
        }
        throw new IllegalArgumentException(h6.c1.r(cls, "Unknown dependency for "));
    }
}
