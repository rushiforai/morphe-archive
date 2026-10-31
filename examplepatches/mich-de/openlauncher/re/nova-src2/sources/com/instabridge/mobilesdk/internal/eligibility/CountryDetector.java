package com.instabridge.mobilesdk.internal.eligibility;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.telephony.TelephonyManager;
import b.c0;
import b70.c;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Locale;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.ranges.IntProgressionIterator;
import kotlin.ranges.IntRange;
import kotlin.ranges.a;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007J\u0010\u0010\b\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u0007J\u000e\u0010\t\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007J\b\u0010\n\u001a\u00020\u0005H\u0002J\u0012\u0010\u000b\u001a\u00020\u00052\b\u0010\f\u001a\u0004\u0018\u00010\rH\u0002J\u0010\u0010\u000e\u001a\u00020\u00052\u0006\u0010\f\u001a\u00020\rH\u0003¨\u0006\u000f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/eligibility/CountryDetector;", b.f42142b, "<init>", "()V", "getCountryCode", b.f42142b, "context", "Landroid/content/Context;", "current", "describe", "systemLocaleCountry", "networkCountry", "telephony", "Landroid/telephony/TelephonyManager;", "slotNetworkCountry", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class CountryDetector {
    public static final int $stable = 0;

    @NotNull
    public static final CountryDetector INSTANCE = new CountryDetector();

    private CountryDetector() {
    }

    private final String networkCountry(TelephonyManager telephony) {
        String networkCountryIso = telephony != null ? telephony.getNetworkCountryIso() : null;
        if (networkCountryIso == null) {
            networkCountryIso = b.f42142b;
        }
        return networkCountryIso.length() > 0 ? networkCountryIso : (telephony == null || Build.VERSION.SDK_INT < 30) ? b.f42142b : slotNetworkCountry(telephony);
    }

    private final String slotNetworkCountry(TelephonyManager telephony) {
        Object objA;
        Object objA2;
        try {
            int i5 = Result.f71687b;
            objA = Integer.valueOf(telephony.getActiveModemCount());
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        Integer num = (Integer) objA;
        if (num != null) {
            int iIntValue = num.intValue();
            for (int i12 = 0; i12 < iIntValue; i12++) {
                try {
                    int i13 = Result.f71687b;
                    objA2 = telephony.getNetworkCountryIso(i12);
                } catch (Throwable th3) {
                    int i14 = Result.f71687b;
                    objA2 = ResultKt.a(th3);
                }
                if (objA2 instanceof Result.Failure) {
                    objA2 = null;
                }
                String str = (String) objA2;
                if (str == null) {
                    str = b.f42142b;
                }
                if (str.length() > 0) {
                    return str;
                }
            }
        }
        return b.f42142b;
    }

    private final String systemLocaleCountry() {
        Locale locale = Resources.getSystem().getConfiguration().getLocales().get(0);
        String country = locale != null ? locale.getCountry() : null;
        return country == null ? b.f42142b : country;
    }

    @Nullable
    public final String current(@NotNull Context context) {
        Intrinsics.g(context, "context");
        String countryCode = getCountryCode(context);
        if (k.U0(countryCode)) {
            return null;
        }
        return countryCode;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v0, types: [kotlin.collections.EmptyList] */
    /* JADX WARN: Type inference failed for: r4v6, types: [java.util.ArrayList] */
    @NotNull
    public final String describe(@NotNull Context context) {
        Object arrayList;
        Object objA;
        Object objA2;
        Intrinsics.g(context, "context");
        Object systemService = context.getSystemService("phone");
        TelephonyManager telephonyManager = systemService instanceof TelephonyManager ? (TelephonyManager) systemService : null;
        String str = b.f42142b;
        if (telephonyManager == null || Build.VERSION.SDK_INT < 30) {
            arrayList = EmptyList.f71733a;
        } else {
            try {
                int i5 = Result.f71687b;
                objA = Integer.valueOf(telephonyManager.getActiveModemCount());
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            if (objA instanceof Result.Failure) {
                objA = null;
            }
            Integer num = (Integer) objA;
            IntRange intRangeM0 = a.m0(0, num != null ? num.intValue() : 0);
            arrayList = new ArrayList(c.u0(intRangeM0, 10));
            IntProgressionIterator it = intRangeM0.iterator();
            while (it.f71911c) {
                int iNextInt = it.nextInt();
                try {
                    int i12 = Result.f71687b;
                    objA2 = telephonyManager.getNetworkCountryIso(iNextInt);
                } catch (Throwable th3) {
                    int i13 = Result.f71687b;
                    objA2 = ResultKt.a(th3);
                }
                if (objA2 instanceof Result.Failure) {
                    objA2 = null;
                }
                String str2 = (String) objA2;
                if (str2 == null) {
                    str2 = b.f42142b;
                }
                arrayList.add(str2);
            }
        }
        String networkCountryIso = telephonyManager != null ? telephonyManager.getNetworkCountryIso() : null;
        if (networkCountryIso == null) {
            networkCountryIso = b.f42142b;
        }
        String simCountryIso = telephonyManager != null ? telephonyManager.getSimCountryIso() : null;
        if (simCountryIso != null) {
            str = simCountryIso;
        }
        Object objValueOf = telephonyManager != null ? Integer.valueOf(telephonyManager.getSimState()) : null;
        String strSystemLocaleCountry = systemLocaleCountry();
        String countryCode = getCountryCode(context);
        StringBuilder sb2 = new StringBuilder("network=");
        sb2.append(networkCountryIso);
        sb2.append(" perSlot=");
        sb2.append(arrayList);
        sb2.append(" sim=");
        sb2.append(str);
        sb2.append(" simState=");
        sb2.append(objValueOf);
        sb2.append(" systemLocale=");
        return c0.r(sb2, strSystemLocaleCountry, " -> ", countryCode);
    }

    @NotNull
    public final String getCountryCode(@NotNull Context context) {
        Intrinsics.g(context, "context");
        Object systemService = context.getSystemService("phone");
        TelephonyManager telephonyManager = systemService instanceof TelephonyManager ? (TelephonyManager) systemService : null;
        String strNetworkCountry = networkCountry(telephonyManager);
        if (strNetworkCountry.length() == 0) {
            strNetworkCountry = systemLocaleCountry();
        }
        if (strNetworkCountry.length() == 0) {
            String simCountryIso = telephonyManager != null ? telephonyManager.getSimCountryIso() : null;
            strNetworkCountry = simCountryIso == null ? b.f42142b : simCountryIso;
        }
        String upperCase = strNetworkCountry.toUpperCase(Locale.ROOT);
        Intrinsics.f(upperCase, "toUpperCase(...)");
        return upperCase;
    }
}
