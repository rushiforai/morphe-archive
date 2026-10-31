package com.facebook.ads.redexgen.X;

import android.media.AudioTrack;
import android.media.AudioTrack$StreamEventCallback;

/* loaded from: assets/audience_network/classes.dex */
public class RC extends AudioTrack$StreamEventCallback {
    public static String[] A02 = {"1Ps5MPoIcoFFmeMoVIT3T2JAaTpvZ", "eMHVlP7dZU61v18jcb680ygrdHiZP", "wis9YFJuHp596uJv5OnEkoDntVgINInC", "zSP", "mwXCxqgHlALVxMUQCRflnQZNheimmQSa", "FYwUP08wiDwKo2nR88XWpwFMbcW", "foR9pyiOhsjCKoblv6dTAH6ZabQf9Tdo", "5Mx0aMCJm4gVVM2skH7k7CK4OO45496M"};
    public final /* synthetic */ RD A00;
    public final /* synthetic */ SI A01;

    public RC(RD rd2, SI si2) {
        this.A00 = rd2;
        this.A01 = si2;
    }

    public final void onDataRequest(AudioTrack audioTrack, int i5) {
        if (!audioTrack.equals(this.A00.A02.A0D)) {
            return;
        }
        RD rd2 = this.A00;
        if (A02[5].length() != 27) {
            throw new RuntimeException();
        }
        A02[3] = "tzs";
        if (rd2.A02.A0I == null || !this.A00.A02.A0X) {
            return;
        }
        this.A00.A02.A0I.AG7();
    }

    public final void onTearDown(AudioTrack audioTrack) {
        if (!audioTrack.equals(this.A00.A02.A0D) || this.A00.A02.A0I == null || !this.A00.A02.A0X) {
            return;
        }
        this.A00.A02.A0I.AG7();
    }
}
