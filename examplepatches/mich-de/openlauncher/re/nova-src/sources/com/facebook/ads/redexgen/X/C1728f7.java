package com.facebook.ads.redexgen.X;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.facebook.ads.AdError;

/* renamed from: com.facebook.ads.redexgen.X.f7, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1728f7 extends BroadcastReceiver {
    public static String[] A03 = {"JgmY627JJ4fVvMUsUI7dBJzvca", "2Fivc7ze9Y6M7vLBAhVCw66dd2zEUTp", "oqNyJxLxp23hnAfKGRpFUMlaCTnSy4au", "HRO7fC4J0U3bXqsrOiWljP6J940cuLTJ", "rhEs9JkkityiMJcgD18RNPKtdGmllPs6", "c8I5EiJJKjWgwuyghylYWruaZ4nXJiut", "YeKDqRnNq5JcEGU0HYsnt6sxK1D4K6hE", "zIQMBMVVQmczFglCifMrZtV9RNUhKeCf"};
    public LG A00;
    public InterfaceC1727f6 A01;
    public String A02;

    public C1728f7(String str, LG lg2, InterfaceC1727f6 interfaceC1727f6) {
        this.A00 = lg2;
        this.A01 = interfaceC1727f6;
        this.A02 = str;
    }

    public final IntentFilter A00() {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(EnumC1658dy.A06.A04(this.A02));
        intentFilter.addAction(EnumC1658dy.A09.A04(this.A02));
        intentFilter.addAction(EnumC1658dy.A04.A04(this.A02));
        intentFilter.addAction(EnumC1658dy.A0A.A04(this.A02));
        intentFilter.addAction(EnumC1658dy.A05.A04(this.A02));
        intentFilter.addAction(EnumC1658dy.A0C.A04(this.A02));
        intentFilter.addAction(EnumC1658dy.A0B.A04(this.A02));
        intentFilter.addAction(EnumC1658dy.A03.A04(this.A02));
        return intentFilter;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        EnumC1658dy enumC1658dy = EnumC1658dy.A06;
        String action2 = this.A02;
        if (enumC1658dy.A04(action2).equals(action)) {
            InterfaceC1727f6 interfaceC1727f6 = this.A01;
            LG lg2 = this.A00;
            String action3 = A03[1];
            if (action3.length() != 11) {
                A03[0] = "z37hhVYNur1y5njE4t22VYTMbB";
                interfaceC1727f6.AGv(lg2);
                return;
            }
        } else {
            EnumC1658dy enumC1658dy2 = EnumC1658dy.A09;
            String action4 = this.A02;
            if (enumC1658dy2.A04(action4).equals(action)) {
                boolean zA1y = C2203mv.A1y(context);
                String[] strArr = A03;
                if (strArr[3].charAt(16) != strArr[4].charAt(16)) {
                    A03[0] = "a2nbOp8yH430aeg70B0MHQFnwN";
                    if (zA1y) {
                        InterfaceC1727f6 interfaceC1727f62 = this.A01;
                        LG lg3 = this.A00;
                        AdError adError = AdError.AD_PRESENTATION_ERROR;
                        String[] strArr2 = A03;
                        if (strArr2[3].charAt(16) != strArr2[4].charAt(16)) {
                            String[] strArr3 = A03;
                            strArr3[2] = "Smm3aT6IchFgLH9ob00fwQqxHFnPPG6O";
                            strArr3[5] = "wzZfDEncWZ9M4YUYJFr8Gzf2lfnMb6hd";
                            interfaceC1727f62.AGw(lg3, adError);
                            return;
                        }
                        String[] strArr4 = A03;
                        strArr4[6] = "douVyTcHxmEKv1YyJqQbVTsvWWCOpXBn";
                        strArr4[7] = "x6yn97aV8hj96Z0WREVv4HAdEeLr9VIY";
                        interfaceC1727f62.AGw(lg3, adError);
                        return;
                    }
                    this.A01.AGw(this.A00, AdError.INTERNAL_ERROR);
                    return;
                }
            } else {
                EnumC1658dy enumC1658dy3 = EnumC1658dy.A04;
                String action5 = this.A02;
                if (enumC1658dy3.A04(action5).equals(action)) {
                    this.A01.AGs(this.A00);
                    return;
                }
                EnumC1658dy enumC1658dy4 = EnumC1658dy.A0A;
                String action6 = this.A02;
                if (enumC1658dy4.A04(action6).equals(action)) {
                    this.A01.AGu(this.A00);
                    return;
                }
                EnumC1658dy enumC1658dy5 = EnumC1658dy.A05;
                String action7 = this.A02;
                if (enumC1658dy5.A04(action7).equals(action)) {
                    this.A01.onRewardedVideoClosed();
                    return;
                }
                EnumC1658dy enumC1658dy6 = EnumC1658dy.A0B;
                String action8 = this.A02;
                if (enumC1658dy6.A04(action8).equals(action)) {
                    this.A01.AGq(this.A00);
                    return;
                }
                EnumC1658dy enumC1658dy7 = EnumC1658dy.A0C;
                String action9 = this.A02;
                if (enumC1658dy7.A04(action9).equals(action)) {
                    this.A01.AGr(this.A00);
                    return;
                }
                EnumC1658dy enumC1658dy8 = EnumC1658dy.A03;
                String action10 = this.A02;
                if (!enumC1658dy8.A04(action10).equals(action)) {
                    return;
                }
                this.A01.onRewardedVideoActivityDestroyed();
                return;
            }
        }
        throw new RuntimeException();
    }
}
