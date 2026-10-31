package com.moloco.sdk.internal.services;

import android.content.Context;
import android.content.res.Resources;
import android.hardware.SensorManager;
import android.os.Build;
import android.os.SystemClock;
import android.telephony.TelephonyManager;
import android.view.inputmethod.InputMethodManager;
import android.view.inputmethod.InputMethodSubtype;
import java.util.Locale;
import kotlin.Deprecated;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: com.moloco.sdk.internal.services.i, reason: case insensitive filesystem */
/* loaded from: classes.dex */
public final class C2961i implements y {

    /* renamed from: c, reason: collision with root package name */
    public static final int f38002c = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f38003a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Lazy f38004b;

    public C2961i(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f38003a = context;
        this.f38004b = LazyKt.a(new a7.f(this, 8));
    }

    public static final boolean a(C2961i c2961i) {
        return c2961i.f38003a.getResources().getConfiguration().smallestScreenWidthDp >= 600;
    }

    @Override // com.moloco.sdk.internal.services.y
    @NotNull
    public x b() {
        String str;
        String str2;
        String str3;
        String networkOperatorName;
        String str4 = Build.MANUFACTURER;
        if (str4 == null) {
            str4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String str5 = Build.MODEL;
        if (str5 == null) {
            str5 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String str6 = Build.HARDWARE;
        if (str6 == null) {
            str3 = str6;
            str = str5;
            str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            str = str5;
            str2 = str6;
            str3 = str2;
        }
        boolean zE = e();
        String str7 = str3;
        String RELEASE = Build.VERSION.RELEASE;
        Intrinsics.f(RELEASE, "RELEASE");
        String str8 = str7;
        int i5 = Build.VERSION.SDK_INT;
        String language = Locale.getDefault().getLanguage();
        Intrinsics.f(language, "getLanguage(...)");
        TelephonyManager telephonyManager = (TelephonyManager) this.f38003a.getSystemService(TelephonyManager.class);
        if (telephonyManager == null || (networkOperatorName = telephonyManager.getNetworkOperatorName()) == null) {
            networkOperatorName = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        float f11 = Resources.getSystem().getDisplayMetrics().density;
        long jCurrentTimeMillis = System.currentTimeMillis() - SystemClock.elapsedRealtime();
        if (str8 == null) {
            str8 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String str9 = Build.BRAND;
        if (str9 == null) {
            str9 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return new x(str4, str, str2, zE, "android", RELEASE, i5, language, networkOperatorName, f11, jCurrentTimeMillis, str8, str9);
    }

    @Override // com.moloco.sdk.internal.services.y
    @NotNull
    public String c() {
        String language = Locale.getDefault().getLanguage();
        Intrinsics.f(language, "getLanguage(...)");
        return language;
    }

    @Override // com.moloco.sdk.internal.services.y
    @Nullable
    public String d() {
        Object systemService = this.f38003a.getSystemService("input_method");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.inputmethod.InputMethodManager");
        InputMethodSubtype currentInputMethodSubtype = ((InputMethodManager) systemService).getCurrentInputMethodSubtype();
        if (currentInputMethodSubtype != null) {
            return currentInputMethodSubtype.getLocale();
        }
        return null;
    }

    public final boolean e() {
        return ((Boolean) this.f38004b.getValue()).booleanValue();
    }

    @Override // com.moloco.sdk.internal.services.y
    @Deprecated
    @NotNull
    public x invoke() {
        return b();
    }

    @Override // com.moloco.sdk.internal.services.y
    @Nullable
    public Boolean a() {
        try {
            Object systemService = this.f38003a.getSystemService("sensor");
            Intrinsics.e(systemService, "null cannot be cast to non-null type android.hardware.SensorManager");
            return Boolean.valueOf(((SensorManager) systemService).getDefaultSensor(4) != null);
        } catch (Exception unused) {
            return null;
        }
    }
}
