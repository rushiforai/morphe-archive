package com.facebook.ads.redexgen.X;

import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.s6, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2518s6 extends FrameLayout {
    public static byte[] A03;
    public static String[] A04 = {"8g7rUDJr7O6IssAOltSex8KkgF4sYvfR", "OXGx65XQ4ZrIEK5TI7fivB7JI6XLFZVF", "163Q583oT81", "waeTQCpFOxHSYLVsoIAnuWvTxf8feInx", "qE6lOCp7JAI3EizzryOpuy2l8uSAI7El", "ZZuHIFUBfFeIEz32hbSx5WMxPJIm13l", "tJxhsqv5dHN5GfDg5MJDOa7xX22O9yYc", "OnQc0jkEhDJNrmKL7G"};
    public RelativeLayout A00;
    public ScrollView A01;
    public final C0958Hi A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 100);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        String[] strArr = A04;
        if (strArr[2].length() == strArr[5].length()) {
            throw new RuntimeException();
        }
        A04[7] = "Fsa7sVeYscHWL4B1dw";
        A03 = new byte[]{7, 59, 54, 115, 18, 55, 115, 58, 32, 115, 59, 58, 55, 55, 54, 61, 80, 107, 97, 106};
    }

    static {
        A04();
    }

    public C2518s6(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A02 = c0958Hi;
        this.A02.A0F().ABm();
        A03();
        A02();
    }

    private void A01() {
        AbstractC2426qc.A0J(this);
        AbstractC2426qc.A0K(this);
    }

    private void A02() {
        this.A00.removeAllViews();
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(13);
        this.A00.addView(getAdHideView(), layoutParams);
        AbstractC2426qc.A0X(this.A00);
        this.A01.fullScroll(33);
    }

    private void A03() {
        this.A01 = new ScrollView(this.A02);
        this.A01.setFillViewport(true);
        AbstractC2426qc.A0O(this.A01, -218103809);
        this.A00 = new RelativeLayout(this.A02);
        this.A00.setPadding(AbstractC2383pv.A0X, AbstractC2383pv.A0X, AbstractC2383pv.A0X, AbstractC2383pv.A0X);
        this.A01.addView(this.A00, new FrameLayout.LayoutParams(-1, -2));
        ScrollView scrollView = this.A01;
        FrameLayout.LayoutParams mainLayoutParams = new FrameLayout.LayoutParams(-1, -1);
        addView(scrollView, mainLayoutParams);
    }

    public final /* synthetic */ void A05(C2528sG c2528sG, View view) {
        this.A02.A0F().ABn();
        c2528sG.A01();
        A01();
    }

    private LinearLayout getAdHideView() {
        LinearLayout linearLayout = new LinearLayout(this.A02);
        linearLayout.setOrientation(1);
        TextView textView = new TextView(this.A02);
        AbstractC2426qc.A0b(textView, true, 20);
        textView.setTextColor(-14934495);
        textView.setText(A00(0, 16, 55));
        textView.setGravity(17);
        LinearLayout.LayoutParams undoAdHideParams = new LinearLayout.LayoutParams(-2, -2);
        undoAdHideParams.setMargins(AbstractC2383pv.A00, AbstractC2383pv.A00, AbstractC2383pv.A00, AbstractC2383pv.A0A);
        final C2528sG c2528sG = new C2528sG(this.A02);
        c2528sG.setData(A00(16, 4, 97), null);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 17;
        c2528sG.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.s4
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.A00.A05(c2528sG, view);
            }
        });
        linearLayout.addView(textView, undoAdHideParams);
        linearLayout.addView(c2528sG, layoutParams);
        return linearLayout;
    }
}
