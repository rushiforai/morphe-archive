package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.Ug, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1273Ug implements InterfaceC1018Jt {
    public final C1282Up A00;

    @Deprecated
    public final C9P A01;
    public final C1277Uk A02;
    public final C1042Kr A03;

    @Deprecated
    public final C1274Uh A04;
    public final C1270Ud A05;
    public final String A06;
    public static final C1273Ug A08 = new C1034Kj().A05();
    public static final InterfaceC1017Js<C1273Ug> A07 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.Uw
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return C1273Ug.A00(bundle);
        }
    };

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 8 out of bounds for length 8
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static C1273Ug A00(Bundle bundle) {
        String str = (String) AbstractC1062Ln.A01(bundle.getString(A02(0), b.f42142b));
        Bundle bundle2 = bundle.getBundle(A02(1));
        C1277Uk c1277Uk = bundle2 == null ? C1277Uk.A07 : (C1277Uk) C1277Uk.A06.A7F(bundle2);
        Bundle bundle3 = bundle.getBundle(A02(2));
        C1270Ud c1270Ud = bundle3 == null ? C1270Ud.A0Z : (C1270Ud) C1270Ud.A0Y.A7F(bundle3);
        Bundle bundle4 = bundle.getBundle(A02(3));
        return new C1273Ug(str, bundle4 == null ? C9P.A00 : (C9P) C1282Up.A05.A7F(bundle4), null, c1277Uk, c1270Ud);
    }

    public C1273Ug(String str, C9P c9p, C1274Uh c1274Uh, C1277Uk c1277Uk, C1270Ud c1270Ud) {
        this.A06 = str;
        this.A03 = c1274Uh;
        this.A04 = c1274Uh;
        this.A02 = c1277Uk;
        this.A05 = c1270Ud;
        this.A00 = c9p;
        this.A01 = c9p;
    }

    public static String A02(int i5) {
        return Integer.toString(i5, 36);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C1273Ug)) {
            return false;
        }
        C1273Ug c1273Ug = (C1273Ug) obj;
        if (N1.A1E(this.A06, c1273Ug.A06) && this.A00.equals(c1273Ug.A00) && N1.A1E(this.A03, c1273Ug.A03) && N1.A1E(this.A02, c1273Ug.A02) && N1.A1E(this.A05, c1273Ug.A05)) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        int result = this.A06.hashCode();
        int i5 = result * 31;
        int result2 = this.A03 != null ? this.A03.hashCode() : 0;
        int result3 = (((i5 + result2) * 31) + this.A02.hashCode()) * 31;
        int result4 = this.A00.hashCode();
        return ((result3 + result4) * 31) + this.A05.hashCode();
    }
}
