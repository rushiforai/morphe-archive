package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* renamed from: com.facebook.ads.redexgen.X.k7, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2033k7 {
    public static byte[] A05;
    public final Handler A00;
    public final InterfaceC2034k8 A01;
    public final C0958Hi A02;
    public final ExecutorService A03;
    public final boolean A04;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A05 = new byte[]{59, 57, 50, 57, 46, 53, 63};
    }

    public C2033k7(C0958Hi c0958Hi, InterfaceC2034k8 interfaceC2034k8, boolean z11) {
        this.A03 = Executors.newSingleThreadExecutor();
        this.A00 = new Handler(Looper.getMainLooper());
        this.A02 = c0958Hi;
        this.A01 = interfaceC2034k8;
        this.A04 = z11;
    }

    public /* synthetic */ C2033k7(C0958Hi c0958Hi, InterfaceC2034k8 interfaceC2034k8, boolean z11, I4 i42) {
        this(c0958Hi, interfaceC2034k8, z11);
    }

    private Drawable A00(C2035k9... c2035k9Arr) {
        if (c2035k9Arr == null || c2035k9Arr.length < 1) {
            return null;
        }
        String url = c2035k9Arr[0].A01;
        String str = c2035k9Arr[0].A00;
        Bitmap bitmapA0O = null;
        try {
            bitmapA0O = new C2086kz(this.A02).A0O(url, -1, -1);
        } catch (Throwable th2) {
            this.A02.A08().ABz(A01(0, 7, 42), AbstractC2126lf.A1V, new C2127lg(th2));
        }
        if (bitmapA0O == null) {
            return null;
        }
        return GT.A05(this.A02, bitmapA0O, this.A04, str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: A03, reason: merged with bridge method [inline-methods] */
    public void A04(Drawable drawable) {
        this.A01.AFB(drawable);
    }

    public final void A05(final C2035k9... c2035k9Arr) {
        this.A03.execute(new Runnable() { // from class: com.facebook.ads.redexgen.X.k6
            @Override // java.lang.Runnable
            public final void run() {
                this.A00.A06(c2035k9Arr);
            }
        });
    }

    public final /* synthetic */ void A06(C2035k9[] c2035k9Arr) {
        final Drawable drawableA00 = A00(c2035k9Arr);
        this.A00.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.k5
            @Override // java.lang.Runnable
            public final void run() {
                this.A01.A04(drawableA00);
            }
        });
    }
}
