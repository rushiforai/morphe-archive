package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.util.Base64;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.MediaView;
import com.facebook.ads.NativeAdLayout;
import com.facebook.ads.internal.api.NativeAdLayoutApi;
import com.vungle.ads.internal.protos.Sdk;
import java.io.ByteArrayOutputStream;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: assets/audience_network/classes.dex */
public final class LL extends AbstractC1710ep {
    public static byte[] A0G;
    public static String[] A0H = {"AssHqLhhTyxVt8qn53NKh99glOkg76Zu", "x1ztYNG5B8Yh1fFD9IH28HNLftAJV3DA", "znnjTlsCkULP275jnLAB9UeCHu0mwbQ7", "ZnygQwUKP9vcdRc0ZykdXWpZHZyK4mhg", "TpC7jOiqrQiocH3FafzZC3NFqv5kOY4I", "3gx5dg94KuTf2YQxiOsayTUTecU9lJlq", "0JsvRjae8Zudzo37ubyWjxcMew8uJTBn", "UifaSDkpcUGfPYHJ0LY2wgaMbKOuGMMh"};
    public View A00;
    public View A01;
    public NativeAdLayout A02;
    public EnumC1721f0 A03;
    public EnumC1722f1 A04;
    public EnumC2255nl A05;
    public String A06;
    public WeakReference<IW> A07;
    public List<View> A08;
    public boolean A09;
    public boolean A0A;
    public boolean A0B;
    public boolean A0C;
    public boolean A0D;
    public boolean A0E;
    public final C1056Lh A0F;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0G, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 15);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A0G = new byte[]{-57, -16, -20, -21, -99, -30, -11, -32, -30, -19, -15, -26, -20, -21, -31, -17, -10, -23, -29, -29, -15, -8, -21, -11, -55, -41, -34, -37, -47, -45, -26, -27, -27, -32, -33, -59, -50, -61, -43, -43, -86, -77, -80, -86, -78, -88, -87, -77, -84, -42, -23, -27, -29, -46, -48, -39, -38, -33, -27, -28, -25, -30, -102, -98, -110, -104, -106, -88, -91, -81, -80, -45, -53, -54, -49, -57, -36, -49, -53, -35, -23, -36, -25, -24, -36, -13, -14, -36, -49, -38, -37, -41, -36, -27, -26, -39, -27, -32, -19, -32, -20, -10, -86, -99, -82, -99, -82, -10, -22, -1, -15, -2, -19, -25, -14, -98, -103, -90, -125, -126, -117, -43, -44, -35, -56, -41, -8, -2, -13, -119, -116, -125, -127, -125, -120, -49, -47, -60, -62, -64, -62, -57, -60, -66, -52, -60, -61, -56, -64, -38, -48, -31, -52, -106, -111, -124, -109, -106, -117, -110, -105, -116, 125, -112, -116, -84, -79, -88, -99, -8, -26, -7, -11, -64, -71, -74, -71, -70, -62, -71, -38, -51, -55, -37, -119, 124, 120, -118, 122, -123, -126, -120, -125, -48, -67, -113, 122, -71, -127, 117, -52, -113, 122, -71, -46, -63, -66, -128, 107, -86, 114, 102, -65, -128, 107, -86, -61};
    }

    static {
        A04();
    }

    public LL(C0958Hi c0958Hi, AbstractC1711eq abstractC1711eq, C1539c2 c1539c2, C1056Lh c1056Lh) {
        super(c0958Hi, abstractC1711eq, c1539c2);
        this.A03 = EnumC1721f0.A03;
        this.A04 = null;
        this.A0F = c1056Lh;
    }

    private String A01(View view) {
        try {
            JSONObject json = A03(view);
            return json.toString();
        } catch (JSONException unused) {
            return A00(0, 14, 110);
        }
    }

    private String A02(View view) {
        int width = view.getWidth();
        String strA00 = A00(0, 0, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
        if (width <= 0 || view.getHeight() <= 0) {
            return strA00;
        }
        try {
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(), Bitmap.Config.ARGB_8888);
            bitmapCreateBitmap.setDensity(view.getResources().getDisplayMetrics().densityDpi);
            view.draw(new Canvas(bitmapCreateBitmap));
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            bitmapCreateBitmap.compress(Bitmap.CompressFormat.JPEG, this.A0F.A0A(), byteArrayOutputStream);
            return Base64.encodeToString(byteArrayOutputStream.toByteArray(), 0);
        } catch (Exception unused) {
            return strA00;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0153  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0161  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private JSONObject A03(View view) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.putOpt(A00(60, 2, 111), Integer.valueOf(view.getId()));
        jSONObject.putOpt(A00(35, 5, 83), view.getClass());
        boolean z11 = false;
        jSONObject.putOpt(A00(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, 6, 11), String.format(Locale.US, A00(Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE, 12, 55), Integer.valueOf(view.getTop()), Integer.valueOf(view.getLeft())));
        jSONObject.putOpt(A00(149, 4, 88), String.format(Locale.US, A00(193, 12, 70), Integer.valueOf(view.getHeight()), Integer.valueOf(view.getWidth())));
        if (this.A08 != null && this.A08.contains(view)) {
            z11 = true;
        }
        jSONObject.putOpt(A00(40, 9, 56), Boolean.valueOf(z11));
        String strA00 = A00(TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 7, 60);
        if (view instanceof Button) {
            strA00 = A00(29, 6, 98);
        } else {
            boolean z12 = view instanceof TextView;
            String[] strArr = A0H;
            String str = strArr[7];
            String type = strArr[1];
            if (str.charAt(8) != type.charAt(8)) {
                A0H[4] = "a1U0qc751PlbEJJxfXyB6O6M8jnkJmpE";
                if (!z12) {
                    boolean z13 = view instanceof ImageView;
                    String[] strArr2 = A0H;
                    String str2 = strArr2[3];
                    String type2 = strArr2[2];
                    if (str2.charAt(11) != type2.charAt(11)) {
                        String[] strArr3 = A0H;
                        strArr3[7] = "4Gk3naybi5dFEHdfNJUEACWbr8WBlccD";
                        strArr3[1] = "aD4fSpDvJi0UhN8txhrN3IJ83C3CHKuE";
                        if (z13) {
                            strA00 = A00(62, 5, 34);
                        } else if (view instanceof MediaView) {
                            strA00 = A00(71, 9, 87);
                        } else if (view instanceof ViewGroup) {
                            strA00 = A00(184, 9, 4);
                        }
                    } else if (z13) {
                    }
                } else if (A0H[0].charAt(27) != 'G') {
                    A0H[4] = "nZrAcFVvb29oE4Mlbld53maAIoqkDe3s";
                    strA00 = A00(161, 4, 9);
                }
            }
            throw new RuntimeException();
        }
        jSONObject.putOpt(A00(165, 4, 41), strA00);
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            JSONArray list = new JSONArray();
            for (int i5 = 0; i5 < viewGroup.getChildCount(); i5++) {
                JSONObject data = A03(viewGroup.getChildAt(i5));
                list.put(data);
            }
            jSONObject.putOpt(A00(67, 4, 45), list);
        }
        return jSONObject;
    }

    private void A05(Map<String, String> map) {
        if (this.A07 != null && this.A07.get() != null) {
            IW iw2 = this.A07.get();
            if (iw2.A0F()) {
                String string = Boolean.TRUE.toString();
                String[] strArr = A0H;
                if (strArr[3].charAt(11) == strArr[2].charAt(11)) {
                    throw new RuntimeException();
                }
                A0H[0] = "GksG5weiqGFJA4CzYL31tY4XZg61IgZg";
                map.put(A00(14, 5, 113), string);
            }
            if (iw2.A0G()) {
                map.put(A00(19, 5, 115), Boolean.TRUE.toString());
            }
            if (iw2.A0H()) {
                map.put(A00(24, 5, 89), Boolean.TRUE.toString());
            }
        }
    }

    private void A06(Map<String, String> map) {
        if (this.A02 != null) {
            NativeAdLayoutApi nativeAdLayoutApi = this.A02.getNativeAdLayoutApi();
            String[] strArr = A0H;
            if (strArr[5].charAt(24) == strArr[6].charAt(24)) {
                String[] strArr2 = A0H;
                strArr2[5] = "bKbE5eHVV53nF8AqISTsS2XleXSgGYKe";
                strArr2[6] = "RAOr0aQs7K7suENq9X79R3c3eNs5Z12e";
                if (nativeAdLayoutApi instanceof IB) {
                    IB ib2 = (IB) this.A02.getNativeAdLayoutApi();
                    if (ib2.A07()) {
                        String string = Boolean.TRUE.toString();
                        String strA00 = A00(87, 7, 95);
                        String[] strArr3 = A0H;
                        if (strArr3[5].charAt(24) != strArr3[6].charAt(24)) {
                            throw new RuntimeException();
                        }
                        String[] strArr4 = A0H;
                        strArr4[5] = "AIBHwP5lJeJ558DJ2d5AlkrLeItc4j56";
                        strArr4[6] = "vTjSRCsjvXvPDNPamwf47TY1e4pm78AM";
                        map.put(strA00, string);
                    }
                    if (ib2.A06()) {
                        String string2 = Boolean.TRUE.toString();
                        String[] strArr5 = A0H;
                        if (strArr5[3].charAt(11) != strArr5[2].charAt(11)) {
                            A0H[4] = "VlzSahO6Qb4jffJxQ8EBGdsDysTkxd8j";
                            map.put(A00(80, 7, 108), string2);
                            return;
                        }
                    } else {
                        return;
                    }
                } else {
                    return;
                }
            }
            throw new RuntimeException();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1710ep
    public final void A0A(Map<String, String> map) {
        if (this.A0F == null) {
            return;
        }
        if (this.A05 != null) {
            map.put(A00(Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, 3, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE), String.valueOf(this.A05.A05()));
        }
        if (this.A09) {
            map.put(A00(112, 3, 112), Boolean.TRUE.toString());
        }
        if (this.A0D) {
            map.put(A00(Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 3, 6), Boolean.TRUE.toString());
        }
        if (this.A0A) {
            map.put(A00(Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 5, 88), Boolean.TRUE.toString());
        }
        if (this.A00 != null && this.A0F.A0T()) {
            map.put(A00(180, 4, 85), A01(this.A00));
        }
        if (this.A00 != null && this.A0F.A0U()) {
            map.put(A00(153, 8, 20), A02(this.A00));
        }
        if (this.A0C) {
            map.put(A00(115, 3, 33), Boolean.TRUE.toString());
        }
        if (this.A03 != null) {
            map.put(A00(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 14, 80), this.A03.toString());
        }
        if (this.A0B) {
            map.put(A00(169, 4, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), Boolean.TRUE.toString());
        }
        View view = this.A01;
        if (A0H[0].charAt(27) == 'G') {
            throw new RuntimeException();
        }
        A0H[0] = "P6MGDEoKncCrYirOOQ1jmq4l0Ss52l96";
        if (view != null) {
            map.put(A00(98, 4, 112), String.valueOf((int) (this.A01.getWidth() / AbstractC2385px.A02)));
            map.put(A00(94, 4, 105), String.valueOf((int) (this.A01.getHeight() / AbstractC2385px.A02)));
        }
        if (this.A04 != null) {
            map.put(A00(102, 5, 45), this.A04.toString());
        }
        if (this.A06 != null) {
            map.put(A00(49, 11, 98), this.A06);
        }
        if (this.A0E) {
            map.put(A00(107, 5, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), Boolean.TRUE.toString());
        }
        A06(map);
        A05(map);
        this.A0F.A0O(map);
    }

    public final void A0B(View view) {
        this.A01 = view;
    }

    public final void A0C(View view) {
        this.A00 = view;
    }

    public final void A0D(NativeAdLayout nativeAdLayout) {
        this.A02 = nativeAdLayout;
    }

    public final void A0E(EnumC1721f0 enumC1721f0) {
        this.A03 = enumC1721f0;
    }

    public final void A0F(EnumC1722f1 enumC1722f1) {
        this.A04 = enumC1722f1;
    }

    public final void A0G(EnumC2255nl enumC2255nl) {
        this.A05 = enumC2255nl;
    }

    public final void A0H(String str) {
        this.A06 = str;
    }

    public final void A0I(WeakReference<IW> weakReference) {
        this.A07 = weakReference;
    }

    public final void A0J(List<View> clickableViews) {
        this.A08 = clickableViews;
    }

    public final void A0K(boolean z11) {
        this.A09 = z11;
    }

    public final void A0L(boolean z11) {
        this.A0A = z11;
    }

    public final void A0M(boolean z11) {
        this.A0B = z11;
    }

    public final void A0N(boolean z11) {
        this.A0C = z11;
    }

    public final void A0O(boolean z11) {
        this.A0D = z11;
    }

    public final void A0P(boolean z11) {
        this.A0E = z11;
    }
}
