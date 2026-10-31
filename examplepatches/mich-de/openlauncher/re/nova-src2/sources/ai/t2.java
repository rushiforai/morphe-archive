package ai;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.text.TextUtils;
import b.kc;
import com.amplitude.android.migration.DatabaseConstants;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.android.gms.internal.measurement.z4;
import com.google.android.gms.internal.measurement.zzdd;
import com.google.android.gms.measurement.internal.zzbf;
import com.google.android.gms.measurement.internal.zzbh;
import com.google.android.gms.measurement.internal.zzoh;
import com.google.android.gms.measurement.internal.zzpl;
import com.google.android.gms.measurement.internal.zzr;
import com.google.common.util.concurrent.ListenableFuture;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.util.TTConst;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.PriorityQueue;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class t2 extends z {

    /* renamed from: c, reason: collision with root package name */
    public p2 f13337c;

    /* renamed from: d, reason: collision with root package name */
    public c2 f13338d;

    /* renamed from: e, reason: collision with root package name */
    public final CopyOnWriteArraySet f13339e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f13340f;

    /* renamed from: g, reason: collision with root package name */
    public final AtomicReference f13341g;

    /* renamed from: h, reason: collision with root package name */
    public final Object f13342h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f13343i;

    /* renamed from: j, reason: collision with root package name */
    public int f13344j;

    /* renamed from: k, reason: collision with root package name */
    public g2 f13345k;

    /* renamed from: l, reason: collision with root package name */
    public g2 f13346l;

    /* renamed from: m, reason: collision with root package name */
    public PriorityQueue f13347m;
    public a2 n;
    public final AtomicLong o;

    /* renamed from: p, reason: collision with root package name */
    public long f13348p;

    /* renamed from: q, reason: collision with root package name */
    public final b1 f13349q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f13350r;

    /* renamed from: s, reason: collision with root package name */
    public g2 f13351s;

    /* renamed from: t, reason: collision with root package name */
    public s2 f13352t;

    /* renamed from: u, reason: collision with root package name */
    public g2 f13353u;

    /* renamed from: v, reason: collision with root package name */
    public final a5.d f13354v;

    public t2(m1 m1Var) {
        super(m1Var);
        this.f13339e = new CopyOnWriteArraySet();
        this.f13342h = new Object();
        this.f13343i = false;
        this.f13344j = 1;
        this.f13350r = true;
        this.f13354v = new a5.d(this, 9);
        this.f13341g = new AtomicReference();
        this.n = a2.f12831c;
        this.f13348p = -1L;
        this.o = new AtomicLong(0L);
        this.f13349q = new b1(m1Var, 3);
    }

    @Override // ai.z
    public final boolean G() {
        return false;
    }

    public final void H(String str, String str2, Bundle bundle) {
        long jElapsedRealtime;
        m1 m1Var = (m1) this.f13368a;
        m1Var.f13143k.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (m1Var.f13136d.O(null, x.f13414e1)) {
            m1Var.f13143k.getClass();
            jElapsedRealtime = SystemClock.elapsedRealtime();
        } else {
            jElapsedRealtime = 0;
        }
        I(str, str2, bundle, true, true, jCurrentTimeMillis, jElapsedRealtime);
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x006c, code lost:
    
        if (r6 > 500) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00a3, code lost:
    
        if (r7 > 500) goto L36;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void I(String str, String str2, Bundle bundle, boolean z11, boolean z12, long j11, long j12) {
        Bundle bundle2 = bundle == null ? new Bundle() : bundle;
        if (!Objects.equals(str2, "screen_view")) {
            boolean z13 = !z12 || this.f13338d == null || p4.h0(str2);
            String str3 = str == null ? "app" : str;
            long j13 = true != ((m1) this.f13368a).f13136d.O(null, x.f13414e1) ? 0L : j12;
            Bundle bundle3 = new Bundle(bundle2);
            for (String str4 : bundle3.keySet()) {
                Object obj = bundle3.get(str4);
                if (obj instanceof Bundle) {
                    bundle3.putBundle(str4, new Bundle((Bundle) obj));
                } else if (obj instanceof Parcelable[]) {
                    Parcelable[] parcelableArr = (Parcelable[]) obj;
                    for (int i5 = 0; i5 < parcelableArr.length; i5++) {
                        Parcelable parcelable = parcelableArr[i5];
                        if (parcelable instanceof Bundle) {
                            parcelableArr[i5] = new Bundle((Bundle) parcelable);
                        }
                    }
                } else if (obj instanceof List) {
                    List list = (List) obj;
                    for (int i11 = 0; i11 < list.size(); i11++) {
                        Object obj2 = list.get(i11);
                        if (obj2 instanceof Bundle) {
                            list.set(i11, new Bundle((Bundle) obj2));
                        }
                    }
                }
            }
            k1 k1Var = ((m1) this.f13368a).f13139g;
            m1.l(k1Var);
            k1Var.M(new l2(this, str3, str2, j11, j13, bundle3, z12, z13, z11));
            return;
        }
        m1 m1Var = (m1) this.f13368a;
        f3 f3Var = m1Var.f13144l;
        m1.k(f3Var);
        long j14 = true != m1Var.f13136d.O(null, x.f13414e1) ? 0L : j12;
        synchronized (f3Var.f12956l) {
            try {
                if (!f3Var.f12955k) {
                    o0 o0Var = ((m1) f3Var.f13368a).f13138f;
                    m1.l(o0Var);
                    o0Var.f13195k.a("Cannot log screen view event when the app is in the background.");
                    return;
                }
                String string = bundle2.getString("screen_name");
                if (string != null) {
                    if (string.length() > 0) {
                        int length = string.length();
                        ((m1) f3Var.f13368a).f13136d.getClass();
                    }
                    o0 o0Var2 = ((m1) f3Var.f13368a).f13138f;
                    m1.l(o0Var2);
                    o0Var2.f13195k.b(Integer.valueOf(string.length()), "Invalid screen name length for screen view. Length");
                    return;
                }
                String string2 = bundle2.getString("screen_class");
                if (string2 != null) {
                    if (string2.length() > 0) {
                        int length2 = string2.length();
                        ((m1) f3Var.f13368a).f13136d.getClass();
                    }
                    o0 o0Var3 = ((m1) f3Var.f13368a).f13138f;
                    m1.l(o0Var3);
                    o0Var3.f13195k.b(Integer.valueOf(string2.length()), "Invalid screen class length for screen view. Length");
                    return;
                }
                if (string2 == null) {
                    zzdd zzddVar = f3Var.f12951g;
                    string2 = zzddVar != null ? f3Var.I(zzddVar.f33309g) : "Activity";
                }
                String str5 = string2;
                b3 b3Var = f3Var.f12947c;
                if (f3Var.f12952h && b3Var != null) {
                    f3Var.f12952h = false;
                    boolean zEquals = Objects.equals(b3Var.f12868b, str5);
                    boolean zEquals2 = Objects.equals(b3Var.f12867a, string);
                    if (zEquals && zEquals2) {
                        o0 o0Var4 = ((m1) f3Var.f13368a).f13138f;
                        m1.l(o0Var4);
                        o0Var4.f13195k.a("Ignoring call to log screen view event with duplicate parameters.");
                        return;
                    }
                }
                m1 m1Var2 = (m1) f3Var.f13368a;
                o0 o0Var5 = m1Var2.f13138f;
                m1.l(o0Var5);
                o0Var5.n.c(string == null ? AbstractJsonLexerKt.NULL : string, "Logging screen view with name, class", str5 == null ? AbstractJsonLexerKt.NULL : str5);
                b3 b3Var2 = f3Var.f12947c == null ? f3Var.f12948d : f3Var.f12947c;
                p4 p4Var = m1Var2.f13141i;
                m1.j(p4Var);
                b3 b3Var3 = new b3(string, str5, p4Var.B0(), true, j11, j14);
                f3Var.f12947c = b3Var3;
                f3Var.f12948d = b3Var2;
                f3Var.f12953i = b3Var3;
                m1Var2.f13143k.getClass();
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                k1 k1Var2 = m1Var2.f13139g;
                m1.l(k1Var2);
                k1Var2.M(new p1(f3Var, bundle2, b3Var3, b3Var2, jElapsedRealtime));
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:125:0x03df  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x03e6  */
    /* JADX WARN: Removed duplicated region for block: B:137:0x042e  */
    /* JADX WARN: Removed duplicated region for block: B:190:0x0568  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x01a0  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x01af  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void J() throws Throwable {
        int i5;
        int i11;
        int i12;
        int i13;
        int i14;
        com.google.android.gms.internal.measurement.j0 j0Var;
        m1 m1Var;
        boolean z11;
        Object obj;
        Object obj2;
        String str;
        String str2;
        Object obj3;
        Object obj4;
        xk.x0 x0VarD;
        String string;
        int i15;
        y3 y3Var;
        String string2;
        String strA;
        t2 t2Var;
        String str3;
        com.google.android.gms.internal.measurement.j0 j0Var2;
        D();
        m1 m1Var2 = (m1) this.f13368a;
        o0 o0Var = m1Var2.f13138f;
        o0 o0Var2 = m1Var2.f13138f;
        m1.l(o0Var);
        o0Var.f13197m.a("Handle tcf update.");
        z0 z0Var = m1Var2.f13137e;
        m1.j(z0Var);
        SharedPreferences sharedPreferencesI = z0Var.I();
        xk.r2 r2Var = a4.f12842a;
        com.google.android.gms.internal.measurement.i0 i0Var = com.google.android.gms.internal.measurement.i0.IAB_TCF_PURPOSE_STORE_AND_ACCESS_INFORMATION_ON_A_DEVICE;
        z3 z3Var = z3.f13519a;
        com.google.android.gms.internal.measurement.i0 i0Var2 = com.google.android.gms.internal.measurement.i0.IAB_TCF_PURPOSE_SELECT_BASIC_ADS;
        z3 z3Var2 = z3.f13520b;
        com.google.android.gms.internal.measurement.i0 i0Var3 = com.google.android.gms.internal.measurement.i0.IAB_TCF_PURPOSE_CREATE_A_PERSONALISED_ADS_PROFILE;
        com.google.android.gms.internal.measurement.i0 i0Var4 = com.google.android.gms.internal.measurement.i0.IAB_TCF_PURPOSE_SELECT_PERSONALISED_ADS;
        com.google.android.gms.internal.measurement.i0 i0Var5 = com.google.android.gms.internal.measurement.i0.IAB_TCF_PURPOSE_MEASURE_AD_PERFORMANCE;
        xk.w2 w2VarK = xk.w2.k(7, new Object[]{i0Var, z3Var, i0Var2, z3Var2, i0Var3, z3Var, i0Var4, z3Var, i0Var5, z3Var2, com.google.android.gms.internal.measurement.i0.IAB_TCF_PURPOSE_APPLY_MARKET_RESEARCH_TO_GENERATE_AUDIENCE_INSIGHTS, z3Var2, com.google.android.gms.internal.measurement.i0.IAB_TCF_PURPOSE_DEVELOP_AND_IMPROVE_PRODUCTS, z3Var2}, null);
        int i16 = xk.d1.f95891c;
        xk.e1 e1Var = new xk.e1("CH");
        char[] cArr = new char[5];
        boolean zContains = sharedPreferencesI.contains("IABTCF_TCString");
        try {
            i5 = sharedPreferencesI.getInt("IABTCF_CmpSdkID", -1);
        } catch (ClassCastException unused) {
            i5 = -1;
        }
        try {
            i11 = sharedPreferencesI.getInt("IABTCF_PolicyVersion", -1);
        } catch (ClassCastException unused2) {
            i11 = -1;
        }
        try {
            i12 = sharedPreferencesI.getInt("IABTCF_gdprApplies", -1);
        } catch (ClassCastException unused3) {
            i12 = -1;
        }
        try {
            i13 = sharedPreferencesI.getInt("IABTCF_PurposeOneTreatment", -1);
        } catch (ClassCastException unused4) {
            i13 = -1;
        }
        int i17 = i11;
        try {
            i14 = sharedPreferencesI.getInt("IABTCF_EnableAdvertiserConsentMode", -1);
        } catch (ClassCastException unused5) {
            i14 = -1;
        }
        String strA2 = a4.a(sharedPreferencesI, "IABTCF_PublisherCC");
        c30.c cVarA = xk.x0.a();
        lh.h it = w2VarK.keySet().iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            j0Var = com.google.android.gms.internal.measurement.j0.PURPOSE_RESTRICTION_UNDEFINED;
            if (!zHasNext) {
                break;
            }
            com.google.android.gms.internal.measurement.i0 i0Var6 = (com.google.android.gms.internal.measurement.i0) it.next();
            boolean z12 = zContains;
            int iZza = i0Var6.zza();
            int i18 = i5;
            xk.e1 e1Var2 = e1Var;
            StringBuilder sb2 = new StringBuilder(String.valueOf(iZza).length() + 28);
            sb2.append("IABTCF_PublisherRestrictions");
            sb2.append(iZza);
            String strA3 = a4.a(sharedPreferencesI, sb2.toString());
            if (TextUtils.isEmpty(strA3) || strA3.length() < 755) {
                j0Var2 = j0Var;
            } else {
                int iDigit = Character.digit(strA3.charAt(754), 10);
                j0Var2 = com.google.android.gms.internal.measurement.j0.PURPOSE_RESTRICTION_NOT_ALLOWED;
                if (iDigit >= 0 && iDigit <= com.google.android.gms.internal.measurement.j0.values().length && iDigit != 0) {
                    if (iDigit == 1) {
                        j0Var = com.google.android.gms.internal.measurement.j0.PURPOSE_RESTRICTION_REQUIRE_CONSENT;
                    } else if (iDigit == 2) {
                        j0Var = com.google.android.gms.internal.measurement.j0.PURPOSE_RESTRICTION_REQUIRE_LEGITIMATE_INTEREST;
                    }
                    j0Var2 = j0Var;
                }
            }
            cVarA.p(i0Var6, j0Var2);
            zContains = z12;
            i5 = i18;
            e1Var = e1Var2;
        }
        boolean z13 = zContains;
        int i19 = i5;
        xk.e1 e1Var3 = e1Var;
        xk.w2 w2VarC = cVarA.c(true);
        String strA4 = a4.a(sharedPreferencesI, "IABTCF_PurposeConsents");
        String strA5 = a4.a(sharedPreferencesI, "IABTCF_VendorConsents");
        boolean z14 = !TextUtils.isEmpty(strA5) && strA5.length() >= 755 && strA5.charAt(754) == '1';
        String strA6 = a4.a(sharedPreferencesI, "IABTCF_PurposeLegitimateInterests");
        String strA7 = a4.a(sharedPreferencesI, "IABTCF_VendorLegitimateInterests");
        if (!TextUtils.isEmpty(strA7)) {
            m1Var = m1Var2;
            if (strA7.length() >= 755 && strA7.charAt(754) == '1') {
                z11 = true;
            }
            cArr[0] = '2';
            if (z13) {
                x0VarD = xk.w2.f96042g;
                obj = "EnableAdvertiserConsentMode";
                obj3 = "gdprApplies";
                obj2 = "Version";
                obj4 = "CmpSdkID";
                str2 = "1";
                str = "0";
            } else {
                com.google.android.gms.internal.measurement.j0 j0Var3 = (com.google.android.gms.internal.measurement.j0) w2VarC.get(i0Var);
                com.google.android.gms.internal.measurement.j0 j0Var4 = (com.google.android.gms.internal.measurement.j0) w2VarC.get(i0Var3);
                com.google.android.gms.internal.measurement.j0 j0Var5 = (com.google.android.gms.internal.measurement.j0) w2VarC.get(i0Var4);
                com.google.android.gms.internal.measurement.j0 j0Var6 = (com.google.android.gms.internal.measurement.j0) w2VarC.get(i0Var5);
                c30.c cVarA2 = xk.x0.a();
                cVarA2.p("Version", "2");
                boolean z15 = z14;
                cVarA2.p("VendorConsent", true != z14 ? "0" : "1");
                boolean z16 = z11;
                cVarA2.p("VendorLegitimateInterest", true != z11 ? "0" : "1");
                cVarA2.p("gdprApplies", i12 != 1 ? "0" : "1");
                cVarA2.p("EnableAdvertiserConsentMode", i14 != 1 ? "0" : "1");
                cVarA2.p("PolicyVersion", String.valueOf(i17));
                cVarA2.p("CmpSdkID", String.valueOf(i19));
                cVarA2.p("PurposeOneTreatment", i13 != 1 ? "0" : "1");
                cVarA2.p("PublisherCC", strA2);
                cVarA2.p("PublisherRestrictions1", String.valueOf(j0Var3 != null ? j0Var3.zza() : j0Var.zza()));
                cVarA2.p("PublisherRestrictions3", String.valueOf(j0Var4 != null ? j0Var4.zza() : j0Var.zza()));
                cVarA2.p("PublisherRestrictions4", String.valueOf(j0Var5 != null ? j0Var5.zza() : j0Var.zza()));
                cVarA2.p("PublisherRestrictions7", String.valueOf(j0Var6 != null ? j0Var6.zza() : j0Var.zza()));
                String strD = a4.d(i0Var, strA4, strA6);
                int i21 = i12;
                String strD2 = a4.d(i0Var3, strA4, strA6);
                String strD3 = a4.d(i0Var4, strA4, strA6);
                String strD4 = a4.d(i0Var5, strA4, strA6);
                w20.e.d("Purpose1", strD);
                w20.e.d("Purpose3", strD2);
                w20.e.d("Purpose4", strD3);
                w20.e.d("Purpose7", strD4);
                c30.c cVarR = cVarA2.r(xk.w2.k(4, new Object[]{"Purpose1", strD, "Purpose3", strD2, "Purpose4", strD3, "Purpose7", strD4}, null));
                obj = "EnableAdvertiserConsentMode";
                obj2 = "Version";
                str = "0";
                str2 = "1";
                int i22 = i13;
                obj3 = "gdprApplies";
                obj4 = "CmpSdkID";
                String str4 = true != a4.b(i0Var, w2VarK, w2VarC, e1Var3, cArr, i14, i21, i22, strA2, strA4, strA6, z15, z16) ? str : str2;
                int i23 = i14;
                x0VarD = cVarR.r(xk.w2.k(5, new Object[]{"AuthorizePurpose1", str4, "AuthorizePurpose3", true != a4.b(i0Var3, w2VarK, w2VarC, e1Var3, cArr, i23, i21, i22, strA2, strA4, strA6, z15, z16) ? str : str2, "AuthorizePurpose4", true != a4.b(i0Var4, w2VarK, w2VarC, e1Var3, cArr, i23, i21, i22, strA2, strA4, strA6, z15, z16) ? str : str2, "AuthorizePurpose7", true != a4.b(i0Var5, w2VarK, w2VarC, e1Var3, cArr, i23, i21, i22, strA2, strA4, strA6, z15, z16) ? str : str2, "PurposeDiagnostics", new String(cArr)}, null)).d();
            }
            y3 y3Var2 = new y3(x0VarD);
            m1.l(o0Var2);
            o0Var2.n.b(y3Var2, "Tcf preferences read");
            z0Var.D();
            string = z0Var.H().getString("stored_tcf_param", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            HashMap map = new HashMap();
            if (TextUtils.isEmpty(string)) {
                for (String str5 : string.split(";")) {
                    String[] strArrSplit = str5.split("=");
                    if (strArrSplit.length >= 2 && a4.f12842a.contains(strArrSplit[0])) {
                        map.put(strArrSplit[0], strArrSplit[1]);
                    }
                }
                i15 = 2;
                y3Var = new y3(map);
            } else {
                y3Var = new y3(map);
                i15 = 2;
            }
            z0Var.D();
            string2 = z0Var.H().getString("stored_tcf_param", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            strA = y3Var2.a();
            if (strA.equals(string2)) {
                SharedPreferences.Editor editorEdit = z0Var.H().edit();
                editorEdit.putString("stored_tcf_param", strA);
                editorEdit.apply();
                Bundle bundleB = y3Var2.b();
                m1.l(o0Var2);
                o0Var2.n.b(bundleB, "Consent generated from Tcf");
                if (bundleB != Bundle.EMPTY) {
                    m1Var.f13143k.getClass();
                    t2Var = this;
                    t2Var.X(bundleB, -30, System.currentTimeMillis());
                } else {
                    t2Var = this;
                }
                Bundle bundle = new Bundle();
                HashMap map2 = y3Var.f13483a;
                String str6 = (map2.isEmpty() || ((String) map2.get(obj2)) != null) ? str : str2;
                Bundle bundleB2 = y3Var2.b();
                Bundle bundleB3 = y3Var.b();
                bundle.putString("_tcfm", str6.concat((bundleB2.size() == bundleB3.size() && Objects.equals(bundleB2.getString("ad_storage"), bundleB3.getString("ad_storage")) && Objects.equals(bundleB2.getString("ad_personalization"), bundleB3.getString("ad_personalization")) && Objects.equals(bundleB2.getString("ad_user_data"), bundleB3.getString("ad_user_data"))) ? str : str2));
                HashMap map3 = y3Var2.f13483a;
                String str7 = (String) map3.get("PurposeDiagnostics");
                if (TextUtils.isEmpty(str7)) {
                    str7 = "200000";
                }
                bundle.putString("_tcfd2", str7);
                StringBuilder sb3 = new StringBuilder(str2);
                try {
                    str3 = (String) map3.get(obj4);
                } catch (NumberFormatException unused6) {
                }
                int i24 = !TextUtils.isEmpty(str3) ? Integer.parseInt(str3) : -1;
                if (i24 < 0 || i24 > 4095) {
                    sb3.append("00");
                } else {
                    sb3.append("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_".charAt(i24 >> 6));
                    sb3.append("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_".charAt(i24 & 63));
                }
                int iC = y3Var2.c();
                if (iC < 0 || iC > 63) {
                    sb3.append(str);
                } else {
                    sb3.append("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_".charAt(iC));
                }
                int i25 = true == str2.equals(map3.get(obj3)) ? i15 : 0;
                int i26 = i25 | 4;
                if (str2.equals(map3.get(obj))) {
                    i26 = i25 | 12;
                }
                sb3.append("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_".charAt(i26));
                bundle.putString("_tcfd", sb3.toString());
                t2Var.K(TTConst.TRACK_TYPE_AUTO, "_tcf", bundle);
                return;
            }
            return;
        }
        m1Var = m1Var2;
        z11 = false;
        cArr[0] = '2';
        if (z13) {
        }
        y3 y3Var22 = new y3(x0VarD);
        m1.l(o0Var2);
        o0Var2.n.b(y3Var22, "Tcf preferences read");
        z0Var.D();
        string = z0Var.H().getString("stored_tcf_param", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        HashMap map4 = new HashMap();
        if (TextUtils.isEmpty(string)) {
        }
        z0Var.D();
        string2 = z0Var.H().getString("stored_tcf_param", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        strA = y3Var22.a();
        if (strA.equals(string2)) {
        }
    }

    public final void K(String str, String str2, Bundle bundle) {
        long jElapsedRealtime;
        D();
        m1 m1Var = (m1) this.f13368a;
        m1Var.f13143k.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (m1Var.f13136d.O(null, x.f13414e1)) {
            m1Var.f13143k.getClass();
            jElapsedRealtime = SystemClock.elapsedRealtime();
        } else {
            jElapsedRealtime = 0;
        }
        L(jCurrentTimeMillis, jElapsedRealtime, bundle, str, str2);
    }

    public final void L(long j11, long j12, Bundle bundle, String str, String str2) {
        D();
        boolean z11 = true;
        if (this.f13338d != null && !p4.h0(str2)) {
            z11 = false;
        }
        M(str, str2, j11, j12, bundle, true, z11, true);
    }

    /* JADX WARN: Removed duplicated region for block: B:58:0x013c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void M(String str, String str2, long j11, long j12, Bundle bundle, boolean z11, boolean z12, boolean z13) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        t2 t2Var;
        z0 z0Var;
        xg.a aVar;
        e eVar;
        String str3;
        z0 z0Var2;
        a5.d dVar;
        boolean z14;
        f3 f3Var;
        z0 z0Var3;
        long j13;
        boolean zC;
        ArrayList arrayList;
        Bundle[] bundleArr;
        String str4;
        f3 f3Var2;
        long j14;
        int i5;
        long j15;
        long j16;
        boolean zK;
        Bundle[] bundleArr2;
        int i11;
        sg.w.e(str);
        sg.w.h(bundle);
        D();
        E();
        m1 m1Var = (m1) this.f13368a;
        boolean zF = m1Var.f();
        x3 x3Var = m1Var.f13140h;
        e eVar2 = m1Var.f13136d;
        Context context = m1Var.f13133a;
        p4 p4Var = m1Var.f13141i;
        o0 o0Var = m1Var.f13138f;
        if (!zF) {
            m1.l(o0Var);
            o0Var.f13197m.a("Event not sent since app measurement is disabled");
            return;
        }
        List list = m1Var.q().f12937k;
        if (list != null && !list.contains(str2)) {
            m1.l(o0Var);
            o0Var.f13197m.c(str2, "Dropping non-safelisted event. event name, origin", str);
            return;
        }
        if (!this.f13340f) {
            this.f13340f = true;
            try {
                try {
                    (!m1Var.f13134b ? Class.forName("com.google.android.gms.tagmanager.TagManagerService", true, context.getClassLoader()) : Class.forName("com.google.android.gms.tagmanager.TagManagerService")).getDeclaredMethod("initialize", Context.class).invoke(null, context);
                } catch (Exception e3) {
                    m1.l(o0Var);
                    o0Var.f13193i.b(e3, "Failed to invoke Tag Manager's initialize() method");
                }
            } catch (ClassNotFoundException unused) {
                m1.l(o0Var);
                o0Var.f13196l.a("Tag Manager is not found and thus will not be used");
            }
        }
        i0 i0Var = m1Var.f13142j;
        z0 z0Var4 = m1Var.f13137e;
        xg.a aVar2 = m1Var.f13143k;
        if (!eVar2.O(null, x.Z0) && "_cmp".equals(str2) && bundle.containsKey("gclid")) {
            String string = bundle.getString("gclid");
            aVar2.getClass();
            z0Var = z0Var4;
            aVar = aVar2;
            eVar = eVar2;
            str3 = null;
            O(System.currentTimeMillis(), string, TTConst.TRACK_TYPE_AUTO, "_lgclid");
            t2Var = this;
        } else {
            t2Var = this;
            z0Var = z0Var4;
            aVar = aVar2;
            eVar = eVar2;
            str3 = null;
        }
        if (!z11 || p4.f13238j[0].equals(str2)) {
            z0Var2 = z0Var;
        } else {
            m1.j(p4Var);
            m1.j(z0Var);
            z0Var2 = z0Var;
            p4Var.Q(bundle, z0Var2.f13506y.J0());
        }
        a5.d dVar2 = t2Var.f13354v;
        if (z13 || "_iap".equals(str2)) {
            dVar = dVar2;
        } else {
            m1.j(p4Var);
            int i12 = 2;
            if (p4Var.G0(DatabaseConstants.EVENT_FIELD, str2)) {
                dVar = dVar2;
                if (p4Var.I0(DatabaseConstants.EVENT_FIELD, b2.f12854a, ((m1) p4Var.f13368a).f13136d.O(str3, x.f13417f1) ? b2.f12856c : b2.f12855b, str2)) {
                    i11 = 40;
                    if (p4Var.J0(40, DatabaseConstants.EVENT_FIELD, str2)) {
                        i12 = 0;
                    }
                    if (i12 != 0) {
                        m1.l(o0Var);
                        o0Var.f13192h.b(i0Var.a(str2), "Invalid public event name. Event will not be logged (FE)");
                        m1.j(p4Var);
                        p4.V(dVar, null, i12, "_ev", p4.K(i11, str2, true), str2 != null ? str2.length() : 0);
                        return;
                    }
                } else {
                    i12 = 13;
                }
            } else {
                dVar = dVar2;
            }
            i11 = 40;
            if (i12 != 0) {
            }
        }
        f3 f3Var3 = m1Var.f13144l;
        m1.k(f3Var3);
        b3 b3VarH = f3Var3.H(false);
        if (b3VarH != null && !bundle.containsKey("_sc")) {
            b3VarH.f12870d = true;
        }
        p4.z0(b3VarH, bundle, z11 && !z13);
        boolean zEquals = "am".equals(str);
        boolean zH0 = p4.h0(str2);
        if (!z11 || t2Var.f13338d == null || zH0) {
            z14 = zEquals;
        } else {
            if (!zEquals) {
                m1.l(o0Var);
                o0Var.f13197m.c(i0Var.a(str2), "Passing event to registered event handler (FE)", i0Var.e(bundle));
                sg.w.h(t2Var.f13338d);
                ((c10.a) t2Var.f13338d).y(str, str2, bundle, j11);
                return;
            }
            z14 = true;
        }
        if (m1Var.h()) {
            m1.j(p4Var);
            m1 m1Var2 = (m1) p4Var.f13368a;
            int iK0 = p4Var.K0(str2);
            if (iK0 != 0) {
                m1.l(o0Var);
                o0Var.f13192h.b(i0Var.a(str2), "Invalid event name. Event will not be logged (FE)");
                String strK = p4.K(40, str2, true);
                int length = str2 != null ? str2.length() : 0;
                m1.j(p4Var);
                p4.V(dVar, null, iK0, "_ev", strK, length);
                return;
            }
            boolean z15 = z14;
            Bundle bundleN = p4Var.N(str2, bundle, p6.a1.k("_o", "_sn", "_sc", "_si"), z13);
            sg.w.h(bundleN);
            m1.k(f3Var3);
            if (f3Var3.H(false) == null || !"_ae".equals(str2)) {
                f3Var = f3Var3;
                z0Var3 = z0Var2;
                j13 = 0;
            } else {
                m1.k(x3Var);
                w3 w3Var = x3Var.f13471f;
                ((m1) ((x3) w3Var.f13399d).f13368a).f13143k.getClass();
                j13 = 0;
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                f3Var = f3Var3;
                z0Var3 = z0Var2;
                long j17 = jElapsedRealtime - w3Var.f13397b;
                w3Var.f13397b = jElapsedRealtime;
                if (j17 > 0) {
                    p4Var.p0(bundleN, j17);
                }
            }
            if (!TTConst.TRACK_TYPE_AUTO.equals(str) && "_ssr".equals(str2)) {
                String string2 = bundleN.getString("_ffr");
                int i13 = xg.c.f95837a;
                if (string2 == null || string2.trim().isEmpty()) {
                    string2 = null;
                } else if (string2 != null) {
                    string2 = string2.trim();
                }
                z0 z0Var5 = m1Var2.f13137e;
                m1.j(z0Var5);
                if (Objects.equals(string2, z0Var5.f13503v.R())) {
                    o0 o0Var2 = m1Var2.f13138f;
                    m1.l(o0Var2);
                    o0Var2.f13197m.a("Not logging duplicate session_start_with_rollout event");
                    return;
                } else {
                    z0 z0Var6 = m1Var2.f13137e;
                    m1.j(z0Var6);
                    z0Var6.f13503v.S(string2);
                }
            } else if ("_ae".equals(str2)) {
                z0 z0Var7 = m1Var2.f13137e;
                m1.j(z0Var7);
                String strR = z0Var7.f13503v.R();
                if (!TextUtils.isEmpty(strR)) {
                    bundleN.putString("_ffr", strR);
                }
            }
            ArrayList arrayList2 = new ArrayList();
            arrayList2.add(bundleN);
            if (eVar.O(null, x.S0)) {
                m1.k(x3Var);
                x3Var.D();
                zC = x3Var.f13469d;
            } else {
                m1.j(z0Var3);
                zC = z0Var3.f13500s.c();
            }
            m1.j(z0Var3);
            if (z0Var3.f13497p.f() > j13 && z0Var3.M(j11) && zC) {
                m1.l(o0Var);
                o0Var.n.a("Current session is expired, remove the session number, ID, and engagement time");
                aVar.getClass();
                str4 = "_ae";
                f3Var2 = f3Var;
                bundleArr = null;
                j14 = j13;
                i5 = 0;
                arrayList = arrayList2;
                z0 z0Var8 = z0Var3;
                j15 = j11;
                O(System.currentTimeMillis(), null, TTConst.TRACK_TYPE_AUTO, "_sid");
                aVar.getClass();
                O(System.currentTimeMillis(), null, TTConst.TRACK_TYPE_AUTO, "_sno");
                aVar.getClass();
                O(System.currentTimeMillis(), null, TTConst.TRACK_TYPE_AUTO, "_se");
                z0Var8.f13498q.g(j14);
            } else {
                arrayList = arrayList2;
                bundleArr = null;
                str4 = "_ae";
                f3Var2 = f3Var;
                j14 = j13;
                i5 = 0;
                j15 = j11;
            }
            if (bundleN.getLong("extend_session", j14) == 1) {
                m1.l(o0Var);
                o0Var.n.a("EXTEND_SESSION param attached: initiate a new session or extend the current active session");
                m1.k(x3Var);
                j16 = j12;
                x3Var.f13470e.M(j15, j16);
            } else {
                j16 = j12;
            }
            ArrayList arrayList3 = new ArrayList(bundleN.keySet());
            Collections.sort(arrayList3);
            int size = arrayList3.size();
            for (int i14 = i5; i14 < size; i14++) {
                String str5 = (String) arrayList3.get(i14);
                if (str5 != null) {
                    m1.j(p4Var);
                    Object obj = bundleN.get(str5);
                    if (obj instanceof Bundle) {
                        Bundle[] bundleArr3 = new Bundle[1];
                        bundleArr3[i5] = (Bundle) obj;
                        bundleArr2 = bundleArr3;
                    } else if (obj instanceof Parcelable[]) {
                        Parcelable[] parcelableArr = (Parcelable[]) obj;
                        bundleArr2 = (Bundle[]) Arrays.copyOf(parcelableArr, parcelableArr.length, Bundle[].class);
                    } else if (obj instanceof ArrayList) {
                        ArrayList arrayList4 = (ArrayList) obj;
                        bundleArr2 = (Bundle[]) arrayList4.toArray(new Bundle[arrayList4.size()]);
                    } else {
                        bundleArr2 = bundleArr;
                    }
                    if (bundleArr2 != null) {
                        bundleN.putParcelableArray(str5, bundleArr2);
                    }
                }
            }
            int i15 = i5;
            while (i15 < arrayList.size()) {
                ArrayList arrayList5 = arrayList;
                Bundle bundleJ0 = (Bundle) arrayList5.get(i15);
                String str6 = i15 != 0 ? "_ep" : str2;
                bundleJ0.putString("_o", str);
                if (z12) {
                    bundleJ0 = p4Var.j0(bundleJ0);
                }
                Bundle bundle2 = bundleJ0;
                zzbh zzbhVar = new zzbh(str6, new zzbf(bundleJ0), str, j15, j16);
                p3 p3VarO = m1Var.o();
                p3VarO.getClass();
                p3VarO.D();
                p3VarO.E();
                p3VarO.P();
                h0 h0VarN = ((m1) p3VarO.f13368a).n();
                h0VarN.getClass();
                Parcel parcelObtain = Parcel.obtain();
                ab.w.a(zzbhVar, parcelObtain, i5);
                byte[] bArrMarshall = parcelObtain.marshall();
                parcelObtain.recycle();
                if (bArrMarshall.length > 131072) {
                    o0 o0Var3 = ((m1) h0VarN.f13368a).f13138f;
                    m1.l(o0Var3);
                    o0Var3.f13191g.a("Event is too long for local database. Sending event directly to service");
                    zK = false;
                } else {
                    zK = h0VarN.K(0, bArrMarshall);
                }
                p3VarO.R(new j3(p3VarO, p3VarO.T(true), zK, zzbhVar, 1));
                if (!z15) {
                    Iterator it = this.f13339e.iterator();
                    while (it.hasNext()) {
                        ((d2) it.next()).a(str, str2, new Bundle(bundle2), j11);
                    }
                }
                i15++;
                j15 = j11;
                j16 = j12;
                arrayList = arrayList5;
                i5 = 0;
            }
            m1.k(f3Var2);
            if (f3Var2.H(false) == null || !str4.equals(str2)) {
                return;
            }
            m1.k(x3Var);
            aVar.getClass();
            x3Var.f13471f.i(SystemClock.elapsedRealtime(), true, true);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0021  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void N(String str, String str2, Object obj, boolean z11, long j11) {
        int iM0;
        int length;
        m1 m1Var = (m1) this.f13368a;
        if (z11) {
            p4 p4Var = m1Var.f13141i;
            m1.j(p4Var);
            iM0 = p4Var.M0(str2);
        } else {
            p4 p4Var2 = m1Var.f13141i;
            m1.j(p4Var2);
            if (p4Var2.G0("user property", str2)) {
                if (p4Var2.I0("user property", b2.f12865l, null, str2)) {
                    ((m1) p4Var2.f13368a).getClass();
                    iM0 = !p4Var2.J0(24, "user property", str2) ? 6 : 0;
                } else {
                    iM0 = 15;
                }
            }
        }
        a5.d dVar = this.f13354v;
        if (iM0 != 0) {
            m1.j(m1Var.f13141i);
            String strK = p4.K(24, str2, true);
            length = str2 != null ? str2.length() : 0;
            m1.j(m1Var.f13141i);
            p4.V(dVar, null, iM0, "_ev", strK, length);
            return;
        }
        String str3 = str == null ? "app" : str;
        if (obj == null) {
            k1 k1Var = m1Var.f13139g;
            m1.l(k1Var);
            k1Var.M(new p1(this, str3, str2, null, j11, 1));
            return;
        }
        p4 p4Var3 = m1Var.f13141i;
        m1.j(p4Var3);
        int iS = p4Var3.S(obj, str2);
        if (iS != 0) {
            m1.j(p4Var3);
            String strK2 = p4.K(24, str2, true);
            length = ((obj instanceof String) || (obj instanceof CharSequence)) ? obj.toString().length() : 0;
            m1.j(m1Var.f13141i);
            p4.V(dVar, null, iS, "_ev", strK2, length);
            return;
        }
        m1.j(p4Var3);
        Object objT = p4Var3.T(obj, str2);
        if (objT != null) {
            k1 k1Var2 = m1Var.f13139g;
            m1.l(k1Var2);
            k1Var2.M(new p1(this, str3, str2, objT, j11, 1));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0057  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void O(long j11, Object obj, String str, String str2) {
        String str3;
        boolean zK;
        Object objValueOf = obj;
        m1 m1Var = (m1) this.f13368a;
        sg.w.e(str);
        sg.w.e(str2);
        D();
        E();
        if ("allow_personalized_ads".equals(str2)) {
            String str4 = "_npa";
            if (objValueOf instanceof String) {
                String str5 = (String) objValueOf;
                if (!TextUtils.isEmpty(str5)) {
                    long j12 = true != "false".equals(str5.toLowerCase(Locale.ENGLISH)) ? 0L : 1L;
                    objValueOf = Long.valueOf(j12);
                    z0 z0Var = m1Var.f13137e;
                    m1.j(z0Var);
                    z0Var.f13496m.S(j12 == 1 ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
                } else if (objValueOf == null) {
                    z0 z0Var2 = m1Var.f13137e;
                    m1.j(z0Var2);
                    z0Var2.f13496m.S("unset");
                } else {
                    str4 = str2;
                }
                o0 o0Var = m1Var.f13138f;
                m1.l(o0Var);
                o0Var.n.c("non_personalized_ads(_npa)", "Setting user property(FE)", objValueOf);
                str3 = str4;
            }
        } else {
            str3 = str2;
        }
        Object obj2 = objValueOf;
        if (!m1Var.f()) {
            o0 o0Var2 = m1Var.f13138f;
            m1.l(o0Var2);
            o0Var2.n.a("User property not set since app measurement is disabled");
            return;
        }
        if (m1Var.h()) {
            zzpl zzplVar = new zzpl(j11, obj2, str3, str);
            p3 p3VarO = m1Var.o();
            p3VarO.D();
            p3VarO.E();
            p3VarO.P();
            h0 h0VarN = ((m1) p3VarO.f13368a).n();
            h0VarN.getClass();
            Parcel parcelObtain = Parcel.obtain();
            ab.w.b(zzplVar, parcelObtain);
            byte[] bArrMarshall = parcelObtain.marshall();
            parcelObtain.recycle();
            if (bArrMarshall.length > 131072) {
                o0 o0Var3 = ((m1) h0VarN.f13368a).f13138f;
                m1.l(o0Var3);
                o0Var3.f13191g.a("User property too long for local database. Sending directly to service");
                zK = false;
            } else {
                zK = h0VarN.K(1, bArrMarshall);
            }
            p3VarO.R(new j3(p3VarO, p3VarO.T(true), zK, zzplVar, 0));
        }
    }

    public final void P() {
        D();
        E();
        m1 m1Var = (m1) this.f13368a;
        if (m1Var.h()) {
            e eVar = m1Var.f13136d;
            ((m1) eVar.f13368a).getClass();
            Boolean boolQ = eVar.Q("google_analytics_deferred_deep_link_enabled");
            if (boolQ != null && boolQ.booleanValue()) {
                o0 o0Var = m1Var.f13138f;
                m1.l(o0Var);
                o0Var.f13197m.a("Deferred Deep Link feature enabled.");
                k1 k1Var = m1Var.f13139g;
                m1.l(k1Var);
                k1Var.M(new f2(this, 2));
            }
            p3 p3VarO = m1Var.o();
            p3VarO.D();
            p3VarO.E();
            zzr zzrVarT = p3VarO.T(true);
            p3VarO.P();
            m1 m1Var2 = (m1) p3VarO.f13368a;
            m1Var2.f13136d.O(null, x.W0);
            m1Var2.n().K(3, new byte[0]);
            p3VarO.R(new k3(p3VarO, zzrVarT, 1));
            this.f13350r = false;
            z0 z0Var = m1Var.f13137e;
            m1.j(z0Var);
            z0Var.D();
            String string = z0Var.H().getString("previous_os_version", null);
            ((m1) z0Var.f13368a).p().F();
            String str = Build.VERSION.RELEASE;
            if (!TextUtils.isEmpty(str) && !str.equals(string)) {
                SharedPreferences.Editor editorEdit = z0Var.H().edit();
                editorEdit.putString("previous_os_version", str);
                editorEdit.apply();
            }
            if (TextUtils.isEmpty(string)) {
                return;
            }
            m1Var.p().F();
            if (string.equals(str)) {
                return;
            }
            Bundle bundle = new Bundle();
            bundle.putString("_po", string);
            K(TTConst.TRACK_TYPE_AUTO, "_ou", bundle);
        }
    }

    public final void Q(Bundle bundle, long j11) {
        m1 m1Var = (m1) this.f13368a;
        sg.w.h(bundle);
        Bundle bundle2 = new Bundle(bundle);
        if (!TextUtils.isEmpty(bundle2.getString("app_id"))) {
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            o0Var.f13193i.a("Package name should be null when calling setConditionalUserProperty");
        }
        bundle2.remove("app_id");
        b2.e(bundle2, "app_id", String.class, null);
        b2.e(bundle2, "origin", String.class, null);
        b2.e(bundle2, PendingUpgradeStore.KEY_NAME, String.class, null);
        b2.e(bundle2, "value", Object.class, null);
        b2.e(bundle2, "trigger_event_name", String.class, null);
        b2.e(bundle2, "trigger_timeout", Long.class, 0L);
        b2.e(bundle2, "timed_out_event_name", String.class, null);
        b2.e(bundle2, "timed_out_event_params", Bundle.class, null);
        b2.e(bundle2, "triggered_event_name", String.class, null);
        b2.e(bundle2, "triggered_event_params", Bundle.class, null);
        b2.e(bundle2, "time_to_live", Long.class, 0L);
        b2.e(bundle2, "expired_event_name", String.class, null);
        b2.e(bundle2, "expired_event_params", Bundle.class, null);
        sg.w.e(bundle2.getString(PendingUpgradeStore.KEY_NAME));
        sg.w.e(bundle2.getString("origin"));
        sg.w.h(bundle2.get("value"));
        bundle2.putLong("creation_timestamp", j11);
        String string = bundle2.getString(PendingUpgradeStore.KEY_NAME);
        Object obj = bundle2.get("value");
        p4 p4Var = m1Var.f13141i;
        i0 i0Var = m1Var.f13142j;
        o0 o0Var2 = m1Var.f13138f;
        m1.j(p4Var);
        if (p4Var.M0(string) != 0) {
            m1.l(o0Var2);
            o0Var2.f13190f.b(i0Var.c(string), "Invalid conditional user property name");
            return;
        }
        m1.j(p4Var);
        if (p4Var.S(obj, string) != 0) {
            m1.l(o0Var2);
            o0Var2.f13190f.c(i0Var.c(string), "Invalid conditional user property value", obj);
            return;
        }
        Object objT = p4Var.T(obj, string);
        if (objT == null) {
            m1.l(o0Var2);
            o0Var2.f13190f.c(i0Var.c(string), "Unable to normalize conditional user property value", obj);
            return;
        }
        b2.d(bundle2, objT);
        long j12 = bundle2.getLong("trigger_timeout");
        if (!TextUtils.isEmpty(bundle2.getString("trigger_event_name")) && (j12 > 15552000000L || j12 < 1)) {
            m1.l(o0Var2);
            o0Var2.f13190f.c(i0Var.c(string), "Invalid conditional user property timeout", Long.valueOf(j12));
            return;
        }
        long j13 = bundle2.getLong("time_to_live");
        if (j13 > 15552000000L || j13 < 1) {
            m1.l(o0Var2);
            o0Var2.f13190f.c(i0Var.c(string), "Invalid conditional user property time to live", Long.valueOf(j13));
        } else {
            k1 k1Var = m1Var.f13139g;
            m1.l(k1Var);
            k1Var.M(new n2(this, bundle2, 0));
        }
    }

    public final void R(String str, String str2, Bundle bundle) {
        m1 m1Var = (m1) this.f13368a;
        m1Var.f13143k.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        sg.w.e(str);
        Bundle bundle2 = new Bundle();
        bundle2.putString(PendingUpgradeStore.KEY_NAME, str);
        bundle2.putLong("creation_timestamp", jCurrentTimeMillis);
        if (str2 != null) {
            bundle2.putString("expired_event_name", str2);
            bundle2.putBundle("expired_event_params", bundle);
        }
        k1 k1Var = m1Var.f13139g;
        m1.l(k1Var);
        k1Var.M(new n2(this, bundle2, 1));
    }

    public final String S() {
        m1 m1Var = (m1) this.f13368a;
        try {
            return b2.b(m1Var.f13133a, m1Var.f13146p);
        } catch (IllegalStateException e3) {
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            o0Var.f13190f.b(e3, "getGoogleAppId failed with exception");
            return null;
        }
    }

    public final void T(a2 a2Var, long j11, boolean z11) {
        int i5 = a2Var.f12833b;
        D();
        E();
        m1 m1Var = (m1) this.f13368a;
        z0 z0Var = m1Var.f13137e;
        o0 o0Var = m1Var.f13138f;
        m1.j(z0Var);
        a2 a2VarK = z0Var.K();
        if (j11 <= this.f13348p && a2.l(a2VarK.f12833b, i5)) {
            m1.l(o0Var);
            o0Var.f13196l.b(a2Var, "Dropped out-of-date consent setting, proposed settings");
            return;
        }
        z0 z0Var2 = m1Var.f13137e;
        m1.j(z0Var2);
        z0Var2.D();
        if (!a2.l(i5, z0Var2.H().getInt("consent_source", 100))) {
            m1.l(o0Var);
            o0Var.f13196l.b(Integer.valueOf(i5), "Lower precedence consent source ignored, proposed source");
            return;
        }
        SharedPreferences.Editor editorEdit = z0Var2.H().edit();
        editorEdit.putString("consent_settings", a2Var.g());
        editorEdit.putInt("consent_source", i5);
        editorEdit.apply();
        m1.l(o0Var);
        o0Var.n.b(a2Var, "Setting storage consent(FE)");
        this.f13348p = j11;
        if (m1Var.o().N()) {
            p3 p3VarO = m1Var.o();
            p3VarO.D();
            p3VarO.E();
            p3VarO.R(new n3(p3VarO, 2));
        } else {
            p3 p3VarO2 = m1Var.o();
            p3VarO2.D();
            p3VarO2.E();
            if (p3VarO2.M()) {
                p3VarO2.R(new k3(p3VarO2, p3VarO2.T(false)));
            }
        }
        if (z11) {
            m1Var.o().H(new AtomicReference());
        }
    }

    public final void U(Boolean bool, boolean z11) {
        D();
        E();
        m1 m1Var = (m1) this.f13368a;
        o0 o0Var = m1Var.f13138f;
        m1.l(o0Var);
        o0Var.f13197m.b(bool, "Setting app measurement enabled (FE)");
        z0 z0Var = m1Var.f13137e;
        m1.j(z0Var);
        z0Var.D();
        SharedPreferences.Editor editorEdit = z0Var.H().edit();
        if (bool != null) {
            editorEdit.putBoolean("measurement_enabled", bool.booleanValue());
        } else {
            editorEdit.remove("measurement_enabled");
        }
        editorEdit.apply();
        if (z11) {
            z0Var.D();
            SharedPreferences.Editor editorEdit2 = z0Var.H().edit();
            if (bool != null) {
                editorEdit2.putBoolean("measurement_enabled_from_api", bool.booleanValue());
            } else {
                editorEdit2.remove("measurement_enabled_from_api");
            }
            editorEdit2.apply();
        }
        k1 k1Var = m1Var.f13139g;
        m1.l(k1Var);
        k1Var.D();
        if (m1Var.f13156z || !(bool == null || bool.booleanValue())) {
            V();
        }
    }

    public final void V() {
        D();
        m1 m1Var = (m1) this.f13368a;
        z0 z0Var = m1Var.f13137e;
        o0 o0Var = m1Var.f13138f;
        xg.a aVar = m1Var.f13143k;
        m1.j(z0Var);
        String strR = z0Var.f13496m.R();
        if (strR != null) {
            if ("unset".equals(strR)) {
                aVar.getClass();
                O(System.currentTimeMillis(), null, "app", "_npa");
            } else {
                Long lValueOf = Long.valueOf(true != InneractiveMediationDefs.SHOW_HOUSE_AD_YES.equals(strR) ? 0L : 1L);
                aVar.getClass();
                O(System.currentTimeMillis(), lValueOf, "app", "_npa");
            }
        }
        if (!m1Var.f() || !this.f13350r) {
            m1.l(o0Var);
            o0Var.f13197m.a("Updating Scion state (FE)");
            p3 p3VarO = m1Var.o();
            p3VarO.D();
            p3VarO.E();
            p3VarO.R(new k3(p3VarO, p3VarO.T(true), 3));
            return;
        }
        m1.l(o0Var);
        o0Var.f13197m.a("Recording app launch after enabling measurement for the first time (FE)");
        P();
        x3 x3Var = m1Var.f13140h;
        m1.k(x3Var);
        x3Var.f13470e.K();
        k1 k1Var = m1Var.f13139g;
        m1.l(k1Var);
        k1Var.M(new f2(this, 1));
    }

    public final void W() {
        m1 m1Var = (m1) this.f13368a;
        if (!(m1Var.f13133a.getApplicationContext() instanceof Application) || this.f13337c == null) {
            return;
        }
        ((Application) m1Var.f13133a.getApplicationContext()).unregisterActivityLifecycleCallbacks(this.f13337c);
    }

    public final void X(Bundle bundle, int i5, long j11) throws Throwable {
        Boolean bool;
        String string;
        x1 x1Var;
        m1 m1Var = (m1) this.f13368a;
        E();
        a2 a2Var = a2.f12831c;
        z1[] z1VarArr = y1.STORAGE.f13481a;
        int length = z1VarArr.length;
        int i11 = 0;
        while (true) {
            bool = null;
            if (i11 >= length) {
                string = null;
                break;
            }
            String str = z1VarArr[i11].f13512a;
            if (bundle.containsKey(str) && (string = bundle.getString(str)) != null) {
                if ((string.equals("granted") ? Boolean.TRUE : string.equals("denied") ? Boolean.FALSE : null) == null) {
                    break;
                }
            }
            i11++;
        }
        if (string != null) {
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            o0Var.f13195k.b(string, "Ignoring invalid consent setting");
            o0 o0Var2 = m1Var.f13138f;
            m1.l(o0Var2);
            o0Var2.f13195k.a("Valid consent values are 'granted', 'denied'");
        }
        k1 k1Var = m1Var.f13139g;
        m1.l(k1Var);
        boolean zJ = k1Var.J();
        a2 a2VarB = a2.b(i5, bundle);
        Iterator it = a2VarB.f12832a.values().iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            x1Var = x1.UNINITIALIZED;
            if (!zHasNext) {
                break;
            } else if (((x1) it.next()) != x1Var) {
                Z(a2VarB, zJ);
                break;
            }
        }
        n nVarC = n.c(i5, bundle);
        Iterator it2 = nVarC.f13170e.values().iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            } else if (((x1) it2.next()) != x1Var) {
                Y(nVarC, zJ);
                break;
            }
        }
        if (bundle != null) {
            int iOrdinal = a2.d(bundle.getString("ad_personalization")).ordinal();
            if (iOrdinal == 2) {
                bool = Boolean.FALSE;
            } else if (iOrdinal == 3) {
                bool = Boolean.TRUE;
            }
        }
        if (bool != null) {
            String str2 = i5 == -30 ? "tcf" : "app";
            if (zJ) {
                O(j11, bool.toString(), str2, "allow_personalized_ads");
            } else {
                N(str2, "allow_personalized_ads", bool.toString(), false, j11);
            }
        }
    }

    public final void Y(n nVar, boolean z11) {
        ab.z zVar = new ab.z(7, this, nVar);
        if (z11) {
            D();
            zVar.run();
        } else {
            k1 k1Var = ((m1) this.f13368a).f13139g;
            m1.l(k1Var);
            k1Var.M(zVar);
        }
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Can't find top splitter block for handler:B:69:0x0115
        	at jadx.core.utils.BlockUtils.getTopSplitterForHandler(BlockUtils.java:1178)
        	at jadx.core.dex.visitors.regions.maker.ExcHandlersRegionMaker.collectHandlerRegions(ExcHandlersRegionMaker.java:53)
        	at jadx.core.dex.visitors.regions.maker.ExcHandlersRegionMaker.process(ExcHandlersRegionMaker.java:38)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:27)
        */
    public final void Z(ai.a2 r14, boolean r15) throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 279
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: ai.t2.Z(ai.a2, boolean):void");
    }

    public final void a0() {
        z4.a();
        m1 m1Var = (m1) this.f13368a;
        e eVar = m1Var.f13136d;
        k1 k1Var = m1Var.f13139g;
        o0 o0Var = m1Var.f13138f;
        if (eVar.O(null, x.P0)) {
            m1.l(k1Var);
            if (k1Var.J()) {
                m1.l(o0Var);
                o0Var.f13190f.a("Cannot get trigger URIs from analytics worker thread");
                return;
            }
            if (kc.b()) {
                m1.l(o0Var);
                o0Var.f13190f.a("Cannot get trigger URIs from main thread");
                return;
            }
            E();
            m1.l(o0Var);
            o0Var.n.a("Getting trigger URIs (FE)");
            AtomicReference atomicReference = new AtomicReference();
            m1.l(k1Var);
            k1Var.N(atomicReference, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, "get trigger URIs", new m2(this, atomicReference, 5, false));
            List list = (List) atomicReference.get();
            if (list == null) {
                m1.l(o0Var);
                o0Var.f13192h.a("Timed out waiting for get trigger URIs");
            } else {
                m1.l(k1Var);
                k1Var.M(new ab.z(this, list, false, 9));
            }
        }
    }

    public final PriorityQueue b0() {
        if (this.f13347m == null) {
            this.f13347m = new PriorityQueue(Comparator.comparing(q2.f13261a, r2.f13279b));
        }
        return this.f13347m;
    }

    public final void c0() {
        zzoh zzohVar;
        D();
        if (b0().isEmpty() || this.f13343i || (zzohVar = (zzoh) b0().poll()) == null) {
            return;
        }
        m1 m1Var = (m1) this.f13368a;
        p4 p4Var = m1Var.f13141i;
        m1.j(p4Var);
        u6.b bVarZ = p4Var.Z();
        if (bVarZ != null) {
            this.f13343i = true;
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            m0 m0Var = o0Var.n;
            String str = zzohVar.f33773f;
            m0Var.b(str, "Registering trigger URI");
            ListenableFuture listenableFutureE = bVarZ.e(Uri.parse(str));
            if (listenableFutureE != null) {
                listenableFutureE.b(new cl.u0(0, listenableFutureE, new io.sentry.e3(this, zzohVar, false, 4)), new h2(this, 0));
            } else {
                this.f13343i = false;
                b0().add(zzohVar);
            }
        }
    }

    public final void d0(a2 a2Var) {
        D();
        boolean z11 = (a2Var.i(z1.ANALYTICS_STORAGE) && a2Var.i(z1.AD_STORAGE)) || ((m1) this.f13368a).o().M();
        m1 m1Var = (m1) this.f13368a;
        k1 k1Var = m1Var.f13139g;
        m1.l(k1Var);
        k1Var.D();
        if (z11 != m1Var.f13156z) {
            k1 k1Var2 = m1Var.f13139g;
            m1.l(k1Var2);
            k1Var2.D();
            m1Var.f13156z = z11;
            z0 z0Var = ((m1) this.f13368a).f13137e;
            m1.j(z0Var);
            z0Var.D();
            Boolean boolValueOf = z0Var.H().contains("measurement_enabled_from_api") ? Boolean.valueOf(z0Var.H().getBoolean("measurement_enabled_from_api", true)) : null;
            if (!z11 || boolValueOf == null || boolValueOf.booleanValue()) {
                U(Boolean.valueOf(z11), false);
            }
        }
    }
}
