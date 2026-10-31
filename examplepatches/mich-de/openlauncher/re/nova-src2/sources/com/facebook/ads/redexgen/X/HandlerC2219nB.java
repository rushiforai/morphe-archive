package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.RewardData;
import com.facebook.ads.internal.api.AudienceNetworkRemoteServiceApi;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.nB, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class HandlerC2219nB extends Handler {
    public static byte[] A04;
    public static final String A05;
    public final Context A00;
    public final AudienceNetworkRemoteServiceApi.MessageHandler A01;
    public final AudienceNetworkRemoteServiceApi.PackageVerifier A02;
    public final C0949Gz A03;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 41);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A04 = new byte[]{101, 93, 97, 97, 93, 95, -105, -92, -92, -95, -76, -98, -88, -76, -101, -86, -93, -93, -102, -95, -76, -95, -92, -100, -100, -102, -103, -11, -10, -12, 1, -29, -26, 1, -21, -26, 1, -19, -25, -5, -118, -117, -119, -106, 121, -116, -123, 123, -125, 124, -106, -126, 124, -112, -59, -58, -60, -47, -59, -73, -60, -56, -69, -75, -73, -47, -73, -54, -58, -60, -77, -59, -34, -33, -35, -22, -34, -48, -35, -31, -44, -50, -48, -22, -34, -49, -42, -22, -31, -48, -35, -34, -44, -38, -39};
    }

    static {
        A04();
        A05 = HandlerC2219nB.class.getSimpleName();
    }

    public HandlerC2219nB(Context context, AudienceNetworkRemoteServiceApi.MessageHandler messageHandler, AudienceNetworkRemoteServiceApi.PackageVerifier packageVerifier) {
        super(Looper.getMainLooper());
        this.A00 = context;
        this.A02 = packageVerifier;
        this.A03 = C0949Gz.A00();
        this.A01 = messageHandler;
    }

    public static Bundle A00() {
        Bundle bundle = new Bundle();
        bundle.putString(A03(72, 23, 98), A03(0, 6, 6));
        bundle.putString(A03(54, 18, 73), new JSONObject().toString());
        return bundle;
    }

    private C1024Jz A01(C1020Jv c1020Jv, String str) {
        C1024Jz c1024Jz = new C1024Jz(c1020Jv, this.A03, str);
        c1024Jz.A0G(c1020Jv.A0B(), c1020Jv.A07());
        return c1024Jz;
    }

    private C1021Jw A02(C1003Jc c1003Jc, String str) {
        C1021Jw c1021Jw = new C1021Jw(c1003Jc, this.A03, str);
        c1021Jw.A0J(c1003Jc.A05, c1003Jc.A02, c1003Jc.A08);
        return c1021Jw;
    }

    @Override // android.os.Handler
    public final void handleMessage(Message msg) throws Throwable {
        String strVerifyPackage;
        if (AbstractC2311oi.A02(this)) {
        }
        try {
            if (this.A01 != null && this.A01.handleMessage(msg)) {
                return;
            }
            Messenger messenger = msg.replyTo;
            if (msg.what == 1) {
                if (messenger != null) {
                    C0949Gz.A00().A07(2, null, A00(), messenger);
                    return;
                }
                return;
            }
            String callingAppPackage = msg.getData().getString(A03(27, 13, Sdk.SDKError.Reason.TPAT_ERROR_VALUE));
            if (callingAppPackage == null) {
                return;
            }
            C0958Hi c0958HiA05 = C2013jn.A05(this.A00, callingAppPackage);
            c0958HiA05.A0F().AKk(msg.getData().getBoolean(A03(6, 21, 44), false));
            if (this.A02 != null) {
                strVerifyPackage = this.A02.verifyPackage(this.A00, msg, msg.getData().getString(A03(40, 14, 14)));
            } else {
                strVerifyPackage = null;
            }
            if (strVerifyPackage == null) {
                if (messenger != null) {
                    C0949Gz.A00().A07(20, callingAppPackage, null, messenger);
                }
                c0958HiA05.A0F().AJ9();
                return;
            }
            switch (msg.what) {
                case TTAdConstant.IMAGE_MODE_1010 /* 1010 */:
                    if (messenger != null) {
                        C2216n8 c2216n8A04 = C0949Gz.A00().A04(callingAppPackage);
                        if (c2216n8A04 == null) {
                            c2216n8A04 = C0949Gz.A00().A05(callingAppPackage, messenger, strVerifyPackage);
                        }
                        C1020Jv intAdModel = AbstractC1810gR.A04(c0958HiA05, msg.getData(), strVerifyPackage);
                        if (c2216n8A04.A00 == null) {
                            c2216n8A04.A00 = A01(intAdModel, callingAppPackage);
                        } else if (c2216n8A04.A00 instanceof C1024Jz) {
                            ((C1024Jz) c2216n8A04.A00).A0G(intAdModel.A0B(), intAdModel.A07());
                        }
                        C0949Gz.A00().A07(TTAdConstant.IMAGE_MODE_1011, callingAppPackage, A00(), messenger);
                        break;
                    }
                    break;
                case TTAdConstant.IMAGE_MODE_1012 /* 1012 */:
                case 2002:
                    C0949Gz.A00().A08(callingAppPackage);
                    break;
                case 2000:
                    if (messenger != null) {
                        C2216n8 c2216n8A042 = C0949Gz.A00().A04(callingAppPackage);
                        if (c2216n8A042 == null) {
                            c2216n8A042 = C0949Gz.A00().A05(callingAppPackage, messenger, strVerifyPackage);
                        }
                        C1003Jc c1003JcA05 = AbstractC1810gR.A05(c0958HiA05, msg.getData(), strVerifyPackage);
                        if (c2216n8A042.A00 == null) {
                            c2216n8A042.A00 = A02(c1003JcA05, callingAppPackage);
                        } else if (c2216n8A042.A00 instanceof C1021Jw) {
                            C1021Jw c1021Jw = (C1021Jw) c2216n8A042.A00;
                            String adId = c1003JcA05.A05;
                            c1021Jw.A0J(adId, c1003JcA05.A02, c1003JcA05.A08);
                        }
                        C0949Gz.A00().A07(2001, callingAppPackage, A00(), messenger);
                        break;
                    }
                    break;
                case 2003:
                    InterfaceC1790g7 interfaceC1790g7A03 = C0949Gz.A00().A03(callingAppPackage);
                    if (interfaceC1790g7A03 instanceof C1021Jw) {
                        RewardData rewardDataA01 = AbstractC1811gS.A01(msg.getData());
                        C1021Jw c1021Jw2 = (C1021Jw) interfaceC1790g7A03;
                        if (rewardDataA01 != null) {
                            c1021Jw2.A0I(rewardDataA01);
                            break;
                        }
                    }
                    break;
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
