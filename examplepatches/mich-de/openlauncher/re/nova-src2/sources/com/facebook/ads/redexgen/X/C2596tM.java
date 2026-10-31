package com.facebook.ads.redexgen.X;

import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.text.TextUtils;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.tM, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2596tM extends LinearLayout {
    public static byte[] A04;
    public static String[] A05 = {"c3XyMVVK2ZPeOt0e4CLBNBDbK", "DsCUYZfHfFO6YC0ZUz1", "eLhkJXERmPgt", b.f42142b, b.f42142b, "5cC1cV814bBflaO82eB2FX5nm", b.f42142b, "kS5kSd3yRJfI"};
    public static final int A06;

    @Nullable
    public Drawable A00;
    public TextView A01;
    public TextView A02;
    public final C0958Hi A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        byte[] bArr = {7, 27, 27, 31, 28};
        if (A05[4].length() != 0) {
            throw new RuntimeException();
        }
        A05[1] = "lhzBP3Bo4mEfv1CoOUdrfuIGeogVZlJ";
        A04 = bArr;
    }

    static {
        A02();
        A06 = AbstractC2383pv.A0Q;
    }

    public C2596tM(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A03 = c0958Hi;
        A01();
    }

    private void A01() {
        setOrientation(1);
        this.A02 = new TextView(getContext());
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        this.A02.setTextColor(-16777216);
        this.A02.setTextSize(2, 20.0f);
        this.A02.setEllipsize(TextUtils.TruncateAt.END);
        this.A02.setSingleLine(true);
        this.A02.setVisibility(8);
        this.A02.setGravity(17);
        addView(this.A02, layoutParams);
        this.A01 = new TextView(getContext());
        LinearLayout.LayoutParams subtitleTextViewParams = new LinearLayout.LayoutParams(-2, -2);
        this.A01.setAlpha(0.5f);
        this.A01.setTextColor(-16777216);
        this.A01.setTextSize(2, 15.0f);
        this.A01.setCompoundDrawablePadding(A06);
        this.A01.setEllipsize(TextUtils.TruncateAt.END);
        this.A01.setSingleLine(true);
        this.A01.setVisibility(8);
        this.A01.setGravity(17);
        addView(this.A01, subtitleTextViewParams);
        if (C2203mv.A2z(this.A03)) {
            this.A02.setVisibility(4);
            this.A01.setVisibility(4);
        }
    }

    private Drawable getPadlockDrawable() {
        if (this.A00 == null) {
            this.A00 = AbstractC2438qo.A03(this.A03, EnumC2437qn.BROWSER_PADLOCK);
        }
        return this.A00;
    }

    public void setSubtitle(@Nullable String str) throws SecurityException {
        if (TextUtils.isEmpty(str)) {
            this.A01.setText((CharSequence) null);
            this.A01.setVisibility(4);
        } else {
            Uri uriA00 = AbstractC2351pP.A00(str);
            this.A01.setText(uriA00.getHost());
            this.A01.setCompoundDrawablesRelativeWithIntrinsicBounds(A00(0, 5, 24).equals(uriA00.getScheme()) ? getPadlockDrawable() : null, (Drawable) null, (Drawable) null, (Drawable) null);
            this.A01.setVisibility(0);
        }
    }

    public void setTitle(String str) {
        if (TextUtils.isEmpty(str)) {
            this.A02.setText((CharSequence) null);
            String[] strArr = A05;
            if (strArr[6].length() != strArr[3].length()) {
                throw new RuntimeException();
            }
            A05[4] = b.f42142b;
            this.A02.setVisibility(4);
            return;
        }
        this.A02.setText(str);
        this.A02.setVisibility(0);
    }
}
