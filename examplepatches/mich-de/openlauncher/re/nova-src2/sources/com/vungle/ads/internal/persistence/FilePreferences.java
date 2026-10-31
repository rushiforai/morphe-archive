package com.vungle.ads.internal.persistence;

import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.executor.j;
import com.vungle.ads.internal.util.PathProvider;
import com.vungle.ads.internal.util.n;
import fa.l0;
import java.io.File;
import java.io.Serializable;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(bv = {}, d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\u0018\u00002\u00020\u0001:\u0001\u0005J\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u00022\u0006\u0010\u0003\u001a\u00020\u0002¨\u0006\u0006"}, d2 = {"Lcom/vungle/ads/internal/persistence/FilePreferences;", b.f42142b, b.f42142b, DatabaseConstants.KEY_FIELD, "getString", "com/vungle/ads/internal/persistence/a", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes.dex */
public final class FilePreferences {

    /* renamed from: d, reason: collision with root package name */
    public static final a f47336d = new a();

    /* renamed from: e, reason: collision with root package name */
    public static final ConcurrentHashMap f47337e = new ConcurrentHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final Executor f47338a;

    /* renamed from: b, reason: collision with root package name */
    public final File f47339b;

    /* renamed from: c, reason: collision with root package name */
    public final ConcurrentHashMap f47340c;

    public /* synthetic */ FilePreferences(j jVar, PathProvider pathProvider, String str, int i5) {
        this(jVar, pathProvider, str);
    }

    public final void b() {
        HashMap map = new HashMap(this.f47340c);
        this.f47338a.execute(new l0(11, this.f47339b, map));
    }

    public final String c() {
        Object obj = this.f47340c.get("previous_tcf_token");
        return obj instanceof String ? (String) obj : b.f42142b;
    }

    @Nullable
    public final String getString(@NotNull String key) {
        Intrinsics.g(key, "key");
        Object obj = this.f47340c.get(key);
        if (obj instanceof String) {
            return (String) obj;
        }
        return null;
    }

    public FilePreferences(j jVar, PathProvider pathProvider, String str) throws Throwable {
        this.f47338a = jVar;
        File file = new File(pathProvider.a(), str);
        this.f47339b = file;
        ConcurrentHashMap concurrentHashMap = new ConcurrentHashMap();
        this.f47340c = concurrentHashMap;
        Object objC = n.c(file);
        if (objC instanceof HashMap) {
            concurrentHashMap.putAll((HashMap) objC);
        }
    }

    public static final void a(File fileToWrite, Serializable serializable) {
        Intrinsics.g(fileToWrite, "$fileToWrite");
        Intrinsics.g(serializable, "$serializable");
        n.a(fileToWrite, serializable);
    }

    public final FilePreferences a(boolean z11, String key) {
        Intrinsics.g(key, "key");
        this.f47340c.put(key, Boolean.valueOf(z11));
        return this;
    }

    public final Boolean a(String key) {
        Intrinsics.g(key, "key");
        Object obj = this.f47340c.get(key);
        if (obj instanceof Boolean) {
            return (Boolean) obj;
        }
        return null;
    }

    public final FilePreferences b(String key, int i5) {
        Intrinsics.g(key, "key");
        this.f47340c.put(key, Integer.valueOf(i5));
        return this;
    }

    public final FilePreferences b(String key, long j11) {
        Intrinsics.g(key, "key");
        this.f47340c.put(key, Long.valueOf(j11));
        return this;
    }

    public final FilePreferences a(String key, String value) {
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        this.f47340c.put(key, value);
        return this;
    }

    public final int a(String key, int i5) {
        Intrinsics.g(key, "key");
        Object obj = this.f47340c.get(key);
        return obj instanceof Integer ? ((Number) obj).intValue() : i5;
    }

    public final long a(String key, long j11) {
        Intrinsics.g(key, "key");
        Object obj = this.f47340c.get(key);
        return obj instanceof Long ? ((Number) obj).longValue() : j11;
    }
}
