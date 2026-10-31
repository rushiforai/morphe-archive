package com.facebook.ads.redexgen.X;

import android.view.View;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.oj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2312oj extends FrameLayout {
    public static final int A08 = AbstractC2383pv.A0e;
    public C07046w A00;
    public C0804Bj A01;
    public C5Z A02;
    public C0786Ar A03;
    public C5B A04;
    public AnonymousClass51 A05;
    public final C0958Hi A06;
    public final C2232nO A07;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 12 out of bounds for length 12
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final void A04(InterfaceC2224nG interfaceC2224nG, String str, Map<String, String> map) {
        A02();
        this.A02 = new C5Z(this.A06, interfaceC2224nG, this.A00, str, null, map);
        if (C2203mv.A20(this.A06)) {
            this.A01 = new C0804Bj(this.A06, interfaceC2224nG, this.A00, str, false, this.A02, map);
        } else {
            this.A01 = null;
        }
    }

    public C2312oj(C0958Hi c0958Hi, C2232nO c2232nO) {
        super(c0958Hi);
        this.A07 = c2232nO;
        this.A06 = c0958Hi;
        setUpView(c0958Hi);
    }

    public final void A01() {
        A0j(true, 10);
    }

    public final void A02() {
        if (this.A01 != null) {
            this.A01.A07();
            this.A01 = null;
        }
        if (this.A02 != null) {
            this.A02.A0p();
            this.A02 = null;
        }
    }

    public final void A03(AbstractC2172mQ abstractC2172mQ) {
        getEventBus().A05(abstractC2172mQ);
    }

    public final void A05(EnumC1664e4 enumC1664e4) {
        A0f(enumC1664e4, 13);
    }

    public final boolean A06() {
        return A0q();
    }

    public C0799Be getSimpleVideoView() {
        return this.A00;
    }

    public float getVolume() {
        return getVolume();
    }

    public void setPlaceholderUrl(String str) {
        this.A04.setImage(str);
    }

    private void setUpPlugins(C0958Hi c0958Hi) {
        A0Z();
        this.A04 = new C5B(c0958Hi);
        A0g(this.A04);
        this.A03 = new C0786Ar(c0958Hi, this.A07);
        A0g(new C5M(c0958Hi));
        A0g(this.A03);
        this.A05 = new AnonymousClass51(c0958Hi, true, this.A07);
        A0g(this.A05);
        A0g(new C0788At(this.A05, EnumC1654du.A03, true, true));
        if (!A0l()) {
            return;
        }
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(10);
        layoutParams.addRule(11);
        layoutParams.setMargins(A08, A08, A08, A08);
        this.A03.setLayoutParams(layoutParams);
        addView(this.A03);
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.facebook.ads.redexgen.X.6w] */
    private void setUpVideo(final C0958Hi c0958Hi) {
        this.A00 = new C0799Be(c0958Hi) { // from class: com.facebook.ads.redexgen.X.6w
            @Override // android.widget.RelativeLayout, android.view.View
            public final void onMeasure(int i5, int i11) {
                int newWidthSpec = View.MeasureSpec.getMode(i5);
                if (newWidthSpec == 1073741824) {
                    i11 = i5;
                } else {
                    int newWidthSpec2 = View.MeasureSpec.getMode(i11);
                    if (newWidthSpec2 == 1073741824) {
                        i5 = i11;
                    }
                }
                super.onMeasure(i5, i11);
            }
        };
        setLayoutParams(new FrameLayout.LayoutParams(-1, -2));
        AbstractC2426qc.A0L(this.A00);
        addView(this.A00);
        setOnClickListener(new ViewOnClickListenerC2313ok(this));
    }

    private void setUpView(C0958Hi c0958Hi) {
        setUpVideo(c0958Hi);
        setUpPlugins(c0958Hi);
    }

    public void setVideoURI(String str) {
        setVideoURI(str);
    }

    public void setVolume(float f11) {
        setVolume(f11);
        this.A03.A09();
    }
}
