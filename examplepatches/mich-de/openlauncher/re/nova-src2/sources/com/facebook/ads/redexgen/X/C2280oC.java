package com.facebook.ads.redexgen.X;

import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.Arrays;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.oC, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2280oC extends LinearLayout {
    public static byte[] A03;
    public static String[] A04 = {"F7oiGWHDW6FlXKbumFqAsiFj3Zy9d02f", "njbIZQUh4kOSvRp99Ka0pLH96NoEUi", "uBaRfduMjMbfnJ6Dbgh2gXn", "Q5QLjjvfTGRgxpkT38Aphz", "wBRZurdnuXbk33Wwui208TGtUiOPoAjw", "XpnVjDS9IQD6Q4glSqewdbzyGFB212WX", "Yh84W3csvcbiPnAeyVs5og2VgIOUeUlF", "umfte8dekaf4cRX5Sax5V7W"};
    public static final C2294oQ A05;
    public final ImageView A00;
    public final TextView A01;
    public final C0958Hi A02;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public C2280oC(C0958Hi c0958Hi) {
        super(c0958Hi);
        C1h.A09(c0958Hi, A00(7, 9, 94));
        this.A02 = c0958Hi;
        setOrientation(1);
        int i5 = (((this.A02.getResources().getDisplayMetrics().widthPixels - AbstractC2383pv.A0A) - AbstractC2383pv.A0A) - AbstractC2383pv.A0X) / 2;
        float f11 = AbstractC2383pv.A0A;
        ImageView imageView = new ImageView(getContext());
        imageView.setLayoutParams(new LinearLayout.LayoutParams(-1, i5));
        imageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
        imageView.setOutlineProvider(new C2298oV(f11));
        imageView.setClipToOutline(true);
        this.A00 = imageView;
        addView(this.A00);
        TextView textView = new TextView(getContext());
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.topMargin = AbstractC2383pv.A02;
        layoutParams.bottomMargin = AbstractC2383pv.A02;
        layoutParams.setMarginStart(AbstractC2383pv.A0X);
        layoutParams.setMarginEnd(AbstractC2383pv.A0X);
        textView.setLayoutParams(layoutParams);
        textView.setTextColor(Color.parseColor(A00(0, 7, 68)));
        textView.setTextSize(2, 14.0f);
        textView.setLineSpacing(0.0f, 0.0f);
        textView.setLineSpacing(TypedValue.applyDimension(2, 16.0f, textView.getResources().getDisplayMetrics()) - textView.getTextSize(), 0.0f);
        textView.setMaxLines(1);
        textView.setEllipsize(TextUtils.TruncateAt.END);
        textView.setIncludeFontPadding(false);
        this.A01 = textView;
        LinearLayout linearLayout = new LinearLayout(getContext());
        linearLayout.setOrientation(1);
        linearLayout.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        linearLayout.setBackground(new ColorDrawable(-1));
        linearLayout.setOutlineProvider(new C2281oD(f11));
        linearLayout.setClipToOutline(true);
        linearLayout.addView(this.A01);
        addView(linearLayout);
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 3);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        if (A04[1].length() == 5) {
            throw new RuntimeException();
        }
        String[] strArr = A04;
        strArr[7] = "JGw8wXeLdHqJduoGu1fuz1u";
        strArr[2] = "qRFyAJ6IfLcIuaQeI8GLd2c";
        A03 = new byte[]{106, 119, AbstractJsonLexerKt.TC_INVALID, 119, AbstractJsonLexerKt.TC_INVALID, 119, -128, -62, -59, -92, -48, -49, -43, -58, -39, -43, -27, -28, -73, -23, -23, -37, -22, -23, -62, -27, -41, -38, -37, -38, -95, -96, 117, -98, -101, -107, -99, 115, -107, -90, -101, -95, -96, -123, -121, -124, 121, -118, 120, -119, 94, -125, 123, -124};
    }

    static {
        A01();
        A05 = new C2294oQ(null);
    }

    public final void A02(C2278oA c2278oA, InterfaceC05620n<AnonymousClass22> interfaceC05620n, InterfaceC05620n<AnonymousClass22> interfaceC05620n2) {
        C1h.A09(c2278oA, A00(43, 11, 18));
        C1h.A09(interfaceC05620n, A00(30, 13, 47));
        C1h.A09(interfaceC05620n2, A00(16, 14, 115));
        this.A01.setText(c2278oA.A04());
        this.A00.setImageDrawable(null);
        new AsyncTaskC0892Et(this.A00, this.A02).A04().A06(new CO(interfaceC05620n2)).A07(c2278oA.A02());
        setOnClickListener(new ViewOnClickListenerC2282oE(interfaceC05620n));
    }

    public final ImageView getProductImageView() {
        return this.A00;
    }

    public final TextView getProductTitleView() {
        return this.A01;
    }
}
