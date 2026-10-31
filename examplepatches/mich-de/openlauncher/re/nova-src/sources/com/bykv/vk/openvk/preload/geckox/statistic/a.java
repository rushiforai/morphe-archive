package com.bykv.vk.openvk.preload.geckox.statistic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
final class a {

    /* renamed from: a, reason: collision with root package name */
    private static final Map<Long, a> f22122a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    private final Map<String, com.bykv.vk.openvk.preload.geckox.statistic.model.a> f22123b = new HashMap();

    public static a a(long j11) {
        a aVar;
        Map<Long, a> map = f22122a;
        synchronized (map) {
            try {
                aVar = map.get(Long.valueOf(j11));
                if (aVar == null) {
                    aVar = new a();
                    map.put(Long.valueOf(j11), aVar);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return aVar;
    }

    public final com.bykv.vk.openvk.preload.geckox.statistic.model.a a(String str) {
        com.bykv.vk.openvk.preload.geckox.statistic.model.a aVar;
        synchronized (this.f22123b) {
            try {
                aVar = this.f22123b.get(str);
                if (aVar == null) {
                    aVar = new com.bykv.vk.openvk.preload.geckox.statistic.model.a();
                    this.f22123b.put(str, aVar);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return aVar;
    }

    public final List<com.bykv.vk.openvk.preload.geckox.statistic.model.a> a() {
        ArrayList arrayList;
        synchronized (this.f22123b) {
            arrayList = new ArrayList(this.f22123b.values());
        }
        return arrayList;
    }
}
