package com.facebook.ads.redexgen.X;

import android.graphics.Rect;
import android.os.Build;
import android.view.accessibility.AccessibilityNodeInfo;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.i0, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1904i0 {
    public static byte[] A02;
    public static String[] A03 = {"IVmNZ4K5ijrEy03SUyZllrwYfGsSidsw", "uaVeZCSsPKZMiFLhWQ93bkOuh7Bkr", "fj8UDgC4HzdO2kuBNBPUB7GtanmKKm25", "SYZpn4btE2JdKC0jqJVDdFV7Ab7Ex928", "9XKyAy0QwW2RAbyuAC0HJ7gQU9o6NjRH", "LWQKQsADjd8kwxodkBq3bJfZv3R2tuNQ", "ttD9SROXIamLqNqjpH0jHeP07ZacbL3Q", "0sQtHWJTsFmoyuVwvJXQHcjInEg1c"};
    public static final C1900hw A04;
    public int A00 = -1;
    public final AccessibilityNodeInfo A01;

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A02 = new byte[]{107, 103, 90, 65, 58, 53, 46, 108, 97, 123, 96, 106, 125, 71, 96, 94, 111, 124, 107, 96, 122, 52, 46, 43, 48, 114, AbstractJsonLexerKt.TC_INVALID, 101, 126, 116, 99, 89, 126, 67, 115, 98, 117, 117, 126, 42, 48, 52, 47, 108, 103, 106, 108, 100, 110, 109, 99, 106, 53, 47, 56, 35, 96, 107, 102, 96, 104, 102, 103, 57, 35, 59, 32, 99, 108, 97, 115, 115, 78, 97, 109, 101, 58, 32, 50, 41, 106, 101, 96, 106, 98, 104, 107, 101, 108, 51, 41, 88, 67, 0, 12, 13, 23, 6, 13, 23, 39, 6, 16, 0, 17, 10, 19, 23, 10, 12, 13, 89, 67, 49, 42, 111, 100, 107, 104, 102, 111, 110, 48, 42, 64, 91, 29, 20, 24, 14, 8, 26, 25, 23, 30, 65, 91, 52, 47, 105, 96, 108, 122, 124, 106, 107, 53, 47, 60, 39, 107, 104, 105, 96, 68, 107, 110, 100, 108, 102, 101, 107, 98, 61, 39, 36, 63, 111, 126, 124, 116, 126, 120, 122, 81, 126, 114, 122, 37, 63, 7, 28, 76, 93, 79, 79, 75, 83, 78, 88, 6, 28, 22, 13, 94, 78, 95, 66, 65, 65, 76, 79, 65, 72, 23, 13, 29, 6, 85, 67, 74, 67, 69, 82, 67, 66, 28, 6, 80, 75, 31, 14, 19, 31, 81, 75, AbstractJsonLexerKt.TC_INVALID, 100, 50, 45, 33, 51, 13, 32, 126, 100, 33, 35, 52, 41, 47, 46, 63, 33, 35, 35, 37, 51, 51, 41, 34, 41, 44, 41, 52, 57, 63, 38, 47, 35, 53, 51, 109, 111, 120, 101, 99, 98, 115, 111, 96, 105, 109, 126, 115, 109, 111, 111, 105, AbstractJsonLexerKt.TC_INVALID, AbstractJsonLexerKt.TC_INVALID, 101, 110, 101, 96, 101, 120, 117, 115, 106, 99, 111, 121, AbstractJsonLexerKt.TC_INVALID, 32, 34, 53, 40, 46, 47, 62, 34, 45, 36, 32, 51, 62, 39, 46, 34, 52, 50, 51, 49, 38, 59, 61, 60, 45, 49, 62, 55, 51, 32, 45, 33, 55, 62, 55, 49, 38, 59, 61, 60, 25, 27, 12, 17, 23, 22, 7, 27, 20, 17, 27, 19, 69, 71, 80, 77, 75, 74, 91, 71, 75, 84, 93, 107, 105, 126, 99, 101, 100, 117, 105, AbstractJsonLexerKt.TC_INVALID, 126, 8, 10, 29, 0, 6, 7, 22, 15, 6, 10, 28, 26, 63, 61, 42, 55, 49, 48, 33, 50, 49, 48, 57, 33, 61, 50, 55, 61, 53, 90, 88, 79, 82, 84, 85, 68, 85, 94, 67, 79, 68, 90, 79, 68, 86, 84, 77, 94, 86, 94, 85, 79, 68, 92, 73, 90, 85, 78, 87, 90, 73, 82, 79, 66, 78, 76, 91, 70, 64, 65, 80, 65, 74, 87, 91, 80, 71, 91, 66, 67, 80, 74, 67, 74, 66, 74, 65, 91, 34, 32, 55, 42, 44, 45, 60, 51, 34, 48, 55, 38, 21, 23, 0, 29, 27, 26, 11, 4, 6, 17, 2, 29, 27, 1, 7, 11, 21, 0, 11, 25, 27, 2, 17, 25, 17, 26, 0, 11, 19, 6, 21, 26, 1, 24, 21, 6, 29, 0, 13, 45, 47, 56, 37, 35, 34, 51, 60, 62, 41, 58, 37, 35, 57, 63, 51, 36, 56, 33, 32, 51, 41, 32, 41, 33, 41, 34, 56, 14, 12, 27, 6, 0, 1, 16, 28, 12, 29, 0, 3, 3, 16, 13, 14, 12, 4, 24, 14, 29, 11, 4, 6, 17, 12, 10, 11, 26, 22, 6, 23, 10, 9, 9, 26, 3, 10, 23, 18, 4, 23, 1, 34, 32, 55, 42, 44, 45, 60, 48, 38, 47, 38, 32, 55, 52, 54, 33, 60, 58, 59, 42, 38, 48, 33, 42, 38, 48, 57, 48, 54, 33, 60, 58, 59, 24, 26, 13, 16, 22, 23, 6, 12, 23, 18, 23, 22, 14, 23, 87};
    }

    static {
        A09();
        if (Build.VERSION.SDK_INT >= 24) {
            A04 = new C3K() { // from class: com.facebook.ads.redexgen.X.3I
            };
            return;
        }
        if (Build.VERSION.SDK_INT >= 23) {
            A04 = new C3K();
        } else if (Build.VERSION.SDK_INT >= 22) {
            A04 = new C3M();
        } else {
            A04 = new C3O();
        }
    }

    public C1904i0(AccessibilityNodeInfo accessibilityNodeInfo) {
        this.A01 = accessibilityNodeInfo;
    }

    private final int A00() {
        return this.A01.getActions();
    }

    public static C1904i0 A01(AccessibilityNodeInfo accessibilityNodeInfo) {
        return new C1904i0(accessibilityNodeInfo);
    }

    private final CharSequence A02() {
        return this.A01.getClassName();
    }

    private final CharSequence A03() {
        return this.A01.getContentDescription();
    }

    private final CharSequence A04() {
        return this.A01.getPackageName();
    }

    private final CharSequence A05() {
        return this.A01.getText();
    }

    private final String A06() {
        return A04.A02(this.A01);
    }

    public static String A07(int i5) {
        switch (i5) {
            case 1:
                return A08(367, 12, 50);
            case 2:
                return A08(294, 18, 26);
            case 4:
                return A08(577, 13, 24);
            case 8:
                return A08(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 22, 9);
            case 16:
                return A08(334, 12, 35);
            case 32:
                String[] strArr = A03;
                if (strArr[2].charAt(30) == strArr[6].charAt(30)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A03;
                strArr2[0] = "Wsn1vJkw9zMZ1dCIcpdhA48NRIlsHibC";
                strArr2[3] = "yyZsxnBpb3hGEtLyBJQzoNk7OwP5So5E";
                return A08(379, 17, 5);
            case 64:
                return A08(236, 26, 27);
            case 128:
                return A08(262, 32, 87);
            case 256:
                return A08(396, 35, 96);
            case EventBridgeChannel.QUEUE_CAPACITY /* 512 */:
                return A08(467, 39, 47);
            case 1024:
                return A08(431, 24, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
            case 2048:
                return A08(PglCryptUtils.DECRYPT_FAILED, 28, 23);
            case androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT /* 4096 */:
                return A08(556, 21, 62);
            case UserMetadata.MAX_INTERNAL_KEY_SIZE /* 8192 */:
                return A08(534, 22, 52);
            case ReaderJsonLexerKt.BATCH_SIZE /* 16384 */:
                return A08(346, 11, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
            case SQLiteDatabase.OPEN_NOMUTEX /* 32768 */:
                return A08(455, 12, 24);
            case SQLiteDatabase.OPEN_FULLMUTEX /* 65536 */:
                return A08(357, 10, 81);
            case SQLiteDatabase.OPEN_SHAREDCACHE /* 131072 */:
                return A08(590, 20, 14);
            default:
                return A08(610, 14, 34);
        }
    }

    private final void A0A(Rect rect) {
        this.A01.getBoundsInParent(rect);
    }

    private final void A0B(Rect rect) {
        this.A01.getBoundsInScreen(rect);
    }

    private final boolean A0C() {
        return this.A01.isCheckable();
    }

    private final boolean A0D() {
        return this.A01.isChecked();
    }

    private final boolean A0E() {
        return this.A01.isClickable();
    }

    private final boolean A0F() {
        return this.A01.isEnabled();
    }

    private final boolean A0G() {
        return this.A01.isFocusable();
    }

    private final boolean A0H() {
        return this.A01.isFocused();
    }

    private final boolean A0I() {
        return this.A01.isLongClickable();
    }

    private final boolean A0J() {
        return this.A01.isPassword();
    }

    private final boolean A0K() {
        return this.A01.isScrollable();
    }

    private final boolean A0L() {
        return this.A01.isSelected();
    }

    public final AccessibilityNodeInfo A0M() {
        return this.A01;
    }

    public final void A0N(int i5) {
        this.A01.addAction(i5);
    }

    public final void A0O(CharSequence charSequence) {
        this.A01.setClassName(charSequence);
    }

    public final void A0P(Object obj) {
        A04.A03(this.A01, ((C1901hx) obj).A00);
    }

    public final void A0Q(Object obj) {
        A04.A04(this.A01, ((C1902hy) obj).A00);
    }

    public final void A0R(boolean z11) {
        this.A01.setScrollable(z11);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        C1904i0 c1904i0 = (C1904i0) obj;
        if (this.A01 == null) {
            if (c1904i0.A01 != null) {
                return false;
            }
        } else if (!this.A01.equals(c1904i0.A01)) {
            return false;
        }
        return true;
    }

    public final int hashCode() {
        if (this.A01 == null) {
            return 0;
        }
        return this.A01.hashCode();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(super.toString());
        Rect rect = new Rect();
        A0A(rect);
        StringBuilder builder = new StringBuilder().append(A08(5, 18, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
        sb2.append(builder.append(rect).toString());
        A0B(rect);
        StringBuilder builder2 = new StringBuilder().append(A08(23, 18, 107));
        sb2.append(builder2.append(rect).toString());
        sb2.append(A08(165, 15, 100)).append(A04());
        sb2.append(A08(65, 13, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE)).append(A02());
        sb2.append(A08(Sdk.SDKError.Reason.MRAID_JS_DOES_NOT_EXIST_VALUE, 8, 16)).append(A05());
        sb2.append(A08(91, 22, 24)).append(A03());
        sb2.append(A08(Sdk.SDKError.Reason.PRIVACY_ICON_FALLBACK_ERROR_VALUE, 10, 63)).append(A06());
        sb2.append(A08(41, 13, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE)).append(A0C());
        sb2.append(A08(54, 11, 120)).append(A0D());
        sb2.append(A08(Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, 13, 0)).append(A0G());
        sb2.append(A08(Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, 11, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE)).append(A0H());
        sb2.append(A08(Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE, 12, 93)).append(A0L());
        sb2.append(A08(78, 13, 114)).append(A0E());
        sb2.append(A08(148, 17, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE)).append(A0I());
        sb2.append(A08(113, 11, 113)).append(A0F());
        sb2.append(A08(180, 12, 71)).append(A0J());
        StringBuilder builder3 = new StringBuilder().append(A08(192, 14, 86)).append(A0K());
        sb2.append(builder3.toString());
        sb2.append(A08(2, 3, 26));
        int action = A00();
        while (action != 0) {
            int iNumberOfTrailingZeros = 1 << Integer.numberOfTrailingZeros(action);
            action &= ~iNumberOfTrailingZeros;
            sb2.append(A07(iNumberOfTrailingZeros));
            if (action != 0) {
                sb2.append(A08(0, 2, 60));
            }
        }
        sb2.append(A08(624, 1, 113));
        return sb2.toString();
    }
}
