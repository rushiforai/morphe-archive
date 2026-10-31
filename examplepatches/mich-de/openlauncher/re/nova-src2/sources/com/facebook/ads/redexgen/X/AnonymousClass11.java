package com.facebook.ads.redexgen.X;

import android.graphics.Rect;
import android.view.View;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.WeakHashMap;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.11, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass11 implements C2K {
    public static byte[] A01;
    public static String[] A02 = {"rLc4fYMr", "ixdDwPBhG85i5bbqpGEQKxuiwQlM2VVC", "F3cHIEtQAherQEaTxdWKmXUpP0iQmTxt", "w81i2ltv5bGBgxtzgXDyKUxhIQ2Y8G9g", "EO94kdaAUP6qiZMjy5QkstUi4eMsmPMz", "EcjLg", "Il2UHoQgd", "dt4c7RRazln7nneNUWSp1273AHuNKPtF"};
    public static final C2O A03;
    public static final WeakHashMap<View, AnonymousClass11> A04;
    public static volatile boolean A05;
    public final WeakReference<View> A00;

    public /* synthetic */ AnonymousClass11(View view, AbstractC05811i abstractC05811i) {
        this(view);
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 88);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A01 = new byte[]{17, 11, 10, 57, 18, 17, 28, 31, 18, 44, 27, 29, 10, 40, 50, 51, 0, 43, 40, 37, 38, 43, 17, 46, 52, 46, 37, 43, 34, 21, 34, 36, 51, 92, 67, 79, 93, 90, 69, 88, 94, 120, 79, 73, 94};
    }

    static {
        A02();
        A03 = new C2O(null);
        A04 = new WeakHashMap<>();
    }

    public AnonymousClass11(View view) {
        this.A00 = new WeakReference<>(view);
    }

    @Override // com.facebook.ads.redexgen.X.C2K
    public final boolean AAC(Rect rect, Rect rect2, Rect rect3) {
        C1h.A09(rect, A00(13, 20, 31));
        C1h.A09(rect2, A00(0, 13, 38));
        C1h.A09(rect3, A00(33, 12, 114));
        View view = this.A00.get();
        if (view == null) {
            return false;
        }
        boolean zA02 = C2N.A02(view, rect, rect2, rect3);
        if (A02[7].charAt(20) == 'L') {
            throw new RuntimeException();
        }
        A02[7] = "jcDjII5YCCAGPdyBiDYMZv2MTl6lSOUa";
        return zA02;
    }

    public final boolean equals(Object obj) {
        View view;
        if (obj == this) {
            return true;
        }
        if (obj != null) {
            boolean zA0C = C1h.A0C(obj.getClass(), getClass());
            if (A02[0].length() == 17) {
                throw new RuntimeException();
            }
            A02[7] = "M4ONuF9mrsAu6NnJn4s6rmStGwT8wnTJ";
            return zA0C && (view = this.A00.get()) != null && view == ((AnonymousClass11) obj).A00.get();
        }
        return false;
    }

    public final int hashCode() {
        View view = this.A00.get();
        if (view != null) {
            return view.hashCode();
        }
        return 0;
    }
}
