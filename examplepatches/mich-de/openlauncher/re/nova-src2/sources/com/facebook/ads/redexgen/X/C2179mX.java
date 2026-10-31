package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import com.facebook.ads.internal.util.common.Preconditions;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.UUID;
import java.util.concurrent.Executor;

/* renamed from: com.facebook.ads.redexgen.X.mX, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2179mX {
    public static byte[] A06;
    public static String[] A07 = {"eZRg0", "9V6E8W", "xj5QhV", "OA95VIvTvwhgOpg1JzD5APn5ld4Fxl09", "KVXKxw3vFVm2nsonOqXLQ2M9", "1wiEXg5TWKy6aTJl", "hr3sX5JQ1zlqribj", "Vt9t5ut5ZgjhHbMTByjzA5y3IT5Rov5"};
    public C2198mq A00;
    public final Handler A01 = new Handler(Looper.getMainLooper());
    public final C2095lA A02;
    public final AbstractC2173mR<String> A03;
    public final InterfaceC2189mh<C2221nD> A04;
    public final C2221nD A05;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 55);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A06 = new byte[]{26, 40, 31, 31, 2, 31, 77, 0, 8, 30, 30, 12, 10, 8, 77, 14, 12, 3, 3, 2, 25, 77, 15, 8, 77, 3, 24, 1, 1, 13, 46, 38, 38, 40, 47, 38, 97, 36, 55, 36, 47, 53, 123, 97, 9, 30, 24, 20, 9, 31, 36, 31, 26, 15, 26, 25, 26, 8, 30};
    }

    static {
        A02();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.mR != com.facebook.ads.internal.eventstorage.AdEventStorageCallback<java.lang.String> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.mh != com.facebook.ads.internal.eventstorage.record.RecordDatabase<com.facebook.ads.internal.logging.AdEvent> */
    public C2179mX(C2221nD c2221nD, AbstractC2173mR<String> abstractC2173mR, InterfaceC2189mh<C2221nD> interfaceC2189mh, C2095lA c2095lA) {
        this.A05 = c2221nD;
        this.A04 = interfaceC2189mh;
        this.A03 = abstractC2173mR;
        this.A02 = c2095lA;
    }

    private String A00() {
        String eventId;
        String string = null;
        try {
            string = UUID.randomUUID().toString();
            InterfaceC2125le interfaceC2125leA08 = this.A02.A08();
            String eventId2 = this.A05.A06().toString();
            interfaceC2125leA08.AAh(eventId2);
            eventId = this.A05.A08();
        } catch (C2198mq e3) {
            this.A00 = e3;
            InterfaceC2125le interfaceC2125leA082 = this.A02.A08();
            int i5 = AbstractC2126lf.A2N;
            C2127lg c2127lg = new C2127lg(e3);
            String eventId3 = A01(44, 15, 76);
            interfaceC2125leA082.ABz(eventId3, i5, c2127lg);
        }
        if (TextUtils.isEmpty(eventId)) {
            return null;
        }
        if (this.A02.A05().AB6()) {
            StringBuilder sb2 = new StringBuilder();
            String eventId4 = A01(29, 15, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
            StringBuilder sbAppend = sb2.append(eventId4);
            String eventId5 = this.A05.A06().toString();
            StringBuilder sbAppend2 = sbAppend.append(eventId5);
            String eventId6 = A01(0, 1, 13);
            StringBuilder sbAppend3 = sbAppend2.append(eventId6);
            String eventId7 = this.A05.A09().toString();
            sbAppend3.append(eventId7).toString();
        }
        this.A04.ALa(H8.A07(this.A02, string, this.A05));
        return string;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: A03, reason: merged with bridge method [inline-methods] */
    public void A05(String str) {
        if (this.A00 == null) {
            AbstractC2173mR<String> abstractC2173mR = this.A03;
            if (A07[0].length() == 0) {
                throw new RuntimeException();
            }
            String[] strArr = A07;
            strArr[5] = "shQ0u07cw4p4b8Uc";
            strArr[6] = "JjSvAUnNTB5Zbg5c";
            abstractC2173mR.A02(str);
            return;
        }
        AbstractC2173mR<String> abstractC2173mR2 = this.A03;
        String str2 = (String) Preconditions.checkNotNull(this.A00.getMessage(), A01(1, 28, 90));
        String[] strArr2 = A07;
        if (strArr2[5].length() != strArr2[6].length()) {
            abstractC2173mR2.A01(0, str2);
        } else {
            A07[4] = "N66E9jsqBkZQOUjdGlNkK47WGUg";
            abstractC2173mR2.A01(0, str2);
        }
    }

    public final /* synthetic */ void A04() {
        final String strA00 = A00();
        this.A01.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.mV
            @Override // java.lang.Runnable
            public final void run() {
                this.A00.A05(strA00);
            }
        });
    }

    public final void A06(Executor executor) {
        executor.execute(new Runnable() { // from class: com.facebook.ads.redexgen.X.mW
            @Override // java.lang.Runnable
            public final void run() {
                this.A00.A04();
            }
        });
    }
}
