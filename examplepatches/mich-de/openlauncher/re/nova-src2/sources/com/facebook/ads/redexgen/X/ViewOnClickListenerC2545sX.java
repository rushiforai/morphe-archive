package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.sX, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2545sX implements View.OnClickListener {
    public static String[] A02 = {"TIunxDtIhaUNWzp4pt", "P9jotymXcalp6QY0mceKgA2PKmpL9MmY", "D7hcdAR4gL6eiDwh3neEemk2oNa5HBXr", "yvexzu4B1k7dNWe8D7Or2RByN379E6p0", "Pqli68R1jGGut3mXcbdL9aII4ZRM", "ATTETBfRTuy9XX9zcQNEfkNPOGv1roB9", "U61xFgZvYwebvbfIgBzckGL9tuihnAsk", "Y5vLZmHyGlb7iKoGDQtiStGzi5AFA8c4"};
    public final /* synthetic */ C2528sG A00;
    public final /* synthetic */ FC A01;

    public ViewOnClickListenerC2545sX(FC fc2, C2528sG c2528sG) {
        this.A01 = fc2;
        this.A00 = c2528sG;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A01();
            this.A01.A0D.AFv(EnumC1821gc.A05);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            String[] strArr = A02;
            if (strArr[3].charAt(16) != strArr[7].charAt(16)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[5] = "30YalsquWEYpd1gcKbt6iXjPGudeG4qT";
            strArr2[1] = "9GHMqcINuHB0R6Mj0oiZfCiPilEGiYS9";
        }
    }
}
