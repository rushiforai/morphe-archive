package com.vungle.ads.internal;

import android.content.Context;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s1 {
    public static ServiceLocator a() {
        return ServiceLocator.INSTANCE;
    }

    public final ServiceLocator a(Context context) {
        ServiceLocator serviceLocator;
        Intrinsics.g(context, "context");
        ServiceLocator serviceLocator2 = ServiceLocator.INSTANCE;
        if (serviceLocator2 != null) {
            return serviceLocator2;
        }
        synchronized (this) {
            serviceLocator = ServiceLocator.INSTANCE;
            if (serviceLocator == null) {
                serviceLocator = new ServiceLocator(context, 0);
                ServiceLocator.INSTANCE = serviceLocator;
            }
        }
        return serviceLocator;
    }
}
