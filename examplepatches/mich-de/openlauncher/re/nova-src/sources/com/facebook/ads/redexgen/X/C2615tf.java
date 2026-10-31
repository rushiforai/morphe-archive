package com.facebook.ads.redexgen.X;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.tf, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2615tf extends Drawable {
    public static byte[] A0G;
    public static String[] A0H = {"Mp", "s1okci9AACeOEsTaqEhejkWwVhqIiyNU", "empHZDdin7c86b5ED3ajK85vhcLRVQYd", "QRrQz6m9v7aBhecCWxUXgpf0lUmjJya0", "Hctlswo9ad12sYru2lKVThOw6NzJy2jW", "0MQcFv6TsH62DS4QTRzsSvzajYizZeJ9", "0Y", "3fR7fZsYHtoPr7aoRN1kO3di1PlcoJD4"};
    public int A00;
    public int A01;
    public int A02;
    public long A03;
    public String A04;
    public String A05;
    public String A06;
    public WeakReference<C1539c2> A07;
    public boolean A08;
    public final Paint A09 = new Paint();
    public final Paint A0A = new Paint();
    public final Path A0C = new Path();
    public final TextPaint A0E = new TextPaint();
    public final Paint A0B = new Paint();
    public final Handler A0D = new Handler();
    public final Runnable A0F = new C0893Eu(this);

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0G, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 62);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A0G = new byte[]{65, 73, 21, 42, 38, 52, 121, 99, 24, 87, 94, 24, 81, 93, 49, 18, 28, 25, 24, 25, 93, 117, 109, 113, 113, 109, 115, 55, 21, 6, 16, 84, 86, 113, 118, 107, 118, 126, 115, 118, 101, 118, 113, 120, 49, 49, 49, 60, 11, 4, 79, 68, AbstractJsonLexerKt.TC_INVALID, 122, AbstractJsonLexerKt.TC_INVALID, 126, 102, AbstractJsonLexerKt.TC_INVALID, 108, 83, 95, 77, 91, 88, 83, 86, 83, 78, 67, 26, 121, 82, 95, 89, 81, 95, 72, 26, 84, 85, 78, 26, 73, 95, 78, 32, 104, 48, 125, 51, 96, 33, 39, 47};
    }

    static {
        A04();
    }

    public C2615tf() {
        this.A09.setColor(Color.argb(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 36, 36, 36));
        this.A09.setStyle(Paint.Style.FILL_AND_STROKE);
        this.A0A.setAntiAlias(true);
        this.A0A.setColor(Color.argb(191, 0, 255, 0));
        this.A0A.setStrokeWidth(20.0f);
        this.A0A.setStyle(Paint.Style.STROKE);
        this.A0E.setAntiAlias(true);
        this.A0E.setColor(-1);
        this.A0E.setStyle(Paint.Style.FILL_AND_STROKE);
        this.A0E.setTextSize(30.0f);
        this.A0B.setColor(Color.argb(Sdk.SDKError.Reason.PLACEMENT_SLEEP_VALUE, 0, 0, 0));
        this.A0B.setStyle(Paint.Style.FILL_AND_STROKE);
        A07();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A03() {
        StringBuilder sb2 = new StringBuilder();
        int i5 = this.A00;
        String strA02 = A02(0, 1, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
        if (i5 <= 0) {
            if (!TextUtils.isEmpty(this.A06)) {
                sb2.append(this.A06);
                sb2.append(strA02);
            }
            if (!TextUtils.isEmpty(this.A04)) {
                sb2.append(this.A04);
                sb2.append(strA02);
            }
            sb2.append(A02(47, 4, 81));
            sb2.append(A02(21, 6, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
            sb2.append(A02(12, 9, 67));
            if (this.A03 > 0) {
                long jMax = Math.max(0L, System.currentTimeMillis() - this.A03);
                int i11 = (int) (jMax / 3600000);
                long j11 = jMax % 3600000;
                int minutes = (int) (j11 / 60000);
                int i12 = (int) ((j11 % 60000) / 1000);
                if (i11 > 0) {
                    sb2.append(i11);
                    sb2.append(A02(85, 2, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE));
                }
                if (i11 > 0 || minutes > 0) {
                    sb2.append(minutes);
                    sb2.append(A02(87, 2, 99));
                }
                sb2.append(i12);
                sb2.append(A02(89, 5, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
            } else {
                String[] strArr = A0H;
                if (strArr[3].charAt(18) == strArr[1].charAt(18)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0H;
                strArr2[4] = "KaVl90AUCQiyYrscuVoIg37eW2R2JvQo";
                strArr2[2] = "0pxfQADbA4sIF5gDourAGVlubWCldmoZ";
                sb2.append(A02(51, 7, 47));
            }
        } else {
            sb2.append(A02(27, 5, 74));
            sb2.append(this.A01 + 1);
            sb2.append(A02(8, 4, 6));
            sb2.append(this.A00);
        }
        sb2.append(A02(1, 7, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
        if (this.A07 == null || this.A07.get() == null) {
            sb2.append(A02(58, 27, 4));
        } else {
            sb2.append(this.A07.get().A0R());
        }
        this.A05 = sb2.toString();
        float fMax = -2.1474836E9f;
        String[] strArrSplit = this.A05.split(strA02);
        for (String str : strArrSplit) {
            fMax = Math.max(fMax, this.A0E.measureText(str, 0, str.length()));
        }
        this.A02 = (int) (0.5f + fMax);
        invalidateSelf();
    }

    public final void A07() {
        this.A00 = 0;
        this.A01 = -1;
        this.A05 = A02(32, 15, 33);
        this.A02 = 100;
        this.A06 = null;
        this.A03 = -1L;
        this.A07 = null;
        A0D(false);
    }

    public final void A08(int i5, int i11) {
        this.A00 = i5;
        this.A01 = i11;
        A03();
    }

    public final void A09(long j11) {
        this.A03 = j11;
        A03();
    }

    public final void A0A(C1539c2 c1539c2) {
        this.A07 = new WeakReference<>(c1539c2);
        A03();
    }

    public final void A0B(String str) {
        this.A04 = str;
        A03();
    }

    public final void A0C(String str) {
        this.A06 = str;
        A03();
    }

    public final void A0D(boolean z11) {
        this.A08 = z11;
        if (this.A08) {
            this.A0D.post(this.A0F);
        } else {
            this.A0D.removeCallbacks(this.A0F);
        }
        invalidateSelf();
    }

    public final boolean A0E() {
        return this.A08;
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        if (!this.A08) {
            return;
        }
        int width = canvas.getWidth();
        int height = canvas.getHeight();
        canvas.drawRect(0.0f, 0.0f, width, height, this.A09);
        StaticLayout textLayout = new StaticLayout(this.A05, this.A0E, this.A02, Layout.Alignment.ALIGN_CENTER, 1.0f, 0.0f, false);
        float f11 = width / 2.0f;
        float f12 = height / 2.0f;
        float width2 = textLayout.getWidth() / 2.0f;
        float height2 = textLayout.getHeight() / 2.0f;
        float canvasMiddleY = f11 - width2;
        float textMiddleX = f12 - height2;
        float textMiddleY = f11 + width2;
        canvas.drawRect(canvasMiddleY - 40.0f, textMiddleX - 40.0f, textMiddleY + 40.0f, f12 + height2 + 40.0f, this.A0B);
        canvas.save();
        canvas.translate(f11 - width2, f12 - height2);
        textLayout.draw(canvas);
        canvas.restore();
        this.A0C.reset();
        this.A0C.moveTo(0.0f, 0.0f);
        this.A0C.lineTo(width, 0.0f);
        this.A0C.lineTo(width, height);
        this.A0C.lineTo(0.0f, height);
        this.A0C.lineTo(0.0f, 0.0f);
        canvas.drawPath(this.A0C, this.A0A);
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
    }
}
