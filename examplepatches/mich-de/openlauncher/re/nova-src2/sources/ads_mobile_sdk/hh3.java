package ads_mobile_sdk;

import java.util.Iterator;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class hh3 implements ThreadFactory {

    /* renamed from: a, reason: collision with root package name */
    public final String f4388a;

    /* renamed from: b, reason: collision with root package name */
    public Integer f4389b = null;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicInteger f4390c = new AtomicInteger(1);

    public hh3(String str) {
        this.f4388a = str;
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        Intrinsics.g(runnable, "runnable");
        String str = "GMA(" + this.f4388a + ") " + this.f4390c.getAndIncrement();
        Integer num = this.f4389b;
        if (num != null) {
            return new Thread(new ae.c(4, num, runnable), str);
        }
        cz.b bVar = mu0.f7335a;
        if (gq.f4020a != hq.f4478a && mu0.a(2, "GoogleMobileAds")) {
            Iterator it = mu0.f7335a.c("Creating Thread with default priority").iterator();
            while (true) {
                vk.s sVar = (vk.s) it;
                if (!sVar.hasNext()) {
                    break;
                }
                sVar.next();
                Thread.currentThread().getClass();
            }
        }
        return new Thread(runnable, str);
    }
}
