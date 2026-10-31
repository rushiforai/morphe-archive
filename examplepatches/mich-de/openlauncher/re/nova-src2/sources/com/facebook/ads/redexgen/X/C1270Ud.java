package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.os.Bundle;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Ud, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1270Ud implements InterfaceC1018Jt {
    public final Uri A00;
    public final Uri A01;
    public final Bundle A02;
    public final US A03;
    public final US A04;
    public final Boolean A05;
    public final CharSequence A06;
    public final CharSequence A07;
    public final CharSequence A08;
    public final CharSequence A09;
    public final CharSequence A0A;
    public final CharSequence A0B;
    public final CharSequence A0C;
    public final CharSequence A0D;
    public final CharSequence A0E;
    public final CharSequence A0F;
    public final CharSequence A0G;
    public final CharSequence A0H;
    public final CharSequence A0I;
    public final Integer A0J;
    public final Integer A0K;
    public final Integer A0L;
    public final Integer A0M;
    public final Integer A0N;
    public final Integer A0O;
    public final Integer A0P;
    public final Integer A0Q;
    public final Integer A0R;
    public final Integer A0S;
    public final Integer A0T;
    public final Integer A0U;

    @Deprecated
    public final Integer A0V;
    public final byte[] A0W;
    public static String[] A0X = {"rqF7mv", "7", "nDuk78wqh6dob", "sxg7qdg0FEo1VdbC87N7NCFUxgrytNQ0", "0fyY7bVUjrOP1I8L25ncO0F2JH9YqPRP", "Af", "YIjxItH4g27REAB9Yqq83f2RBsN1r9Y8", "UyHA1PqdLtaHFz"};
    public static final C1270Ud A0Z = new Kw().A11();
    public static final InterfaceC1017Js<C1270Ud> A0Y = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.Uf
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return C1270Ud.A00(bundle);
        }
    };

    public C1270Ud(Kw kw2) {
        this.A0H = kw2.A0H;
        this.A08 = kw2.A08;
        this.A07 = kw2.A07;
        this.A06 = kw2.A06;
        this.A0D = kw2.A0D;
        this.A0G = kw2.A0G;
        this.A0C = kw2.A0C;
        this.A01 = kw2.A01;
        this.A04 = kw2.A04;
        this.A03 = kw2.A03;
        this.A0W = kw2.A0V;
        this.A0J = kw2.A0J;
        this.A00 = kw2.A00;
        this.A0U = kw2.A0U;
        this.A0T = kw2.A0T;
        this.A0L = kw2.A0L;
        this.A05 = kw2.A05;
        this.A0V = kw2.A0O;
        this.A0O = kw2.A0O;
        this.A0N = kw2.A0N;
        this.A0M = kw2.A0M;
        this.A0R = kw2.A0R;
        this.A0Q = kw2.A0Q;
        this.A0P = kw2.A0P;
        this.A0I = kw2.A0I;
        this.A0A = kw2.A0A;
        this.A0B = kw2.A0B;
        this.A0K = kw2.A0K;
        this.A0S = kw2.A0S;
        this.A0E = kw2.A0E;
        this.A09 = kw2.A09;
        this.A0F = kw2.A0F;
        this.A02 = kw2.A02;
    }

    public static C1270Ud A00(Bundle bundle) {
        Integer numValueOf;
        Bundle fieldBundle;
        Bundle fieldBundle2;
        Kw kw2 = new Kw();
        Kw kwA0X = kw2.A0n(bundle.getCharSequence(A02(0))).A0e(bundle.getCharSequence(A02(1))).A0d(bundle.getCharSequence(A02(2))).A0c(bundle.getCharSequence(A02(3))).A0j(bundle.getCharSequence(A02(4))).A0m(bundle.getCharSequence(A02(5))).A0i(bundle.getCharSequence(A02(6))).A0X((Uri) bundle.getParcelable(A02(7)));
        byte[] byteArray = bundle.getByteArray(A02(10));
        if (bundle.containsKey(A02(29))) {
            numValueOf = Integer.valueOf(bundle.getInt(A02(29)));
        } else {
            numValueOf = null;
        }
        kwA0X.A10(byteArray, numValueOf).A0W((Uri) bundle.getParcelable(A02(11))).A0o(bundle.getCharSequence(A02(22))).A0g(bundle.getCharSequence(A02(23))).A0h(bundle.getCharSequence(A02(24))).A0k(bundle.getCharSequence(A02(27))).A0f(bundle.getCharSequence(A02(28))).A0l(bundle.getCharSequence(A02(30))).A0Y(bundle.getBundle(A02(1000)));
        if (bundle.containsKey(A02(8)) && (fieldBundle2 = bundle.getBundle(A02(8))) != null) {
            kw2.A0a((US) US.A03.A7F(fieldBundle2));
        }
        if (bundle.containsKey(A02(9)) && (fieldBundle = bundle.getBundle(A02(9))) != null) {
            kw2.A0Z((US) US.A03.A7F(fieldBundle));
        }
        String strA02 = A02(12);
        if (A0X[3].charAt(31) == '0') {
            A0X[3] = "MvQoZ507B5Y9mDYLRU4w3wSBtLCYmfI0";
            if (bundle.containsKey(strA02)) {
                kw2.A0z(Integer.valueOf(bundle.getInt(A02(12))));
            }
            if (bundle.containsKey(A02(13))) {
                kw2.A0y(Integer.valueOf(bundle.getInt(A02(13))));
            }
            if (bundle.containsKey(A02(14))) {
                kw2.A0q(Integer.valueOf(bundle.getInt(A02(14))));
            }
            if (bundle.containsKey(A02(15))) {
                kw2.A0b(Boolean.valueOf(bundle.getBoolean(A02(15))));
            }
            if (bundle.containsKey(A02(16))) {
                Integer numValueOf2 = Integer.valueOf(bundle.getInt(A02(16)));
                if (A0X[3].charAt(31) == '0') {
                    A0X[4] = "MsByWm30R2JgYov514fSG3nMJMuZAVni";
                    kw2.A0t(numValueOf2);
                }
            }
            if (bundle.containsKey(A02(17))) {
                kw2.A0s(Integer.valueOf(bundle.getInt(A02(17))));
            }
            if (bundle.containsKey(A02(18))) {
                kw2.A0r(Integer.valueOf(bundle.getInt(A02(18))));
            }
            if (bundle.containsKey(A02(19))) {
                kw2.A0w(Integer.valueOf(bundle.getInt(A02(19))));
            }
            if (bundle.containsKey(A02(20))) {
                kw2.A0v(Integer.valueOf(bundle.getInt(A02(20))));
            }
            if (bundle.containsKey(A02(21))) {
                int i5 = bundle.getInt(A02(21));
                String[] strArr = A0X;
                if (strArr[7].length() == strArr[1].length()) {
                    throw new RuntimeException();
                }
                A0X[2] = "J48ZbhMspFiWTTv";
                kw2.A0u(Integer.valueOf(i5));
            }
            if (bundle.containsKey(A02(25))) {
                kw2.A0p(Integer.valueOf(bundle.getInt(A02(25))));
            }
            if (bundle.containsKey(A02(26))) {
                kw2.A0x(Integer.valueOf(bundle.getInt(A02(26))));
            }
            return kw2.A11();
        }
        throw new RuntimeException();
    }

    public static String A02(int i5) {
        return Integer.toString(i5, 36);
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x016d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        C1270Ud c1270Ud = (C1270Ud) obj;
        if (N1.A1E(this.A0H, c1270Ud.A0H) && N1.A1E(this.A08, c1270Ud.A08) && N1.A1E(this.A07, c1270Ud.A07)) {
            CharSequence charSequence = this.A06;
            CharSequence charSequence2 = c1270Ud.A06;
            if (A0X[2].length() != 29) {
                A0X[3] = "7ohZlWvSQtIroMcVktzoDjdZPn9fgok0";
                if (N1.A1E(charSequence, charSequence2) && N1.A1E(this.A0D, c1270Ud.A0D)) {
                    boolean zA1E = N1.A1E(this.A0G, c1270Ud.A0G);
                    if (A0X[2].length() != 29) {
                        String[] strArr = A0X;
                        strArr[7] = "5eBLLJW4wR2t4m";
                        strArr[1] = "C";
                        if (zA1E) {
                            if (N1.A1E(this.A0C, c1270Ud.A0C) && N1.A1E(this.A01, c1270Ud.A01) && N1.A1E(this.A04, c1270Ud.A04) && N1.A1E(this.A03, c1270Ud.A03) && Arrays.equals(this.A0W, c1270Ud.A0W) && N1.A1E(this.A0J, c1270Ud.A0J) && N1.A1E(this.A00, c1270Ud.A00) && N1.A1E(this.A0U, c1270Ud.A0U) && N1.A1E(this.A0T, c1270Ud.A0T) && N1.A1E(this.A0L, c1270Ud.A0L) && N1.A1E(this.A05, c1270Ud.A05) && N1.A1E(this.A0O, c1270Ud.A0O) && N1.A1E(this.A0N, c1270Ud.A0N) && N1.A1E(this.A0M, c1270Ud.A0M) && N1.A1E(this.A0R, c1270Ud.A0R) && N1.A1E(this.A0Q, c1270Ud.A0Q) && N1.A1E(this.A0P, c1270Ud.A0P) && N1.A1E(this.A0I, c1270Ud.A0I) && N1.A1E(this.A0A, c1270Ud.A0A) && N1.A1E(this.A0B, c1270Ud.A0B)) {
                                Integer num = this.A0K;
                                String[] strArr2 = A0X;
                                if (strArr2[7].length() != strArr2[1].length()) {
                                    String[] strArr3 = A0X;
                                    strArr3[0] = "N0EJbP";
                                    strArr3[5] = "Yt";
                                    if (N1.A1E(num, c1270Ud.A0K)) {
                                        if (N1.A1E(this.A0S, c1270Ud.A0S) && N1.A1E(this.A0E, c1270Ud.A0E)) {
                                            boolean zA1E2 = N1.A1E(this.A09, c1270Ud.A09);
                                            if (A0X[6].charAt(22) == '2') {
                                                String[] strArr4 = A0X;
                                                strArr4[0] = "5qcISL";
                                                strArr4[5] = "Jy";
                                                if (zA1E2 && N1.A1E(this.A0F, c1270Ud.A0F)) {
                                                    return true;
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    A0X[4] = "kZN2LsyWTmbm6IhsQQdhh9ZcJEtqBOIc";
                                    if (N1.A1E(num, c1270Ud.A0K)) {
                                    }
                                }
                            }
                        }
                    } else {
                        String[] strArr5 = A0X;
                        strArr5[7] = "uf5T3n7tR2Eq71";
                        strArr5[1] = "d";
                        if (zA1E) {
                        }
                    }
                }
            }
            throw new RuntimeException();
        }
        return false;
    }

    public final int hashCode() {
        return A6.A00(this.A0H, this.A08, this.A07, this.A06, this.A0D, this.A0G, this.A0C, this.A01, this.A04, this.A03, Integer.valueOf(Arrays.hashCode(this.A0W)), this.A0J, this.A00, this.A0U, this.A0T, this.A0L, this.A05, this.A0O, this.A0N, this.A0M, this.A0R, this.A0Q, this.A0P, this.A0I, this.A0A, this.A0B, this.A0K, this.A0S, this.A0E, this.A09, this.A0F);
    }
}
