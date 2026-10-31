package io.branch.search.internal;

import android.text.TextUtils;
import io.branch.search.internal.W;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.g2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3158g2 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final WeakHashMap f64544a = new WeakHashMap();

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Object f64545b = new Object();

    /* renamed from: c, reason: collision with root package name */
    public final int f64546c = 10;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final ConcurrentHashMap f64547d = new ConcurrentHashMap();

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final Object f64548e = new Object();

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final C3182h9 f64549f = new C3182h9();

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final ArrayList f64550g = new ArrayList();

    /* JADX WARN: Removed duplicated region for block: B:12:0x0025  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(@NotNull X analyticsEntity) {
        boolean z11;
        Intrinsics.g(analyticsEntity, "analyticsEntity");
        synchronized (this.f64548e) {
            List list = (List) this.f64547d.get(Integer.valueOf(analyticsEntity.c()));
            if (list != null) {
                z11 = list.isEmpty();
            }
        }
        return z11;
    }

    public final void a(@NotNull X analyticsEntity, float f11, long j11) {
        Intrinsics.g(analyticsEntity, "analyticsEntity");
        synchronized (this.f64548e) {
            try {
                String apiName = analyticsEntity.e();
                if (!TextUtils.isEmpty(apiName)) {
                    C3182h9 c3182h9 = this.f64549f;
                    c3182h9.getClass();
                    Intrinsics.g(apiName, "apiName");
                    c3182h9.f64657a.a(apiName, analyticsEntity, Le.f62854a);
                }
                List linkedList = (List) this.f64547d.get(Integer.valueOf(analyticsEntity.c()));
                if (linkedList == null) {
                    linkedList = new LinkedList();
                } else if (linkedList.size() >= this.f64546c) {
                    linkedList.remove(0);
                }
                linkedList.add(new W.b(f11, j11));
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Nullable
    public final Boolean a(int i5) {
        List list;
        if (!this.f64547d.containsKey(Integer.valueOf(i5)) || (list = (List) this.f64547d.get(Integer.valueOf(i5))) == null || list.isEmpty()) {
            return null;
        }
        return Boolean.valueOf(Float.compare(((W.b) a2.c.e(1, list)).f63548a, 1.0f) == 0);
    }
}
