package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.res.Resources;
import com.facebook.ads.NativeAdScrollView;
import com.facebook.ads.NativeAdView;
import com.facebook.ads.NativeAdViewAttributes;
import com.facebook.ads.NativeAdsManager;
import com.facebook.ads.internal.api.NativeAdScrollViewApi;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.k1, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2027k1 implements NativeAdScrollViewApi {
    public static byte[] A07;
    public final int A00;
    public final NativeAdScrollView.AdViewProvider A01;
    public final NativeAdView.Type A02;
    public final NativeAdViewAttributes A03;
    public final NativeAdsManager A04;
    public final I9 A05;
    public final C0958Hi A06;

    static {
        A07();
    }

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 33);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A07 = new byte[]{-61, -21, -23, -22, -106, -26, -24, -27, -20, -33, -38, -37, -106, -41, -106, -60, -41, -22, -33, -20, -37, -73, -38, -52, -33, -37, -19, -92, -54, -17, -26, -37, -94, -106, -73, -38, -52, -33, -37, -19, -58, -24, -27, -20, -33, -38, -37, -24, -106, -27, -24, -106, -41, -106, -28, -41, -22, -33, -20, -37, -73, -38, -52, -33, -37, -19, -66, -37, -33, -35, -34, -22, -70, -26, -106, -87, -68, -79, -66, -83, -119, -84, -69, -107, -87, -74, -87, -81, -83, -70, 104, -74, -73, -68, 104, -76, -73, -87, -84, -83, -84};
    }

    public C2027k1(NativeAdScrollView nativeAdScrollView, Context context, NativeAdsManager nativeAdsManager, NativeAdScrollView.AdViewProvider adViewProvider, int i5, NativeAdView.Type type, NativeAdViewAttributes nativeAdViewAttributes, int i11) throws Resources.NotFoundException {
        if (nativeAdsManager.isLoaded()) {
            if (type != null || adViewProvider != null || i5 > 0) {
                this.A06 = C2013jn.A03(context);
                this.A04 = nativeAdsManager;
                this.A03 = nativeAdViewAttributes;
                this.A01 = adViewProvider;
                this.A02 = type;
                this.A00 = i11;
                IA ia2 = new IA(this);
                this.A05 = new I9(context);
                if (this.A02 != null) {
                    this.A05.A00((int) (AbstractC2385px.A02 * this.A02.getHeight()));
                } else if (i5 > 0) {
                    this.A05.A00(((int) AbstractC2385px.A02) * i5);
                }
                this.A05.setAdapter(ia2);
                setInset(20);
                ia2.A09();
                nativeAdScrollView.addView(this.A05);
                return;
            }
            throw new IllegalArgumentException(A06(0, 74, 85));
        }
        throw new IllegalStateException(A06(74, 27, 39));
    }

    @Override // com.facebook.ads.internal.api.NativeAdScrollViewApi
    public final void setInset(int i5) {
        if (i5 > 0) {
            float f11 = AbstractC2385px.A02;
            float density = i5;
            int insetDp = Math.round(density * f11);
            this.A05.setPadding(insetDp, 0, insetDp, 0);
            float density2 = i5 / 2;
            this.A05.setPageMargin(Math.round(density2 * f11));
            this.A05.setClipToPadding(false);
        }
    }
}
