package com.fyber.inneractive.sdk.bidder;

import android.app.NotificationManager;
import android.content.IntentFilter;
import android.os.Build;
import android.text.TextUtils;
import android.util.Base64;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.fyber.inneractive.sdk.bidder.TokenParametersOuterClass$TokenParameters;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.a1;
import com.fyber.inneractive.sdk.config.enums.IabTcfGdprAppliesStatus;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.external.InneractiveUserConfig;
import com.fyber.inneractive.sdk.protobuf.y0;
import com.fyber.inneractive.sdk.protobuf.z0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.t1;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class b implements e, a1, com.fyber.inneractive.sdk.config.cellular.h {

    /* renamed from: h, reason: collision with root package name */
    public static final b f27620h = new b();

    /* renamed from: a, reason: collision with root package name */
    public final k f27621a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.serverapi.c f27622b;

    /* renamed from: c, reason: collision with root package name */
    public final d f27623c;

    /* renamed from: d, reason: collision with root package name */
    public f f27624d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicReference f27625e = new AtomicReference(null);

    /* renamed from: f, reason: collision with root package name */
    public final AtomicBoolean f27626f = new AtomicBoolean(false);

    /* renamed from: g, reason: collision with root package name */
    public final Object f27627g = new Object();

    public b() {
        com.fyber.inneractive.sdk.config.cellular.a aVar;
        com.fyber.inneractive.sdk.serverapi.c cVar = new com.fyber.inneractive.sdk.serverapi.c(com.fyber.inneractive.sdk.config.global.r.a());
        this.f27622b = cVar;
        d dVar = new d(cVar);
        this.f27623c = dVar;
        this.f27621a = TokenParametersOuterClass$TokenParameters.newBuilder();
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        iAConfigManager.f27764x.f27774e = this;
        if (iAConfigManager.f27761u.f27936b.a(true, "bidding_token_wait_for_ua")) {
            t1 t1Var = iAConfigManager.f27765y;
            t1Var.b();
            if (!t1Var.f31231d.get()) {
                t1Var.c();
            }
            dVar.f27630b = iAConfigManager.f27765y.a();
        }
        if (!InneractiveAdManager.isCurrentUserAChild() && (aVar = iAConfigManager.O) != null) {
            try {
                aVar.f27778c.add(this);
            } catch (Throwable th2) {
                IAlog.a("failed to add network observer", th2, new Object[0]);
            }
        }
        f fVar = new f(this);
        this.f27624d = fVar;
        com.fyber.inneractive.sdk.util.o.f31210a.registerReceiver(fVar, new IntentFilter("android.media.RINGER_MODE_CHANGED"));
        com.fyber.inneractive.sdk.util.o.f31210a.registerReceiver(fVar, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        com.fyber.inneractive.sdk.util.o.f31210a.registerReceiver(fVar, new IntentFilter("android.app.action.INTERRUPTION_FILTER_CHANGED"));
        com.fyber.inneractive.sdk.util.o.f31210a.registerReceiver(fVar, new IntentFilter("android.os.action.POWER_SAVE_MODE_CHANGED"));
        com.fyber.inneractive.sdk.util.o.f31210a.registerReceiver(fVar, new IntentFilter("android.intent.action.AIRPLANE_MODE"));
        if (com.fyber.inneractive.sdk.util.o.a("android.permission.BLUETOOTH")) {
            com.fyber.inneractive.sdk.util.o.f31210a.registerReceiver(fVar, new IntentFilter("android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED"));
            com.fyber.inneractive.sdk.util.o.f31210a.registerReceiver(fVar, new IntentFilter("android.bluetooth.adapter.action.STATE_CHANGED"));
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:146:0x063d  */
    /* JADX WARN: Type inference failed for: r12v23 */
    /* JADX WARN: Type inference failed for: r12v7 */
    /* JADX WARN: Type inference failed for: r12v8 */
    /* JADX WARN: Type inference failed for: r13v1 */
    /* JADX WARN: Type inference failed for: r13v12 */
    /* JADX WARN: Type inference failed for: r13v2 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final byte[] a() throws JSONException, NumberFormatException {
        JSONArray jSONArrayA;
        ?? r12;
        ?? r13;
        u0 u0Var;
        char c11;
        char c12;
        o0 o0Var;
        String str;
        k kVar = this.f27621a;
        kVar.f30901b = (z0) kVar.f30901b.dynamicMethod(y0.NEW_MUTABLE_INSTANCE);
        k kVar2 = this.f27621a;
        this.f27623c.getClass();
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA = h.a("1.2");
        kVar2.c();
        ((TokenParametersOuterClass$TokenParameters) kVar2.f30901b).setVersion(nullableStringA);
        if (this.f27625e.get() != null) {
            this.f27623c.a();
        }
        k kVar3 = this.f27621a;
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA2 = h.a(this.f27623c.f27630b);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setUserAgent(nullableStringA2);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA3 = h.a(this.f27623c.f27631c);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setSdkVersion(nullableStringA3);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA4 = h.a(this.f27623c.f27632d);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setBundleID(nullableStringA4);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA5 = h.a(this.f27623c.f27633e);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setDeviceModel(nullableStringA5);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA6 = h.a(this.f27623c.f27634f);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setAppVersion(nullableStringA6);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA7 = h.a(AndroidContextPlugin.PLATFORM);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setDeviceOS(nullableStringA7);
        int i5 = Build.VERSION.SDK_INT;
        a0 a0VarNewBuilder = TokenParametersOuterClass$TokenParameters.NullableUInt32.newBuilder();
        a0VarNewBuilder.c();
        ((TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder.f30901b).setData(i5);
        TokenParametersOuterClass$TokenParameters.NullableUInt32 nullableUInt32 = (TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder.a();
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setDeviceApi(nullableUInt32);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA8 = h.a(Build.VERSION.RELEASE);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setOsVersion(nullableStringA8);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA9 = h.a(this.f27623c.f27635g);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setDeviceLanguage(nullableStringA9);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA10 = h.a(this.f27623c.f27636h);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setCountryCode(nullableStringA10);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA11 = h.a(this.f27623c.f27637i);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setCarrierName(nullableStringA11);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA12 = h.a(this.f27623c.f27638j);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setMobileCountryCode(nullableStringA12);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA13 = h.a(this.f27623c.f27639k);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setMobileNetworkCode(nullableStringA13);
        Long l9 = this.f27623c.f27640l;
        y yVarNewBuilder = TokenParametersOuterClass$TokenParameters.NullableSInt32.newBuilder();
        if (l9 != null) {
            int iIntValue = l9.intValue();
            yVarNewBuilder.c();
            ((TokenParametersOuterClass$TokenParameters.NullableSInt32) yVarNewBuilder.f30901b).setData(iIntValue);
        }
        TokenParametersOuterClass$TokenParameters.NullableSInt32 nullableSInt32 = (TokenParametersOuterClass$TokenParameters.NullableSInt32) yVarNewBuilder.a();
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setOffsetFromGMT(nullableSInt32);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA14 = h.a(this.f27623c.L);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setTimezone(nullableStringA14);
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA15 = h.a(iAConfigManager.E.f27845g);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setUserID(nullableStringA15);
        int i11 = this.f27623c.f27641m;
        a0 a0VarNewBuilder2 = TokenParametersOuterClass$TokenParameters.NullableUInt32.newBuilder();
        if (i11 > 0) {
            a0VarNewBuilder2.c();
            ((TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder2.f30901b).setData(i11);
        }
        TokenParametersOuterClass$TokenParameters.NullableUInt32 nullableUInt322 = (TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder2.a();
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setDeviceWidth(nullableUInt322);
        int i12 = this.f27623c.n;
        a0 a0VarNewBuilder3 = TokenParametersOuterClass$TokenParameters.NullableUInt32.newBuilder();
        if (i12 > 0) {
            a0VarNewBuilder3.c();
            ((TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder3.f30901b).setData(i12);
        }
        TokenParametersOuterClass$TokenParameters.NullableUInt32 nullableUInt323 = (TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder3.a();
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setDeviceHeight(nullableUInt323);
        q qVar = this.f27623c.o;
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setFrameworkName(qVar);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA16 = h.a(this.f27623c.f27642p);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setInputLanguages(nullableStringA16);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA17 = h.a(this.f27623c.G);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setMediationType(nullableStringA17);
        this.f27623c.getClass();
        com.fyber.inneractive.sdk.ignite.l lVar = iAConfigManager.F.o;
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA18 = h.a(lVar != null ? lVar.getOdt() : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setOdt(nullableStringA18);
        Integer numA = com.fyber.inneractive.sdk.serverapi.b.a();
        a0 a0VarNewBuilder4 = TokenParametersOuterClass$TokenParameters.NullableUInt32.newBuilder();
        if (numA != null) {
            int iIntValue2 = numA.intValue();
            a0VarNewBuilder4.c();
            ((TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder4.f30901b).setData(iIntValue2);
        }
        TokenParametersOuterClass$TokenParameters.NullableUInt32 nullableUInt324 = (TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder4.a();
        kVar3.c();
        ((TokenParametersOuterClass$TokenParameters) kVar3.f30901b).setAdServicesVersion(nullableUInt324);
        com.fyber.inneractive.sdk.config.h hVar = iAConfigManager.E;
        if (hVar != null) {
            k kVar4 = this.f27621a;
            if (hVar.n() == IabTcfGdprAppliesStatus.DOES_NOT_APPLY || com.fyber.inneractive.sdk.util.o.f31210a == null) {
                str = null;
            } else {
                hVar.p();
                if (hVar.f27843e == null) {
                    hVar.f27843e = hVar.l();
                }
                str = hVar.f27842d;
                if (str == null) {
                    str = hVar.f27843e;
                }
            }
            TokenParametersOuterClass$TokenParameters.NullableString nullableStringA19 = h.a(str);
            kVar4.c();
            ((TokenParametersOuterClass$TokenParameters) kVar4.f30901b).setGdprString(nullableStringA19);
            TokenParametersOuterClass$TokenParameters.NullableBool nullableBoolA = h.a(hVar.e());
            kVar4.c();
            ((TokenParametersOuterClass$TokenParameters) kVar4.f30901b).setGdprConsent(nullableBoolA);
            TokenParametersOuterClass$TokenParameters.NullableString nullableStringA20 = h.a(com.fyber.inneractive.sdk.util.o.f31210a == null ? null : hVar.f27846h);
            kVar4.c();
            ((TokenParametersOuterClass$TokenParameters) kVar4.f30901b).setCcpaString(nullableStringA20);
            TokenParametersOuterClass$TokenParameters.NullableBool nullableBoolA2 = h.a(com.fyber.inneractive.sdk.util.o.f31210a == null ? null : hVar.f27847i);
            kVar4.c();
            ((TokenParametersOuterClass$TokenParameters) kVar4.f30901b).setLgpdConsent(nullableBoolA2);
            Boolean bool = hVar.f27848j;
            if (bool != null && bool.booleanValue()) {
                k kVar5 = this.f27621a;
                TokenParametersOuterClass$TokenParameters.NullableBool nullableBoolA3 = h.a(bool);
                kVar5.c();
                ((TokenParametersOuterClass$TokenParameters) kVar5.f30901b).setCoppaApplies(nullableBoolA3);
            }
            com.fyber.inneractive.sdk.gpp.a aVar = hVar.n;
            String str2 = aVar.f28467d;
            String str3 = aVar.f28464a.get() == null ? null : aVar.f28465b;
            if (com.fyber.inneractive.sdk.util.v.a(str2) || com.fyber.inneractive.sdk.util.v.a(str3)) {
                r rVarNewBuilder = TokenParametersOuterClass$TokenParameters.Gpp.newBuilder();
                if (com.fyber.inneractive.sdk.util.v.a(str2)) {
                    rVarNewBuilder.c();
                    ((TokenParametersOuterClass$TokenParameters.Gpp) rVarNewBuilder.f30901b).setGppEncodedString(str2);
                } else {
                    IAlog.a("%ssetGppDataToToken No GPP String found, not adding to token", IAlog.a(this));
                }
                if (com.fyber.inneractive.sdk.util.v.a(str3)) {
                    rVarNewBuilder.c();
                    ((TokenParametersOuterClass$TokenParameters.Gpp) rVarNewBuilder.f30901b).setGppSid(str3);
                } else {
                    IAlog.a("%ssetGppDataToToken No GPP SID found, not adding to token", IAlog.a(this));
                }
                k kVar6 = this.f27621a;
                TokenParametersOuterClass$TokenParameters.Gpp gpp = (TokenParametersOuterClass$TokenParameters.Gpp) rVarNewBuilder.a();
                kVar6.c();
                ((TokenParametersOuterClass$TokenParameters) kVar6.f30901b).setGpp(gpp);
            } else {
                IAlog.a("%ssetGppDataToToken No GPP data found", IAlog.a(this));
            }
        }
        if (!InneractiveAdManager.isCurrentUserAChild()) {
            k kVar7 = this.f27621a;
            com.fyber.inneractive.sdk.config.y yVar = com.fyber.inneractive.sdk.config.x.f27950a.f27966b;
            boolean z11 = yVar != null ? yVar.f27952b : false;
            kVar7.c();
            ((TokenParametersOuterClass$TokenParameters) kVar7.f30901b).setDnt(z11);
        }
        k kVar8 = this.f27621a;
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA21 = h.a(this.f27623c.f27643q);
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setNetwork(nullableStringA21);
        g0 g0Var = this.f27623c.f27644r;
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setSecureContent(g0Var);
        TokenParametersOuterClass$TokenParameters.NullableBool nullableBoolA4 = h.a(this.f27623c.B);
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setBatteryCharging(nullableBoolA4);
        TokenParametersOuterClass$TokenParameters.NullableBool nullableBoolA5 = h.a(this.f27623c.f27645s);
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setHeadsetPlugged(nullableBoolA5);
        TokenParametersOuterClass$TokenParameters.NullableBool nullableBoolA6 = h.a(this.f27623c.f27646t);
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setBluetoothPlugged(nullableBoolA6);
        TokenParametersOuterClass$TokenParameters.NullableBool nullableBoolA7 = h.a(this.f27623c.f27647u);
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setLowPowerMode(nullableBoolA7);
        boolean z12 = this.f27623c.f27648v;
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setDarkMode(z12);
        TokenParametersOuterClass$TokenParameters.NullableBool nullableBoolA8 = h.a(this.f27623c.f27649w);
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setAirplaneMode(nullableBoolA8);
        TokenParametersOuterClass$TokenParameters.NullableBool nullableBoolA9 = h.a(this.f27623c.f27650x);
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setDndMode(nullableBoolA9);
        TokenParametersOuterClass$TokenParameters.NullableBool nullableBoolA10 = h.a(this.f27623c.f27651y);
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setIsRingMuted(nullableBoolA10);
        int i13 = this.f27623c.f27652z;
        a0 a0VarNewBuilder5 = TokenParametersOuterClass$TokenParameters.NullableUInt32.newBuilder();
        if (i13 > 0) {
            a0VarNewBuilder5.c();
            ((TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder5.f30901b).setData(i13);
        }
        TokenParametersOuterClass$TokenParameters.NullableUInt32 nullableUInt325 = (TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder5.a();
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setSessionDuration(nullableUInt325);
        String str4 = this.f27623c.C;
        a0 a0VarNewBuilder6 = TokenParametersOuterClass$TokenParameters.NullableUInt32.newBuilder();
        if (!TextUtils.isEmpty(str4)) {
            int i14 = Integer.parseInt(str4);
            a0VarNewBuilder6.c();
            ((TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder6.f30901b).setData(i14);
        }
        TokenParametersOuterClass$TokenParameters.NullableUInt32 nullableUInt326 = (TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder6.a();
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setBatteryLevel(nullableUInt326);
        TokenParametersOuterClass$TokenParameters.NullableBool nullableBoolA11 = h.a(Boolean.valueOf(TextUtils.equals(iAConfigManager.f27764x.a(UnitDisplayType.INTERSTITIAL, "LAST_VAST_SKIPED"), "1")));
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setPriorSkip(nullableBoolA11);
        InneractiveUserConfig.Gender gender = this.f27623c.D;
        q0 q0Var = gender == InneractiveUserConfig.Gender.FEMALE ? q0.FEMALE : gender == InneractiveUserConfig.Gender.MALE ? q0.MALE : q0.UNKNOWN;
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setUserGender(q0Var);
        TokenParametersOuterClass$TokenParameters.NullableString nullableStringA22 = h.a(this.f27623c.F);
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setZipCode(nullableStringA22);
        boolean z13 = this.f27623c.E;
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setMuteAudio(z13);
        TokenParametersOuterClass$TokenParameters.NullableBool nullableBoolA12 = h.a(this.f27623c.K);
        kVar8.c();
        ((TokenParametersOuterClass$TokenParameters) kVar8.f30901b).setMediaMuted(nullableBoolA12);
        com.fyber.inneractive.sdk.config.y yVar2 = com.fyber.inneractive.sdk.config.x.f27950a.f27966b;
        if (yVar2 != null ? yVar2.f27953c : false) {
            k kVar9 = this.f27621a;
            TokenParametersOuterClass$TokenParameters.NullableString nullableStringA23 = h.a(this.f27623c.A);
            kVar9.c();
            ((TokenParametersOuterClass$TokenParameters) kVar9.f30901b).setAmazonId(nullableStringA23);
        } else {
            k kVar10 = this.f27621a;
            TokenParametersOuterClass$TokenParameters.NullableString nullableStringA24 = h.a(this.f27623c.A);
            kVar10.c();
            ((TokenParametersOuterClass$TokenParameters) kVar10.f30901b).setAaid(nullableStringA24);
        }
        UnitDisplayType[] unitDisplayTypeArrValues = UnitDisplayType.values();
        int length = unitDisplayTypeArrValues.length;
        int i15 = 0;
        while (true) {
            boolean z14 = true;
            if (i15 >= length) {
                com.fyber.inneractive.sdk.serverapi.c cVar = this.f27622b;
                cVar.getClass();
                com.fyber.inneractive.sdk.config.global.r rVarA = com.fyber.inneractive.sdk.config.global.r.a();
                cVar.f31097a = rVarA;
                rVarA.a(false, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                com.fyber.inneractive.sdk.config.global.r rVar = this.f27622b.f31097a;
                if (rVar != null) {
                    jSONArrayA = com.fyber.inneractive.sdk.config.global.g.a(rVar.f27837b, true);
                    IAlog.a("%s: active experiments json set = %s", "SupportedFeaturesProvider", jSONArrayA);
                } else {
                    jSONArrayA = null;
                }
                if (jSONArrayA != null) {
                    for (int i16 = 0; i16 < jSONArrayA.length(); i16++) {
                        JSONObject jSONObjectOptJSONObject = jSONArrayA.optJSONObject(i16);
                        if (jSONObjectOptJSONObject != null) {
                            n nVarNewBuilder = TokenParametersOuterClass$TokenParameters.Experiment.newBuilder();
                            String strOptString = jSONObjectOptJSONObject.optString("id");
                            nVarNewBuilder.c();
                            ((TokenParametersOuterClass$TokenParameters.Experiment) nVarNewBuilder.f30901b).setIdentifier(strOptString);
                            String strOptString2 = jSONObjectOptJSONObject.optString("v");
                            nVarNewBuilder.c();
                            ((TokenParametersOuterClass$TokenParameters.Experiment) nVarNewBuilder.f30901b).setVariant(strOptString2);
                            k kVar11 = this.f27621a;
                            TokenParametersOuterClass$TokenParameters.Experiment experiment = (TokenParametersOuterClass$TokenParameters.Experiment) nVarNewBuilder.a();
                            kVar11.c();
                            ((TokenParametersOuterClass$TokenParameters) kVar11.f30901b).addAbExperiments(experiment);
                        }
                    }
                }
                k kVar12 = this.f27621a;
                int i17 = com.fyber.inneractive.sdk.config.n.f27870a;
                String property = System.getProperty("ia.testEnvironmentConfiguration.number");
                a0 a0VarNewBuilder7 = TokenParametersOuterClass$TokenParameters.NullableUInt32.newBuilder();
                if (!TextUtils.isEmpty(property)) {
                    int i18 = Integer.parseInt(property);
                    a0VarNewBuilder7.c();
                    ((TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder7.f30901b).setData(i18);
                }
                TokenParametersOuterClass$TokenParameters.NullableUInt32 nullableUInt327 = (TokenParametersOuterClass$TokenParameters.NullableUInt32) a0VarNewBuilder7.a();
                kVar12.c();
                ((TokenParametersOuterClass$TokenParameters) kVar12.f30901b).setPortal(nullableUInt327);
                k kVar13 = this.f27621a;
                TokenParametersOuterClass$TokenParameters.NullableString nullableStringA25 = h.a(System.getProperty("ia.testEnvironmentConfiguration.response"));
                kVar13.c();
                ((TokenParametersOuterClass$TokenParameters) kVar13.f30901b).setMockResponseId(nullableStringA25);
                k kVar14 = this.f27621a;
                TokenParametersOuterClass$TokenParameters.NullableString nullableStringA26 = h.a(this.f27623c.H);
                kVar14.c();
                ((TokenParametersOuterClass$TokenParameters) kVar14.f30901b).setIgniteVersion(nullableStringA26);
                k kVar15 = this.f27621a;
                TokenParametersOuterClass$TokenParameters.NullableString nullableStringA27 = h.a(this.f27623c.I);
                kVar15.c();
                ((TokenParametersOuterClass$TokenParameters) kVar15.f30901b).setIgnitePackageName(nullableStringA27);
                if (this.f27623c.J) {
                    k kVar16 = this.f27621a;
                    TokenParametersOuterClass$TokenParameters.NullableBool nullableBoolA13 = h.a(Boolean.TRUE);
                    kVar16.c();
                    ((TokenParametersOuterClass$TokenParameters) kVar16.f30901b).setChildMode(nullableBoolA13);
                }
                return ((TokenParametersOuterClass$TokenParameters) this.f27621a.a()).toByteArray();
            }
            UnitDisplayType unitDisplayType = unitDisplayTypeArrValues[i15];
            if (!unitDisplayType.isDeprecated()) {
                int[] iArr = g.f27654a;
                int i19 = iArr[unitDisplayType.ordinal()];
                o0 o0Var2 = i19 != 1 ? i19 != 2 ? i19 != 3 ? i19 != 4 ? i19 != 5 ? o0.UNITDISPLAYTYPEUNKNOWN : o0.TYPENATIVE : o0.MRECT : o0.REWARDED : o0.INTERSTITIAL : o0.BANNER;
                com.fyber.inneractive.sdk.serverapi.a aVar2 = com.fyber.inneractive.sdk.serverapi.b.f31093a;
                IAConfigManager iAConfigManager2 = IAConfigManager.Q;
                String strA = iAConfigManager2.f27764x.a(unitDisplayType, "LAST_DOMAIN_SHOWED");
                if (!TextUtils.isEmpty(strA) && strA.contains(",")) {
                    strA = strA.split(",")[0];
                }
                if (!TextUtils.isEmpty(strA)) {
                    k kVar17 = this.f27621a;
                    s sVarNewBuilder = TokenParametersOuterClass$TokenParameters.LastAdomain.newBuilder();
                    sVarNewBuilder.c();
                    ((TokenParametersOuterClass$TokenParameters.LastAdomain) sVarNewBuilder.f30901b).setAdomain(strA);
                    sVarNewBuilder.c();
                    ((TokenParametersOuterClass$TokenParameters.LastAdomain) sVarNewBuilder.f30901b).setType(o0Var2);
                    TokenParametersOuterClass$TokenParameters.LastAdomain lastAdomain = (TokenParametersOuterClass$TokenParameters.LastAdomain) sVarNewBuilder.a();
                    kVar17.c();
                    ((TokenParametersOuterClass$TokenParameters) kVar17.f30901b).addLastAdomains(lastAdomain);
                }
                String strA2 = iAConfigManager2.f27764x.a(unitDisplayType, "LAST_APP_BUNDLE_ID");
                if (!TextUtils.isEmpty(strA2)) {
                    k kVar18 = this.f27621a;
                    u uVarNewBuilder = TokenParametersOuterClass$TokenParameters.LastAdvertisedBundle.newBuilder();
                    uVarNewBuilder.c();
                    ((TokenParametersOuterClass$TokenParameters.LastAdvertisedBundle) uVarNewBuilder.f30901b).setLastBundle(strA2);
                    uVarNewBuilder.c();
                    ((TokenParametersOuterClass$TokenParameters.LastAdvertisedBundle) uVarNewBuilder.f30901b).setType(o0Var2);
                    TokenParametersOuterClass$TokenParameters.LastAdvertisedBundle lastAdvertisedBundle = (TokenParametersOuterClass$TokenParameters.LastAdvertisedBundle) uVarNewBuilder.a();
                    kVar18.c();
                    ((TokenParametersOuterClass$TokenParameters) kVar18.f30901b).addLastAdvertisedBundles(lastAdvertisedBundle);
                }
                if (TextUtils.equals(iAConfigManager2.f27764x.a(unitDisplayType, "LAST_CLICKED"), "1")) {
                    k kVar19 = this.f27621a;
                    int i21 = iArr[unitDisplayType.ordinal()];
                    if (i21 == 1) {
                        c11 = 3;
                        c12 = 4;
                        o0Var = o0.BANNER;
                    } else if (i21 != 2) {
                        c11 = 3;
                        c11 = 3;
                        c11 = 3;
                        c11 = 3;
                        if (i21 != 3) {
                            c12 = 4;
                            c12 = 4;
                            c12 = 4;
                            o0Var = i21 != 4 ? i21 != 5 ? o0.UNITDISPLAYTYPEUNKNOWN : o0.TYPENATIVE : o0.MRECT;
                        } else {
                            c12 = 4;
                            o0Var = o0.REWARDED;
                        }
                    } else {
                        c11 = 3;
                        c12 = 4;
                        o0Var = o0.INTERSTITIAL;
                    }
                    kVar19.c();
                    ((TokenParametersOuterClass$TokenParameters) kVar19.f30901b).addPriorClicks(o0Var);
                    r12 = c11;
                    r13 = c12;
                } else {
                    r12 = 3;
                    r13 = 4;
                }
                a("display", unitDisplayType, o0Var2);
                if (unitDisplayType.isFullscreenUnit()) {
                    a("video", unitDisplayType, o0Var2);
                    String strA3 = iAConfigManager2.f27764x.a(unitDisplayType, "LAST_VAST_CLICKED_TYPE");
                    if (!TextUtils.isEmpty(strA3)) {
                        k kVar20 = this.f27621a;
                        b0 b0VarNewBuilder = TokenParametersOuterClass$TokenParameters.PriorVideoClickType.newBuilder();
                        strA3.getClass();
                        switch (strA3.hashCode()) {
                            case 49:
                                if (strA3.equals("1")) {
                                    z14 = false;
                                    break;
                                } else {
                                    z14 = -1;
                                    break;
                                }
                            case 50:
                                if (!strA3.equals("2")) {
                                }
                                break;
                            case 51:
                                if (strA3.equals("3")) {
                                    z14 = 2;
                                    break;
                                }
                                break;
                            case 52:
                                if (strA3.equals("4")) {
                                    z14 = r12;
                                    break;
                                }
                                break;
                            case 53:
                                if (strA3.equals("5")) {
                                    z14 = r13;
                                    break;
                                }
                                break;
                        }
                        switch (z14) {
                            case false:
                                u0Var = u0.CTABUTTON;
                                break;
                            case true:
                                u0Var = u0.COMPANION;
                                break;
                            case true:
                                u0Var = u0.VIDEOVIEW;
                                break;
                            case true:
                                u0Var = u0.APPINFO;
                                break;
                            case true:
                                u0Var = u0.STOREPROMO;
                                break;
                            default:
                                u0Var = u0.NOCLICK;
                                break;
                        }
                        b0VarNewBuilder.c();
                        ((TokenParametersOuterClass$TokenParameters.PriorVideoClickType) b0VarNewBuilder.f30901b).setClickType(u0Var);
                        b0VarNewBuilder.c();
                        ((TokenParametersOuterClass$TokenParameters.PriorVideoClickType) b0VarNewBuilder.f30901b).setType(o0Var2);
                        TokenParametersOuterClass$TokenParameters.PriorVideoClickType priorVideoClickType = (TokenParametersOuterClass$TokenParameters.PriorVideoClickType) b0VarNewBuilder.a();
                        kVar20.c();
                        ((TokenParametersOuterClass$TokenParameters) kVar20.f30901b).addPriorClickTypes(priorVideoClickType);
                    }
                }
            }
            i15++;
        }
    }

    public final void b() {
        byte[] byteArray;
        if (this.f27626f.compareAndSet(false, true)) {
            try {
                String strEncodeToString = Base64.encodeToString(a(), 2);
                IAConfigManager iAConfigManager = IAConfigManager.Q;
                String str = iAConfigManager.f27755m;
                com.fyber.inneractive.sdk.config.r rVar = iAConfigManager.f27761u.f27936b;
                String str2 = "token_size_limit";
                int iA = rVar.a("token_size_limit", 4000, 1);
                if (!TextUtils.isEmpty(str)) {
                    str2 = "token_size_limit_" + str.toLowerCase(Locale.US);
                }
                TokenParametersOuterClass$TokenParameters tokenParametersOuterClass$TokenParametersA = iAConfigManager.J.a(rVar.a(str2, iA, 1) - strEncodeToString.getBytes().length);
                if (tokenParametersOuterClass$TokenParametersA == null) {
                    byteArray = null;
                } else {
                    k kVar = this.f27621a;
                    kVar.c();
                    com.fyber.inneractive.sdk.protobuf.t0.a(kVar.f30901b, tokenParametersOuterClass$TokenParametersA);
                    byteArray = ((TokenParametersOuterClass$TokenParameters) kVar.a()).toByteArray();
                }
                AtomicReference atomicReference = this.f27625e;
                if (byteArray != null) {
                    strEncodeToString = Base64.encodeToString(byteArray, 2);
                }
                atomicReference.set(strEncodeToString);
            } catch (Throwable th2) {
                IAlog.b("Failed to generate token with error: %s", th2.getMessage());
            }
            this.f27626f.set(false);
        }
    }

    public final void c() {
        int currentInterruptionFilter = ((NotificationManager) com.fyber.inneractive.sdk.util.o.f31210a.getSystemService("notification")).getCurrentInterruptionFilter();
        boolean z11 = currentInterruptionFilter >= 2 && currentInterruptionFilter <= 4;
        Boolean bool = this.f27623c.f27650x;
        if (bool == null || bool.booleanValue() != z11) {
            this.f27623c.f27650x = Boolean.valueOf(z11);
            d();
        }
    }

    public final void d() {
        com.fyber.inneractive.sdk.util.r.f31215a.execute(new a(this));
    }

    @Override // com.fyber.inneractive.sdk.config.cellular.h
    public final void a(com.fyber.inneractive.sdk.util.a1 a1Var) {
        if (TextUtils.equals(this.f27623c.f27643q, a1Var.b())) {
            return;
        }
        this.f27623c.f27643q = a1Var.b();
        d();
    }

    public final void a(String str, UnitDisplayType unitDisplayType, o0 o0Var) {
        ArrayList arrayList;
        int i5;
        m0 m0Var;
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        com.fyber.inneractive.sdk.cache.session.e eVar = iAConfigManager.f27764x.f27770a;
        if (eVar != null) {
            com.fyber.inneractive.sdk.cache.session.k kVar = (com.fyber.inneractive.sdk.cache.session.k) eVar.f27686b.get(com.fyber.inneractive.sdk.cache.session.enums.c.a(unitDisplayType.value(), str));
            TokenParametersOuterClass$TokenParameters.UserSession userSession = null;
            if (kVar != null) {
                ArrayList arrayList2 = new ArrayList(kVar);
                Collections.sort(arrayList2, new com.fyber.inneractive.sdk.cache.session.j());
                arrayList = new ArrayList(arrayList2);
            } else {
                arrayList = null;
            }
            try {
                i5 = Integer.parseInt(iAConfigManager.f27761u.f27936b.a("number_of_sessions", Integer.toString(5)));
            } catch (Throwable unused) {
                i5 = 5;
            }
            int i11 = i5 >= 0 ? i5 : 5;
            if (i11 > 0 && arrayList != null && arrayList.size() >= i11) {
                if (str.equals("video")) {
                    m0Var = m0.VIDEO;
                } else if (!str.equals("display")) {
                    m0Var = m0.UNITCONTENTTYPEUNKNOWN;
                } else {
                    m0Var = m0.DISPLAY;
                }
                r0 r0VarNewBuilder = TokenParametersOuterClass$TokenParameters.UserSession.newBuilder();
                r0VarNewBuilder.c();
                ((TokenParametersOuterClass$TokenParameters.UserSession) r0VarNewBuilder.f30901b).setSubType(m0Var);
                Iterator it = arrayList.iterator();
                int i12 = 0;
                while (it.hasNext()) {
                    com.fyber.inneractive.sdk.cache.session.g gVar = (com.fyber.inneractive.sdk.cache.session.g) it.next();
                    h0 h0VarNewBuilder = TokenParametersOuterClass$TokenParameters.SessionData.newBuilder();
                    int i13 = gVar.f27692b;
                    h0VarNewBuilder.c();
                    ((TokenParametersOuterClass$TokenParameters.SessionData) h0VarNewBuilder.f30901b).setClicks(i13);
                    int i14 = gVar.f27691a;
                    h0VarNewBuilder.c();
                    ((TokenParametersOuterClass$TokenParameters.SessionData) h0VarNewBuilder.f30901b).setImpressions(i14);
                    if (str.equals("video") || o0Var.equals(o0.REWARDED)) {
                        int i15 = gVar.f27693c;
                        h0VarNewBuilder.c();
                        ((TokenParametersOuterClass$TokenParameters.SessionData) h0VarNewBuilder.f30901b).setCompletions(i15);
                    }
                    TokenParametersOuterClass$TokenParameters.SessionData sessionData = (TokenParametersOuterClass$TokenParameters.SessionData) h0VarNewBuilder.a();
                    r0VarNewBuilder.c();
                    ((TokenParametersOuterClass$TokenParameters.UserSession) r0VarNewBuilder.f30901b).addSessionDataItems(sessionData);
                    i12++;
                    if (i12 >= i11) {
                        break;
                    }
                }
                r0VarNewBuilder.c();
                ((TokenParametersOuterClass$TokenParameters.UserSession) r0VarNewBuilder.f30901b).setType(o0Var);
                userSession = (TokenParametersOuterClass$TokenParameters.UserSession) r0VarNewBuilder.a();
            }
            if (userSession == null || userSession.getSessionDataItemsList().size() <= 0) {
                return;
            }
            k kVar2 = this.f27621a;
            kVar2.c();
            ((TokenParametersOuterClass$TokenParameters) kVar2.f30901b).addUserSessions(userSession);
        }
    }
}
