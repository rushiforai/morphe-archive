package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.LinkedBlockingQueue;

/* renamed from: com.facebook.ads.redexgen.X.pz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2387pz implements InvocationHandler {
    public static byte[] A03;
    public final /* synthetic */ int A00;
    public final /* synthetic */ C2095lA A01;
    public final /* synthetic */ LinkedBlockingQueue A02;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 63);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{16, 14, 23, 14, 27, 18, 12, 21, 19, 34, 1, 30, 26, 23, 34, -4, 15, 27, 19, 29, 27, 42, 10, 47, 38, 27, -75, -77, -62, -92, -81, -70, -61, -77, 40, 39, -4, 33, 30, 28, 36, 44, 46, 38, 44, 11, 30, 26, 29, 50};
    }

    public C2387pz(int i5, LinkedBlockingQueue linkedBlockingQueue, C2095lA c2095lA) {
        this.A00 = i5;
        this.A02 = linkedBlockingQueue;
        this.A01 = c2095lA;
    }

    @Override // java.lang.reflect.InvocationHandler
    public final Object invoke(Object obj, Method method, Object[] objArr) throws Throwable {
        try {
            if (method.getName().equals(A00(34, 16, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE)) && objArr.length == 1 && (objArr[0] instanceof List)) {
                for (Object c11 : (List) objArr[0]) {
                    String str = (String) c11.getClass().getMethod(A00(7, 12, 111), new Class[0]).invoke(c11, new Object[0]);
                    int iIntValue = ((Integer) c11.getClass().getMethod(A00(19, 7, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), new Class[0]).invoke(c11, new Object[0])).intValue();
                    if (str == null && iIntValue == this.A00) {
                        byte[] value = (byte[]) c11.getClass().getMethod(A00(26, 8, 15), new Class[0]).invoke(c11, new Object[0]);
                        this.A02.put(value);
                        return null;
                    }
                }
                this.A02.put(null);
            }
        } catch (Throwable t6) {
            this.A01.A08().ABz(A00(0, 7, 106), AbstractC2126lf.A1G, new C2127lg(t6));
        }
        return null;
    }
}
