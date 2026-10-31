package com.facebook.ads.redexgen.X;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/* loaded from: assets/audience_network/classes.dex */
public class UE extends BroadcastReceiver {
    public static String[] A01 = {"J0abSZclFz6cHgmygiIhCEQBMg", "7hY699yVyYSIYUVIvTwcvhzStxyi", "VLJJiP4PJdBWUr5iFXTFCudjAo", "JHfwSc91GCPwr", "Fl3ADiyLD", "iYmUGDZ6LpVMDT1W8t2hrKHTh2bK", "TK7nMFYmMdZbpjoM9HV0E5SrGUPk5XMq", "SptLInk335HJsxKTO2POm"};
    public final /* synthetic */ UJ A00;

    public UE(UJ uj) {
        this.A00 = uj;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        if (!isInitialStickyBroadcast()) {
            UJ uj = this.A00;
            String[] strArr = A01;
            if (strArr[2].length() != strArr[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[3] = "byP5iaFuA33N0";
            strArr2[4] = "q3lugRIfy";
            uj.A03();
        }
    }
}
