package com.facebook.ads.redexgen.X;

import android.util.Log;
import android.view.View;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.jE, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1978jE {
    public static byte[] A0I;
    public static String[] A0J = {"RjjM", "koSvj4DxhDjUOCe4EMKks9dnOG3CuiGu", "aGHSBrQSfGZtxcbyILmCKrnGyIhpjEzu", "3xCBACovNHKuv2JvT7we0utPzpikn", "cVLYlYPRz01pIgpGABaAmbt5GOW22sRw", "rNQ6SroUNOr34Wm88sisB9VlrwVLSnji", "gjKr", "5vAD1AgEgb1ZXBUPAvYh"};
    public static final List<Object> A0K;
    public C7O A08;
    public WeakReference<C7O> A09;
    public int A0C;
    public final View A0H;
    public int A03 = -1;
    public int A01 = -1;
    public long A05 = -1;
    public int A00 = -1;
    public int A04 = -1;
    public AbstractC1978jE A06 = null;
    public AbstractC1978jE A07 = null;
    public List<Object> A0A = null;
    public List<Object> A0B = null;
    public int A0D = 0;
    public C1968j4 A0F = null;
    public boolean A0G = false;
    public int A0E = 0;
    public int A02 = -1;

    public static String A0D(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0I, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 42);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0F() {
        A0I = new byte[]{120, 49, 60, 101, 89, 16, 30, 23, 22, 11, 28, 29, 107, 34, 37, 61, 42, 39, 34, 47, 9, 71, 70, 9, 89, 72, 91, 76, 71, 93, 20, 90, 91, 64, 20, 70, 81, 87, 77, 87, 88, 85, 86, 88, 81, 28, 123, 43, 52, 40, 50, 47, 50, 52, 53, 102, 114, 32, 55, 63, 61, 36, 55, 54, 18, 65, 81, 64, 83, 66, 18, 25, 77, 84, 73, 125, 92, 77, 88, 90, 81, 92, 93, 58, 111, 116, 120, 117, 111, 116, 126, 100, 49, 42, 32, 33, 34, 45, 42, 33, 32, 100, 37, 32, 37, 52, 48, 33, 54, 100, 52, 43, 55, 45, 48, 45, 43, 42, 41, 124, 121, 109, 104, 125, 108, 81, 22, 26, 85, 86, 94, 106, 85, 73, 7, 76, 64, 16, 44, 16, 15, 19, 90, 96, 95, 83, 65, 69, 122, 118, 100, 91, 124, AbstractJsonLexerKt.TC_INVALID, 119, 118, 97, 104, 118, 76, 89, 89, 76, 78, 69, 72, 73, 126, 78, 95, 76, 93, 112, 95, 103, 108, 101, 106, 99, 97, 87, 103, 118, 101, 116, 89, 48, 42, 11, 60, 58, 32, 58, 53, 56, 59, 53, 60, 121, 61, 60, 58, 43, 60, 52, 60, 55, 45, 60, 61, 121, 59, 60, 53, 54, 46, 121, 105, 99, 121, 44, 55, 52, 56, 45, 58, 49, 60, 61, 121, 41, 56, 48, 43, 121, 54, 63, 121, 42, 60, 45, 16, 42, 11, 60, 58, 32, 56, 59, 53, 60, 113, 112, 121, 58, 56, 53, 53, 42, 121, 63, 54, 43, 121, 31, 2, 19, 27, 32, 31, 19, 1, 86, 27, 23, 15, 86, 24, 25, 2, 86, 20, 19, 86, 24, 3, 26, 26, 19};
        String[] strArr = A0J;
        if (strArr[5].charAt(21) != strArr[1].charAt(21)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0J;
        strArr2[5] = "ATZarWDBMn8zDwozKxOA19Yjdj8cqMYP";
        strArr2[1] = "9Y2h7opSRjFz5DGljetO79QOLWaAi3pM";
    }

    static {
        A0F();
        A0K = Collections.EMPTY_LIST;
    }

    public AbstractC1978jE(View view) {
        if (view != null) {
            this.A0H = view;
            return;
        }
        throw new IllegalArgumentException(A0D(264, 24, 92));
    }

    private void A0E() {
        if (this.A0A == null) {
            this.A0A = new ArrayList();
            this.A0B = Collections.unmodifiableList(this.A0A);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0I(C7O c7o) {
        this.A0E = AbstractC1880hb.A00(this.A0H);
        c7o.A26(this, 4);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0J(C7O c7o) {
        c7o.A26(this, this.A0E);
        this.A0E = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0K() {
        return (this.A0C & 16) == 0 && AbstractC1880hb.A0G(this.A0H);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0L() {
        return (this.A0C & 16) != 0;
    }

    private final boolean A0M() {
        return (this.A0C & EventBridgeChannel.QUEUE_CAPACITY) != 0 || A0m();
    }

    public final int A0R() {
        if (this.A08 == null) {
            return -1;
        }
        return this.A08.A1E(this);
    }

    public final int A0S() {
        return this.A00;
    }

    public final int A0T() {
        return this.A04 == -1 ? this.A03 : this.A04;
    }

    public final int A0U() {
        return this.A01;
    }

    public final long A0V() {
        return this.A05;
    }

    public final List<Object> A0W() {
        if ((this.A0C & 1024) == 0) {
            if (this.A0A != null) {
                int size = this.A0A.size();
                if (A0J[2].charAt(8) == 'd') {
                    throw new RuntimeException();
                }
                String[] strArr = A0J;
                strArr[5] = "2DcmVbWbN7IXAuYZB7QLz9ixHDr4nD2H";
                strArr[1] = "B34awafHihlIJm5KsMjOG9HfWfhHTq0p";
                if (size != 0) {
                    return this.A0B;
                }
            }
            return A0K;
        }
        return A0K;
    }

    public final void A0X() {
        this.A01 = -1;
        this.A04 = -1;
    }

    public final void A0Y() {
        if (this.A0A != null) {
            this.A0A.clear();
        }
        this.A0C &= -1025;
    }

    public final void A0Z() {
        this.A0C &= -33;
    }

    public final void A0a() {
        this.A0C &= -257;
    }

    public final void A0b() {
        this.A0C = 0;
        this.A03 = -1;
        this.A01 = -1;
        this.A05 = -1L;
        this.A04 = -1;
        this.A0D = 0;
        this.A06 = null;
        this.A07 = null;
        A0Y();
        this.A0E = 0;
        this.A02 = -1;
        C7O.A0t(this);
    }

    public final void A0c() {
        if (this.A01 == -1) {
            this.A01 = this.A03;
        }
    }

    public final void A0d() {
        this.A0F.A0d(this);
    }

    public final void A0e(int i5) {
        this.A0C |= i5;
    }

    public final void A0f(int i5, int i11) {
        this.A0C = (this.A0C & (~i11)) | (i5 & i11);
    }

    public final void A0g(int i5, int i11, boolean z11) {
        A0e(8);
        A0h(i11, z11);
        this.A03 = i5;
    }

    public final void A0h(int i5, boolean z11) {
        if (this.A01 == -1) {
            this.A01 = this.A03;
        }
        if (this.A04 == -1) {
            this.A04 = this.A03;
        }
        if (z11) {
            this.A04 += i5;
        }
        this.A03 += i5;
        if (this.A0H.getLayoutParams() != null) {
            ((C1961ix) this.A0H.getLayoutParams()).A01 = true;
        }
    }

    public final void A0i(C1968j4 c1968j4, boolean z11) {
        this.A0F = c1968j4;
        this.A0G = z11;
    }

    public final void A0j(Object obj) {
        if (obj != null) {
            if ((1024 & this.A0C) != 0) {
                return;
            }
            A0E();
            this.A0A.add(obj);
            return;
        }
        A0e(1024);
    }

    public final void A0k(boolean z11) {
        int i5 = this.A0D;
        this.A0D = z11 ? i5 - 1 : i5 + 1;
        if (A0J[4].charAt(7) != 'R') {
            throw new RuntimeException();
        }
        A0J[7] = "l8mjsSEKM";
        if (this.A0D < 0) {
            this.A0D = 0;
            Log.e(A0D(143, 4, 28), A0D(186, 78, 115) + this);
            return;
        }
        if (!z11 && this.A0D == 1) {
            int i11 = this.A0C | 16;
            String[] strArr = A0J;
            if (strArr[5].charAt(21) != strArr[1].charAt(21)) {
                throw new RuntimeException();
            }
            A0J[2] = "drml3nLoX5pQWQBc32bzozsnTExNEnJK";
            this.A0C = i11;
            return;
        }
        if (!z11 || this.A0D != 0) {
            return;
        }
        this.A0C &= -17;
    }

    public final boolean A0l() {
        return (this.A0C & 1) != 0;
    }

    public final boolean A0m() {
        return (this.A0C & 4) != 0;
    }

    public final boolean A0n() {
        return (this.A0C & 8) != 0;
    }

    public final boolean A0o() {
        return this.A0F != null;
    }

    public final boolean A0p() {
        return (this.A0C & 256) != 0;
    }

    public final boolean A0q() {
        return (this.A0C & 2) != 0;
    }

    public final boolean A0r() {
        return (this.A0C & 2) != 0;
    }

    public final boolean A0s() {
        return (this.A0C & 128) != 0;
    }

    public final boolean A0t() {
        return (this.A0C & 32) != 0;
    }

    public final boolean A0u() {
        return (this.A0C & 16) == 0 && !AbstractC1880hb.A0G(this.A0H);
    }

    public final boolean A0v(int i5) {
        return (this.A0C & i5) != 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x01b5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String toString() {
        String strA0D;
        StringBuilder sb2 = new StringBuilder(A0D(147, 11, 57) + Integer.toHexString(hashCode()) + A0D(46, 10, 113) + this.A03 + A0D(0, 4, 114) + this.A05 + A0D(Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, 9, 16) + this.A01 + A0D(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 8, 74) + this.A04);
        if (A0o()) {
            StringBuilder sbAppend = sb2.append(A0D(64, 7, 24));
            if (this.A0G) {
                String[] strArr = A0J;
                if (strArr[0].length() != strArr[6].length()) {
                    throw new RuntimeException();
                }
                A0J[4] = "j0Vj1oVRIqCq1XZaWhj1lvw8KAw9tpFK";
                strA0D = A0D(TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 13, 46);
            } else {
                strA0D = A0D(158, 15, 7);
            }
            sbAppend.append(strA0D);
        }
        if (A0m()) {
            sb2.append(A0D(12, 8, 97));
        }
        if (!A0l()) {
            sb2.append(A0D(83, 8, 48));
        }
        if (A0r()) {
            if (A0J[4].charAt(7) != 'R') {
                throw new RuntimeException();
            }
            A0J[3] = "foGMuj5MEatDallcaM1f2EXlxkDRS";
            sb2.append(A0D(Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 7, 35));
        }
        if (A0n()) {
            sb2.append(A0D(56, 8, 120));
        }
        if (A0s()) {
            sb2.append(A0D(4, 8, 83));
        }
        if (A0p()) {
            sb2.append(A0D(71, 12, 19));
        }
        if (!A0u()) {
            StringBuilder sb3 = new StringBuilder().append(A0D(30, 16, 30)).append(this.A0D).append(A0D(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 1, 82));
            sb2.append(sb3.toString());
        }
        if (A0M()) {
            sb2.append(A0D(91, 27, 110));
        }
        View view = this.A0H;
        String[] strArr2 = A0J;
        if (strArr2[0].length() != strArr2[6].length()) {
            A0J[3] = "v49slmZH3G5n79cGGvxOHO9vt1V64";
            if (view.getParent() == null) {
                sb2.append(A0D(20, 10, 3));
            }
        } else {
            String[] strArr3 = A0J;
            strArr3[5] = "W0NVeHZD2y4aXmdfyR2eL940vqkefCMI";
            strArr3[1] = "YJ6uhs8dg1u1qe09RVpCk9ETEVw4FjVT";
            if (view.getParent() == null) {
            }
        }
        sb2.append(A0D(288, 1, 68));
        return sb2.toString();
    }
}
