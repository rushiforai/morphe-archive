package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.graphics.Point;
import android.os.Bundle;
import android.os.Looper;
import android.view.accessibility.CaptioningManager;
import androidx.compose.ui.node.LayoutNode;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public class LW {
    public static byte[] A0R;
    public static String[] A0S = {"EZ5pwgqE9J2GV", "Bx4zvb0TFLke4C48bmXMMhiBK8RARUTe", "chsu9obloZq7H", "RU5va9t96bGo5VkaoEHTLZucsEkZ", "DrpQfdgzNOmy3evCZDjoSxy8eOhJqLRQ", "xSsADYIDDGsPAL", "e0pHpTJdpLToYZoToit53Rhre32SzXI7", "RO3FiMMn2jCpfVjboYJFbtfHHy9W2lMZ"};
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public int A05;
    public int A06;
    public int A07;
    public int A08;
    public int A09;
    public int A0A;
    public int A0B;
    public int A0C;
    public int A0D;
    public int A0E;
    public int A0F;
    public HashMap<U8, U6> A0G;
    public HashSet<Integer> A0H;
    public List<String> A0I;
    public List<String> A0J;
    public List<String> A0K;

    @MetaExoPlayerCustomization
    public List<String> A0L;
    public List<String> A0M;
    public boolean A0N;
    public boolean A0O;
    public boolean A0P;
    public boolean A0Q;

    public static String A0H(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0R, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 22);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0P() {
        A0R = new byte[]{-68, -70, -55, -51, -62, -56, -57, -62, -57, -64};
    }

    static {
        A0P();
    }

    @Deprecated
    public LW() {
        this.A06 = LayoutNode.NotPlacedPlaceOrder;
        this.A05 = LayoutNode.NotPlacedPlaceOrder;
        this.A04 = LayoutNode.NotPlacedPlaceOrder;
        this.A03 = LayoutNode.NotPlacedPlaceOrder;
        this.A0F = LayoutNode.NotPlacedPlaceOrder;
        this.A0E = LayoutNode.NotPlacedPlaceOrder;
        this.A0Q = true;
        this.A0M = XR.A01();
        this.A0D = 0;
        this.A0L = XR.A01();
        this.A0I = XR.A01();
        this.A0B = 0;
        this.A02 = LayoutNode.NotPlacedPlaceOrder;
        this.A01 = LayoutNode.NotPlacedPlaceOrder;
        this.A0J = XR.A01();
        this.A0K = XR.A01();
        this.A0C = 0;
        this.A00 = 0;
        this.A0P = false;
        this.A0O = false;
        this.A0N = false;
        this.A0G = new HashMap<>();
        this.A0H = new HashSet<>();
    }

    public LW(Context context) {
        this();
        A0n(context);
        A0o(context, true);
    }

    public LW(Bundle bundle) {
        List listA01;
        this.A06 = bundle.getInt(U1.A0e, U1.A0U.A06);
        this.A05 = bundle.getInt(U1.A0d, U1.A0U.A05);
        this.A04 = bundle.getInt(U1.A0c, U1.A0U.A04);
        this.A03 = bundle.getInt(U1.A0b, U1.A0U.A03);
        this.A0A = bundle.getInt(U1.A0i, U1.A0U.A0A);
        this.A09 = bundle.getInt(U1.A0h, U1.A0U.A09);
        this.A08 = bundle.getInt(U1.A0g, U1.A0U.A08);
        this.A07 = bundle.getInt(U1.A0f, U1.A0U.A07);
        this.A0F = bundle.getInt(U1.A0v, U1.A0U.A0F);
        this.A0E = bundle.getInt(U1.A0t, U1.A0U.A0E);
        this.A0Q = bundle.getBoolean(U1.A0u, U1.A0U.A0Q);
        this.A0M = AbstractC07549l.A07((String[]) AbstractC1337Wx.A00(bundle.getStringArray(U1.A0p), new String[0]));
        this.A0D = bundle.getInt(U1.A0U(), U1.A0U.A0D);
        String[] preferredVideoLanguages1 = (String[]) AbstractC1337Wx.A00(bundle.getStringArray(U1.A0o), new String[0]);
        this.A0L = A0G(preferredVideoLanguages1);
        String[] preferredVideoLanguages12 = new String[0];
        this.A0I = A0G((String[]) AbstractC1337Wx.A00(bundle.getStringArray(U1.A0j), preferredVideoLanguages12));
        this.A0B = bundle.getInt(U1.A0l, U1.A0U.A0B);
        this.A02 = bundle.getInt(U1.A0a, U1.A0U.A02);
        this.A01 = bundle.getInt(U1.A0Z, U1.A0U.A01);
        String[] preferredVideoLanguages13 = new String[0];
        this.A0J = AbstractC07549l.A07((String[]) AbstractC1337Wx.A00(bundle.getStringArray(U1.A0k), preferredVideoLanguages13));
        String[] preferredVideoLanguages14 = new String[0];
        this.A0K = A0G((String[]) AbstractC1337Wx.A00(bundle.getStringArray(U1.A0m), preferredVideoLanguages14));
        this.A0C = bundle.getInt(U1.A0n, U1.A0U.A0C);
        this.A00 = bundle.getInt(U1.A0Y, U1.A0U.A00);
        this.A0P = bundle.getBoolean(U1.A0s, U1.A0U.A0P);
        this.A0O = bundle.getBoolean(U1.A0X, U1.A0U.A0O);
        this.A0N = bundle.getBoolean(U1.A0W, U1.A0U.A0N);
        ArrayList parcelableArrayList = bundle.getParcelableArrayList(U1.A0r);
        if (parcelableArrayList == null) {
            listA01 = XR.A01();
        } else {
            listA01 = C1068Lt.A01(U6.A03, parcelableArrayList);
        }
        this.A0G = new HashMap<>();
        for (int i5 = 0; i5 < listA01.size(); i5++) {
            U6 u62 = (U6) listA01.get(i5);
            this.A0G.put(u62.A00, u62);
        }
        int[] iArr = (int[]) AbstractC1337Wx.A00(bundle.getIntArray(U1.A0V), new int[0]);
        this.A0H = new HashSet<>();
        for (int i11 : iArr) {
            this.A0H.add(Integer.valueOf(i11));
        }
    }

    public LW(U1 u12) {
        A0R(u12);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4e != com.google.common.collect.ImmutableList$Builder<java.lang.String> */
    public static AbstractC07549l<String> A0G(String[] strArr) {
        C06344e c06344eA01 = AbstractC07549l.A01();
        for (String str : (String[]) AbstractC1062Ln.A01(strArr)) {
            Object objA01 = AbstractC1062Ln.A01(str);
            String[] strArr2 = A0S;
            if (strArr2[1].charAt(20) == strArr2[6].charAt(20)) {
                throw new RuntimeException();
            }
            String[] strArr3 = A0S;
            strArr3[2] = "8AYFq9iq893W0";
            strArr3[0] = "svb9BY3nO4bYa";
            c06344eA01.A04(N1.A0k((String) objA01));
        }
        return c06344eA01.A05();
    }

    private void A0Q(Context context) {
        CaptioningManager captioningManager;
        if ((N1.A02 >= 23 || Looper.myLooper() != null) && (captioningManager = (CaptioningManager) context.getSystemService(A0H(0, 10, 67))) != null && captioningManager.isEnabled()) {
            String[] strArr = A0S;
            if (strArr[4].charAt(22) == strArr[7].charAt(22)) {
                throw new RuntimeException();
            }
            A0S[5] = "kU4MtlR9D6feCz";
            this.A0C = 1088;
            Locale locale = captioningManager.getLocale();
            if (locale != null) {
                this.A0K = AbstractC07549l.A04(N1.A0o(locale));
            }
        }
    }

    @EnsuresNonNull
    private void A0R(U1 u12) {
        this.A06 = u12.A06;
        this.A05 = u12.A05;
        this.A04 = u12.A04;
        this.A03 = u12.A03;
        this.A0A = u12.A0A;
        this.A09 = u12.A09;
        this.A08 = u12.A08;
        this.A07 = u12.A07;
        this.A0F = u12.A0F;
        this.A0E = u12.A0E;
        this.A0Q = u12.A0Q;
        this.A0M = u12.A0M;
        this.A0D = u12.A0D;
        this.A0L = u12.A0L;
        this.A0I = u12.A0I;
        this.A0B = u12.A0B;
        this.A02 = u12.A02;
        this.A01 = u12.A01;
        this.A0J = u12.A0J;
        this.A0K = u12.A0K;
        this.A0C = u12.A0C;
        this.A00 = u12.A00;
        this.A0P = u12.A0P;
        this.A0O = u12.A0O;
        this.A0N = u12.A0N;
        this.A0H = new HashSet<>(u12.A0H);
        this.A0G = new HashMap<>(u12.A0G);
    }

    public LW A0W(U1 u12) {
        A0R(u12);
        return this;
    }

    public LW A0m(int i5, int i11, boolean z11) {
        this.A0F = i5;
        this.A0E = i11;
        this.A0Q = z11;
        return this;
    }

    public LW A0n(Context context) {
        if (N1.A02 >= 19) {
            A0Q(context);
        }
        return this;
    }

    public LW A0o(Context context, boolean z11) {
        Point viewportSize = N1.A0W(context);
        return A0m(viewportSize.x, viewportSize.y, z11);
    }

    public U1 A0p() {
        return new U1(this);
    }
}
