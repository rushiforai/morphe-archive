package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import android.os.SystemClock;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.IOException;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.96, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass96 extends UY {
    public static byte[] A07;
    public static final InterfaceC1017Js<AnonymousClass96> A08;
    public static final String A09;
    public static final String A0A;
    public static final String A0B;
    public static final String A0C;
    public static final String A0D;
    public static final String A0E;
    public final boolean A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final VC A04;
    public final L1 A05;
    public final String A06;

    public static /* synthetic */ AnonymousClass96 A00(Bundle bundle) {
        return new AnonymousClass96(bundle);
    }

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 47);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A07 = new byte[]{76, 9, 30, 30, 3, 30, 64, 76, 5, 2, 8, 9, 20, 81, 3, 15, 73, 64, 93, 66, 78, 91, 18, 2, 14, 72, 65, 92, 67, 79, 90, 113, 93, 91, 94, 94, 65, 92, 90, 75, 74, 19, 34, 56, 125, 74, 66, 64, 91, 74, 15, 74, 93, 93, 64, 93, 117, 73, 83, 84, 69, 67, 6, 67, 84, 84, 73, 84, 33, 26, 17, 12, 4, 17, 23, 0, 17, 16, 84, 6, 1, 26, 0, 29, 25, 17, 84, 17, 6, 6, 27, 6};
    }

    static {
        A07();
        A08 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.Sl
            @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
            public final InterfaceC1018Jt A7F(Bundle bundle) {
                return AnonymousClass96.A00(bundle);
            }
        };
        A0E = N1.A0h(1001);
        A0D = N1.A0h(1002);
        A0C = N1.A0h(BackupConstant.SCENE_CLOSED_WITHOUT_SHOW);
        A0A = N1.A0h(1004);
        A0B = N1.A0h(1005);
        A09 = N1.A0h(1006);
    }

    public AnonymousClass96(int i5, Throwable th2, int i11) {
        this(i5, th2, null, i11, null, -1, null, 4, false);
    }

    public AnonymousClass96(int i5, Throwable th2, String str, int i11, String str2, int i12, VC vc, int i13, boolean z11) {
        this(A06(i5, th2, str, str2, i12, vc, i13), th2, i11, i5, str2, i12, vc, i13, null, SystemClock.elapsedRealtime(), z11);
    }

    public AnonymousClass96(Bundle bundle) {
        VC vc;
        super(bundle);
        this.A03 = bundle.getInt(A0E, 2);
        this.A06 = bundle.getString(A0D);
        this.A02 = bundle.getInt(A0C, -1);
        Bundle bundle2 = bundle.getBundle(A0A);
        if (bundle2 == null) {
            vc = null;
        } else {
            vc = (VC) VC.A0b.A7F(bundle2);
        }
        this.A04 = vc;
        this.A01 = bundle.getInt(A0B, 4);
        this.A00 = bundle.getBoolean(A09, false);
        this.A05 = null;
    }

    public AnonymousClass96(String str, Throwable th2, int i5, int i11, String str2, int i12, VC vc, int i13, L1 l12, long j11, boolean z11) {
        super(str, th2, i5, j11);
        AbstractC1062Ln.A07(!z11 || i11 == 1);
        AbstractC1062Ln.A07(th2 != null || i11 == 3);
        this.A03 = i11;
        this.A06 = str2;
        this.A02 = i12;
        this.A04 = vc;
        this.A01 = i13;
        this.A05 = l12;
        this.A00 = z11;
    }

    public static AnonymousClass96 A01(IOException iOException, int i5) {
        return new AnonymousClass96(0, iOException, i5);
    }

    @Deprecated
    public static AnonymousClass96 A02(RuntimeException runtimeException) {
        return A03(runtimeException, 1000);
    }

    public static AnonymousClass96 A03(RuntimeException runtimeException, int i5) {
        return new AnonymousClass96(2, runtimeException, i5);
    }

    public static AnonymousClass96 A04(Throwable th2, String str, int i5, VC vc, int i11, boolean z11, int i12) {
        int i13 = i11;
        if (vc == null) {
            i13 = 4;
        }
        return new AnonymousClass96(1, th2, null, i12, str, i5, vc, i13, z11);
    }

    public static String A06(@MetaExoPlayerCustomization(type = {"NEW_METHOD_ARGS"}, value = "Throwable cause - linked with Error reporting") int i5, Throwable th2, String str, String str2, int i11, VC vc, int i12) {
        String message;
        String strA05;
        if (str == null) {
            message = th2 == null ? null : th2.getMessage();
        } else {
            message = str;
        }
        if (message != null) {
            return message;
        }
        switch (i5) {
            case 0:
                strA05 = A05(56, 12, 9);
                break;
            case 1:
                StringBuilder sbAppend = new StringBuilder().append(str2);
                String message2 = A05(0, 14, 67);
                StringBuilder sbAppend2 = sbAppend.append(message2).append(i11);
                String message3 = A05(14, 9, 0);
                StringBuilder sbAppend3 = sbAppend2.append(message3).append(vc);
                String message4 = A05(23, 19, 1);
                StringBuilder sbAppend4 = sbAppend3.append(message4);
                String message5 = N1.A0g(i12);
                strA05 = sbAppend4.append(message5).toString();
                break;
            case 2:
            default:
                strA05 = A05(68, 24, 91);
                break;
            case 3:
                strA05 = A05(44, 12, 0);
                break;
        }
        if (!TextUtils.isEmpty(str)) {
            StringBuilder sbAppend5 = new StringBuilder().append(strA05);
            String message6 = A05(42, 2, 55);
            return sbAppend5.append(message6).append(str).toString();
        }
        return strA05;
    }
}
