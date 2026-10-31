package com.facebook.ads.redexgen.X;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.widget.ImageView;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Aq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0785Aq extends ImageView implements InterfaceC1663e3 {
    public static byte[] A05;
    public static final int A06;
    public C0799Be A00;
    public final Paint A01;
    public final C0958Hi A02;
    public final C2232nO A03;
    public final B3 A04;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 28);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A05 = new byte[]{122, -94, -95, -110, 77, 110, -111};
    }

    static {
        A06();
        A06 = AbstractC2383pv.A0H;
    }

    public C0785Aq(C0958Hi c0958Hi, C2232nO c2232nO) {
        super(c0958Hi);
        this.A04 = new B3() { // from class: com.facebook.ads.redexgen.X.5C
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(B4 b42) {
                this.A00.A09();
            }
        };
        this.A03 = c2232nO;
        this.A02 = c0958Hi;
        this.A01 = new Paint();
        this.A01.setColor(Integer.MIN_VALUE);
        setColorFilter(-1);
        setPadding(AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y);
        setContentDescription(A03(0, 7, 17));
        A05();
        setOnClickListener(new ViewOnClickListenerC1649dp(this));
        AbstractC2426qc.A0H(1112, this);
    }

    private void A04() {
        setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.ICON_MUTE));
    }

    private void A05() {
        setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.ICON_UN_MUTE));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A07() {
        return this.A00 != null && this.A00.getVolume() == 0.0f;
    }

    public final void A09() {
        if (this.A00 == null) {
            return;
        }
        if (A07()) {
            A04();
        } else {
            A05();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1663e3
    public final void ABd(C0799Be c0799Be) {
        this.A00 = c0799Be;
        if (this.A00 != null) {
            this.A00.getEventBus().A05(this.A04);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1663e3
    public final void ALp(C0799Be c0799Be) {
        if (this.A00 != null) {
            this.A00.getEventBus().A06(this.A04);
        }
        this.A00 = null;
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onDraw(Canvas canvas) {
        int y11 = getWidth() / 2;
        int x11 = getHeight() / 2;
        canvas.drawCircle(y11, x11, Math.min(y11, x11), this.A01);
        super.onDraw(canvas);
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        int height = A06;
        int width = A06;
        setMeasuredDimension(height, width);
    }
}
