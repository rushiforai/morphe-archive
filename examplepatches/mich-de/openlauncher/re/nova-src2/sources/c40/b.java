package c40;

import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.executor.j;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19654a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ j f19655b;

    public /* synthetic */ b(j jVar, int i5) {
        this.f19654a = i5;
        this.f19655b = jVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f19654a) {
            case 0:
                AnalyticsClient.a(this.f19655b);
                break;
            case 1:
                j.c(this.f19655b);
                break;
            case 2:
                j.a(this.f19655b);
                break;
            default:
                j.b(this.f19655b);
                break;
        }
    }
}
