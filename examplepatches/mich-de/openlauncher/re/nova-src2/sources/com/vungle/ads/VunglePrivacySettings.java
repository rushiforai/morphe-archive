package com.vungle.ads;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.persistence.FilePreferences;
import com.vungle.ads.internal.privacy.PrivacyConsent;
import com.vungle.ads.internal.privacy.PrivacyManager;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(bv = {}, d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\t\n\u0002\b\u0004\bÆ\u0002\u0018\u00002\u00020\u0001J\u0010\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007J\b\u0010\u0007\u001a\u00020\u0006H\u0007J\u001a\u0010\n\u001a\u00020\u00042\u0006\u0010\b\u001a\u00020\u00022\b\u0010\t\u001a\u0004\u0018\u00010\u0006H\u0007J\b\u0010\u000b\u001a\u00020\u0006H\u0007J\b\u0010\f\u001a\u00020\u0006H\u0007J\b\u0010\r\u001a\u00020\u0006H\u0007J\b\u0010\u000f\u001a\u00020\u000eH\u0007J\u0010\u0010\u0010\u001a\u00020\u00042\u0006\u0010\b\u001a\u00020\u0002H\u0007J\b\u0010\u0011\u001a\u00020\u0006H\u0007¨\u0006\u0012"}, d2 = {"Lcom/vungle/ads/VunglePrivacySettings;", b.f42142b, b.f42142b, "isUserCoppa", b.f42142b, "setCOPPAStatus", b.f42142b, "getCOPPAStatus", "optIn", "consentMessageVersion", "setGDPRStatus", "getGDPRStatus", "getGDPRMessageVersion", "getGDPRSource", b.f42142b, "getGDPRTimestamp", "setCCPAStatus", "getCCPAStatus", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class VunglePrivacySettings {

    @NotNull
    public static final VunglePrivacySettings INSTANCE = new VunglePrivacySettings();

    @JvmStatic
    @NotNull
    public static final String getCCPAStatus() {
        String value;
        PrivacyManager.INSTANCE.getClass();
        PrivacyConsent privacyConsent = PrivacyManager.f47440h;
        return (privacyConsent == null || (value = privacyConsent.getValue()) == null) ? PrivacyConsent.UNKNOWN.getValue() : value;
    }

    @JvmStatic
    @NotNull
    public static final String getCOPPAStatus() {
        PrivacyManager.INSTANCE.getClass();
        return PrivacyManager.c().name();
    }

    @JvmStatic
    @NotNull
    public static final String getGDPRMessageVersion() {
        PrivacyManager.INSTANCE.getClass();
        String str = PrivacyManager.f47438f;
        return str == null ? b.f42142b : str;
    }

    @JvmStatic
    @NotNull
    public static final String getGDPRSource() {
        PrivacyManager.INSTANCE.getClass();
        String str = PrivacyManager.f47437e;
        return str == null ? "no_interaction" : str;
    }

    @JvmStatic
    @NotNull
    public static final String getGDPRStatus() {
        PrivacyManager.INSTANCE.getClass();
        return PrivacyManager.b();
    }

    @JvmStatic
    public static final long getGDPRTimestamp() {
        PrivacyManager.INSTANCE.getClass();
        Long l9 = PrivacyManager.f47439g;
        if (l9 != null) {
            return l9.longValue();
        }
        return 0L;
    }

    @JvmStatic
    public static final void setCCPAStatus(boolean optIn) {
        PrivacyManager.INSTANCE.updateCcpaConsent(optIn ? PrivacyConsent.OPT_IN : PrivacyConsent.OPT_OUT);
    }

    @JvmStatic
    public static final void setCOPPAStatus(boolean isUserCoppa) {
        PrivacyManager.INSTANCE.getClass();
        PrivacyManager.f47434b.set(Boolean.valueOf(isUserCoppa));
        FilePreferences filePreferences = PrivacyManager.f47441i;
        if (filePreferences != null) {
            filePreferences.a(isUserCoppa, "is_coppa").b();
        }
    }

    @JvmStatic
    public static final void setGDPRStatus(boolean optIn, @Nullable String consentMessageVersion) {
        String value = optIn ? PrivacyConsent.OPT_IN.getValue() : PrivacyConsent.OPT_OUT.getValue();
        PrivacyManager.INSTANCE.getClass();
        PrivacyManager.a(value, "publisher", consentMessageVersion);
    }
}
