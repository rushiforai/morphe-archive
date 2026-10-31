package com.facebook.ads.redexgen.X;

import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.gI, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class HandlerC1801gI extends Handler {
    public static byte[] A0D;
    public static String[] A0E = {"7XGwSkVk3T00tnH9cVPKelrEGcawiCjw", "CQOuonMXQSYezZedNwAjlRkGSLi3aOjj", "mesEj11OvP9", "VZOpRMX1bgsh5uSD6zrhQF9CMqqU", "qOEuTvvHdf1ojQl77Cm2nWjluxHjpHjj", "MJ8oyn1cMPaioU5SW8VDhXvuoMQhG6hY", "cRCjMWliQ8bJ7V8UELoizUhtI", "6BrNpk2twP0gV2txjXjpJVsF16rKzLtO"};
    public int A00;
    public int A01;
    public Messenger A02;
    public InterfaceC2396q8 A03;
    public boolean A04;
    public boolean A05;
    public final ServiceConnection A06;
    public final Handler A07;
    public final Messenger A08;
    public final InterfaceC1640df A09;
    public final C0957Hh A0A;
    public final AbstractRunnableC2319oq A0B;
    public final AbstractRunnableC2319oq A0C;

    public static String A0A(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0D, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 17);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0B() {
        A0D = new byte[]{-121, -102, -104, -102, -98, -85, -102, -103, 85, -99, -106, -93, -103, -88, -99, -106, -96, -102, 85, -101, -106, -98, -95, -102, -103, 97, 85, -104, -92, -103, -102, 111, 85, -46, -45, -47, -34, -49, -64, -62, -54, -64, -58, -60, -34, -64, -53, -47, -60, -64, -61, -40, -34, -60, -41, -56, -46, -45, -46, -34, -54, -60, -40, -116, -115, -117, -104, -119, 122, 124, -124, 122, -128, 126, -104, -126, -121, -116, -115, 122, -123, -123, 126, 125, -104, -124, 126, -110, -30, -29, -31, -18, -33, -48, -46, -38, -48, -42, -44, -18, -38, -44, -24};
        if (A0E[7].length() != 32) {
            throw new RuntimeException();
        }
        A0E[2] = "iPGKfbxDLhp";
    }

    static {
        A0B();
    }

    public HandlerC1801gI(C0957Hh c0957Hh) {
        super(Looper.getMainLooper());
        this.A07 = new Handler(Looper.getMainLooper());
        this.A0B = new C1007Jg(this);
        this.A06 = new ServiceConnectionC1800gH(this);
        this.A0A = c0957Hh;
        this.A08 = new Messenger(this);
        InterfaceC1644dj funnelModule = c0957Hh.A00(c0957Hh);
        if (funnelModule != null) {
            this.A09 = funnelModule.ADC();
        } else {
            this.A09 = new C1097Mx();
        }
        this.A0C = new C1006Jf(this);
    }

    public static /* synthetic */ int A01(HandlerC1801gI handlerC1801gI) {
        int i5 = handlerC1801gI.A00;
        handlerC1801gI.A00 = i5 + 1;
        return i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0C(Messenger messenger) throws RemoteException {
        Message messageObtain = Message.obtain((Handler) null, 1);
        messageObtain.replyTo = this.A08;
        messageObtain.setData(AbstractC1810gR.A00(this.A0A));
        try {
            messenger.send(messageObtain);
        } catch (RemoteException unused) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0F(boolean z11) {
        this.A04 = z11;
        C1797gE c1797gEA01 = C1799gG.A01(this.A0A, z11, this.A06);
        this.A09.AJb(c1797gEA01.A00, c1797gEA01.A01, this.A00);
        this.A05 = c1797gEA01.A00 == 0;
        if (this.A05) {
            this.A09.AJY(this.A00);
            if (this.A02 == null) {
                this.A07.removeCallbacks(this.A0C);
                this.A07.postDelayed(this.A0C, AbstractC2206my.A01(this.A0A));
                return;
            }
            return;
        }
        this.A09.AJa(this.A00);
        boolean zA0B = AbstractC2206my.A0B(this.A0A);
        String[] strArr = A0E;
        if (strArr[3].length() == strArr[6].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0E;
        strArr2[0] = "FxD7YzO4CyP1D0jV5Ld9721uIeTHQPLi";
        strArr2[4] = "onRm7tgfjCImirzUHi1hG1EU2Jl8lJWl";
        if (A0I(zA0B)) {
            return;
        }
        AbstractC2153m7.A05(this.A0A);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0I(boolean z11) {
        if (!z11 || this.A02 != null || this.A01 >= AbstractC2206my.A02(this.A0A)) {
            return false;
        }
        this.A01++;
        this.A07.postDelayed(this.A0B, AbstractC2206my.A03(this.A0A));
        return true;
    }

    public final void A0J() {
        if (this.A05) {
            this.A05 = false;
            this.A0A.unbindService(this.A06);
            this.A02 = null;
        }
    }

    public final void A0K(String str, InterfaceC2396q8 interfaceC2396q8, int i5) throws RemoteException {
        if (this.A05) {
            this.A09.AJe(i5);
            this.A03 = interfaceC2396q8;
            Message messageObtain = Message.obtain((Handler) null, i5);
            messageObtain.replyTo = this.A08;
            if (str != null) {
                Bundle bundle = new Bundle();
                bundle.putString(A0A(88, 15, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE), str);
                messageObtain.setData(bundle);
            }
            try {
                if (this.A02 != null) {
                    this.A02.send(messageObtain);
                    return;
                }
                return;
            } catch (RemoteException e3) {
                this.A09.AJf(e3.toString());
                return;
            }
        }
        InterfaceC1640df interfaceC1640df = this.A09;
        if (A0E[7].length() != 32) {
            throw new RuntimeException();
        }
        A0E[2] = "GMBTsYwMPeX";
        interfaceC1640df.AJg();
    }

    public final void A0L(boolean z11) {
        this.A07.removeCallbacks(this.A0B);
        this.A07.removeCallbacks(this.A0C);
        this.A01 = 0;
        this.A00 = 0;
        A0F(z11);
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (message.what == 2) {
                C1799gG.A04(this.A0A, message);
                this.A09.AJX(this.A00);
                return;
            }
            if (message.what == 20 || message.what == 40 || message.what == 30) {
                this.A09.AJc(message.what, this.A00);
                if (message.what == 20) {
                    AbstractC2206my.A09(this.A0A);
                }
                String str = A0A(0, 33, 36) + message.what;
                AbstractC2153m7.A05(this.A0A);
                return;
            }
            if (message.what == 4) {
                this.A09.AJd();
                Bundle data = message.getData();
                if (this.A03 != null) {
                    boolean z11 = data.getBoolean(A0A(33, 30, 110), false);
                    String strA0A = A0A(88, 15, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
                    if (z11) {
                        this.A03.AGA(data.getString(strA0A));
                    } else if (data.getBoolean(A0A(63, 25, 40), false)) {
                        this.A03.AGB(data.getString(strA0A));
                    }
                }
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
