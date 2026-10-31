package com.facebook.ads.redexgen.X;

import android.util.Log;
import android.view.View;
import android.view.ViewParent;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.hr, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1895hr {
    public static byte[] A00;
    public static final C1894hq A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 64);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{115, 114, 82, 121, 111, 104, 121, 120, 76, 110, 121, 79, AbstractJsonLexerKt.TC_INVALID, 110, 115, 112, 112, 6, 7, 39, 12, 26, 29, 12, 13, 58, 10, 27, 6, 5, 5, 119, 118, 86, 125, 107, 108, 125, 124, 75, 123, 106, 119, 116, 116, 89, 123, 123, 125, 104, 108, 125, 124, 126, AbstractJsonLexerKt.TC_INVALID, 66, 101, 112, 99, 101, 95, 116, 98, 101, 116, 117, 66, 114, 99, 126, 125, 125, 85, 84, 105, 78, 85, 74, 116, 95, 73, 78, 95, 94, 105, 89, 72, 85, 86, 86};
    }

    static {
        A01();
        A01 = new JI() { // from class: com.facebook.ads.redexgen.X.7W
            public static byte[] A00;
            public static String[] A01 = {"lLTnlT7kdgZgpONat", "d79paUk3eSzGphhSN42PN5Aq8dj9iVyl", "SPt342n", "OIl1JjPDUNYuj0Z8zSbytdcas", "BSu1Ds7nymHwzPjWE4jzwGDd8JkRRJPQ", "PB1eQ9fbEyjMYRd9wV6iR7DUEeVSeCVP", "JUVWQPWt2QIcAEqAV6T0sxDALqwyj", "zKN2MvPWkZddLmlUYuVLkoywXLI"};

            public static String A00(int i5, int i11, int i12) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
                int i13 = 0;
                while (true) {
                    int length = bArrCopyOfRange.length;
                    if (A01[7].length() == 21) {
                        throw new RuntimeException();
                    }
                    A01[7] = "QKmrPpG47xHIA";
                    if (i13 >= length) {
                        return new String(bArrCopyOfRange);
                    }
                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 58);
                    i13++;
                }
            }

            public static void A01() {
                A00 = new byte[]{79, 11, 0, 10, 28, 79, 1, 0, 27, 79, 6, 2, 31, 3, 10, 2, 10, 1, 27, 79, 6, 1, 27, 10, 29, 9, 14, 12, 10, 79, 2, 10, 27, 7, 0, 11, 79, 0, 1, 33, 10, 28, 27, 10, 11, 41, 3, 6, 1, 8, 125, 57, 50, 56, 46, 125, 51, 50, 41, 125, 52, 48, 45, 49, 56, 48, 56, 51, 41, 125, 52, 51, 41, 56, 47, 59, 60, 62, 56, 125, 48, 56, 41, 53, 50, 57, 125, 50, 51, 19, 56, 46, 41, 56, 57, 13, 47, 56, 27, 49, 52, 51, 58, 5, 65, 74, 64, 86, 5, 75, 74, 81, 5, 76, 72, 85, 73, 64, 72, 64, 75, 81, 5, 76, 75, 81, 64, 87, 67, 68, 70, 64, 5, 72, 64, 81, 77, 74, 65, 5, 74, 75, 107, 64, 86, 81, 64, 65, 117, 87, 64, 118, 70, 87, 74, 73, 73, 3, 71, 76, 70, 80, 3, 77, 76, 87, 3, 74, 78, 83, 79, 70, 78, 70, 77, 87, 3, 74, 77, 87, 70, 81, 69, 66, 64, 70, 3, 78, 70, 87, 75, 76, 71, 3, 76, 77, 109, 70, 80, 87, 70, 71, 112, 64, 81, 76, 79, 79, 35, 103, 108, 102, 112, 35, 109, 108, 119, 35, 106, 110, 115, 111, 102, 110, 102, 109, 119, 35, 106, 109, 119, 102, 113, 101, 98, 96, 102, 35, 110, 102, 119, 107, 108, 103, 35, 108, 109, 77, 102, 112, 119, 102, 103, 80, 96, 113, 108, 111, 111, 66, 96, 96, 102, 115, 119, 102, 103, 81, 21, 30, 20, 2, 81, 31, 30, 5, 81, 24, 28, 1, 29, 20, 28, 20, 31, 5, 81, 24, 31, 5, 20, 3, 23, 16, 18, 20, 81, 28, 20, 5, 25, 30, 21, 81, 30, 31, 34, 5, 16, 3, 5, 63, 20, 2, 5, 20, 21, 34, 18, 3, 30, 29, 29, 47, 107, 96, 106, 124, 47, 97, 96, 123, 47, 102, 98, AbstractJsonLexerKt.TC_INVALID, 99, 106, 98, 106, 97, 123, 47, 102, 97, 123, 106, 125, 105, 110, 108, 106, 47, 98, 106, 123, 103, 96, 107, 47, 96, 97, 92, 123, 96, AbstractJsonLexerKt.TC_INVALID, 65, 106, 124, 123, 106, 107, 92, 108, 125, 96, 99, 99, 75, 116, 120, 106, 77, 124, 111, 120, 115, 105, 61, 80, 111, 99, 113, 86, 103, 116, 99, 104, 114, 69, 105, 107, 118, 103, 114};
            }

            static {
                A01();
            }

            @Override // com.facebook.ads.redexgen.X.C1894hq
            public final void A02(ViewParent viewParent, View view) {
                try {
                    viewParent.onStopNestedScroll(view);
                } catch (AbstractMethodError e3) {
                    Log.e(A00(389, 16, 60), A00(378, 11, 39) + viewParent + A00(323, 55, 53), e3);
                }
            }

            @Override // com.facebook.ads.redexgen.X.C1894hq
            public final void A03(ViewParent viewParent, View view, int i5, int i11, int i12, int i13) {
                try {
                    viewParent.onNestedScroll(view, i5, i11, i12, i13);
                } catch (AbstractMethodError e3) {
                    Log.e(A00(389, 16, 60), A00(378, 11, 39) + viewParent + A00(157, 51, 25), e3);
                }
            }

            @Override // com.facebook.ads.redexgen.X.C1894hq
            public final void A04(ViewParent viewParent, View view, int i5, int i11, int[] iArr) {
                try {
                    viewParent.onNestedPreScroll(view, i5, i11, iArr);
                } catch (AbstractMethodError e3) {
                    Log.e(A00(389, 16, 60), A00(378, 11, 39) + viewParent + A00(103, 54, 31), e3);
                }
            }

            @Override // com.facebook.ads.redexgen.X.C1894hq
            public final void A05(ViewParent viewParent, View view, View view2, int i5) {
                try {
                    viewParent.onNestedScrollAccepted(view, view2, i5);
                } catch (AbstractMethodError e3) {
                    Log.e(A00(389, 16, 60), A00(378, 11, 39) + viewParent + A00(Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, 59, 57), e3);
                }
            }

            @Override // com.facebook.ads.redexgen.X.C1894hq
            public final boolean A06(ViewParent viewParent, View view, float f11, float f12) {
                try {
                    return viewParent.onNestedPreFling(view, f11, f12);
                } catch (AbstractMethodError e3) {
                    Log.e(A00(389, 16, 60), A00(378, 11, 39) + viewParent + A00(50, 53, 103), e3);
                    return false;
                }
            }

            @Override // com.facebook.ads.redexgen.X.C1894hq
            public final boolean A07(ViewParent viewParent, View view, float f11, float f12, boolean z11) {
                try {
                    return viewParent.onNestedFling(view, f11, f12, z11);
                } catch (AbstractMethodError e3) {
                    Log.e(A00(389, 16, 60), A00(378, 11, 39) + viewParent + A00(0, 50, 85), e3);
                    return false;
                }
            }

            @Override // com.facebook.ads.redexgen.X.C1894hq
            public final boolean A08(ViewParent viewParent, View view, View view2, int i5) {
                try {
                    return viewParent.onStartNestedScroll(view, view2, i5);
                } catch (AbstractMethodError e3) {
                    Log.e(A00(389, 16, 60), A00(378, 11, 39) + viewParent + A00(267, 56, 75), e3);
                    return false;
                }
            }
        };
    }

    public static void A02(ViewParent viewParent, View view, int i5) {
        if (0 != 0) {
            throw new NullPointerException(A00(72, 18, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE));
        }
        if (i5 == 0) {
            A01.A02(viewParent, view);
        }
    }

    public static void A03(ViewParent viewParent, View view, int i5, int i11, int i12, int i13, int i14) {
        if (0 != 0) {
            throw new NullPointerException(A00(17, 14, 41));
        }
        if (i14 == 0) {
            A01.A03(viewParent, view, i5, i11, i12, i13);
        }
    }

    public static void A04(ViewParent viewParent, View view, int i5, int i11, int[] iArr, int i12) {
        if (0 != 0) {
            throw new NullPointerException(A00(0, 17, 92));
        }
        if (i12 == 0) {
            A01.A04(viewParent, view, i5, i11, iArr);
        }
    }

    public static void A05(ViewParent viewParent, View view, View view2, int i5, int i11) {
        if (0 != 0) {
            throw new NullPointerException(A00(31, 22, 88));
        }
        if (i11 == 0) {
            A01.A05(viewParent, view, view2, i5);
        }
    }

    public static boolean A06(ViewParent viewParent, View view, float f11, float f12) {
        return A01.A06(viewParent, view, f11, f12);
    }

    public static boolean A07(ViewParent viewParent, View view, float f11, float f12, boolean z11) {
        return A01.A07(viewParent, view, f11, f12, z11);
    }

    public static boolean A08(ViewParent viewParent, View view, View view2, int i5, int i11) {
        if (0 != 0) {
            throw new NullPointerException(A00(53, 19, 81));
        }
        if (i11 == 0) {
            return A01.A08(viewParent, view, view2, i5);
        }
        return false;
    }
}
