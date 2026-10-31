package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.content.Context;

/* renamed from: com.facebook.ads.redexgen.X.jn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2013jn {
    public static InterfaceC1640df A00(Context context, InterfaceC2097lC interfaceC2097lC) {
        return A01(context, interfaceC2097lC, null);
    }

    public static InterfaceC1640df A01(Context context, InterfaceC2097lC interfaceC2097lC, String str) {
        C0957Hh sdkContext = A09(context);
        InterfaceC1644dj interfaceC1644djA8n = interfaceC2097lC.A8n(sdkContext);
        if (interfaceC1644djA8n != null) {
            return str != null ? interfaceC1644djA8n.ADD(str) : interfaceC1644djA8n.ADC();
        }
        return new C1097Mx();
    }

    public static C0958Hi A02(Activity activity) {
        return new C0958Hi(activity, (InterfaceC2097lC) A0A(), A00(activity, A0A()));
    }

    public static C0958Hi A03(Context context) {
        return new C0958Hi(context, A0A(), new C1097Mx());
    }

    public static C0958Hi A04(Context context) {
        if (C2203mv.A0v(context)) {
            return new C0958Hi(context, A0A(), A00(context, A0A()));
        }
        return A03(context);
    }

    public static C0958Hi A05(Context context, String str) {
        InterfaceC1640df interfaceC1640dfA01 = A01(context, A0A(), str);
        interfaceC1640dfA01.AKl(1000);
        return new C0958Hi(context, A0A(), interfaceC1640dfA01);
    }

    public static C0958Hi A06(Context context, String str) {
        return new C0958Hi(context, A0A(), A01(context, A0A(), str));
    }

    public static C0958Hi A07(Context context, String str) {
        return new C0958Hi(context, A0A(), A01(context, A0A(), str));
    }

    public static C7D A08(Context context) {
        return new C7D(context, A0A(), A0A().A8n(A09(context)));
    }

    public static C0957Hh A09(Context context) {
        return new C0957Hh(context, A0A());
    }

    public static synchronized HG A0A() {
        return HG.A02();
    }
}
