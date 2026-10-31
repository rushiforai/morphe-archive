package com.facebook.ads.redexgen.X;

import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import com.facebook.ads.AdError;
import com.facebook.ads.RewardData;
import com.facebook.ads.internal.protocol.AdErrorType;
import com.facebook.ads.internal.util.activity.AdActivityIntent;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.gC, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class HandlerC1795gC extends Handler {
    public static byte[] A0A;
    public static String[] A0B = {"gcJlMo3lQ2pvKCdW2p1sJtuziP4vmf3g", "UeVkxUw", b.f42142b, "mK9oSbAokt8TQ0dXUmD3wWyanMNanYZS", "2sppJEO", "qJx5aWB0ThxzYc01mDGkt7c3QG7aYNlh", "VEMLINTEzdP6zY82lzj", "ayakGQouLRgcgrHEvJCPTB1FEKY99m"};
    public Messenger A00;
    public boolean A01;
    public boolean A02;
    public final ServiceConnection A03;
    public final Handler A04;
    public final Messenger A05;
    public final K6 A06;
    public final C0958Hi A07;
    public final C0957Hh A08;
    public final AbstractRunnableC2319oq A09;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 112);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A0A = new byte[]{98, 109, 101, 25, 3, 103, 96, 122, 113, 124, 120, 113, 111, 126, 126, 113, 97, 124, 103, 107, 96, 122, 111, 122, 103, 97, 96, 113, 101, 107, 119, 0, 55, 63, 61, 38, 55, 114, 33, 55, 32, 36, 59, 49, 55, 114, 55, 32, 32, 61, 32, 124, 37, 34, 36, 41, 55, 50, 41, 63, 50, 41, 61, 51, 47, 58, 37, 41, 59, 24, 53, 60, 41};
    }

    static {
        A07();
    }

    public HandlerC1795gC(C0958Hi c0958Hi, K6 k62) {
        super(Looper.getMainLooper());
        this.A04 = new Handler(Looper.getMainLooper());
        this.A03 = new ServiceConnectionC1794gB(this);
        this.A07 = c0958Hi;
        this.A08 = c0958Hi.A02();
        this.A05 = new Messenger(this);
        this.A06 = k62;
        this.A09 = new C1009Ji(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A05() {
        if (this.A01) {
            A0C();
            if (A0B[0].charAt(10) != 'p') {
                throw new RuntimeException();
            }
            A0B[0] = "nLMfglhqWUp8cQyLFKCyrpcnfEaexaDa";
            this.A00 = null;
        }
        this.A06.A0A();
        this.A06.A09();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:22:0x00ac  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void A06() {
        this.A00 = null;
        A0C();
        if (this.A06.A03().A7P() == EnumC1787g4.A07) {
            this.A07.A0F().AJB();
            this.A06.A0C(10, AdErrorType.INTERNAL_ERROR, null);
            return;
        }
        if (this.A06.A03().A7Q() == EnumC1787g4.A08) {
            if (AbstractC2206my.A0A(this.A07)) {
                C0958Hi c0958Hi = this.A07;
                String[] strArr = A0B;
                if (strArr[3].charAt(27) != strArr[5].charAt(27)) {
                    throw new RuntimeException();
                }
                A0B[7] = "eWy5dFEIXLQZTiIRTgsO";
                c0958Hi.A0F().AJ1();
                if (this.A06 instanceof C7Z) {
                    this.A06.AFw(1022, this.A06.A04(), null);
                    return;
                }
                if (this.A06 instanceof C7Y) {
                    this.A06.AFw(3000, this.A06.A04(), null);
                    RewardData rewardData = ((C7Y) this.A06).A0F().A03;
                    String[] strArr2 = A0B;
                    if (strArr2[4].length() != strArr2[1].length()) {
                        if (rewardData != null) {
                            this.A06.AFw(3002, this.A06.A04(), null);
                        }
                    } else {
                        A0B[7] = "c6k72gA3xT0mEX";
                        if (rewardData != null) {
                        }
                    }
                    this.A06.AFw(2110, this.A06.A04(), null);
                    return;
                }
                return;
            }
            this.A07.A0F().AJB();
            K6 k62 = this.A06;
            AdErrorType adErrorType = AdErrorType.INTERNAL_ERROR;
            if (A0B[6].length() != 19) {
                A0B[0] = "g9K0Z2syi6pHATMwVPoLqfWcGNzb5ezM";
                k62.A0C(10, adErrorType, null);
                return;
            } else {
                String[] strArr3 = A0B;
                strArr3[4] = "CMvvdGA";
                strArr3[1] = "SkuOyls";
                k62.A0C(10, adErrorType, null);
                return;
            }
        }
        EnumC1787g4 enumC1787g4A7P = this.A06.A03().A7P();
        EnumC1787g4 enumC1787g4 = EnumC1787g4.A06;
        if (A0B[2].length() != 6) {
            String[] strArr4 = A0B;
            strArr4[4] = "UkTM1Ed";
            strArr4[1] = "qtIwwU7";
            if (enumC1787g4A7P != enumC1787g4) {
                return;
            }
        } else if (enumC1787g4A7P != enumC1787g4) {
            return;
        }
        if (AbstractC2206my.A0J(this.A07)) {
            this.A07.A0F().AJI();
            this.A06.A03().ABe();
            this.A06.A0E(true);
            this.A06.A09();
            return;
        }
        this.A07.A0F().AJH();
        this.A06.A03().AKj(new AdError(2008, A04(31, 21, 34)));
    }

    private void A08(Messenger messenger, int i5, Bundle bundle) throws RemoteException {
        Message messageObtain = Message.obtain((Handler) null, i5);
        messageObtain.replyTo = this.A05;
        if (bundle != null) {
            messageObtain.setData(bundle);
        }
        messageObtain.getData().putString(A04(52, 13, 6), this.A06.A04());
        messenger.send(messageObtain);
    }

    public static void A0B(C0958Hi c0958Hi, String str) {
        c0958Hi.A0F().AJ5(str);
        InterfaceC2092l7 interfaceC2092l7A0G = c0958Hi.A0G();
        if (interfaceC2092l7A0G != null && interfaceC2092l7A0G.A7O() != null && interfaceC2092l7A0G.A7K() != null) {
            interfaceC2092l7A0G.A7O().onError(interfaceC2092l7A0G.A7K(), AdError.AD_PRESENTATION_ERROR);
        }
    }

    public final void A0C() {
        if (this.A01) {
            this.A07.A0F().AJU();
            this.A01 = false;
            this.A08.unbindService(this.A03);
        }
    }

    public final void A0D(C0958Hi c0958Hi, int i5) {
        this.A07.A0F().AJS();
        AdActivityIntent adActivityIntentA06 = C2337p8.A06(c0958Hi);
        adActivityIntentA06.putExtra(A04(65, 8, 60), EnumC2295oR.A0G);
        adActivityIntentA06.putExtra(A04(52, 13, 6), this.A06.A04());
        adActivityIntentA06.putExtra(A04(5, 26, 94), i5);
        try {
            int usedContext = C2337p8.A00(c0958Hi, adActivityIntentA06);
            this.A07.A0F().AJT(usedContext);
        } catch (C2335p6 e3) {
            String strA04 = A04(0, 5, 83);
            Throwable cause = e3.getCause();
            if (cause != null) {
                strA04 = strA04 + cause.toString();
            }
            A0B(c0958Hi, strA04);
        }
    }

    public final void A0E(boolean z11) {
        C1797gE bindResult = C1799gG.A01(this.A08, z11, this.A03);
        this.A01 = bindResult.A00 == 0;
        if (this.A01) {
            this.A07.A0F().AJ7();
            if (this.A00 == null) {
                this.A04.postDelayed(this.A09, AbstractC2206my.A00(this.A08));
                return;
            }
            return;
        }
        this.A07.A0F().AJF();
        this.A02 = false;
        this.A06.A0A();
        this.A06.A09();
    }

    public final boolean A0F(int i5, Bundle bundle) {
        try {
            Messenger service = this.A00;
            if (service != null) {
                A08(service, i5, bundle);
                return true;
            }
            return false;
        } catch (RemoteException e3) {
            A0C();
            this.A07.A0F().AJA(e3);
            return false;
        }
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (message.what == 3) {
                return;
            }
            if (message.what == 20 || message.what == 30 || message.what == 40) {
                if (message.what == 20) {
                    this.A07.A0F().AJP();
                    AbstractC2206my.A09(this.A08);
                } else {
                    this.A07.A0F().AJO(message.what);
                }
                A05();
                return;
            }
            String adId = message.getData().getString(A04(52, 13, 6));
            if (!this.A06.A04().equals(adId)) {
                this.A07.A0F().AJV();
            } else if (message.what == 2001 || message.what == 1011) {
                C1799gG.A04(this.A08, message);
            } else {
                this.A07.A0F().AJG(message.what);
                this.A06.A0D(message);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
