package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.facebook.ads.internal.dynamicloading.DynamicLoaderFactory;
import com.facebook.ads.internal.protocol.AdErrorType;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public abstract class K6 implements InterfaceC1809gQ {
    public static byte[] A06;
    public final InterfaceC1788g5 A00;
    public final HandlerC1795gC A01;
    public final C0958Hi A02;
    public final Handler A03;
    public final String A04;
    public final InterfaceC1803gK A05;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 36);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A06 = new byte[]{-65, -46, -53, -63, -55, -62, -36, -62, -43, -47, -49, -66, -48, -36, -56, -62, -42, -46, -41, -35, -24, -50, -37, -37, -40, -37, -24, -52, -40, -51, -50, -24, -44, -50, -30, -83, -82, -84, -71, -101, -98, -71, -93, -98, -71, -91, -97, -77, -24, -23, -25, -12, -38, -25, -25, -28, -25, -12, -30, -38, -24, -24, -42, -36, -38, -12, -32, -38, -18};
    }

    public abstract void A08();

    public abstract void A09();

    public abstract void A0A();

    public abstract void A0E(boolean z11);

    public K6(C0958Hi c0958Hi, String str, InterfaceC1804gL interfaceC1804gL) {
        this.A02 = c0958Hi;
        this.A04 = str;
        DynamicLoaderFactory.makeLoader(this.A02).getInitApi().onAdLoadInvoked(this.A02);
        this.A00 = new K9(c0958Hi, this);
        this.A01 = new HandlerC1795gC(c0958Hi, this);
        this.A03 = new Handler(Looper.getMainLooper());
        this.A05 = interfaceC1804gL.A61(this.A00, this, this.A01);
    }

    public final InterfaceC1788g5 A03() {
        return this.A00;
    }

    public final String A04() {
        return this.A04;
    }

    public final void A05() {
        if (this.A01.A01) {
            this.A02.A0F().AJE();
            A06();
        } else {
            this.A02.A0F().AJ6();
            this.A01.A02 = true;
            this.A01.A0E(AbstractC2206my.A01.get());
        }
    }

    public final void A06() {
        this.A02.A0F().AJK();
        if (!this.A01.A0F(this.A05.A91(), this.A05.A60(this.A04))) {
            A0A();
            A09();
            this.A02.A0F().AJC();
        }
    }

    public final void A07() {
        if (!C2203mv.A0t(this.A02)) {
            return;
        }
        ExecutorC2419qV.A00(new K7(this));
    }

    public final void A0B(int i5) {
        this.A01.A0D(this.A02, i5);
    }

    public final void A0C(int i5, AdErrorType adErrorType, String str) {
        Bundle bundle = new Bundle();
        String strA01 = A01(48, 21, 113);
        if (str != null) {
            bundle.putString(strA01, str);
        } else {
            bundle.putString(strA01, adErrorType.getDefaultErrorMessage());
        }
        bundle.putInt(A01(17, 18, 101), adErrorType.getErrorCode());
        AFw(i5, this.A04, bundle);
    }

    public final void A0D(Message message) {
        this.A05.AAN(message);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1809gQ
    public final void AFw(int i5, String str, Bundle bundle) {
        Message messageObtain = Message.obtain((Handler) null, i5);
        messageObtain.getData().putString(A01(35, 13, 54), str);
        if (bundle != null) {
            messageObtain.getData().putBundle(A01(0, 17, 89), bundle);
        }
        Runnable callbackApiRunnable = new K8(this, messageObtain);
        this.A03.post(callbackApiRunnable);
    }
}
