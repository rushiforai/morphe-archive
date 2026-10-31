package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/* renamed from: com.facebook.ads.redexgen.X.sU, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2542sU extends LinearLayout {
    public static final int A03 = (int) (AbstractC2385px.A02 * 40.0f);
    public static final int A04 = (int) (AbstractC2385px.A02 * 20.0f);
    public static final int A05 = (int) (AbstractC2385px.A02 * 10.0f);
    public final C1823ge A00;
    public final C0958Hi A01;
    public final InterfaceC2526sE A02;

    public C2542sU(C0958Hi c0958Hi, C1823ge c1823ge, InterfaceC2526sE interfaceC2526sE, EnumC2437qn enumC2437qn) {
        this(c0958Hi, c1823ge, interfaceC2526sE, null, enumC2437qn);
    }

    public C2542sU(C0958Hi c0958Hi, C1823ge c1823ge, InterfaceC2526sE interfaceC2526sE, String str, EnumC2437qn enumC2437qn) {
        super(c0958Hi);
        this.A01 = c0958Hi;
        this.A00 = c1823ge;
        this.A02 = interfaceC2526sE;
        setOrientation(1);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        if (!TextUtils.isEmpty(str)) {
            View headerView = A01(str);
            headerView.setPadding(0, 0, 0, 0);
            View view = new View(getContext());
            view.setLayoutParams(new LinearLayout.LayoutParams(-1, 1));
            AbstractC2426qc.A0O(view, -10459280);
            addView(headerView, layoutParams);
            addView(view);
        }
        if (!TextUtils.isEmpty(this.A00.A03())) {
            View viewA00 = A00(enumC2437qn, this.A00.A03());
            viewA00.setPadding(0, A05, 0, A05);
            addView(viewA00, layoutParams);
        }
        C2548sa c2548saA03 = A03();
        c2548saA03.setPadding(0, A05, 0, 0);
        addView(c2548saA03, layoutParams);
    }

    private View A00(EnumC2437qn enumC2437qn, String str) {
        ImageView imageView = new ImageView(getContext());
        imageView.setColorFilter(-10459280);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(A04, A04);
        layoutParams.gravity = 16;
        imageView.setImageBitmap(AbstractC2438qo.A01(enumC2437qn));
        TextView textView = new TextView(getContext());
        AbstractC2426qc.A0b(textView, true, 14);
        textView.setTextColor(-10459280);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
        textView.setText(str);
        textView.setPadding(A05, 0, 0, 0);
        textView.setFocusable(true);
        LinearLayout linearLayout = new LinearLayout(getContext());
        linearLayout.setOrientation(0);
        linearLayout.addView(imageView, layoutParams);
        linearLayout.addView(textView, layoutParams2);
        return linearLayout;
    }

    private View A01(String str) {
        ImageView imageView = new ImageView(getContext());
        imageView.setColorFilter(-10459280);
        imageView.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.BACK_ARROW));
        imageView.setPadding(0, A05, A05 * 2, A05);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(A03, A03);
        imageView.setOnClickListener(new ViewOnClickListenerC2540sS(this));
        TextView textView = new TextView(getContext());
        textView.setGravity(17);
        textView.setText(str);
        AbstractC2426qc.A0b(textView, true, 16);
        textView.setTextColor(-14934495);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.setMargins(0, 0, A03, 0);
        layoutParams.gravity = 17;
        LinearLayout linearLayout = new LinearLayout(getContext());
        linearLayout.setOrientation(0);
        linearLayout.addView(imageView, titleParams);
        linearLayout.addView(textView, layoutParams);
        return linearLayout;
    }

    private C2548sa A03() {
        C2548sa c2548sa = new C2548sa(this.A01);
        for (C1823ge c1823ge : this.A00.A05()) {
            C2528sG c2528sG = new C2528sG(this.A01);
            c2528sG.setData(c1823ge.A04(), null);
            c2528sG.setOnClickListener(new ViewOnClickListenerC2541sT(this, c2528sG, c1823ge));
            c2548sa.addView(c2528sG);
        }
        return c2548sa;
    }
}
