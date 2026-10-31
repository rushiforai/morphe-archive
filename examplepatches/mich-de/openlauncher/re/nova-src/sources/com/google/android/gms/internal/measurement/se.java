package com.google.android.gms.internal.measurement;

import android.os.StrictMode;
import java.util.Arrays;
import java.util.Iterator;
import java.util.ServiceConfigurationError;

/* loaded from: classes3.dex */
public abstract class se {

    /* renamed from: a, reason: collision with root package name */
    public static final re f33068a;

    static {
        re reVar;
        StrictMode.ThreadPolicy threadPolicyAllowThreadDiskReads = StrictMode.allowThreadDiskReads();
        try {
            try {
                Iterator it = Arrays.asList(new re[0]).iterator();
                if (it.hasNext()) {
                    reVar = (re) it.next();
                    vk.b0.j("Expected at most one FlagsService", !it.hasNext());
                } else {
                    StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskReads);
                    reVar = new re();
                }
                f33068a = reVar;
            } catch (Throwable th2) {
                throw new ServiceConfigurationError(th2.getMessage(), th2);
            }
        } finally {
            StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskReads);
        }
    }
}
