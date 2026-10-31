package com.instabridge.ai.tools;

import android.annotation.SuppressLint;
import android.content.Context;
import android.telephony.SubscriptionInfo;
import android.telephony.SubscriptionManager;
import android.telephony.TelephonyManager;
import b.u4;
import b70.g;
import io.michaelrocks.libphonenumber.android.NumberParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.Grouping;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
import kotlin.jvm.internal.markers.KMutableMap;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0005\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u0007\u0010\bJ#\u0010\f\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\b\u0010\n\u001a\u0004\u0018\u00010\tH\u0003¢\u0006\u0004\b\f\u0010\rJ\u0017\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\u000f\u0010\u0010J\u0015\u0010\u0011\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0011\u0010\u0012J\u001d\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0016\u001a\u00020\u000b2\u0006\u0010\u0013\u001a\u00020\u000b¢\u0006\u0004\b\u0016\u0010\u0010J\u0017\u0010\u0018\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u0017\u001a\u00020\u000b¢\u0006\u0004\b\u0018\u0010\u0010J\u0015\u0010\u0019\u001a\u00020\u000b2\u0006\u0010\u0017\u001a\u00020\u000b¢\u0006\u0004\b\u0019\u0010\u0010J\u0015\u0010\u001c\u001a\u00020\u001b2\u0006\u0010\u001a\u001a\u00020\u000b¢\u0006\u0004\b\u001c\u0010\u001dR\u0018\u0010\u001e\u001a\u0004\u0018\u00010\u00068\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u001e\u0010\u001f¨\u0006 "}, d2 = {"Lcom/instabridge/ai/tools/PhoneNumberNormalizer;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Landroid/content/Context;", "context", "Lc60/b;", "getPhoneUtil", "(Landroid/content/Context;)Lc60/b;", "Landroid/telephony/TelephonyManager;", "tm", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getSimCountryByVote", "(Landroid/content/Context;Landroid/telephony/TelephonyManager;)Ljava/lang/String;", "raw", "fallbackClean", "(Ljava/lang/String;)Ljava/lang/String;", "getDefaultRegion", "(Landroid/content/Context;)Ljava/lang/String;", "phone", "normalize", "(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;", "normalizeInternational", "e164", "getCountryForNumber", "withoutPlus", "input", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "looksLikePhoneNumber", "(Ljava/lang/String;)Z", "phoneUtil", "Lc60/b;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class PhoneNumberNormalizer {

    @Nullable
    private static volatile c60.b phoneUtil;

    @NotNull
    public static final PhoneNumberNormalizer INSTANCE = new PhoneNumberNormalizer();
    public static final int $stable = 8;

    private PhoneNumberNormalizer() {
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0048 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final String fallbackClean(String raw) {
        String strI = u4.i("[^0-9+]", raw, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        int i5 = 0;
        for (int i11 = 0; i11 < strI.length(); i11++) {
            if (Character.isDigit(strI.charAt(i11))) {
                i5++;
            }
        }
        if (4 > i5 || i5 >= 16) {
            return (1 > i5 || i5 >= 4) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strI;
        }
        if (!j.I0(strI, "+", false) || strI.length() <= 4) {
            String strF0 = j.F0(strI, "+", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false);
            if (strF0.length() != 0) {
                return strF0;
            }
        }
    }

    private final c60.b getPhoneUtil(Context context) {
        c60.b bVarB;
        c60.b bVar = phoneUtil;
        if (bVar != null) {
            return bVar;
        }
        synchronized (this) {
            bVarB = phoneUtil;
            if (bVarB == null) {
                bVarB = c60.b.b(context.getApplicationContext());
                phoneUtil = bVarB;
            }
        }
        return bVarB;
    }

    /* JADX WARN: Removed duplicated region for block: B:116:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0053  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x017a  */
    @SuppressLint({"MissingPermission"})
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final String getSimCountryByVote(Context context, TelephonyManager tm2) {
        List<SubscriptionInfo> activeSubscriptionInfoList;
        String simCountryIso;
        Object next;
        String upperCase;
        Object next2;
        String countryIso;
        String upperCase2;
        if (tm2 != null) {
            Object systemService = context.getSystemService("telephony_subscription_service");
            SubscriptionManager subscriptionManager = systemService instanceof SubscriptionManager ? (SubscriptionManager) systemService : null;
            if (subscriptionManager != null) {
                try {
                    activeSubscriptionInfoList = subscriptionManager.getActiveSubscriptionInfoList();
                } catch (SecurityException unused) {
                }
                if (activeSubscriptionInfoList != null || activeSubscriptionInfoList.size() <= 1) {
                    simCountryIso = tm2.getSimCountryIso();
                    if (simCountryIso != null) {
                        return null;
                    }
                    String upperCase3 = simCountryIso.toUpperCase(Locale.ROOT);
                    Intrinsics.f(upperCase3, "toUpperCase(...)");
                    if (upperCase3.length() == 2) {
                        return upperCase3;
                    }
                    return null;
                }
                List<SubscriptionInfo> list = activeSubscriptionInfoList;
                final ArrayList arrayList = new ArrayList();
                Iterator<T> it = list.iterator();
                while (it.hasNext()) {
                    String countryIso2 = ((SubscriptionInfo) it.next()).getCountryIso();
                    if (countryIso2 != null) {
                        upperCase2 = countryIso2.toUpperCase(Locale.ROOT);
                        Intrinsics.f(upperCase2, "toUpperCase(...)");
                        if (upperCase2.length() != 2) {
                            upperCase2 = null;
                        }
                    }
                    if (upperCase2 != null) {
                        arrayList.add(upperCase2);
                    }
                }
                if (!arrayList.isEmpty()) {
                    if (g.P0(arrayList).size() == 1) {
                        return (String) g.W0(arrayList);
                    }
                    int defaultVoiceSubscriptionId = SubscriptionManager.getDefaultVoiceSubscriptionId();
                    Iterator<T> it2 = list.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            next = null;
                            break;
                        }
                        next = it2.next();
                        if (((SubscriptionInfo) next).getSubscriptionId() == defaultVoiceSubscriptionId) {
                            break;
                        }
                    }
                    SubscriptionInfo subscriptionInfo = (SubscriptionInfo) next;
                    if (subscriptionInfo == null || (countryIso = subscriptionInfo.getCountryIso()) == null) {
                        upperCase = null;
                    } else {
                        upperCase = countryIso.toUpperCase(Locale.ROOT);
                        Intrinsics.f(upperCase, "toUpperCase(...)");
                        if (upperCase.length() != 2) {
                        }
                    }
                    if (upperCase != null) {
                        return upperCase;
                    }
                    Grouping<String, String> grouping = new Grouping<String, String>() { // from class: com.instabridge.ai.tools.PhoneNumberNormalizer$getSimCountryByVote$$inlined$groupingBy$2
                        @Override // kotlin.collections.Grouping
                        public String keyOf(String element) {
                            return element;
                        }

                        @Override // kotlin.collections.Grouping
                        public Iterator<String> sourceIterator() {
                            return arrayList.iterator();
                        }
                    };
                    LinkedHashMap linkedHashMap = new LinkedHashMap();
                    Iterator itSourceIterator = grouping.sourceIterator();
                    while (itSourceIterator.hasNext()) {
                        Object objKeyOf = grouping.keyOf(itSourceIterator.next());
                        Object intRef = linkedHashMap.get(objKeyOf);
                        if (intRef == null && !linkedHashMap.containsKey(objKeyOf)) {
                            intRef = new Ref.IntRef();
                        }
                        Ref.IntRef intRef2 = (Ref.IntRef) intRef;
                        intRef2.f71861a++;
                        linkedHashMap.put(objKeyOf, intRef2);
                    }
                    for (Map.Entry entry : linkedHashMap.entrySet()) {
                        Intrinsics.e(entry, "null cannot be cast to non-null type kotlin.collections.MutableMap.MutableEntry<K of kotlin.collections.GroupingKt__GroupingJVMKt.mapValuesInPlace, R of kotlin.collections.GroupingKt__GroupingJVMKt.mapValuesInPlace>");
                        if ((entry instanceof KMappedMarker) && !(entry instanceof KMutableMap.Entry)) {
                            TypeIntrinsics.h(entry, "kotlin.collections.MutableMap.MutableEntry");
                            throw null;
                        }
                        entry.setValue(Integer.valueOf(((Ref.IntRef) entry.getValue()).f71861a));
                    }
                    Iterator it3 = TypeIntrinsics.c(linkedHashMap).entrySet().iterator();
                    if (it3.hasNext()) {
                        next2 = it3.next();
                        if (it3.hasNext()) {
                            int iIntValue = ((Number) ((Map.Entry) next2).getValue()).intValue();
                            do {
                                Object next3 = it3.next();
                                int iIntValue2 = ((Number) ((Map.Entry) next3).getValue()).intValue();
                                if (iIntValue < iIntValue2) {
                                    next2 = next3;
                                    iIntValue = iIntValue2;
                                }
                            } while (it3.hasNext());
                        }
                    } else {
                        next2 = null;
                    }
                    Map.Entry entry2 = (Map.Entry) next2;
                    if (entry2 != null) {
                        return (String) entry2.getKey();
                    }
                    return null;
                }
            } else {
                activeSubscriptionInfoList = null;
                if (activeSubscriptionInfoList != null) {
                }
                simCountryIso = tm2.getSimCountryIso();
                if (simCountryIso != null) {
                }
            }
        }
        return null;
    }

    @Nullable
    public final String getCountryForNumber(@NotNull String e164) {
        c60.b bVar;
        Intrinsics.g(e164, "e164");
        if (j.I0(e164, "+", false) && (bVar = phoneUtil) != null) {
            try {
                return bVar.h(bVar.n(e164, null));
            } catch (Exception unused) {
            }
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x003c  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x003f A[RETURN] */
    @NotNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String getDefaultRegion(@NotNull Context context) {
        String upperCase;
        String networkCountryIso;
        Intrinsics.g(context, "context");
        Object systemService = context.getSystemService("phone");
        TelephonyManager telephonyManager = systemService instanceof TelephonyManager ? (TelephonyManager) systemService : null;
        String simCountryByVote = getSimCountryByVote(context, telephonyManager);
        if (simCountryByVote != null) {
            return simCountryByVote;
        }
        if (fo.d.k()) {
            if (telephonyManager == null || (networkCountryIso = telephonyManager.getNetworkCountryIso()) == null) {
                upperCase = null;
                if (upperCase != null) {
                    return upperCase;
                }
            } else {
                upperCase = networkCountryIso.toUpperCase(Locale.ROOT);
                Intrinsics.f(upperCase, "toUpperCase(...)");
                if (upperCase.length() != 2) {
                }
                if (upperCase != null) {
                }
            }
        }
        String country = Locale.getDefault().getCountry();
        String str = country.length() == 2 ? country : null;
        return str == null ? "US" : str;
    }

    public final boolean looksLikePhoneNumber(@NotNull String input) {
        Intrinsics.g(input, "input");
        String string = k.u1(input).toString();
        if (string.length() != 0) {
            if (!j.I0(string, "+", false) || string.length() <= 1) {
                int i5 = 0;
                while (true) {
                    if (i5 >= string.length()) {
                        for (int i11 = 0; i11 < string.length(); i11++) {
                            char cCharAt = string.charAt(i11);
                            if (Character.isDigit(cCharAt) || k.L0(" -().", cCharAt)) {
                            }
                        }
                    } else {
                        if (Character.isLetter(string.charAt(i5))) {
                            break;
                        }
                        i5++;
                    }
                }
            }
            return true;
        }
        return false;
    }

    @NotNull
    public final String normalize(@NotNull String phone, @NotNull Context context) {
        String strConcat;
        Intrinsics.g(phone, "phone");
        Intrinsics.g(context, "context");
        String string = k.u1(phone).toString();
        if (string.length() == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (!j.I0(string, "00", false) || string.length() <= 4) {
            strConcat = string;
        } else {
            String strSubstring = string.substring(2);
            Intrinsics.f(strSubstring, "substring(...)");
            strConcat = "+".concat(strSubstring);
        }
        try {
            c60.b phoneUtil2 = getPhoneUtil(context);
            String strD = phoneUtil2.d(phoneUtil2.n(strConcat, getDefaultRegion(context)));
            Intrinsics.d(strD);
            return strD;
        } catch (NumberParseException unused) {
            return fallbackClean(string);
        } catch (Exception unused2) {
            return fallbackClean(string);
        }
    }

    @NotNull
    public final String normalizeInternational(@NotNull String phone) {
        Intrinsics.g(phone, "phone");
        String string = k.u1(phone).toString();
        if (string.length() == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (j.I0(string, "00", false) && string.length() > 4) {
            String strSubstring = string.substring(2);
            Intrinsics.f(strSubstring, "substring(...)");
            string = "+".concat(strSubstring);
        }
        if (!j.I0(string, "+", false)) {
            return string;
        }
        c60.b bVar = phoneUtil;
        if (bVar == null) {
            return u4.i("[^0-9+]", string, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        }
        try {
            String strD = bVar.d(bVar.n(string, null));
            Intrinsics.d(strD);
            return strD;
        } catch (Exception unused) {
            return u4.i("[^0-9+]", string, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        }
    }

    @NotNull
    public final String withoutPlus(@NotNull String e164) {
        Intrinsics.g(e164, "e164");
        return k.a1(e164, "+");
    }
}
