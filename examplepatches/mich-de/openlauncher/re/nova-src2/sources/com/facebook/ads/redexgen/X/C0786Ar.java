package com.facebook.ads.redexgen.X;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.widget.ImageView;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Ar, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0786Ar extends ImageView implements InterfaceC1663e3 {
    public static byte[] A06;
    public static String[] A07 = {"CZ6R6baQKTb1E5sAmpDqVkfMXF7zVnG4", "nQZGX73N3q5NRRZlZyP90gUTrDeeLYBu", "LfCM6PYFJNbwOvLH4thVDQon3h1Zk2zk", "bpUakkTElIOqaP65ISNG9oh", "gJtMODfbj2e7z8MJG7ZRKfD", "8rYwk9o7IGDDsMQbyUTj4ra1LUt9E6qX", "3WiLQHXTUUJ8WctEatoRQ", "Xo7nIXQ5hsw2R0tzDjIU8fyfjH4jtFIR"};
    public static final int A08;
    public static final int A09;
    public C0799Be A00;
    public final Paint A01;
    public final RectF A02;
    public final C0958Hi A03;
    public final C2232nO A04;
    public final B3 A05;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 19);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A06 = new byte[]{101, 93, 92, 77, 8, 105, 76};
    }

    static {
        A06();
        A09 = (int) (AbstractC2385px.A02 * 4.0f);
        A08 = (int) (AbstractC2385px.A02 * 6.0f);
    }

    public C0786Ar(C0958Hi c0958Hi, C2232nO c2232nO) {
        this(c0958Hi, c2232nO, false);
    }

    public C0786Ar(C0958Hi c0958Hi, C2232nO c2232nO, boolean z11) {
        super(c0958Hi);
        this.A05 = new B3() { // from class: com.facebook.ads.redexgen.X.5D
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(B4 b42) {
                this.A00.A09();
            }
        };
        this.A04 = c2232nO;
        this.A03 = c0958Hi;
        if (z11) {
            this.A02 = new RectF();
        } else {
            this.A02 = null;
        }
        this.A01 = new Paint();
        this.A01.setColor(-1728053248);
        setColorFilter(-1);
        setPadding(A09, A09, A09, A09);
        setContentDescription(A03(0, 7, 59));
        A05();
        setOnClickListener(new ViewOnClickListenerC1650dq(this));
    }

    private void A04() {
        setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.SOUND_OFF));
    }

    private void A05() {
        setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.SOUND_ON));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A07() {
        if (this.A00 != null) {
            float volume = this.A00.getVolume();
            String[] strArr = A07;
            if (strArr[5].charAt(12) == strArr[1].charAt(12)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A07;
            strArr2[3] = "7LwdJMyLjSlNEKSwxkcw7Q3";
            strArr2[6] = "d5nTRpYYugpReKnwSxkEX";
            if (volume == 0.0f) {
                return true;
            }
        }
        return false;
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
            this.A00.getEventBus().A05(this.A05);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1663e3
    public final void ALp(C0799Be c0799Be) {
        if (this.A00 != null) {
            this.A00.getEventBus().A06(this.A05);
        }
        this.A00 = null;
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onDraw(Canvas canvas) {
        int width = getWidth() / 2;
        int x11 = getHeight();
        int y11 = x11 / 2;
        if (this.A02 != null) {
            RectF rectF = this.A02;
            int x12 = getWidth();
            float f11 = x12;
            int x13 = getHeight();
            rectF.set(0.0f, 0.0f, f11, x13);
            RectF rectF2 = this.A02;
            int x14 = A08;
            float f12 = x14;
            int x15 = A08;
            canvas.drawRoundRect(rectF2, f12, x15, this.A01);
        } else {
            int x16 = Math.min(width, y11);
            canvas.drawCircle(width, y11, x16, this.A01);
        }
        super.onDraw(canvas);
    }

    public void setBackgroundPaintColor(int i5) {
        this.A01.setColor(i5);
    }
}
