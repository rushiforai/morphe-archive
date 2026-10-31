package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class EP extends IX {
    public static byte[] A01;
    public final /* synthetic */ C2735vb A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 68);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-14, 5, 1, -1, -18, 0, 50, 47, 41};
    }

    public EP(C2735vb c2735vb) {
        this.A00 = c2735vb;
    }

    @Override // com.facebook.ads.redexgen.X.IX
    public final void A09(int i5, int i11, int i12, int i13, int i14, Bundle bundle) {
        C1h.A09(bundle, A00(0, 6, 73));
        switch (i14) {
            case 1:
                this.A00.A05.AEM();
                if (this.A00.A03) {
                    this.A00.A03 = false;
                    this.A00.A04.A0F().A5Q();
                    break;
                }
                break;
            case 2:
            case 5:
                this.A00.A05.AEL();
                if (!this.A00.A03) {
                    this.A00.A03 = true;
                    this.A00.A04.A0F().A5P();
                    break;
                }
                break;
        }
    }

    @Override // com.facebook.ads.redexgen.X.IX
    public final void A0A(int i5, Bundle bundle) {
        String strA00;
        switch (i5) {
            case 1:
                if (bundle == null || (strA00 = bundle.getString(A00(6, 3, Sdk.SDKError.Reason.TPAT_ERROR_VALUE))) == null) {
                    strA00 = A00(0, 0, 85);
                }
                this.A00.A05.AGE(strA00);
                break;
            case 2:
                this.A00.A05.AG5();
                break;
        }
    }
}
