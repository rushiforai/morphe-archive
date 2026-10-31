package com.fyber.inneractive.sdk.config;

import android.app.Application;
import android.content.SharedPreferences;
import android.os.Looper;
import android.text.TextUtils;
import b.c9;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.config.enums.IabTcfGdprAppliesStatus;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes.dex */
public final class h implements com.fyber.inneractive.sdk.privacy.d {

    /* renamed from: k, reason: collision with root package name */
    public SharedPreferences f27849k;

    /* renamed from: l, reason: collision with root package name */
    public SharedPreferences f27850l;
    public IabTcfGdprAppliesStatus o;

    /* renamed from: p, reason: collision with root package name */
    public Boolean f27852p;

    /* renamed from: a, reason: collision with root package name */
    public Boolean f27839a = null;

    /* renamed from: b, reason: collision with root package name */
    public Boolean f27840b = null;

    /* renamed from: c, reason: collision with root package name */
    public Boolean f27841c = null;

    /* renamed from: d, reason: collision with root package name */
    public String f27842d = null;

    /* renamed from: e, reason: collision with root package name */
    public String f27843e = null;

    /* renamed from: f, reason: collision with root package name */
    public InneractiveAdManager.GdprConsentSource f27844f = null;

    /* renamed from: g, reason: collision with root package name */
    public String f27845g = null;

    /* renamed from: h, reason: collision with root package name */
    public String f27846h = null;

    /* renamed from: i, reason: collision with root package name */
    public Boolean f27847i = null;

    /* renamed from: j, reason: collision with root package name */
    public Boolean f27848j = null;

    /* renamed from: m, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.privacy.c f27851m = new com.fyber.inneractive.sdk.privacy.c(this);
    public final com.fyber.inneractive.sdk.gpp.a n = new com.fyber.inneractive.sdk.gpp.a();

    /* renamed from: q, reason: collision with root package name */
    public final AtomicBoolean f27853q = new AtomicBoolean(false);

    public final boolean a(boolean z11, String str) {
        if (com.fyber.inneractive.sdk.util.o.f31210a == null) {
            return false;
        }
        j();
        SharedPreferences sharedPreferences = this.f27849k;
        if (sharedPreferences == null) {
            return false;
        }
        c9.q(sharedPreferences, str, z11);
        return true;
    }

    public final void b() {
        IAlog.a("Clearing LGPD consent status", new Object[0]);
        if (com.fyber.inneractive.sdk.util.o.f31210a == null) {
            IAlog.f("clearLgpdConsentStatus was invoked, but the Inneractive SDK was not properly initialized, or destroyed.", new Object[0]);
            return;
        }
        j();
        this.f27847i = null;
        SharedPreferences sharedPreferences = this.f27849k;
        if (sharedPreferences != null) {
            sharedPreferences.edit().remove("IALgpdConsentStatus").apply();
        }
    }

    public final void c() {
        IAlog.a("Clearing CCPA Consent String", new Object[0]);
        if (com.fyber.inneractive.sdk.util.o.f31210a == null) {
            IAlog.f("clearUSPrivacyString was invoked, but the Inneractive SDK was not properly initialized, or destroyed.", new Object[0]);
            return;
        }
        j();
        this.f27846h = null;
        SharedPreferences sharedPreferences = this.f27849k;
        if (sharedPreferences != null) {
            sharedPreferences.edit().remove("IACCPAConsentData").apply();
        }
    }

    public final void d() {
        if (this.n.f28464a.get() != null) {
            return;
        }
        if (this.f27850l == null) {
            Application application = com.fyber.inneractive.sdk.util.o.f31210a;
            if (application == null) {
                IAlog.a("%sensureGppManagerInitialization - Context is null - returning", "ConfigDataProtectionProvider: ");
                return;
            }
            this.f27850l = application.getSharedPreferences(application.getPackageName() + "_preferences", 0);
        }
        com.fyber.inneractive.sdk.gpp.a aVar = this.n;
        SharedPreferences sharedPreferences = this.f27850l;
        if (sharedPreferences == null) {
            aVar.getClass();
            IAlog.a("%s defaultSharedPreferences is null, not initializing GppManager", "GppManager");
        } else if (aVar.f28464a.get() == null) {
            aVar.f28464a.set(sharedPreferences);
            aVar.b();
        }
    }

    public final Boolean e() {
        d();
        p();
        if (this.f27840b == null) {
            this.f27840b = m();
        }
        Boolean bool = Boolean.TRUE;
        if (bool.equals(this.f27839a)) {
            IAlog.a("%sB1: GDPR consent granted - Publisher API override", "ConfigDataProtectionProvider: ");
            return bool;
        }
        Boolean bool2 = Boolean.FALSE;
        boolean zEquals = bool2.equals(this.f27839a);
        IabTcfGdprAppliesStatus iabTcfGdprAppliesStatusN = n();
        if (iabTcfGdprAppliesStatusN != IabTcfGdprAppliesStatus.APPLIES) {
            if (zEquals) {
                IAlog.a("%sB1.1/B2: Publisher denied, gdprApplies status: %s - checking GPP (strict)", "ConfigDataProtectionProvider: ", iabTcfGdprAppliesStatusN);
                return a(bool2);
            }
            IAlog.a("%sB1.2/B2: Publisher API not used, gdprApplies status: %s - checking GPP (lenient)", "ConfigDataProtectionProvider: ", iabTcfGdprAppliesStatusN);
            return a((Boolean) null);
        }
        IAlog.a("%sB2.2: GDPR applies - Checking TCF VendorConsents", "ConfigDataProtectionProvider: ");
        Boolean bool3 = this.f27840b;
        if (bool3 == null) {
            IAlog.a("%sB3: TCF VendorConsents missing - checking GPP (strict)", "ConfigDataProtectionProvider: ");
            return a(bool2);
        }
        if (bool3.booleanValue()) {
            IAlog.a("%sB3.1: GDPR consent granted - TCF Vendor 262 present", "ConfigDataProtectionProvider: ");
            return bool;
        }
        IAlog.a("%sB3.2: TCF Vendor 262 denied - checking GPP (strict)", "ConfigDataProtectionProvider: ");
        return a(bool2);
    }

    public final Integer f() {
        SharedPreferences sharedPreferences = this.f27850l;
        if (sharedPreferences == null) {
            return null;
        }
        try {
            int i5 = sharedPreferences.getInt("IABTCF_CmpSdkID", -1);
            if (i5 != -1) {
                return Integer.valueOf(i5);
            }
        } catch (Exception e3) {
            IAlog.a("%sError when trying to read IABTCF_CmpSdkID", e3, "ConfigDataProtectionProvider: ");
        }
        com.fyber.inneractive.sdk.tcf.a aVar = this.n.f28466c;
        if (aVar.f31108c) {
            return Integer.valueOf(aVar.f31109d);
        }
        return null;
    }

    public final Integer g() {
        SharedPreferences sharedPreferences = this.f27850l;
        if (sharedPreferences == null) {
            return null;
        }
        try {
            int i5 = sharedPreferences.getInt("IABTCF_CmpSdkVersion", -1);
            if (i5 != -1) {
                return Integer.valueOf(i5);
            }
        } catch (Exception e3) {
            IAlog.a("%sError when trying to read IABTCF_CmpSdkVersion", e3, "ConfigDataProtectionProvider: ");
        }
        com.fyber.inneractive.sdk.tcf.a aVar = this.n.f28466c;
        if (aVar.f31108c) {
            return Integer.valueOf(aVar.f31110e);
        }
        return null;
    }

    public final void h() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            IAlog.b("%sinvalidatePrivacyKeys() called off the main thread — this is a threading bug", "ConfigDataProtectionProvider: ");
        }
        this.o = null;
        this.f27852p = null;
        this.f27841c = null;
        this.f27843e = null;
        this.f27840b = null;
        com.fyber.inneractive.sdk.gpp.a aVar = this.n;
        if (aVar.f28464a.get() == null) {
            IAlog.a("%s refreshFromDefaultSharedPreferences - not initialized", "GppManager");
        } else {
            aVar.b();
            IAlog.a("%s refreshFromDefaultSharedPreferences - GPP/TCF reloaded from prefs", "GppManager");
        }
    }

    public final boolean i() {
        String str;
        Boolean bool = this.f27852p;
        if (bool != null) {
            return bool.booleanValue();
        }
        d();
        if (this.f27841c == null) {
            this.f27841c = o();
        }
        Boolean bool2 = this.f27852p;
        if (bool2 != null) {
            return bool2.booleanValue();
        }
        IabTcfGdprAppliesStatus iabTcfGdprAppliesStatusN = n();
        if (iabTcfGdprAppliesStatusN == IabTcfGdprAppliesStatus.APPLIES) {
            IAlog.a("%sA1.2: GDPR applies - Checking Legacy TCF", "ConfigDataProtectionProvider: ");
            Boolean bool3 = this.f27841c;
            if (bool3 != null && !bool3.booleanValue()) {
                IAlog.a("%sA2: TCF Purpose 1 consent granted - Purpose 1 ENABLED", "ConfigDataProtectionProvider: ");
                this.f27852p = Boolean.FALSE;
                return false;
            }
            IAlog.a("%s%s: TCF Purpose 1 %s - Checking GPP", "ConfigDataProtectionProvider: ", bool3 == null ? "A2.1" : "A2.2", bool3 == null ? "does not exist" : "denied");
            com.fyber.inneractive.sdk.gpp.a aVar = this.n;
            str = aVar.f28464a.get() != null ? aVar.f28465b : null;
            if (str != null && !str.isEmpty() && this.n.a()) {
                IAlog.a("%sA3.2: GppSID contains EU section - Checking GPP PurposeConsents", "ConfigDataProtectionProvider: ");
                return k();
            }
            IAlog.a("%sA.3.3: GppSID missing or no EU section when GDPR applies - BLOCK AD REQUESTS", "ConfigDataProtectionProvider: ");
            this.f27852p = Boolean.TRUE;
            return true;
        }
        boolean z11 = iabTcfGdprAppliesStatusN == IabTcfGdprAppliesStatus.NOT_FOUND;
        IAlog.a("%s%s: gdprApplies key %s, checking GPP", "ConfigDataProtectionProvider: ", z11 ? "A1.1" : "A1", z11 ? "not found" : "is false");
        com.fyber.inneractive.sdk.gpp.a aVar2 = this.n;
        str = aVar2.f28464a.get() != null ? aVar2.f28465b : null;
        if (str != null && !str.isEmpty()) {
            if (this.n.a()) {
                IAlog.a("%sA3.2: GppSID contains EU section - Checking GPP PurposeConsents", "ConfigDataProtectionProvider: ");
                return k();
            }
            IAlog.a("%sA3: GppSID doesn't contain EU section - Purpose 1 ENABLED", "ConfigDataProtectionProvider: ");
            this.f27852p = Boolean.FALSE;
            return false;
        }
        if (!z11 || str != null) {
            IAlog.a("%sA3.1: GppSID empty - Purpose 1 ENABLED", "ConfigDataProtectionProvider: ");
            this.f27852p = Boolean.FALSE;
            return false;
        }
        Integer num = IAConfigManager.Q.f27748f;
        boolean z12 = num != null && num.intValue() == 1;
        this.f27852p = Boolean.valueOf(z12);
        IAlog.a("%sBoth IABTCF_gdprApplies & IABGPP_GppSID are null. x-dt-is-gdpr = %s. Purpose1 disabled = %s", "ConfigDataProtectionProvider: ", num, Boolean.valueOf(z12));
        return z12;
    }

    public final void j() {
        Application application = com.fyber.inneractive.sdk.util.o.f31210a;
        if (application != null) {
            if (this.f27850l == null) {
                this.f27850l = application.getSharedPreferences(application.getPackageName() + "_preferences", 0);
            }
            com.fyber.inneractive.sdk.gpp.a aVar = this.n;
            SharedPreferences sharedPreferences = this.f27850l;
            if (sharedPreferences == null) {
                aVar.getClass();
                IAlog.a("%s defaultSharedPreferences is null, not initializing GppManager", "GppManager");
            } else if (aVar.f28464a.get() == null) {
                aVar.f28464a.set(sharedPreferences);
                aVar.b();
            }
            if (this.f27849k == null) {
                SharedPreferences sharedPreferences2 = application.getSharedPreferences("IAConfigurationPreferences", 0);
                this.f27849k = sharedPreferences2;
                if (sharedPreferences2 == null) {
                    IAlog.a("%sretrievePersistedValues - Shared prefs is null - returning", "ConfigDataProtectionProvider: ");
                } else {
                    this.f27853q.set(sharedPreferences2.getBoolean("invalid_gdpr_applies_flag_event_reported", false));
                }
                SharedPreferences sharedPreferences3 = this.f27849k;
                if (sharedPreferences3 != null) {
                    IAlog.a("%sInitializing privacy content info from shared prefs", "ConfigDataProtectionProvider: ");
                    this.f27841c = o();
                    if (sharedPreferences3.contains("IAGDPRBool")) {
                        this.f27839a = Boolean.valueOf(sharedPreferences3.getBoolean("IAGDPRBool", false));
                    }
                    this.f27840b = m();
                    if (sharedPreferences3.contains("IAGdprConsentData")) {
                        this.f27842d = sharedPreferences3.getString("IAGdprConsentData", null);
                    }
                    this.f27843e = l();
                    if (sharedPreferences3.contains("IACCPAConsentData")) {
                        this.f27846h = sharedPreferences3.getString("IACCPAConsentData", null);
                    }
                    if (sharedPreferences3.contains("IAGdprSource")) {
                        try {
                            this.f27844f = InneractiveAdManager.GdprConsentSource.valueOf(sharedPreferences3.getString("IAGdprSource", InneractiveAdManager.GdprConsentSource.Internal.toString()));
                        } catch (Exception unused) {
                            this.f27844f = InneractiveAdManager.GdprConsentSource.Internal;
                        }
                    }
                    if (sharedPreferences3.contains("IALgpdConsentStatus")) {
                        this.f27847i = Boolean.valueOf(sharedPreferences3.getBoolean("IALgpdConsentStatus", false));
                    }
                    if (sharedPreferences3.contains("keyUserID")) {
                        this.f27845g = sharedPreferences3.getString("keyUserID", null);
                    }
                }
            }
        }
    }

    public final boolean k() {
        com.fyber.inneractive.sdk.tcf.a aVar = this.n.f28466c;
        Boolean boolValueOf = aVar.f31108c ? Boolean.valueOf(aVar.f31112g) : null;
        if (boolValueOf == null || boolValueOf.booleanValue()) {
            IAlog.a("%sA4.1: GPP Purpose 1 %s - BLOCK AD REQUESTS", "ConfigDataProtectionProvider: ", boolValueOf == null ? "does not exist" : "not granted");
            this.f27852p = Boolean.TRUE;
            return true;
        }
        IAlog.a("%sA4: GPP Purpose 1 consent granted - Purpose 1 ENABLED", "ConfigDataProtectionProvider: ");
        this.f27852p = Boolean.FALSE;
        return false;
    }

    public final String l() {
        r rVar;
        SharedPreferences sharedPreferences;
        if (n() == IabTcfGdprAppliesStatus.DOES_NOT_APPLY) {
            IAlog.a("%sGDPR does not apply - returning null for GDPR consent string", "ConfigDataProtectionProvider: ");
            return null;
        }
        v vVar = IAConfigManager.Q.f27761u;
        if (vVar == null || (rVar = vVar.f27936b) == null) {
            IAlog.a("%sGlobal config resolver is null - returning null for GDPR consent string", "ConfigDataProtectionProvider: ");
            return null;
        }
        if (rVar.a("TcfVendorId", 262, Integer.MIN_VALUE) != 0 && (sharedPreferences = this.f27850l) != null && sharedPreferences.contains("IABTCF_TCString")) {
            try {
                return this.f27850l.getString("IABTCF_TCString", null);
            } catch (Exception unused) {
            }
        }
        return null;
    }

    public final Boolean m() {
        r rVar;
        SharedPreferences sharedPreferences;
        if (n() == IabTcfGdprAppliesStatus.DOES_NOT_APPLY) {
            IAlog.a("%sGDPR does not apply - returning null for GDPR consent status", "ConfigDataProtectionProvider: ");
            return null;
        }
        v vVar = IAConfigManager.Q.f27761u;
        if (vVar != null && (rVar = vVar.f27936b) != null) {
            int iA = rVar.a("TcfVendorId", 262, Integer.MIN_VALUE);
            if (iA != 0 && (sharedPreferences = this.f27850l) != null) {
                try {
                    String string = sharedPreferences.getString("IABTCF_VendorConsents", null);
                    if (string == null) {
                        return null;
                    }
                    int i5 = (iA >= 0 ? iA : 262) - 1;
                    return Boolean.valueOf(string.length() > i5 && string.charAt(i5) == '1');
                } catch (Exception unused) {
                }
            }
        }
        return null;
    }

    public final IabTcfGdprAppliesStatus n() {
        Application application;
        IabTcfGdprAppliesStatus iabTcfGdprAppliesStatus = this.o;
        if (iabTcfGdprAppliesStatus != null) {
            return iabTcfGdprAppliesStatus;
        }
        SharedPreferences sharedPreferences = this.f27850l;
        if (sharedPreferences == null) {
            IAlog.a("%sError reading gdprApplies mAppDefaultSharedPrefs is null", "ConfigDataProtectionProvider: ");
            IabTcfGdprAppliesStatus iabTcfGdprAppliesStatus2 = IabTcfGdprAppliesStatus.NOT_FOUND;
            this.o = iabTcfGdprAppliesStatus2;
            return iabTcfGdprAppliesStatus2;
        }
        if (!sharedPreferences.contains("IABTCF_gdprApplies")) {
            IAlog.a("%sReading gdprApplies: key not found", "ConfigDataProtectionProvider: ");
            IabTcfGdprAppliesStatus iabTcfGdprAppliesStatus3 = IabTcfGdprAppliesStatus.NOT_FOUND;
            this.o = iabTcfGdprAppliesStatus3;
            return iabTcfGdprAppliesStatus3;
        }
        try {
            int i5 = this.f27850l.getInt("IABTCF_gdprApplies", -1);
            if (i5 == 1 || i5 == 0) {
                this.o = i5 == 1 ? IabTcfGdprAppliesStatus.APPLIES : IabTcfGdprAppliesStatus.DOES_NOT_APPLY;
                IAlog.a("%sReading gdprApplies: %s", "ConfigDataProtectionProvider: ", Integer.valueOf(i5));
                return this.o;
            }
            IAlog.a("%sgdprApplies exists but its value is invalid, returning it as APPLIES", "ConfigDataProtectionProvider: ");
            this.o = IabTcfGdprAppliesStatus.APPLIES;
            Map<String, ?> all = this.f27850l.getAll();
            Object obj = (all == null || !all.containsKey("IABTCF_gdprApplies")) ? null : all.get("IABTCF_gdprApplies");
            if (obj == null) {
                IAlog.a("%sSkipping reportInvalidGdprAppliesFlagEvent - invalidValue is null", "ConfigDataProtectionProvider: ");
            } else {
                if (this.f27849k == null && (application = com.fyber.inneractive.sdk.util.o.f31210a) != null) {
                    this.f27849k = application.getSharedPreferences("IAConfigurationPreferences", 0);
                }
                if (this.f27849k == null) {
                    IAlog.a("%sSkipping reportInvalidGdprAppliesFlagEvent - mSharedPrefs are null", "ConfigDataProtectionProvider: ");
                } else if (this.f27853q.compareAndSet(false, true)) {
                    c9.q(this.f27849k, "invalid_gdpr_applies_flag_event_reported", true);
                    IAlog.a("%sreportInvalidGdprAppliesFlagEvent - reporting event for invalid value: %s", "ConfigDataProtectionProvider: ", obj);
                    new com.fyber.inneractive.sdk.network.w(com.fyber.inneractive.sdk.network.u.INVALID_GDPR_APPLIES_FLAG, (InneractiveAdRequest) null, (com.fyber.inneractive.sdk.response.e) null).a("cmp_id", f(), "cmp_version", g(), "value", String.valueOf(obj)).a((String) null);
                } else {
                    IAlog.a("%sSkipping reportInvalidGdprAppliesFlagEvent - event already reported", "ConfigDataProtectionProvider: ");
                }
            }
            return this.o;
        } catch (ClassCastException unused) {
            IAlog.a("%sError reading gdprApplies as int, trying to read it as boolean", "ConfigDataProtectionProvider: ");
            try {
                boolean z11 = this.f27850l.getBoolean("IABTCF_gdprApplies", true);
                this.o = z11 ? IabTcfGdprAppliesStatus.APPLIES : IabTcfGdprAppliesStatus.DOES_NOT_APPLY;
                IAlog.a("%sReading gdprApplies: %s", "ConfigDataProtectionProvider: ", Boolean.valueOf(z11));
                return this.o;
            } catch (Exception unused2) {
                IAlog.a("%sError reading gdprApplies as boolean", "ConfigDataProtectionProvider: ");
            }
        }
    }

    public final Boolean o() {
        if (n() == IabTcfGdprAppliesStatus.DOES_NOT_APPLY) {
            IAlog.a("%sGDPR does not apply - returning false for GDPR Purpose1Disabled", "ConfigDataProtectionProvider: ");
            return Boolean.FALSE;
        }
        v vVar = IAConfigManager.Q.f27761u;
        if (vVar != null && vVar.f27936b != null) {
            SharedPreferences sharedPreferences = this.f27850l;
            if (sharedPreferences == null) {
                IAlog.a("%sApp default shared prefs is null - returning null for GDPR Purpose1Disabled", "ConfigDataProtectionProvider: ");
                return null;
            }
            try {
                String string = sharedPreferences.getString("IABTCF_PurposeConsents", null);
                if (string == null || string.isEmpty()) {
                    return null;
                }
                return Boolean.valueOf(string.charAt(0) != '1');
            } catch (Exception unused) {
                IAlog.b("%sException caught when trying to resolveIsIabGdprPurpose1Disabled from prefs", "ConfigDataProtectionProvider: ");
            }
        }
        return null;
    }

    public final void p() {
        Application application;
        if (this.f27849k == null && (application = com.fyber.inneractive.sdk.util.o.f31210a) != null) {
            this.f27849k = application.getSharedPreferences("IAConfigurationPreferences", 0);
        }
        SharedPreferences sharedPreferences = this.f27849k;
        if (sharedPreferences == null) {
            IAlog.a("%sresolvePublisherApiConsentStatus shared prefs are null - returning", "ConfigDataProtectionProvider: ");
            return;
        }
        if (this.f27839a == null && sharedPreferences.contains("IAGDPRBool")) {
            this.f27839a = Boolean.valueOf(this.f27849k.getBoolean("IAGDPRBool", false));
        }
        if (this.f27842d == null && this.f27849k.contains("IAGdprConsentData")) {
            this.f27842d = this.f27849k.getString("IAGdprConsentData", null);
        }
    }

    public final boolean a(String str, String str2) {
        if (com.fyber.inneractive.sdk.util.o.f31210a == null) {
            return false;
        }
        j();
        if (this.f27849k == null) {
            return false;
        }
        IAlog.a("Saving %s value = %s to sharedPrefs", str, str2);
        a2.c.v(this.f27849k, str, str2);
        return true;
    }

    public final void a(String str) {
        if (com.fyber.inneractive.sdk.util.o.f31210a != null) {
            j();
            if (TextUtils.isEmpty(str)) {
                this.f27845g = str;
                SharedPreferences sharedPreferences = this.f27849k;
                if (sharedPreferences != null) {
                    sharedPreferences.edit().remove("keyUserID").apply();
                    return;
                }
                return;
            }
            if (str.length() > 512) {
                str = str.substring(0, EventBridgeChannel.QUEUE_CAPACITY);
            }
            SharedPreferences sharedPreferences2 = this.f27849k;
            if (sharedPreferences2 != null) {
                this.f27845g = str;
                a2.c.v(sharedPreferences2, "keyUserID", str);
            }
        }
    }

    public final void a() {
        IAlog.a("Clearing GDPR Consent String and status", new Object[0]);
        if (com.fyber.inneractive.sdk.util.o.f31210a == null) {
            IAlog.f("ClearGdprConsent was invoked, but the Inneractive SDK was not properly initialized, or destroyed.", new Object[0]);
            return;
        }
        j();
        this.f27839a = null;
        this.f27842d = null;
        SharedPreferences sharedPreferences = this.f27849k;
        if (sharedPreferences != null) {
            sharedPreferences.edit().remove("IAGdprConsentData").remove("IAGDPRBool").remove("IAGdprSource").apply();
        }
    }

    public final Boolean a(Boolean bool) {
        if (this.n.a()) {
            IAlog.a("%sB.4.1: GppSID contains EU section - checking GPP Vendor 262", "ConfigDataProtectionProvider: ");
            com.fyber.inneractive.sdk.tcf.a aVar = this.n.f28466c;
            Boolean boolValueOf = aVar.f31108c ? Boolean.valueOf(aVar.f31111f) : null;
            if (boolValueOf != null && boolValueOf.booleanValue()) {
                IAlog.a("%sB5: GDPR consent granted - GPP Vendor 262 present", "ConfigDataProtectionProvider: ");
                return Boolean.TRUE;
            }
            IAlog.a("%sB5.1: GDPR consent denied - GPP Vendor 262 not present", "ConfigDataProtectionProvider: ");
            return Boolean.FALSE;
        }
        IAlog.a("%s%s: GppSID has no EU section - returning %s", "ConfigDataProtectionProvider: ", bool == null ? "B4" : "B4.2/B4.3", bool == null ? "UNKNOWN" : "DENIED");
        return bool;
    }
}
