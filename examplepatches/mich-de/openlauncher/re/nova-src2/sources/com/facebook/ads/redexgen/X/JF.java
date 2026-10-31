package com.facebook.ads.redexgen.X;

import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.support.customtabs.ICustomTabsService;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public abstract class JF implements ServiceConnection {
    public static byte[] A01;
    public Context A00;

    static {
        A03();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 72);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A01 = new byte[]{1, 55, 49, 54, 45, 47, 98, 22, 35, 32, 49, 98, 17, 39, 48, 52, 43, 33, 39, 98, 33, 45, 44, 44, 39, 33, 54, 39, 38, 98, 32, 39, 36, 45, 48, 39, 98, 35, 44, 98, 35, 50, 50, 46, 43, 33, 35, 54, 43, 45, 44, 33, 45, 44, 54, 39, 58, 54, 98, 42, 35, 49, 98, 32, 39, 39, 44, 98, 50, 48, 45, 52, 43, 38, 39, 38, 108};
    }

    public abstract void A04(ComponentName componentName, AbstractC0990Io abstractC0990Io);

    public final void A05(Context context) {
        this.A00 = context;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        if (this.A00 != null) {
            A04(componentName, new VS(this, ICustomTabsService.Stub.asInterface(iBinder), componentName, this.A00));
            return;
        }
        throw new IllegalStateException(A02(0, 77, 10));
    }
}
