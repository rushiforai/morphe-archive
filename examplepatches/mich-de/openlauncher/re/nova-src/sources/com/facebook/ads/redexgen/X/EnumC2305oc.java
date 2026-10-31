package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata
/* renamed from: com.facebook.ads.redexgen.X.oc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class EnumC2305oc {
    public static byte[] A00;
    public static String[] A01 = {"OmjeWy8As8fgqm5pJTsevVOMoc4T7JgN", "Iy83URH4qag0055NEvaIf7WzknKwrfKt", "WMonQfgPDl0SEyykkIaVWd1q0buOsSnQ", "EwIddWkNCvWsaf5oGkWD9OBL6TrF0WJd", "5o2KY4BHqaWyFocNQSU1tqZi2a0STG", "xJqSHhTAy0Nda6OEryPxu7bdCfSF6cW9", "5KfENbw5", "WcRohfdVmiuV1GpL88bGHEOa5pelTVCR"};
    public static final C2304ob A02;
    public static final /* synthetic */ InterfaceC05640p A03;
    public static final /* synthetic */ EnumC2305oc[] A04;
    public static final EnumC2305oc A05;
    public static final EnumC2305oc A06;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 112);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        byte[] bArr = {72, 73, 74, 77, 89, 64, 88, 2, 15, 3, 13, 2, 30, 21, 12, 3, 18, 15, 14};
        String[] strArr = A01;
        if (strArr[6].length() == strArr[4].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[0] = "dN8FoAuDr24ELo9qSnoC8B5JTkL20HEN";
        strArr2[3] = "YHQ0rUgJUPLUOpQpbOGpF0ByxGm2CRO5";
        A00 = bArr;
    }

    public static final /* synthetic */ EnumC2305oc[] A02() {
        String[] strArr = A01;
        if (strArr[1].charAt(18) != strArr[2].charAt(18)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[0] = "vSmIYiL2i4R94AHhIaASjau9DqJRdTIt";
        strArr2[3] = "ugLcAnDs83RUnbpapSGq4HiPCMfpqcp8";
        return new EnumC2305oc[]{A05, A06};
    }

    public static EnumC2305oc valueOf(String str) {
        return (EnumC2305oc) Enum.valueOf(EnumC2305oc.class, str);
    }

    public static EnumC2305oc[] values() throws CloneNotSupportedException {
        Object objClone = A04.clone();
        String[] strArr = A01;
        if (strArr[5].charAt(12) == strArr[7].charAt(12)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[1] = "RaATeNT0Z2oMPEiJGdaJ39Cy7DHMpl7D";
        strArr2[2] = "Yy87Txsw0tUdDZLf0XaJ9I7PpXqD3WEv";
        return (EnumC2305oc[]) objClone;
    }

    static {
        A01();
        A05 = new EnumC2305oc(A00(0, 7, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE), 0);
        A06 = new EnumC2305oc(A00(7, 12, 58), 1);
        A04 = A02();
        A03 = C1q.A01(A04);
        A02 = new C2304ob(null);
    }

    public EnumC2305oc(String str, int i5) {
    }
}
