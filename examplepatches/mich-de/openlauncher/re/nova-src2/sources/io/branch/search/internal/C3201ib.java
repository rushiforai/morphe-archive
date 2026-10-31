package io.branch.search.internal;

import android.content.Context;
import android.content.pm.ResolveInfo;
import android.util.LruCache;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.ib, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3201ib {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final C3201ib f64744a = new C3201ib();

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final LruCache<U7, a> f64745b = new LruCache<>(50);

    /* renamed from: io.branch.search.internal.ib$a */
    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final List<ResolveInfo> f64746a;

        /* renamed from: b, reason: collision with root package name */
        public long f64747b;

        /* JADX WARN: Multi-variable type inference failed */
        public a(@NotNull List<? extends ResolveInfo> data, long j11) {
            Intrinsics.g(data, "data");
            this.f64746a = data;
            this.f64747b = j11;
        }
    }

    @NotNull
    public static List a(long j11, @NotNull Context context, @NotNull V7 intentWrap) {
        List<ResolveInfo> list;
        Intrinsics.g(context, "context");
        Intrinsics.g(intentWrap, "intentWrap");
        LruCache<U7, a> lruCache = f64745b;
        a aVar = lruCache.get(intentWrap.f63505a);
        if (aVar != null) {
            if (j11 < aVar.f64747b + 10000) {
                aVar.f64747b = j11;
                list = aVar.f64746a;
            } else {
                list = null;
            }
            if (list != null) {
                return list;
            }
        }
        List<ResolveInfo> it = context.getPackageManager().queryIntentActivities(intentWrap.f63506b, 0);
        U7 u72 = intentWrap.f63505a;
        Intrinsics.f(it, "it");
        lruCache.put(u72, new a(it, j11));
        return it;
    }
}
