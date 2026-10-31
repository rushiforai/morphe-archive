package com.facebook.ads.internal.dynamicloading;

import android.content.Context;
import com.facebook.ads.AudienceNetworkAds;
import com.facebook.ads.internal.settings.MultithreadedBundleWrapper;
import com.facebook.ads.internal.util.common.ANActivityLifecycleCallbacksListener;

/* loaded from: classes.dex */
public final class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f27506a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f27507b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ MultithreadedBundleWrapper f27508c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ AudienceNetworkAds.InitListener f27509d;

    public b(Context context, MultithreadedBundleWrapper multithreadedBundleWrapper, AudienceNetworkAds.InitListener initListener, boolean z11) {
        this.f27506a = context;
        this.f27507b = z11;
        this.f27508c = multithreadedBundleWrapper;
        this.f27509d = initListener;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Throwable th2;
        DynamicLoader dynamicLoader;
        int i5;
        ANActivityLifecycleCallbacksListener.registerActivityCallbacks(this.f27506a);
        synchronized (DynamicLoaderFactory.class) {
            DynamicLoader dynamicLoaderDoMakeLoader = null;
            th2 = null;
            int i11 = 0;
            while (i11 < 3) {
                try {
                    dynamicLoaderDoMakeLoader = DynamicLoaderFactory.doMakeLoader(this.f27506a, false);
                    break;
                } finally {
                    if (i11 == i5) {
                        try {
                        } catch (Throwable th3) {
                        }
                    }
                }
            }
            dynamicLoader = dynamicLoaderDoMakeLoader;
        }
        DynamicLoaderFactory.doCallInitialize(this.f27506a, dynamicLoader, th2, this.f27507b, this.f27508c, this.f27509d);
        DynamicLoaderFactory.sInitializing.set(false);
    }
}
