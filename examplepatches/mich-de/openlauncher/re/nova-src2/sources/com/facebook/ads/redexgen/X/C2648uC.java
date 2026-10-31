package com.facebook.ads.redexgen.X;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;
import android.view.animation.LinearInterpolator;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.uC, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2648uC extends View {
    public static byte[] A0I;
    public static String[] A0J = {"MXGSYDJIXT53Eu", "rSQjewWzlJJm6mH", "OTLmHCk6V9sRuaMMoAeoEWIA", "xEVpkBxJdMs8Usx", "4HebFghRFBisJMY0sXBOKXuAw8NdoIIk", "XKZ7ELYRKja0tESu6FyTVaQEn2THsruU", "DjhgBtBBpe0Qnsw2vo6CB27u6IJrUzuu", "eG2iyoTD0N1tzC"};
    public float A00;
    public int A01;
    public int A02;
    public int A03;
    public long A04;
    public ValueAnimator A05;
    public boolean A06;
    public boolean A07;
    public final float A08;
    public final float A09;
    public final float A0A;
    public final float A0B;
    public final float A0C;
    public final int A0D;
    public final Paint A0E;
    public final Paint A0F;
    public final Paint A0G;
    public final RectF A0H;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0I, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 87);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        byte[] bArr = {-27, -6, -14, 8, 8, 8, 8, 8, 8};
        String[] strArr = A0J;
        if (strArr[6].charAt(19) == strArr[5].charAt(19)) {
            throw new RuntimeException();
        }
        A0J[0] = "DreWOAfYMIn4dp";
        A0I = bArr;
    }

    static {
        A05();
    }

    public C2648uC(Context context, int i5) {
        super(context);
        this.A01 = 0;
        this.A00 = 0.0f;
        this.A03 = 0;
        this.A02 = 0;
        this.A07 = true;
        this.A0H = new RectF();
        this.A04 = 0L;
        this.A06 = false;
        float f11 = AbstractC2385px.A02;
        float density = 3.0f * f11;
        this.A0B = density;
        float density2 = 24.0f * f11;
        this.A09 = density2;
        float density3 = 6.0f * f11;
        this.A08 = density3;
        float density4 = 8.0f * f11;
        this.A0C = density4;
        this.A0A = this.A08 / 2.0f;
        this.A0D = i5;
        A04();
        this.A0G = new Paint(1);
        Paint paint = this.A0G;
        String strA03 = A03(0, 9, 107);
        paint.setColor(Color.parseColor(strA03));
        this.A0G.setStyle(Paint.Style.FILL);
        this.A0F = new Paint(1);
        this.A0F.setColor(-1);
        this.A0F.setStyle(Paint.Style.FILL);
        this.A0E = new Paint(1);
        this.A0E.setColor(Color.parseColor(strA03));
        this.A0E.setStyle(Paint.Style.FILL);
    }

    /* JADX WARN: Incorrect condition in loop: B:12:0x0028 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private float A00() {
        float f11;
        int i5 = this.A02 - this.A03;
        if (i5 <= 0) {
            return 0.0f;
        }
        float f12 = 0.0f;
        if (A0J[2].length() != 24) {
            throw new RuntimeException();
        }
        A0J[2] = "Y0ZkWaxMT6jt3adZTw52BStx";
        for (int i11 = this.A03; i11 < visibleCount; i11++) {
            float scale = A01(i11);
            int visibleCount = this.A01;
            if (i11 == visibleCount) {
                f11 = this.A06 ? this.A0B * 2.0f : this.A09;
            } else {
                f11 = this.A0B * 2.0f;
            }
            f12 += f11 * scale;
        }
        int visibleCount2 = i5 - 1;
        float width = visibleCount2;
        return f12 + (width * this.A0C);
    }

    private float A01(int i5) {
        if (this.A0D <= 5 || i5 == this.A01) {
            return 1.0f;
        }
        if (i5 != this.A03 || this.A03 <= 0) {
            return (i5 != this.A02 + (-1) || this.A02 >= this.A0D) ? 1.0f : 0.6f;
        }
        return 0.6f;
    }

    private void A04() {
        if (this.A0D <= 5) {
            this.A03 = 0;
            this.A02 = this.A0D;
            return;
        }
        if (this.A07) {
            if (this.A01 >= this.A02) {
                int i5 = this.A01 - 5;
                if (A0J[0].length() != 14) {
                    throw new RuntimeException();
                }
                A0J[0] = "kVk1mb97Ae4y6Z";
                this.A03 = i5 + 2;
            } else if (this.A01 == this.A02 - 1) {
                int i11 = this.A02;
                int i12 = this.A0D;
                String[] strArr = A0J;
                if (strArr[6].charAt(19) == strArr[5].charAt(19)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0J;
                strArr2[6] = "M5hFB8KfS4APqOoRWAJyy3kSPVToucAF";
                strArr2[5] = "5ObYjJgOqSTG6ZUTMyE7gnDPrG4xqxW4";
                if (i11 < i12) {
                    this.A03 = (this.A01 - 5) + 2;
                }
            }
            if (this.A01 >= this.A0D - 3) {
                this.A03 = this.A0D - 5;
            }
        } else {
            if (this.A01 < this.A03) {
                this.A03 = this.A01 - 1;
            } else if (this.A01 == this.A03 && this.A03 > 0) {
                this.A03 = this.A01 - 1;
            }
            if (this.A01 <= 3) {
                this.A03 = 0;
            }
        }
        this.A03 = Math.max(0, this.A03);
        this.A02 = this.A03 + 5;
        if (this.A02 > this.A0D) {
            this.A02 = this.A0D;
            String[] strArr3 = A0J;
            if (strArr3[6].charAt(19) != strArr3[5].charAt(19)) {
                A0J[4] = "J7b6LWOWNr0Bc1GXf6shmLhEJA9JYO0r";
                this.A03 = this.A02 - 5;
            } else {
                this.A03 = this.A02 - 5;
            }
        }
    }

    private void A06(Canvas canvas, float f11, float f12, float f13) {
        if (this.A06) {
            float f14 = this.A0B * f13;
            if (A0J[2].length() != 24) {
                throw new RuntimeException();
            }
            A0J[4] = "gfGE0IVM4IiiunjYNzvlXHeKRmLSnZvo";
            canvas.drawCircle(f11 + f14, f12, f14, this.A0F);
            return;
        }
        float right = this.A09 * f13;
        float top = this.A08 * f13;
        float cornerRadius = this.A0A * f13;
        float width = top / 2.0f;
        float bottom = f12 - width;
        float height = f11 + right;
        float top2 = (top / 2.0f) + f12;
        this.A0H.set(f11, bottom, height, top2);
        canvas.drawRoundRect(this.A0H, cornerRadius, cornerRadius, this.A0G);
        float height2 = this.A00;
        if (height2 > 0.0f) {
            float height3 = this.A00;
            this.A0H.set(f11, bottom, (height3 * right) + f11, top2);
            canvas.drawRoundRect(this.A0H, cornerRadius, cornerRadius, this.A0F);
        }
    }

    private void A07(Canvas canvas, float f11, float f12, float f13) {
        canvas.drawCircle(f11, f12, f13, this.A0E);
    }

    public final void A08() {
        A0B();
        this.A00 = 1.0f;
        invalidate();
    }

    public final void A09() {
        if (this.A05 != null && this.A05.isRunning()) {
            this.A05.pause();
        }
    }

    public final void A0A() {
        if (this.A05 != null && this.A05.isPaused()) {
            this.A05.resume();
        }
    }

    public final void A0B() {
        if (this.A05 != null) {
            this.A05.cancel();
            this.A05 = null;
        }
    }

    public final void A0C(long j11) {
        this.A04 = j11;
        if (this.A05 != null && this.A05.isRunning()) {
            return;
        }
        A0B();
        this.A00 = 0.0f;
        this.A05 = ValueAnimator.ofFloat(0.0f, 1.0f);
        this.A05.setDuration(j11);
        this.A05.setInterpolator(new LinearInterpolator());
        this.A05.addUpdateListener(new C2647uB(this));
        this.A05.start();
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.A0D <= 0) {
            return;
        }
        float activeWidth = (getWidth() - A00()) / 2.0f;
        float height = getHeight() / 2.0f;
        for (int i5 = this.A03; i5 < this.A02; i5++) {
            float fA01 = A01(i5);
            if (i5 == this.A01) {
                A06(canvas, activeWidth, height, fA01);
                float startX = this.A06 ? this.A0B * 2.0f : this.A09;
                float totalWidth = this.A0C;
                activeWidth += totalWidth + (startX * fA01);
            } else {
                float startX2 = this.A0B * fA01;
                float totalWidth2 = activeWidth + startX2;
                A07(canvas, totalWidth2, height, startX2);
                float totalWidth3 = this.A0C;
                activeWidth += (startX2 * 2.0f) + totalWidth3;
            }
        }
    }

    public void setCurrentPosition(int i5) {
        if (i5 >= 0 && i5 < this.A0D && this.A01 != i5) {
            A0B();
            if (this.A01 == this.A0D - 1 && i5 == 0) {
                this.A07 = true;
            } else {
                this.A07 = i5 > this.A01;
            }
            this.A01 = i5;
            A04();
            if (this.A04 > 0) {
                A0C(this.A04);
            } else {
                invalidate();
            }
        }
    }

    public void setDotsOnlyMode(boolean z11) {
        this.A06 = z11;
        invalidate();
    }
}
