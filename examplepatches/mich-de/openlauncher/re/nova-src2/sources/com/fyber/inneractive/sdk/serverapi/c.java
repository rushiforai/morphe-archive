package com.fyber.inneractive.sdk.serverapi;

import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.util.k;
import com.fyber.inneractive.sdk.util.o;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

/* loaded from: classes.dex */
public final class c implements d {

    /* renamed from: c, reason: collision with root package name */
    public static final List f31095c = Arrays.asList(5);

    /* renamed from: d, reason: collision with root package name */
    public static final List f31096d = Arrays.asList(Integer.valueOf(com.fyber.inneractive.sdk.rtb.data.types.a.VAST_2_0.a()), Integer.valueOf(com.fyber.inneractive.sdk.rtb.data.types.a.VAST_2_0_WRAPPER.a()));

    /* renamed from: a, reason: collision with root package name */
    public r f31097a;

    /* renamed from: b, reason: collision with root package name */
    public final String f31098b;

    public c(r rVar) {
        String networkOperator;
        try {
            TelephonyManager telephonyManager = (TelephonyManager) o.f31210a.getSystemService("phone");
            networkOperator = telephonyManager.getNetworkOperator();
            if (telephonyManager.getPhoneType() == 2 && k.k()) {
                networkOperator = telephonyManager.getSimOperator();
            }
        } catch (Exception unused) {
            networkOperator = null;
        }
        this.f31098b = networkOperator;
        this.f31097a = rVar;
    }

    public final String a() {
        try {
            return ((TelephonyManager) o.f31210a.getSystemService("phone")).getNetworkOperatorName();
        } catch (Exception unused) {
            return null;
        }
    }

    public final void a(String str, HashMap map) {
        String str2;
        String id2;
        a aVar = b.f31093a;
        try {
            Class.forName("com.unity3d.player.UnityPlayer");
            str2 = "unity3d";
        } catch (Throwable unused) {
            str2 = "native";
        }
        map.put("frmn", str2);
        map.put("headset", a(b.m()));
        map.put("is_muted", a(b.k()));
        map.put("btry_c", a(b.i()));
        map.put("btry_l", b.b());
        map.put("bt_con", a(b.g()));
        Long lE = b.e();
        String strValueOf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        map.put("tod", lE == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : String.valueOf(lE));
        try {
            id2 = TimeZone.getDefault().getID();
        } catch (Throwable unused2) {
            id2 = null;
        }
        map.put("tmz", id2);
        map.put("apnm", a(b.f()));
        map.put("dnd", a(b.l()));
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        map.put("lng", iAConfigManager.f27756p);
        String strA = iAConfigManager.f27764x.a(b.a(str), "LAST_DOMAIN_SHOWED");
        if (!TextUtils.isEmpty(strA) && strA.contains(",")) {
            strA = strA.split(",")[0];
        }
        map.put("ldomain", strA);
        map.put("lbundle", iAConfigManager.f27764x.a(b.a(str), "LAST_APP_BUNDLE_ID"));
        String strA2 = iAConfigManager.f27764x.a(b.a(str), "LAST_CLICKED");
        if (TextUtils.equals(strA2, "0")) {
            strA2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        map.put("lclick", strA2);
        String strA3 = iAConfigManager.f27764x.a(b.a(str), "LAST_VAST_SKIPED");
        if (TextUtils.equals(strA3, "0")) {
            strA3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        map.put("v_lskip", strA3);
        UnitDisplayType unitDisplayTypeA = b.a(str);
        map.put("v_lclicktype", unitDisplayTypeA.isFullscreenUnit() ? iAConfigManager.f27764x.a(unitDisplayTypeA, "LAST_VAST_CLICKED_TYPE") : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        map.put("sdur", String.valueOf(b.c()));
        map.put("userid", iAConfigManager.E.f27845g);
        map.put("low_power_mode", a(b.n()));
        map.put("dark_mode", a(b.h()));
        map.put("d_api", b.d());
        map.put("media_muted", a(b.j()));
        Integer numA = b.a();
        if (numA != null) {
            strValueOf = String.valueOf(numA);
        }
        map.put("asv", strValueOf);
    }

    public static String a(Boolean bool) {
        return bool != null ? bool.booleanValue() ? "1" : "0" : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }
}
