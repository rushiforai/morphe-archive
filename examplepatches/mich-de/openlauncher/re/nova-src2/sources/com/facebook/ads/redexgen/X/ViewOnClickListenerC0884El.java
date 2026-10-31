package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.El, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnClickListenerC0884El extends AbstractC2652uG implements View.OnClickListener {
    public static byte[] A0F;
    public static String[] A0G = {"idQnrwKrPQs0c3zYYHT6WTvW1aXoRMqQ", "Gekt1WHQiHnIJqxdwB9j8FzDtIJy1cfJ", "sF2V", "CdtBVDHmuEaNC9R8", "jtmNaJ8NDkAfiILRFeCM3WK", "aXO2Ks7stxeTyHMnCxwSATKtkmhK3bmt", "xmLEl9t0StR", b.f42142b};
    public static final int A0H;
    public int A00;
    public int A01;
    public Bitmap A02;
    public Paint A03;
    public Rect A04;
    public C0958Hi A05;
    public C2370pi A06;
    public C0888Ep A07;
    public String A08;
    public String A09;
    public String A0A;
    public boolean A0B;
    public boolean A0C;
    public final C2644u8 A0D;
    public final Map<String, String> A0E;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0F, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] ^ i12;
            if (A0G[2].length() != 4) {
                throw new RuntimeException();
            }
            A0G[3] = "DG";
            bArrCopyOfRange[i13] = (byte) (i14 ^ 83);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A0F = new byte[]{64, 78, -84, -39, 78, 86, 121, 33, 95, 80, 85, 95, 87, 99, 79, 83, 73, 78, 95, 89, 28, 24, 87, 23, 31, 9, 9, 31, 20, 29, 31, 8, 58, 32, 12, 37, 97, 12, 55, 54, 32, 58, 52, 61, 90, 92, 74, 93, 76, 67, 70, 76, 68, -68, -55};
    }

    static {
        A04();
        A0H = AbstractC2383pv.A0D;
    }

    public ViewOnClickListenerC0884El(C0958Hi c0958Hi, LA la2, C1744fN c1744fN, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, C1539c2 c1539c2, C2417qT c2417qT, InterfaceC2396q8 interfaceC2396q8) {
        this(c0958Hi, la2.A1X(), c1744fN, la2.A32().A0K().A07(), interfaceC2224nG, interfaceC2459r9, c1539c2, c2417qT, la2.A33(), interfaceC2396q8);
        this.A0D.A0A(la2);
    }

    public ViewOnClickListenerC0884El(C0958Hi c0958Hi, String str, C1744fN c1744fN, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, C1539c2 c1539c2, C2417qT c2417qT, C1750fT c1750fT) {
        this(c0958Hi, str, c1744fN, false, interfaceC2224nG, interfaceC2459r9, c1539c2, c2417qT, c1750fT);
    }

    public ViewOnClickListenerC0884El(C0958Hi c0958Hi, String str, C1744fN c1744fN, boolean z11, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, C1539c2 c1539c2, C2417qT c2417qT, C1750fT c1750fT) {
        super(c0958Hi, c1744fN);
        this.A0E = new HashMap();
        this.A0C = false;
        this.A05 = c0958Hi;
        this.A0B = z11;
        this.A0D = new C2644u8(c0958Hi, str, c1539c2, c2417qT, interfaceC2224nG, c1750fT, interfaceC2459r9);
        setOnClickListener(this);
        AbstractC2426qc.A0H(1001, this);
    }

    public ViewOnClickListenerC0884El(C0958Hi c0958Hi, String str, C1744fN c1744fN, boolean z11, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, C1539c2 c1539c2, C2417qT c2417qT, C1750fT c1750fT, InterfaceC2396q8 interfaceC2396q8) {
        super(c0958Hi, c1744fN);
        this.A0E = new HashMap();
        this.A0C = false;
        this.A05 = c0958Hi;
        this.A0B = z11;
        this.A0D = new C2644u8(c0958Hi, str, c1539c2, c2417qT, interfaceC2224nG, c1750fT, interfaceC2459r9, interfaceC2396q8);
        setOnClickListener(this);
        AbstractC2426qc.A0H(1001, this);
    }

    public static Bitmap A00(Drawable drawable) {
        if (drawable instanceof BitmapDrawable) {
            return ((BitmapDrawable) drawable).getBitmap();
        }
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmapCreateBitmap);
        drawable.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
        drawable.draw(canvas);
        return bitmapCreateBitmap;
    }

    private void A02() {
        if (this.A0B && this.A0A != null) {
            this.A02 = A00(AbstractC2438qo.A03(this.A05, this.A0A.contains(A01(20, 12, 41)) ? EnumC2437qn.MESSENGER : EnumC2437qn.WHATSAPP));
            this.A03 = new Paint();
            setPadding(A0H, 0, A0H, 0);
        }
    }

    private void A03() {
        if (this.A06 != null) {
            this.A06.A06();
        }
        if (this.A07 != null) {
            this.A07.A04();
        }
    }

    public static boolean A05(LA la2) {
        return ((long) la2.A2x()) > 0 && la2.A2v() >= 0;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2652uG
    public final void A0D() {
        if (TextUtils.isEmpty(this.A09)) {
            super.A0D();
            return;
        }
        String buttonText = getText().toString();
        if (TextUtils.isEmpty(buttonText)) {
            return;
        }
        String text = A01(53, 2, 45);
        int iIndexOf = buttonText.indexOf(text);
        if (iIndexOf > 0) {
            String text2 = buttonText.substring(0, iIndexOf);
            buttonText = text2.trim();
        }
        String text3 = A01(5, 3, 89);
        String[] words = buttonText.split(text3);
        for (int i5 = 0; i5 < words.length; i5++) {
            StringBuilder sb2 = new StringBuilder();
            String text4 = words[i5];
            StringBuilder sbAppend = sb2.append(text4.substring(0, 1).toUpperCase(Locale.getDefault()));
            String text5 = words[i5];
            words[i5] = sbAppend.append(text5.substring(1).toLowerCase(Locale.getDefault())).toString();
        }
        StringBuilder sb3 = new StringBuilder();
        String text6 = A01(0, 1, 51);
        StringBuilder sbAppend2 = sb3.append(AbstractC2645u9.A01(text6, words));
        String text7 = A01(1, 4, 61);
        StringBuilder sbAppend3 = sbAppend2.append(text7);
        String text8 = this.A09;
        super.setText((CharSequence) sbAppend3.append(text8).toString());
    }

    public final EnumC1698ec A0E(String str) {
        if (TextUtils.isEmpty(this.A08) || TextUtils.isEmpty(this.A0A)) {
            return EnumC1698ec.A08;
        }
        A03();
        this.A0E.put(A01(8, 12, 111), str);
        this.A0E.put(A01(32, 12, 0), String.valueOf(this.A0C));
        return this.A0D.A06(this.A08, this.A0A, this.A0E);
    }

    public final void A0F() {
        if (!this.A0E.isEmpty()) {
            this.A0E.clear();
        }
        this.A0D.A08();
    }

    public final void A0G(C1746fP c1746fP) {
        if (!TextUtils.isEmpty(c1746fP.A04()) && !TextUtils.isEmpty(c1746fP.A05())) {
            this.A09 = null;
            setText(c1746fP.A05());
        }
    }

    public final void A0H(InterfaceC2643u7 interfaceC2643u7) {
        this.A0D.A0C(interfaceC2643u7);
    }

    public final boolean A0I(LA la2, AbstractC2452r2 abstractC2452r2) {
        if (this.A06 != null || !A05(la2) || la2.A36().A02() == null || la2.A36().A01() == null) {
            return false;
        }
        this.A07 = new C0888Ep(la2.A2v(), la2.A2x(), la2.A2w(), la2.A36().A02(), la2.A36().A01(), abstractC2452r2, this);
        this.A06 = new C2370pi(la2.A2x(), this.A07);
        this.A06.A07();
        return true;
    }

    public String getClickUrl() {
        return this.A0A;
    }

    public C2644u8 getCtaActionHelper() {
        return this.A0D;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            A0E(A01(44, 9, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }

    @Override // android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        A03();
    }

    @Override // android.widget.TextView, android.view.View
    public final void onDraw(Canvas canvas) {
        if (this.A02 != null) {
            this.A04 = new Rect(0, 0, this.A02.getWidth(), this.A02.getHeight());
            this.A01 = this.A02.getWidth();
            this.A00 = 12;
            int shift = (this.A01 + this.A00) / 2;
            canvas.save();
            canvas.translate(shift, 0.0f);
        }
        super.onDraw(canvas);
        if (this.A02 != null) {
            CharSequence text = getText();
            if (text != null) {
                float fMeasureText = getPaint().measureText(text.toString()) + 10.0f;
                float textWidth = getWidth();
                int i5 = (int) ((((textWidth / 2.0f) - (fMeasureText / 2.0f)) - this.A01) - this.A00);
                int left = (getHeight() / 2) - (this.A01 / 2);
                canvas.drawBitmap(this.A02, this.A04, new Rect(i5, left, this.A01 + i5, this.A01 + left), this.A03);
            }
            canvas.restore();
        }
    }

    @Override // android.widget.TextView, android.view.View
    public final void onVisibilityChanged(View view, int i5) {
        super.onVisibilityChanged(view, i5);
        if (i5 != 0) {
            A03();
        }
    }

    @Override // android.widget.TextView, android.view.View
    public final void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        if (!z11) {
            A03();
        }
    }

    public void setClickUrl(String str) {
        this.A0A = str;
    }

    public void setClickUrl(String str, Map<String, String> extraData) {
        this.A0A = str;
        this.A0E.putAll(extraData);
    }

    public void setCta(C1746fP c1746fP, String str, Map<String, String> extraData) {
        setCta(c1746fP, str, extraData, null);
    }

    public void setCta(C1746fP c1746fP, String str, Map<String, String> extraData, InterfaceC2396q8 interfaceC2396q8, InterfaceC2643u7 interfaceC2643u7) {
        setCta(c1746fP, str, extraData, interfaceC2643u7);
        this.A0D.A0B(interfaceC2396q8);
    }

    public void setCta(C1746fP c1746fP, String str, Map<String, String> map, InterfaceC2643u7 interfaceC2643u7) {
        this.A08 = str;
        this.A0A = c1746fP.A06();
        this.A0E.putAll(map);
        this.A0D.A0D(interfaceC2643u7);
        String ctaMetadata = c1746fP.A05();
        if (!TextUtils.isEmpty(ctaMetadata)) {
            String buttonText = this.A0A;
            if (!TextUtils.isEmpty(buttonText)) {
                String strA04 = c1746fP.A04();
                String buttonText2 = TextUtils.isEmpty(strA04) ? null : strA04;
                this.A09 = buttonText2;
                if (!TextUtils.isEmpty(strA04)) {
                    StringBuilder sbAppend = new StringBuilder().append(ctaMetadata);
                    String buttonText3 = A01(1, 4, 61);
                    setText(sbAppend.append(buttonText3).append(strA04).toString());
                } else {
                    setText(ctaMetadata);
                }
                A02();
                return;
            }
        }
        setVisibility(8);
    }

    public void setIsInAppBrowser(boolean z11) {
        this.A0D.A0E(z11);
    }

    public void setV2Design(boolean z11) {
        this.A0C = z11;
    }
}
