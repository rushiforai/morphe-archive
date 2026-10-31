package com.bytedance.sdk.component.lud.zb.ycx;

import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public class zb {
    private static final TimeUnit ycx = TimeUnit.SECONDS;

    public static ExecutorService ycx() {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 2, 30L, ycx, new LinkedBlockingQueue(), new ycx(CarrierConfigurator.APN_TYPE));
        threadPoolExecutor.allowCoreThreadTimeOut(true);
        return threadPoolExecutor;
    }
}
