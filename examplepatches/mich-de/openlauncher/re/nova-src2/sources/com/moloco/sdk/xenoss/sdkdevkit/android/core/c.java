package com.moloco.sdk.xenoss.sdkdevkit.android.core;

import a7.f;
import com.moloco.sdk.internal.MolocoLogger;
import kotlin.Lazy;
import kotlin.LazyKt;
import org.jetbrains.annotations.NotNull;
import r70.k;

/* loaded from: classes.dex */
public final class c implements UserAgentService {

    /* renamed from: c, reason: collision with root package name */
    public static final int f42143c = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f42144a = "WebBrowserUserAgentService";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Lazy f42145b = LazyKt.a(new f(this, 9));

    public final String a() {
        return (String) this.f42145b.getValue();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.core.UserAgentService
    @NotNull
    public String invoke() {
        return a();
    }

    public static final String a(c cVar) {
        try {
            String property = System.getProperty("http.agent");
            if (property != null) {
                if (!k.U0(property)) {
                    return property;
                }
            }
            return b.f42142b;
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, cVar.f42144a, e3.toString(), null, false, 12, null);
            return b.f42142b;
        }
    }
}
