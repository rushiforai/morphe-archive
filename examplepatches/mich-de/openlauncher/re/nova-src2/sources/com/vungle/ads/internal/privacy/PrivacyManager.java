package com.vungle.ads.internal.privacy;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.ConfigManager;
import com.vungle.ads.internal.ServiceLocator;
import com.vungle.ads.internal.model.o2;
import com.vungle.ads.internal.persistence.FilePreferences;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import com.vungle.ads.internal.v;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(bv = {}, d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\bÀ\u0002\u0018\u00002\u00020\u0001J\u000e\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002¨\u0006\u0006"}, d2 = {"Lcom/vungle/ads/internal/privacy/PrivacyManager;", b.f42142b, "Lcom/vungle/ads/internal/privacy/PrivacyConsent;", "consent", b.f42142b, "updateCcpaConsent", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes.dex */
public final class PrivacyManager {

    @NotNull
    public static final PrivacyManager INSTANCE = new PrivacyManager();

    /* renamed from: a, reason: collision with root package name */
    public static final AtomicReference f47433a = new AtomicReference();

    /* renamed from: b, reason: collision with root package name */
    public static final AtomicReference f47434b = new AtomicReference();

    /* renamed from: c, reason: collision with root package name */
    public static final AtomicBoolean f47435c = new AtomicBoolean(false);

    /* renamed from: d, reason: collision with root package name */
    public static String f47436d;

    /* renamed from: e, reason: collision with root package name */
    public static String f47437e;

    /* renamed from: f, reason: collision with root package name */
    public static String f47438f;

    /* renamed from: g, reason: collision with root package name */
    public static Long f47439g;

    /* renamed from: h, reason: collision with root package name */
    public static PrivacyConsent f47440h;

    /* renamed from: i, reason: collision with root package name */
    public static FilePreferences f47441i;

    /* renamed from: j, reason: collision with root package name */
    public static SharedPreferences f47442j;

    public static String b() {
        String str = f47436d;
        return str == null ? "unknown" : str;
    }

    public static COPPA c() {
        AtomicReference atomicReference = f47434b;
        return atomicReference.get() == null ? COPPA.COPPA_NOTSET : Intrinsics.b(atomicReference.get(), Boolean.TRUE) ? COPPA.COPPA_ENABLED : Intrinsics.b(atomicReference.get(), Boolean.FALSE) ? COPPA.COPPA_DISABLED : COPPA.COPPA_NOTSET;
    }

    public static Boolean d() {
        Object objA;
        String string;
        try {
            int i5 = Result.f71687b;
            SharedPreferences sharedPreferences = f47442j;
            objA = sharedPreferences != null ? Integer.valueOf(sharedPreferences.getInt("IABTCF_gdprApplies", -1)) : null;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (Result.a(objA) != null) {
            try {
                SharedPreferences sharedPreferences2 = f47442j;
                objA = (sharedPreferences2 == null || (string = sharedPreferences2.getString("IABTCF_gdprApplies", "-1")) == null) ? null : Integer.valueOf(Integer.parseInt(string));
            } catch (Throwable th3) {
                int i12 = Result.f71687b;
                objA = ResultKt.a(th3);
            }
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        Integer num = (Integer) objA;
        if (num != null && num.intValue() == 1) {
            return Boolean.TRUE;
        }
        if (num != null && num.intValue() == 0) {
            return Boolean.FALSE;
        }
        return null;
    }

    public static boolean e() {
        int iA = v.a(a());
        if (iA != 0) {
            if (iA == 1) {
                return false;
            }
            if (iA != 2) {
                throw new NoWhenBranchMatchedException();
            }
        }
        Boolean bool = (Boolean) f47433a.get();
        return (bool == null || bool.booleanValue()) ? false : true;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x003b  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:39:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean f() {
        String str;
        String string;
        FilePreferences filePreferences;
        FilePreferences filePreferences2;
        if (!Intrinsics.b(d(), Boolean.TRUE)) {
            return false;
        }
        ConfigManager.INSTANCE.getClass();
        o2 o2VarP = ConfigManager.p();
        int i5 = o2VarP == null ? -1 : a.f47443a[o2VarP.ordinal()];
        if (i5 == -1) {
            SharedPreferences sharedPreferences = f47442j;
            str = b.f42142b;
            string = sharedPreferences == null ? sharedPreferences.getString("IABTCF_TCString", b.f42142b) : null;
            if (string != null) {
                str = string;
            }
            filePreferences = f47441i;
            if (!Intrinsics.b(filePreferences != null ? filePreferences.c() : null, str)) {
                return false;
            }
            if (str.length() != 0 && (filePreferences2 = f47441i) != null) {
                filePreferences2.a("previous_tcf_token", str).b();
            }
        } else if (i5 != 1 && i5 != 2) {
            if (i5 != 3) {
                throw new NoWhenBranchMatchedException();
            }
            SharedPreferences sharedPreferences2 = f47442j;
            str = b.f42142b;
            if (sharedPreferences2 == null) {
            }
            if (string != null) {
            }
            filePreferences = f47441i;
            if (!Intrinsics.b(filePreferences != null ? filePreferences.c() : null, str)) {
            }
        }
        return true;
    }

    public final synchronized void a(Context context) {
        Intrinsics.g(context, "context");
        AtomicBoolean atomicBoolean = f47435c;
        if (atomicBoolean.get()) {
            boolean z11 = u.f47714a;
            t.c("PrivacyManager", "PrivacyManager already initialized");
            return;
        }
        f47442j = PreferenceManager.getDefaultSharedPreferences(context);
        FilePreferences filePreferences = (FilePreferences) ServiceLocator.f46726d.a(context).getService(FilePreferences.class);
        f47441i = filePreferences;
        AtomicReference atomicReference = f47433a;
        Boolean bool = (Boolean) atomicReference.get();
        if (bool != null) {
            boolean zBooleanValue = bool.booleanValue();
            FilePreferences filePreferences2 = f47441i;
            if (filePreferences2 != null) {
                filePreferences2.a(zBooleanValue, "disable_ad_id").b();
            }
        } else {
            Boolean boolA = filePreferences.a("disable_ad_id");
            if (boolA != null) {
                atomicReference.set(boolA);
            }
        }
        String str = f47436d;
        if (str != null) {
            String str2 = f47437e;
            if (str2 == null) {
                str2 = b.f42142b;
            }
            String str3 = f47438f;
            if (str3 == null) {
                str3 = b.f42142b;
            }
            Long l9 = f47439g;
            long jLongValue = l9 != null ? l9.longValue() : 0L;
            FilePreferences filePreferences3 = f47441i;
            if (filePreferences3 != null) {
                filePreferences3.a("gdpr_status", str).a("gdpr_source", str2).a("gdpr_message_version", str3).b("gdpr_timestamp", jLongValue).b();
            }
        } else {
            String string = filePreferences.getString("gdpr_status");
            PrivacyConsent privacyConsent = PrivacyConsent.OPT_IN;
            if (Intrinsics.b(string, privacyConsent.getValue())) {
                string = privacyConsent.getValue();
            } else {
                PrivacyConsent privacyConsent2 = PrivacyConsent.OPT_OUT;
                if (Intrinsics.b(string, privacyConsent2.getValue())) {
                    string = privacyConsent2.getValue();
                }
            }
            f47436d = string;
            f47437e = filePreferences.getString("gdpr_source");
            f47438f = filePreferences.getString("gdpr_message_version");
            f47439g = Long.valueOf(filePreferences.a("gdpr_timestamp", 0L));
        }
        PrivacyConsent privacyConsent3 = f47440h;
        if (privacyConsent3 != null) {
            FilePreferences filePreferences4 = f47441i;
            if (filePreferences4 != null) {
                filePreferences4.a("ccpa_status", privacyConsent3.getValue()).b();
            }
        } else {
            String string2 = filePreferences.getString("ccpa_status");
            PrivacyConsent privacyConsent4 = PrivacyConsent.OPT_OUT;
            if (!Intrinsics.b(privacyConsent4.getValue(), string2)) {
                privacyConsent4 = PrivacyConsent.OPT_IN;
            }
            f47440h = privacyConsent4;
        }
        AtomicReference atomicReference2 = f47434b;
        Boolean bool2 = (Boolean) atomicReference2.get();
        if (bool2 != null) {
            boolean zBooleanValue2 = bool2.booleanValue();
            FilePreferences filePreferences5 = f47441i;
            if (filePreferences5 != null) {
                filePreferences5.a(zBooleanValue2, "is_coppa").b();
            }
        } else {
            Boolean boolA2 = filePreferences.a("is_coppa");
            if (boolA2 != null) {
                atomicReference2.set(boolA2);
            }
        }
        atomicBoolean.set(true);
    }

    public final void updateCcpaConsent(@NotNull PrivacyConsent consent) {
        Intrinsics.g(consent, "consent");
        f47440h = consent;
        FilePreferences filePreferences = f47441i;
        if (filePreferences != null) {
            filePreferences.a("ccpa_status", consent.getValue()).b();
        }
    }

    public static void a(String consent, String source, String str) {
        Intrinsics.g(consent, "consent");
        Intrinsics.g(source, "source");
        f47436d = consent;
        f47437e = source;
        f47438f = str;
        long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
        f47439g = Long.valueOf(jCurrentTimeMillis);
        String str2 = f47438f;
        if (str2 == null) {
            str2 = b.f42142b;
        }
        FilePreferences filePreferences = f47441i;
        if (filePreferences != null) {
            filePreferences.a("gdpr_status", consent).a("gdpr_source", source).a("gdpr_message_version", str2).b("gdpr_timestamp", jCurrentTimeMillis).b();
        }
    }

    public static void a(boolean z11) {
        f47433a.set(Boolean.valueOf(z11));
        FilePreferences filePreferences = f47441i;
        if (filePreferences != null) {
            filePreferences.a(z11, "disable_ad_id").b();
        }
    }

    public static int a() {
        Boolean boolD = d();
        if (!Intrinsics.b(boolD, Boolean.TRUE)) {
            return boolD == null ? 3 : 1;
        }
        ConfigManager.INSTANCE.getClass();
        o2 o2VarP = ConfigManager.p();
        int i5 = o2VarP == null ? -1 : a.f47443a[o2VarP.ordinal()];
        if (i5 != -1) {
            if (i5 == 1) {
                return 2;
            }
            if (i5 != 2) {
                if (i5 != 3) {
                    throw new NoWhenBranchMatchedException();
                }
            }
        }
    }
}
