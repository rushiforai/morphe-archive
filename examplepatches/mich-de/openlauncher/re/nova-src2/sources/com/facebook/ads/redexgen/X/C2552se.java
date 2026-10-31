package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.widget.ImageView;
import android.widget.LinearLayout;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.se, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2552se extends LinearLayout {
    public final Bitmap A00;

    public C2552se(C0958Hi c0958Hi, EnumC2569sv enumC2569sv) {
        super(c0958Hi);
        this.A00 = AbstractC2438qo.A01(EnumC2437qn.AD_CHOICE_ICON);
        c0958Hi.A0F().ABk(enumC2569sv.name().toLowerCase(Locale.US));
        A00();
        setAdChoiceIcon(c0958Hi);
    }

    private void A00() {
        setOrientation(0);
        setPadding(AbstractC2383pv.A0K, AbstractC2383pv.A0K, AbstractC2383pv.A0K, AbstractC2383pv.A0K);
        setClipToPadding(false);
        setGravity(17);
        AbstractC2426qc.A0O(this, -859190839);
        AbstractC2426qc.A0F(AbstractC2383pv.A0D, this);
    }

    private void setAdChoiceIcon(C0958Hi c0958Hi) {
        ImageView imageView = new ImageView(c0958Hi);
        AbstractC2426qc.A0L(imageView);
        imageView.setImageBitmap(this.A00);
        imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        imageView.setAdjustViewBounds(true);
        imageView.setLayoutParams(new LinearLayout.LayoutParams(-2, AbstractC2383pv.A0X));
        addView(imageView);
    }
}
