package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Handler;
import android.os.Looper;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* renamed from: com.facebook.ads.redexgen.X.Me, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1078Me {
    public static C1078Me A04;
    public static byte[] A05;
    public static String[] A06 = {"mEW5y6tQgBlLQ4rgt2QB4HCAS2fxpgIG", "VqsbgZy2p0xuXF5umQ0gfrrN6x0Eekbd", "Bmw3Pw1335RLcrMFg2TWNb", "Zc4HXKGIskG3eSFiCTd6JF8MaUB3EDcr", "RGO9LS9P9", "l3mBAuRIeGoa9nGSP", "H9mL1Oixp6iNXbcIo6bTfZcsXpGSRa61", "5gSQxk5eg7uxcM6fRavmPv9iIicoQHPY"};
    public final Handler A01 = new Handler(Looper.getMainLooper());
    public final CopyOnWriteArrayList<WeakReference<InterfaceC1076Mc>> A03 = new CopyOnWriteArrayList<>();
    public final Object A02 = new Object();
    public int A00 = 0;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A06[5].length() == 7) {
                throw new RuntimeException();
            }
            A06[2] = "Bluvv0UDsBk";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 3);
            i13++;
        }
    }

    public static void A06() {
        A05 = new byte[]{76, 67, 73, 95, 66, 68, 73, 3, 67, 72, 89, 3, 78, 66, 67, 67, 3, 110, 98, 99, 99, 104, 110, 121, 100, 123, 100, 121, 116, 114, 110, 101, 108, 99, 106, 104, 23, 27, 26, 26, 17, 23, 0, 29, 2, 29, 0, 13};
    }

    static {
        A06();
    }

    public C1078Me(Context context) {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(A04(0, 36, 46));
        context.registerReceiver(new C1077Md(this), intentFilter);
    }

    public static int A00(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(A04(36, 12, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
        if (connectivityManager == null) {
            return 0;
        }
        try {
            NetworkInfo networkInfo = connectivityManager.getActiveNetworkInfo();
            if (networkInfo == null || !networkInfo.isConnected()) {
                return 1;
            }
            switch (networkInfo.getType()) {
                case 0:
                case 4:
                case 5:
                    return A02(networkInfo);
                case 1:
                    return 2;
                case 2:
                case 3:
                case 7:
                case 8:
                default:
                    return 8;
                case 6:
                    return 5;
                case 9:
                    return 7;
            }
        } catch (SecurityException unused) {
            return 0;
        }
    }

    public static int A02(NetworkInfo networkInfo) {
        switch (networkInfo.getSubtype()) {
            case 1:
            case 2:
                return 3;
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 14:
            case 15:
            case 17:
                return 4;
            case 13:
                return 5;
            case 16:
            case 19:
            default:
                return 6;
            case 18:
                if (A06[2].length() == 8) {
                    throw new RuntimeException();
                }
                A06[4] = "Ggw1XDwp8UJkd4yqvlov9Xxjbjv";
                return 2;
            case 20:
                return N1.A02 >= 29 ? 9 : 0;
        }
    }

    public static synchronized C1078Me A03(Context context) {
        if (A04 == null) {
            A04 = new C1078Me(context);
        }
        return A04;
    }

    private void A05() {
        Iterator<WeakReference<InterfaceC1076Mc>> it = this.A03.iterator();
        while (it.hasNext()) {
            WeakReference<InterfaceC1076Mc> next = it.next();
            if (A06[2].length() == 8) {
                throw new RuntimeException();
            }
            A06[2] = "er9H7aBTxsQtRZ08fxnu9fkRyO3";
            WeakReference<InterfaceC1076Mc> weakReference = next;
            if (weakReference.get() == null) {
                this.A03.remove(weakReference);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A07(int i5) {
        synchronized (this.A02) {
            if (this.A00 == i5) {
                return;
            }
            this.A00 = i5;
            Iterator<WeakReference<InterfaceC1076Mc>> it = this.A03.iterator();
            while (it.hasNext()) {
                WeakReference<InterfaceC1076Mc> next = it.next();
                InterfaceC1076Mc interfaceC1076Mc = next.get();
                if (interfaceC1076Mc != null) {
                    interfaceC1076Mc.AG6(i5);
                } else {
                    this.A03.remove(next);
                }
            }
        }
    }

    public final int A09() {
        int i5;
        synchronized (this.A02) {
            i5 = this.A00;
        }
        return i5;
    }

    public final void A0A(final InterfaceC1076Mc interfaceC1076Mc) {
        A05();
        this.A03.add(new WeakReference<>(interfaceC1076Mc));
        this.A01.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.MY
            @Override // java.lang.Runnable
            public final void run() {
                this.A01.A0B(interfaceC1076Mc);
            }
        });
    }

    public final /* synthetic */ void A0B(InterfaceC1076Mc interfaceC1076Mc) {
        interfaceC1076Mc.AG6(A09());
    }
}
