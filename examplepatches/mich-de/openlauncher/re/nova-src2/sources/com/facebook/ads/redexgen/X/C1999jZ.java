package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import com.facebook.ads.AudienceNetworkActivity;
import com.facebook.ads.internal.api.AudienceNetworkActivityApi;
import com.vungle.ads.internal.protos.Sdk;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.jZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1999jZ implements AudienceNetworkActivityApi {
    public static byte[] A03;
    public static String[] A04 = {"kVVxbIvKBpFLpNMn249evg7U1t5DMrkR", "HNBIISUKPJt5lzvo", "tha", "s0U2IqORDUirQkjYFZUhzDbmHPDS66DK", "4XQ6Ra6x1CsG5mP0jlsGo4Oc8x5GsOh7", "mYQ1yQiLRLlGaSwEYEmmcgt3b9ncmm6M", "URRMMekVjcz4ECsO2XmiMnA4WEVCe5QQ", "lW2qNIOuJVr9bvm7hZsN45J1F7Bnv3JY"};
    public boolean A00;
    public final AudienceNetworkActivityApi A01;
    public final C1998jY A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 71);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{12, 8, 7, 59, 42, 47, 43, 52, 41, 43, 20, 43, 58, 61, 53, 56, 49, 19, 44, 35, 54, 46, 35, 33, 50, 35, 34, -34, 35, 54, 33, 35, 46, 50, 39, 45, 44, -20, -70, -57, -72, -70, -68, -51, -62, -49, -62, -51, -46};
    }

    static {
        A01();
    }

    public C1999jZ(AudienceNetworkActivity audienceNetworkActivity, AudienceNetworkActivityApi audienceNetworkActivityApi, C1998jY c1998jY) {
        this.A01 = audienceNetworkActivityApi;
        this.A02 = c1998jY;
    }

    private void A02(Throwable th2) {
        this.A00 = true;
        this.A02.A09();
        finish(8);
        C2095lA logContext = this.A02.A06();
        if (logContext != null) {
            logContext.A08().ABz(A00(38, 11, 18), AbstractC2126lf.A0C, new C2127lg(th2));
            return;
        }
        String strA00 = A00(0, 17, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        if (A04[3].charAt(1) != '0') {
            throw new RuntimeException();
        }
        A04[6] = "roakWe6n8CepWvGQKms2st32sM0MtJhe";
        Log.e(strA00, A00(17, 21, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), th2);
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        try {
            if (this.A00) {
                this.A01.dump(str, fileDescriptor, printWriter, strArr);
            } else {
                this.A02.dump(str, fileDescriptor, printWriter, strArr);
            }
        } catch (Throwable t6) {
            A02(t6);
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void finish(int i5) {
        this.A02.finish(i5);
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onActivityResult(int i5, int i11, Intent intent) {
        try {
        } catch (Throwable t6) {
            A02(t6);
        }
        if (this.A00) {
            this.A01.onActivityResult(i5, i11, intent);
        } else {
            this.A02.onActivityResult(i5, i11, intent);
            this.A01.onActivityResult(i5, i11, intent);
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onBackPressed() {
        try {
            if (this.A00) {
                return;
            }
            this.A02.onBackPressed();
        } catch (Throwable th2) {
            String[] strArr = A04;
            if (strArr[4].charAt(24) == strArr[5].charAt(24)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A04;
            strArr2[7] = "o2QAVIvbVP3X0FiUaWNt1f6t7dHcTRBl";
            strArr2[0] = "vmYtMIbIQwew4451MpW2UPrO9wIbxS87";
            A02(th2);
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onConfigurationChanged(Configuration configuration) {
        try {
        } catch (Throwable t6) {
            A02(t6);
        }
        if (this.A00) {
            this.A01.onConfigurationChanged(configuration);
        } else {
            this.A02.onConfigurationChanged(configuration);
            this.A01.onConfigurationChanged(configuration);
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onCreate(Bundle bundle) {
        this.A01.onCreate(bundle);
        try {
            this.A02.onCreate(bundle);
        } catch (Throwable t6) {
            A02(t6);
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onDestroy() {
        try {
        } catch (Throwable t6) {
            A02(t6);
        }
        if (this.A00) {
            this.A01.onDestroy();
        } else {
            this.A02.onDestroy();
            this.A01.onDestroy();
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onPause() {
        try {
        } catch (Throwable t6) {
            A02(t6);
        }
        if (this.A00) {
            this.A01.onPause();
        } else {
            this.A02.onPause();
            this.A01.onPause();
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onResume() {
        this.A01.onResume();
        try {
            if (this.A00) {
                return;
            }
            this.A02.onResume();
        } catch (Throwable t6) {
            A02(t6);
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onSaveInstanceState(Bundle bundle) {
        this.A01.onSaveInstanceState(bundle);
        try {
            if (this.A00) {
                return;
            }
            this.A02.onSaveInstanceState(bundle);
        } catch (Throwable th2) {
            String[] strArr = A04;
            if (strArr[4].charAt(24) == strArr[5].charAt(24)) {
                throw new RuntimeException();
            }
            A04[6] = "46sQaeWUXFUhhsRkoBzMlxezgaVtku4l";
            A02(th2);
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onStart() {
        this.A01.onStart();
        try {
            if (this.A00) {
                return;
            }
            this.A02.onStart();
        } catch (Throwable t6) {
            A02(t6);
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onStop() {
        this.A01.onStop();
        try {
            if (this.A00) {
                return;
            }
            this.A02.onStop();
        } catch (Throwable t6) {
            A02(t6);
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        try {
        } catch (Throwable t6) {
            A02(t6);
        }
        if (this.A00) {
            return this.A01.onTouchEvent(motionEvent);
        }
        this.A02.onTouchEvent(motionEvent);
        return this.A01.onTouchEvent(motionEvent);
    }
}
