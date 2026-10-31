package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.Layout;
import android.text.Spanned;
import android.text.SpannedString;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.Th, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1251Th implements InterfaceC1018Jt {
    public final float A00;
    public final float A01;
    public final float A02;
    public final float A03;
    public final float A04;
    public final float A05;
    public final int A06;
    public final int A07;
    public final int A08;
    public final int A09;
    public final int A0A;
    public final int A0B;
    public final Bitmap A0C;
    public final Layout.Alignment A0D;
    public final Layout.Alignment A0E;
    public final CharSequence A0F;
    public final boolean A0G;
    public static String[] A0H = {InneractiveMediationDefs.GENDER_MALE, "PsdtqhGxnJvSIucJo7DP2XF6m11pBbjs", "L", "hkoTC196WnjQeUpmHZOCfmFWdGcuHLfI", "X0kDAQszcbpjzKC3wgFNGcVpiVpcXBq0", "a2264KiS6iYUggqBrTLTn4MXgp3IPOF6", "0TJDKDj1msB", "HNYcYBCOm4"};
    public static final C1251Th A0J = new C1052Ld().A0G(b.f42142b).A0H();
    public static final String A0U = N1.A0h(0);
    public static final String A0V = N1.A0h(1);
    public static final String A0P = N1.A0h(2);
    public static final String A0K = N1.A0h(3);
    public static final String A0M = N1.A0h(4);
    public static final String A0O = N1.A0h(5);
    public static final String A0N = N1.A0h(6);
    public static final String A0Q = N1.A0h(7);
    public static final String A0R = N1.A0h(8);
    public static final String A0X = N1.A0h(9);
    public static final String A0W = N1.A0h(10);
    public static final String A0T = N1.A0h(11);
    public static final String A0L = N1.A0h(12);
    public static final String A0Z = N1.A0h(13);
    public static final String A0a = N1.A0h(14);
    public static final String A0Y = N1.A0h(15);
    public static final String A0S = N1.A0h(16);
    public static final InterfaceC1017Js<C1251Th> A0I = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.Ti
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return C1251Th.A00(bundle);
        }
    };

    public C1251Th(CharSequence charSequence, Layout.Alignment alignment, Layout.Alignment alignment2, Bitmap bitmap, float f11, int i5, int i11, float f12, int i12, int i13, float f13, float f14, float f15, boolean z11, int i14, int i15, float f16) {
        if (charSequence == null) {
            AbstractC1062Ln.A01(bitmap);
        } else {
            AbstractC1062Ln.A07(bitmap == null);
        }
        if (charSequence instanceof Spanned) {
            this.A0F = SpannedString.valueOf(charSequence);
        } else if (charSequence != null) {
            this.A0F = charSequence.toString();
        } else {
            this.A0F = null;
        }
        this.A0E = alignment;
        this.A0D = alignment2;
        this.A0C = bitmap;
        this.A01 = f11;
        this.A07 = i5;
        this.A06 = i11;
        this.A02 = f12;
        this.A08 = i12;
        this.A04 = f14;
        this.A00 = f15;
        this.A0G = z11;
        this.A0B = i14;
        this.A09 = i13;
        this.A05 = f13;
        this.A0A = i15;
        this.A03 = f16;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0061 A[PHI: r4
      0x0061: PHI (r4v6 'bitmap' android.graphics.Bitmap) = (r4v2 'bitmap' android.graphics.Bitmap), (r4v7 'bitmap' android.graphics.Bitmap) binds: [B:31:0x00b1, B:18:0x005f] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x012a  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0143  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x015d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final C1251Th A00(Bundle bundle) {
        Bitmap bitmap;
        C1052Ld c1052Ld = new C1052Ld();
        CharSequence charSequence = bundle.getCharSequence(A0U);
        if (charSequence != null) {
            c1052Ld.A0G(charSequence);
        }
        String str = A0V;
        if (A0H[5].charAt(7) == 'S') {
            A0H[4] = "eCqcTZIltbezTeVPYANWghWmg4tkxUGn";
            Layout.Alignment alignment = (Layout.Alignment) bundle.getSerializable(str);
            if (alignment != null) {
                c1052Ld.A0F(alignment);
            }
            Layout.Alignment alignment2 = (Layout.Alignment) bundle.getSerializable(A0P);
            if (alignment2 != null) {
                c1052Ld.A0E(alignment2);
            }
            Parcelable parcelable = bundle.getParcelable(A0K);
            String[] strArr = A0H;
            if (strArr[2].length() != strArr[0].length()) {
                bitmap = (Bitmap) parcelable;
                if (bitmap != null) {
                    c1052Ld.A0D(bitmap);
                }
                if (bundle.containsKey(A0M) && bundle.containsKey(A0O)) {
                    c1052Ld.A07(bundle.getFloat(A0M), bundle.getInt(A0O));
                }
                if (bundle.containsKey(A0N)) {
                    String str2 = A0N;
                    String[] strArr2 = A0H;
                    if (strArr2[3].charAt(22) == strArr2[1].charAt(22)) {
                        String[] strArr3 = A0H;
                        strArr3[3] = "zFTKXjcz9Y8qxZ0nmsQggOFyZ30mnqbs";
                        strArr3[1] = "SCAoMY8ZKnpe4JEoHmMhoxFk6D54nbA3";
                        c1052Ld.A09(bundle.getInt(str2));
                    }
                }
                if (bundle.containsKey(A0Q)) {
                    c1052Ld.A04(bundle.getFloat(A0Q));
                }
                if (bundle.containsKey(A0R)) {
                    String str3 = A0R;
                    if (A0H[5].charAt(7) != 'S') {
                        String[] strArr4 = A0H;
                        strArr4[7] = "Aboohqu0pY";
                        strArr4[6] = "BqXAEddDaux";
                        c1052Ld.A0A(bundle.getInt(str3));
                    } else {
                        String[] strArr5 = A0H;
                        strArr5[2] = "7";
                        strArr5[0] = "q";
                        c1052Ld.A0A(bundle.getInt(str3));
                    }
                }
                if (bundle.containsKey(A0W) && bundle.containsKey(A0X)) {
                    c1052Ld.A08(bundle.getFloat(A0W), bundle.getInt(A0X));
                }
                if (bundle.containsKey(A0T)) {
                    c1052Ld.A06(bundle.getFloat(A0T));
                }
                String str4 = A0L;
                if (A0H[5].charAt(7) == 'S') {
                    throw new RuntimeException();
                }
                A0H[5] = "QwJd0BmS3bAz846Q0PWcpzIoYSSu4ncS";
                if (bundle.containsKey(str4)) {
                    c1052Ld.A03(bundle.getFloat(A0L));
                }
                if (bundle.containsKey(A0Z)) {
                    c1052Ld.A0C(bundle.getInt(A0Z));
                }
                if (!bundle.getBoolean(A0a, false)) {
                    c1052Ld.A02();
                }
                if (bundle.containsKey(A0Y)) {
                    c1052Ld.A0B(bundle.getInt(A0Y));
                }
                if (bundle.containsKey(A0S)) {
                    c1052Ld.A05(bundle.getFloat(A0S));
                }
                return c1052Ld.A0H();
            }
            String[] strArr6 = A0H;
            strArr6[2] = "C";
            strArr6[0] = "a";
            bitmap = (Bitmap) parcelable;
            if (bitmap != null) {
            }
            if (bundle.containsKey(A0M)) {
                c1052Ld.A07(bundle.getFloat(A0M), bundle.getInt(A0O));
            }
            if (bundle.containsKey(A0N)) {
            }
            if (bundle.containsKey(A0Q)) {
            }
            if (bundle.containsKey(A0R)) {
            }
            if (bundle.containsKey(A0W)) {
                c1052Ld.A08(bundle.getFloat(A0W), bundle.getInt(A0X));
            }
            if (bundle.containsKey(A0T)) {
            }
            String str42 = A0L;
            if (A0H[5].charAt(7) == 'S') {
            }
        }
        throw new RuntimeException();
    }

    public final C1052Ld A02() {
        return new C1052Ld(this);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        String[] strArr = A0H;
        if (strArr[7].length() == strArr[6].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0H;
        strArr2[7] = "KjM5L4cex8";
        strArr2[6] = "14SNgwBaCMY";
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        C1251Th c1251Th = (C1251Th) obj;
        if (TextUtils.equals(this.A0F, c1251Th.A0F) && this.A0E == c1251Th.A0E && this.A0D == c1251Th.A0D && (this.A0C != null ? !(c1251Th.A0C == null || !this.A0C.sameAs(c1251Th.A0C)) : c1251Th.A0C == null)) {
            float f11 = this.A01;
            String[] strArr3 = A0H;
            if (strArr3[7].length() == strArr3[6].length()) {
                throw new RuntimeException();
            }
            String[] strArr4 = A0H;
            strArr4[7] = "Qe1GNlCupD";
            strArr4[6] = "iU4laVEh1GR";
            if (f11 == c1251Th.A01 && this.A07 == c1251Th.A07 && this.A06 == c1251Th.A06 && this.A02 == c1251Th.A02 && this.A08 == c1251Th.A08 && this.A04 == c1251Th.A04 && this.A00 == c1251Th.A00 && this.A0G == c1251Th.A0G && this.A0B == c1251Th.A0B && this.A09 == c1251Th.A09) {
                float f12 = this.A05;
                float f13 = c1251Th.A05;
                if (A0H[4].charAt(9) != 'b') {
                    throw new RuntimeException();
                }
                String[] strArr5 = A0H;
                strArr5[3] = "BsAL9xSYd5Evy30hUWNvFdFFKh92WRMq";
                strArr5[1] = "KMRu2F3T1SDWeEugC3SNDoFFs1bhnWUi";
                if (f12 == f13 && this.A0A == c1251Th.A0A && this.A03 == c1251Th.A03) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        return A6.A00(this.A0F, this.A0E, this.A0D, this.A0C, Float.valueOf(this.A01), Integer.valueOf(this.A07), Integer.valueOf(this.A06), Float.valueOf(this.A02), Integer.valueOf(this.A08), Float.valueOf(this.A04), Float.valueOf(this.A00), Boolean.valueOf(this.A0G), Integer.valueOf(this.A0B), Integer.valueOf(this.A09), Float.valueOf(this.A05), Integer.valueOf(this.A0A), Float.valueOf(this.A03));
    }
}
