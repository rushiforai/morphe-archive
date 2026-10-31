package com.moloco.sdk.internal.services.bidtoken;

import android.os.Build;
import com.moloco.sdk.BuildConfig;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.services.J;
import com.moloco.sdk.service_locator.a;
import java.util.Locale;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import t70.k0;
import t70.m0;

/* loaded from: classes.dex */
public final class A {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Lazy f37661a = LazyKt.a(new a2.k(7));

    public static final z a() {
        String str;
        String str2;
        MolocoLogger.info$default(MolocoLogger.INSTANCE, "ServerBidTokenService", "Creating BidTokenService instance", null, false, 12, null);
        a.e eVar = a.e.f38290a;
        c50.e eVarA = com.moloco.sdk.internal.http.a.a(eVar.h().invoke(), eVar.l().invoke());
        j jVar = new j(2800L, 3, 200L);
        String language = Locale.getDefault().getLanguage();
        Intrinsics.f(language, "getLanguage(...)");
        String RELEASE = Build.VERSION.RELEASE;
        Intrinsics.f(RELEASE, "RELEASE");
        String str3 = Build.MANUFACTURER;
        if (str3 == null) {
            str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String str4 = Build.MODEL;
        if (str4 == null) {
            str4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String str5 = Build.HARDWARE;
        if (str5 == null) {
            String str6 = str4;
            str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            str = str6;
        } else {
            str = str4;
            str2 = str5;
        }
        return new z(new c(BuildConfig.SDK_VERSION_NAME, eVarA, jVar, new g(language, RELEASE, str3, str, str2)), k0.a(CoroutineContext.Element.DefaultImpls.d(m0.d(), com.moloco.sdk.internal.scheduling.b.a().getIo())), v.f37887a.a(new com.moloco.sdk.internal.bidtoken.c(), new J()));
    }

    public static final z c() {
        return (z) f37661a.getValue();
    }
}
