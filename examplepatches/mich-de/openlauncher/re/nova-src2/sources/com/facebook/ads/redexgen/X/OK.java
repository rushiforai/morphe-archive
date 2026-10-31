package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.util.Map;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class OK implements InterfaceC1383Yv {
    public static String[] A03 = {"7uz0Som4IG7TRWUehbwdgdVh7", "ZE8Da8Lubk2vJGYn2ZK7Xov", b.f42142b, "m2c0uAYXJLgCDZXbFoOgS74g90TEYPYl", "5e9mSvnYBnLPWsiL1gzdh4fKQ0IS5IUE", "dMYl5Gqwxen9108n6AVe8CHIAYXdaLv7", "guwhY1tlqdTdtQ", "vK4M4cRyPXyhwSvTSzmPlbql"};
    public static final InterfaceC1387Yz A04 = new InterfaceC1387Yz() { // from class: com.facebook.ads.redexgen.X.OM
        @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
        public final InterfaceC1383Yv[] A5w() {
            return OK.A00();
        }

        @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
        public final /* synthetic */ InterfaceC1383Yv[] A5x(Uri uri, Map map) {
            return AbstractC1386Yy.A01(this, uri, map);
        }
    };
    public boolean A00;
    public final OJ A02 = new OJ();
    public final C1084Mk A01 = new C1084Mk(ReaderJsonLexerKt.BATCH_SIZE);

    public static /* synthetic */ InterfaceC1383Yv[] A00() {
        return new InterfaceC1383Yv[]{new OK()};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AAq(InterfaceC1384Yw interfaceC1384Yw) {
        this.A02.A6B(interfaceC1384Yw, new C1601d2(0, 1));
        interfaceC1384Yw.A6x();
        interfaceC1384Yw.AKP(new Q4(-9223372036854775807L));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final int AIY(Q9 q92, ZH zh2) throws IOException {
        int i5 = q92.read(this.A01.A0l(), 0, ReaderJsonLexerKt.BATCH_SIZE);
        if (i5 == -1) {
            return -1;
        }
        this.A01.A0f(0);
        this.A01.A0e(i5);
        if (!this.A00) {
            this.A02.AI3(0L, 4);
            this.A00 = true;
        }
        this.A02.A5j(this.A01);
        return 0;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AIp() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AKO(long j11, long j12) {
        this.A00 = false;
        this.A02.AKN();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final boolean ALN(Q9 q92) throws IOException {
        C1084Mk c1084Mk = new C1084Mk(10);
        int length = 0;
        while (true) {
            byte[] bArrA0l = c1084Mk.A0l();
            if (A03[5].charAt(19) != 'e') {
                throw new RuntimeException();
            }
            A03[2] = b.f42142b;
            q92.AI6(bArrA0l, 0, 10);
            c1084Mk.A0f(0);
            if (c1084Mk.A0K() != 4801587) {
                q92.AK3();
                q92.A4X(length);
                int i5 = length;
                int syncBytes = 0;
                while (true) {
                    q92.AI6(c1084Mk.A0l(), 0, 7);
                    c1084Mk.A0f(0);
                    int headerPosition = c1084Mk.A0M();
                    if (headerPosition != 44096 && headerPosition != 44097) {
                        syncBytes = 0;
                        q92.AK3();
                        i5++;
                        if (i5 - length >= 8192) {
                            return false;
                        }
                        q92.A4X(i5);
                    } else {
                        syncBytes++;
                        if (syncBytes >= 4) {
                            return true;
                        }
                        int headerPosition2 = AbstractC1369Yg.A02(c1084Mk.A0l(), headerPosition);
                        if (headerPosition2 == -1) {
                            return false;
                        }
                        q92.A4X(headerPosition2 - 7);
                    }
                }
            } else {
                c1084Mk.A0g(3);
                int iA0H = c1084Mk.A0H();
                length += iA0H + 10;
                q92.A4X(iA0H);
            }
        }
    }
}
