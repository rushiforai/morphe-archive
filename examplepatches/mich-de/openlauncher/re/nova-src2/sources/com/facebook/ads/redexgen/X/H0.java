package com.facebook.ads.redexgen.X;

import android.graphics.Rect;

/* loaded from: assets/audience_network/classes.dex */
public final class H0 {
    public static String[] A02 = {"AMQNzlG2eGPOJo74lPpddO6twtMEce", "8uZuLGh3CZSzV4eSaK74M9a8aAW81o1g", "CYs8BZmCr6kO5jRRUq4laItl384RlovT", "PO4hUmmCpilEicL1R3sLdD9hI0Kiey5Z", "WmgRsP13YsLJamj9MMjVCco3tjnpIVCq", "0ErvOAeoLZJf3MJzf6jF5Cw5BrHPqp", "S0kgbIpbc64QMPj8XCJtTK8zDrzNpUnW", "MO6xPizLQkqntlkNHRrNVg7dZ2stU5UP"};
    public final Rect A00 = new Rect();
    public final Rect A01 = new Rect();

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 6 out of bounds for length 6
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private boolean A01(C05912l<C2210n2, C2215n7> c05912l, C2Z c2z) {
        float fAAB = -1.0f;
        try {
            fAAB = c2z.AAB(c05912l);
        } catch (IllegalStateException unused) {
        }
        if (fAAB > 0.0f && A00(c05912l)) {
            return true;
        }
        if (c05912l.A06.A00().getGlobalVisibleRect(this.A01) && this.A01.bottom - this.A01.top > 0 && A00(c05912l)) {
            return true;
        }
        c2z.AAA(this.A00);
        c2z.A8o(c05912l, this.A01);
        return (this.A00.bottom - this.A00.top > 0 && this.A01.bottom - this.A00.top > 0) && A00(c05912l);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.2l != com.instagram.common.viewpoint.core.ViewpointData<com.facebook.ads.internal.impressionsecondchannel.model.Impression, com.facebook.ads.internal.impressionsecondchannel.state.ImpressionState> */
    public static boolean A00(C05912l<C2210n2, C2215n7> c05912l) {
        if (c05912l.A06.A05()) {
            return c05912l.A07.A07();
        }
        if (!c05912l.A06.A06()) {
            return true;
        }
        C2215n7 c2215n7 = c05912l.A07;
        String[] strArr = A02;
        if (strArr[3].charAt(7) != strArr[2].charAt(7)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A02;
        strArr2[3] = "8O0EOVeCMdEJdeSbYPFIeNjJXhTUSITs";
        strArr2[2] = "Km62DwbCV8Ma1ecjtuIU72b1y8KakI9d";
        return c2215n7.A06();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.2l != com.instagram.common.viewpoint.core.ViewpointData<com.facebook.ads.internal.impressionsecondchannel.model.Impression, com.facebook.ads.internal.impressionsecondchannel.state.ImpressionState> */
    public final void A02(C05912l<C2210n2, C2215n7> c05912l, C2Z c2z) {
        if (c05912l.A07.A04() && A01(c05912l, c2z)) {
            c05912l.A07.A01();
            c05912l.A06.A02().ACn(c05912l.A06.A03(), c05912l.A06.A04());
        }
        if (c05912l.A07.A05() && C2203mv.A1l(c05912l.A06.A01())) {
            c05912l.A07.A02();
            c05912l.A06.A02().AC9(c05912l.A06.A03(), c05912l.A06.A04());
        }
    }
}
