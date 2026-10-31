package com.facebook.ads.redexgen.X;

import android.graphics.Color;
import android.text.Layout;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.text.style.UnderlineSpan;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.bb, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1512bb {
    public static byte[] A0M;
    public static String[] A0N = {"ArNd5eFfRZBBWsuTOVj5CRKaXWYTk2BH", "BEFwit5856KS1", "sWOqBaFhx5HMLQa9Bqo230gF4aYqQzJy", "DJhnQv4i2rnTuSYSjfTShuEcyWa8rb5o", "CTsavOjyUFmVQYpprKq7uh86hk2X", "xVIRrqY9FWl1ASu3qmZC25YViKmcP7Gl", "fEGsdBhBDzJu", "TK872Kar81pWrXrBTqpL0M91e8VlYjUb"};
    public static final int A0O;
    public static final int A0P;
    public static final int A0Q;
    public static final int[] A0R;
    public static final int[] A0S;
    public static final int[] A0T;
    public static final int[] A0U;
    public static final int[] A0V;
    public static final int[] A0W;
    public static final int[] A0X;
    public static final boolean[] A0Y;
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
    public boolean A0G;
    public boolean A0H;
    public boolean A0I;
    public boolean A0J;
    public final List<SpannableString> A0L = new ArrayList();
    public final SpannableStringBuilder A0K = new SpannableStringBuilder();

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0M, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 89);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A0M = new byte[]{-19, 6, -3, 16, 8, -3, -5, 12, -3, -4, -72, 2, 13, 11, 12, 1, -2, 1, -5, -7, 12, 1, 7, 6, -72, 14, -7, 4, 13, -3, -46, -72};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 18 out of bounds for length 18
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00f5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final C1511ba A05() {
        Layout.Alignment alignment;
        float f11;
        float f12;
        if (A0H()) {
            return null;
        }
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        for (int i5 = 0; i5 < this.A0L.size(); i5++) {
            spannableStringBuilder.append((CharSequence) this.A0L.get(i5));
            spannableStringBuilder.append('\n');
        }
        spannableStringBuilder.append((CharSequence) A02());
        switch (this.A07) {
            case 0:
            case 3:
                alignment = Layout.Alignment.ALIGN_NORMAL;
                if (this.A0H) {
                    f11 = this.A05 / 99.0f;
                    int i11 = this.A0D;
                    String[] strArr = A0N;
                    if (strArr[6].length() != strArr[4].length()) {
                        A0N[3] = "XSEqDsrxmPYtiSwohhXeIwmwCtZ6B8mV";
                        f12 = i11 / 99.0f;
                    }
                    throw new RuntimeException();
                }
                float f13 = this.A05;
                if (A0N[7].charAt(13) != 't') {
                    A0N[5] = "k21zHcXflW0U4JhufvFegY4pSXmn4QVf";
                    f11 = f13 / 209.0f;
                    f12 = this.A0D / 74.0f;
                } else {
                    String[] strArr2 = A0N;
                    strArr2[6] = "oGU0LgIASHma";
                    strArr2[4] = "dS3mtnN1rWlWqNJqRoD6xdpzPUbm";
                    f11 = f13 / 30.967285f;
                    f12 = this.A0D / 2.1131198E-35f;
                }
                return new C1511ba(spannableStringBuilder, alignment, (0.9f * f12) + 0.05f, 0, this.A00 / 3 == 0 ? 0 : this.A00 / 3 == 1 ? 1 : 2, (f11 * 0.9f) + 0.05f, this.A00 % 3 == 0 ? 0 : this.A00 % 3 == 1 ? 1 : 2, -3.4028235E38f, this.A0E != A0O, this.A0E, this.A09);
            case 1:
                alignment = Layout.Alignment.ALIGN_OPPOSITE;
                String[] strArr3 = A0N;
                if (strArr3[2].charAt(26) == strArr3[0].charAt(26)) {
                    String[] strArr4 = A0N;
                    strArr4[2] = "gY2wVxa0145iB596FPo2BDWqtYYDpcKE";
                    strArr4[0] = "igJbCG59JYSEJf0P44QU5S9yXPY6ig2p";
                    if (this.A0H) {
                    }
                    return new C1511ba(spannableStringBuilder, alignment, (0.9f * f12) + 0.05f, 0, this.A00 / 3 == 0 ? 0 : this.A00 / 3 == 1 ? 1 : 2, (f11 * 0.9f) + 0.05f, this.A00 % 3 == 0 ? 0 : this.A00 % 3 == 1 ? 1 : 2, -3.4028235E38f, this.A0E != A0O, this.A0E, this.A09);
                }
                throw new RuntimeException();
            case 2:
                alignment = Layout.Alignment.ALIGN_CENTER;
                if (this.A0H) {
                }
                return new C1511ba(spannableStringBuilder, alignment, (0.9f * f12) + 0.05f, 0, this.A00 / 3 == 0 ? 0 : this.A00 / 3 == 1 ? 1 : 2, (f11 * 0.9f) + 0.05f, this.A00 % 3 == 0 ? 0 : this.A00 % 3 == 1 ? 1 : 2, -3.4028235E38f, this.A0E != A0O, this.A0E, this.A09);
            default:
                throw new IllegalArgumentException(A03(0, 32, 63) + this.A07);
        }
    }

    static {
        A04();
        A0P = A01(2, 2, 2, 0);
        A0O = A01(0, 0, 0, 0);
        A0Q = A01(0, 0, 0, 3);
        A0V = new int[]{0, 0, 0, 0, 0, 2, 0};
        A0W = new int[]{0, 0, 0, 0, 0, 0, 2};
        A0X = new int[]{3, 3, 3, 3, 3, 3, 1};
        A0Y = new boolean[]{false, false, false, true, true, true, false};
        A0U = new int[]{A0O, A0Q, A0O, A0O, A0Q, A0O, A0O};
        A0T = new int[]{0, 1, 2, 3, 4, 3, 4};
        A0S = new int[]{0, 0, 0, 0, 0, 3, 3};
        A0R = new int[]{A0O, A0O, A0O, A0O, A0O, A0Q, A0Q};
    }

    public C1512bb() {
        A08();
    }

    public static int A00(int i5, int i11, int i12) {
        return A01(i5, i11, i12, 0);
    }

    public static int A01(int i5, int i11, int i12, int i13) {
        int i14;
        AbstractC1062Ln.A00(i5, 0, 4);
        AbstractC1062Ln.A00(i11, 0, 4);
        AbstractC1062Ln.A00(i12, 0, 4);
        AbstractC1062Ln.A00(i13, 0, 4);
        switch (i13) {
            case 0:
            case 1:
                i14 = 255;
                break;
            case 2:
                i14 = Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
                break;
            case 3:
                i14 = 0;
                break;
            default:
                i14 = 255;
                break;
        }
        int alpha = i5 > 1 ? 255 : 0;
        return Color.argb(i14, alpha, i11 > 1 ? 255 : 0, i12 > 1 ? 255 : 0);
    }

    private final SpannableString A02() {
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(this.A0K);
        int length = spannableStringBuilder.length();
        if (length > 0) {
            if (this.A06 != -1) {
                spannableStringBuilder.setSpan(new StyleSpan(2), this.A06, length, 33);
            }
            if (this.A0C != -1) {
                spannableStringBuilder.setSpan(new UnderlineSpan(), this.A0C, length, 33);
            }
            if (this.A04 != -1) {
                spannableStringBuilder.setSpan(new ForegroundColorSpan(this.A03), this.A04, length, 33);
            }
            if (this.A02 != -1) {
                spannableStringBuilder.setSpan(new BackgroundColorSpan(this.A01), this.A02, length, 33);
            }
        }
        return new SpannableString(spannableStringBuilder);
    }

    public final void A06() {
        int length = this.A0K.length();
        if (length > 0) {
            int length2 = length - 1;
            this.A0K.delete(length2, length);
        }
    }

    public final void A07() {
        this.A0L.clear();
        this.A0K.clear();
        this.A06 = -1;
        this.A0C = -1;
        this.A04 = -1;
        this.A02 = -1;
        this.A0A = 0;
    }

    public final void A08() {
        A07();
        this.A0G = false;
        this.A0J = false;
        this.A09 = 4;
        this.A0H = false;
        this.A0D = 0;
        this.A05 = 0;
        this.A00 = 0;
        this.A0B = 15;
        this.A0I = true;
        this.A07 = 0;
        this.A0F = 0;
        this.A08 = 0;
        this.A0E = A0O;
        this.A03 = A0P;
        this.A01 = A0O;
    }

    public final void A09(char c11) {
        if (c11 == '\n') {
            this.A0L.add(A02());
            this.A0K.clear();
            if (this.A06 != -1) {
                this.A06 = 0;
            }
            int i5 = this.A0C;
            if (A0N[5].charAt(21) == 'A') {
                throw new RuntimeException();
            }
            String[] strArr = A0N;
            strArr[2] = "yiMP5uMgRhWf0DhXWWpw71X57ZY0bktO";
            strArr[0] = "Vb811ABrn5MKph1zfNz3zyooE6YLHKmU";
            if (i5 != -1) {
                this.A0C = 0;
            }
            if (this.A04 != -1) {
                this.A04 = 0;
            }
            if (this.A02 != -1) {
                this.A02 = 0;
            }
            while (true) {
                if ((this.A0I && this.A0L.size() >= this.A0B) || this.A0L.size() >= 15) {
                    this.A0L.remove(0);
                } else {
                    return;
                }
            }
        } else {
            this.A0K.append(c11);
        }
    }

    public final void A0A(int i5, int i11) {
        if (this.A0A != i5) {
            A09('\n');
        }
        this.A0A = i5;
    }

    public final void A0B(int i5, int i11, int i12) {
        if (this.A04 != -1 && this.A03 != i5) {
            this.A0K.setSpan(new ForegroundColorSpan(this.A03), this.A04, this.A0K.length(), 33);
        }
        if (i5 != A0P) {
            int length = this.A0K.length();
            String[] strArr = A0N;
            if (strArr[6].length() == strArr[4].length()) {
                throw new RuntimeException();
            }
            A0N[3] = "0Vb0MNxPa5nWYYVLmQvHqg2UywhwN7LO";
            this.A04 = length;
            this.A03 = i5;
        }
        if (this.A02 != -1 && this.A01 != i11) {
            this.A0K.setSpan(new BackgroundColorSpan(this.A01), this.A02, this.A0K.length(), 33);
        }
        if (i11 != A0O) {
            this.A02 = this.A0K.length();
            this.A01 = i11;
        }
    }

    public final void A0C(int i5, int i11, int i12, boolean z11, boolean z12, int i13, int i14) {
        if (this.A06 != -1) {
            if (!z11) {
                this.A0K.setSpan(new StyleSpan(2), this.A06, this.A0K.length(), 33);
                this.A06 = -1;
            }
        } else if (z11) {
            this.A06 = this.A0K.length();
        }
        if (this.A0C != -1) {
            if (!z12) {
                this.A0K.setSpan(new UnderlineSpan(), this.A0C, this.A0K.length(), 33);
                this.A0C = -1;
                return;
            }
            return;
        }
        if (!z12) {
            return;
        }
        this.A0C = this.A0K.length();
    }

    public final void A0D(int i5, int i11, boolean z11, int i12, int i13, int i14, int i15) {
        this.A0E = i5;
        this.A07 = i15;
    }

    public final void A0E(boolean z11) {
        this.A0J = z11;
    }

    public final void A0F(boolean z11, boolean z12, boolean z13, int i5, boolean z14, int i11, int i12, int i13, int i14, int i15, int i16, int i17) {
        this.A0G = true;
        this.A0J = z11;
        this.A0I = z12;
        this.A09 = i5;
        this.A0H = z14;
        this.A0D = i11;
        this.A05 = i12;
        this.A00 = i15;
        if (this.A0B != i13 + 1) {
            this.A0B = i13 + 1;
            while (true) {
                if ((!z12 || this.A0L.size() < this.A0B) && this.A0L.size() < 15) {
                    break;
                } else {
                    this.A0L.remove(0);
                }
            }
        }
        if (i16 != 0 && this.A0F != i16) {
            this.A0F = i16;
            int i18 = i16 - 1;
            A0D(A0U[i18], A0Q, A0Y[i18], 0, A0W[i18], A0X[i18], A0V[i18]);
        }
        if (i17 != 0 && this.A08 != i17) {
            this.A08 = i17;
            int i19 = i17 - 1;
            A0C(0, 1, 1, false, false, A0S[i19], A0T[i19]);
            A0B(A0P, A0R[i19], A0O);
        }
    }

    public final boolean A0G() {
        return this.A0G;
    }

    public final boolean A0H() {
        return !A0G() || (this.A0L.isEmpty() && this.A0K.length() == 0);
    }

    public final boolean A0I() {
        return this.A0J;
    }
}
