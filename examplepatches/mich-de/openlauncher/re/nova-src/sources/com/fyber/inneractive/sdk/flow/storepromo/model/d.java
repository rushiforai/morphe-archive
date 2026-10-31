package com.fyber.inneractive.sdk.flow.storepromo.model;

import b.c0;
import com.fyber.inneractive.sdk.util.h;
import java.text.DecimalFormat;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final String f28372a;

    /* renamed from: b, reason: collision with root package name */
    public final String f28373b;

    /* renamed from: c, reason: collision with root package name */
    public final String f28374c;

    public d(String str, String str2, String str3) {
        String strE;
        this.f28374c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f28372a = str;
        this.f28373b = str2;
        h hVar = new h(str3);
        if (hVar.f31190a == null) {
            strE = "N/A";
        } else {
            double dLongValue = r11.longValue() / 1024.0d;
            double d5 = dLongValue / 1024.0d;
            double d11 = d5 / 1024.0d;
            DecimalFormat decimalFormat = new DecimalFormat("#.##");
            strE = d5 > 850.0d ? c0.E(decimalFormat.format(d11), " GB") : dLongValue > 850.0d ? c0.E(decimalFormat.format(d5), " MB") : hVar.f31190a.longValue() > 850 ? c0.E(decimalFormat.format(dLongValue), " kB") : c0.E(decimalFormat.format(hVar.f31190a), " bytes");
        }
        this.f28374c = strE;
    }
}
