package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.MotionEvent;
import android.widget.RelativeLayout;
import com.facebook.ads.AudienceNetworkActivity;
import com.facebook.ads.internal.api.AudienceNetworkActivityApi;
import com.facebook.ads.internal.context.Repairable;
import com.facebook.ads.internal.dynamicloading.DynamicLoaderImpl;
import com.facebook.ads.internal.protocol.AdPlacementType;
import com.vungle.ads.internal.protos.Sdk;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.jY, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1998jY implements AudienceNetworkActivityApi, Repairable {
    public static byte[] A0M;
    public static String[] A0N = {"6hyfNvrTK6t0uOk4ZUiKTcly4lO9QIT3", "Cx5XWQG9gTlQcsVl0OO6K9WlulTSTZ", "4fLDdlgMQ2q", "AM05mUF2qaDkDYU3MyDNTK", "rN7iVf06fBiMXo1UDWoI2bEJDxOmVmjv", "9bqAz3M9pAQkcUJXzFdGLS", "1D1uNCEUmAwDpqE", "h0QQnxfLOYpp7kAK6sPhgGYv8wQTA65G"};
    public int A00;
    public int A02;
    public long A03;
    public long A04;
    public Intent A05;
    public RelativeLayout A06;
    public EnumC2295oR A07;
    public InterfaceC2460rA A08;
    public AbstractC2524sC A09;
    public C1908i4 A0A;
    public String A0B;
    public String A0C;
    public boolean A0E;
    public final AudienceNetworkActivity A0F;
    public final AudienceNetworkActivityApi A0G;
    public final C2008ji A0H;
    public final C2025jz A0I;
    public final C2048kM A0J;
    public final C0958Hi A0K;
    public final List<InterfaceC2004je> A0L = new ArrayList();
    public int A01 = -1;
    public boolean A0D = false;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0M, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 111);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A0M = new byte[]{24, 49, 36, 37, 47, 40, -29, 55, 50, -29, 44, 49, 41, 40, 53, -29, 57, 44, 40, 58, 23, 60, 51, 40, -29, 41, 53, 50, 48, -29, 44, 49, 55, 40, 49, 55, -29, 50, 53, -29, 54, 36, 57, 40, 39, 12, 49, 54, 55, 36, 49, 38, 40, 22, 55, 36, 55, 40, 67, 80, 65, 67, 69, 86, 75, 88, 75, 86, 91, -22, -24, -13, -13, -20, -7, -37, 0, -9, -20, -10, -1, -4, -8, 1, 7, -25, 2, -2, -8, 1, -44, -32, -34, -97, -41, -46, -44, -42, -45, -32, -32, -36, -97, -46, -43, -28, -97, -38, -33, -27, -42, -29, -28, -27, -38, -27, -38, -46, -35, -97, -43, -38, -28, -31, -35, -46, -22, -42, -43, 10, -1, 12, 2, 17, 1, -1, 14, 3, -21, -14, -23, -23, 27, 34, 17, 30, 30, 21, 16, 17, -16, 33, 25, 28, 31, 37, 31, -10, -11, -8, -6, -8, -25, -17, -6, 29, 31, 18, 17, 18, 19, 22, 27, 18, 17, -4, 31, 22, 18, 27, 33, 14, 33, 22, 28, 27, -8, 18, 38, 70, 62, 60, 67, 20, 57, 71, 56, 69, 38, 56, 54, 66, 65, 55, 70, 92, 87, 71, 87, 90, 81, 77, 86, 92, 73, 92, 81, 87, 86, 58, 51, 46, 54, 58, 42, 14, 41, 78, 65, 61, 79, 44, 81, 72, 61};
    }

    static {
        A02();
    }

    public C1998jY(AudienceNetworkActivity audienceNetworkActivity, AudienceNetworkActivityApi audienceNetworkActivityApi) {
        this.A0F = audienceNetworkActivity;
        this.A0G = audienceNetworkActivityApi;
        this.A0K = C2013jn.A02(audienceNetworkActivity);
        this.A0K.A0O(this);
        this.A0I = new C2025jz(this.A0K, this.A0F);
        this.A0J = new C2048kM(this.A0K, this.A0F);
        this.A0H = new C2008ji(this, this.A0K, this.A0F);
    }

    private String A00() {
        if (this.A07 == null || this.A07.A03() == null) {
            String strA01 = A01(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 4, 14);
            if (A0N[7].charAt(27) == 'B') {
                throw new RuntimeException();
            }
            String[] strArr = A0N;
            strArr[0] = "lXGGIoQiVRTFZbahFmXDq0Ih71OJd5Th";
            strArr[4] = "qffsSf087e8H5is6LoQf1iLvvCOOaSRV";
            return strA01;
        }
        return this.A07.A03();
    }

    private void A03(Intent intent, Bundle bundle) {
        String strA01 = A01(Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 8, 105);
        String strA012 = A01(Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, 8, 86);
        String strA013 = A01(165, 24, 62);
        if (bundle != null) {
            Bundle bundleA03 = C2337p8.A03(bundle, DynamicLoaderImpl.class.getClassLoader());
            this.A01 = bundleA03.getInt(strA013, -1);
            this.A0B = bundleA03.getString(strA012);
            this.A07 = (EnumC2295oR) bundleA03.getSerializable(strA01);
            return;
        }
        this.A01 = intent.getIntExtra(strA013, -1);
        this.A0B = intent.getStringExtra(strA012);
        this.A07 = (EnumC2295oR) intent.getSerializableExtra(strA01);
        this.A02 = intent.getIntExtra(A01(189, 16, 100), 0) * 1000;
    }

    public final RelativeLayout A04() {
        return this.A06;
    }

    public final AudienceNetworkActivity A05() {
        return this.A0F;
    }

    public final C0958Hi A06() {
        return this.A0K;
    }

    public final C1908i4 A07() {
        return this.A0A;
    }

    public final String A08() {
        return this.A0B;
    }

    public final void A09() {
        this.A0H.A05(this.A07, this.A0B);
    }

    public final void A0A(InterfaceC2004je interfaceC2004je) {
        this.A0L.add(interfaceC2004je);
    }

    public final void A0B(InterfaceC2004je interfaceC2004je) {
        this.A0L.remove(interfaceC2004je);
    }

    public final void A0C(String str) {
        this.A0H.A09(str, this.A0B);
    }

    public final void A0D(String str, C1756fZ c1756fZ) {
        if (this.A08 == null) {
            return;
        }
        if (this.A09 == null) {
            this.A09 = AbstractC2525sD.A02(this.A0K, this.A0K.A0A(), str, c1756fZ, this.A08, new IV(this));
            AbstractC2426qc.A0H(1118, this.A09);
            this.A09.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        }
        AbstractC2426qc.A0K(this.A09);
        this.A06.addView(this.A09);
        this.A09.A0N();
    }

    public final void A0E(String str, C2170mO c2170mO) {
        this.A0H.A08(str, c2170mO, this.A0B);
    }

    public final void A0F(boolean z11) {
        this.A0D = z11;
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        AbstractC2343pG.A00();
        if (0 != 0) {
            throw new NullPointerException(A01(142, 15, 61));
        }
        this.A0G.dump(str, fileDescriptor, printWriter, strArr);
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void finish(int i5) {
        if (i5 == 9 && (this.A08 instanceof D2)) {
            D2 d22 = (D2) this.A08;
            if (d22.A0i()) {
                if (this.A09 != null) {
                    AbstractC2426qc.A0K(this.A09);
                }
                d22.A0h();
                return;
            }
        }
        this.A0K.A0F().A3Z(String.valueOf(A05().hashCode()), i5, A00());
        if (this.A0F.isFinishing()) {
            return;
        }
        this.A0H.A07(this.A07, this.A0B);
        this.A0H.A06(this.A07, this.A0B);
        this.A0G.finish(i5);
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onActivityResult(int i5, int i11, Intent intent) {
        if (this.A08 != null && this.A08.onActivityResult(i5, i11, intent)) {
            return;
        }
        F4.A07(i5, i11, intent);
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onBackPressed() {
        long jCurrentTimeMillis = System.currentTimeMillis();
        long j11 = this.A03;
        long currentTime = jCurrentTimeMillis - this.A04;
        this.A03 = j11 + currentTime;
        this.A04 = jCurrentTimeMillis;
        if (this.A03 > this.A02) {
            boolean shouldIntercept = false;
            Iterator<InterfaceC2004je> it = this.A0L.iterator();
            while (it.hasNext()) {
                if (it.next().AAw()) {
                    shouldIntercept = true;
                }
            }
            if (!shouldIntercept) {
                this.A0G.onBackPressed();
            }
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onConfigurationChanged(Configuration configuration) {
        if (this.A00 != configuration.orientation) {
            HashMap map = new HashMap();
            int i5 = configuration.orientation;
            String strA01 = A01(Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE, 14, Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
            if (i5 == 1) {
                map.put(strA01, A01(157, 8, 23));
            } else {
                map.put(strA01, A01(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, 9, 47));
            }
            C2232nO.A02(EnumC2231nN.A0K, map, this.A08 == null ? A01(0, 0, 50) : this.A08.getCurrentClientToken(), this.A0K.A0A());
            this.A00 = configuration.orientation;
            this.A0I.A01();
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onCreate(Bundle bundle) {
        AbstractC2428qe.A02();
        this.A0J.A04();
        this.A05 = C2337p8.A02(this.A0F.getIntent(), DynamicLoaderImpl.class.getClassLoader());
        C0958Hi c0958HiA05 = C2337p8.A05(this.A05);
        if (c0958HiA05 != null) {
            C0958Hi c0958Hi = this.A0K;
            String[] strArr = A0N;
            if (strArr[0].charAt(26) != strArr[4].charAt(26)) {
                throw new RuntimeException();
            }
            A0N[6] = "7njofUp2AYjKONZ";
            c0958Hi.A0M(c0958HiA05);
        }
        A03(this.A05, bundle);
        C0958Hi startAdContext = this.A0K;
        startAdContext.A0F().A3a(String.valueOf(A05().hashCode()), A00());
        String callerType = this.A05.getStringExtra(A01(69, 10, 24));
        this.A0J.A08(this.A07, callerType == null || !(callerType.equals(AdPlacementType.INTERSTITIAL.name()) || callerType.equals(AdPlacementType.REWARDED_VIDEO.name())));
        this.A06 = new RelativeLayout(this.A0F);
        AbstractC2426qc.A0O(this.A06, 0);
        this.A0F.setContentView(this.A06, new RelativeLayout.LayoutParams(-1, -1));
        Intent intent = this.A05;
        C0958Hi startAdContext2 = this.A0K;
        InterfaceC2224nG interfaceC2224nGA0A = startAdContext2.A0A();
        C0958Hi startAdContext3 = this.A0K;
        this.A08 = new C2003jd(this, intent, interfaceC2224nGA0A, startAdContext3).A0M(this.A07, this.A06);
        if (this.A0D) {
            this.A0F.setRequestedOrientation(1);
        }
        if (this.A08 == null) {
            C0958Hi startAdContext4 = this.A0K;
            startAdContext4.A08().ABz(A01(58, 11, 115), AbstractC2126lf.A0A, new C2127lg(A01(0, 58, 84)));
            A09();
            finish(7);
            return;
        }
        this.A08.ABc(this.A05, bundle, this);
        this.A0H.A09(A01(90, 39, 2), this.A0B);
        this.A04 = System.currentTimeMillis();
        this.A0A = this.A0J.A03(this.A05, this.A06);
        this.A0J.A07(this.A05, this.A07, this.A06);
        this.A00 = this.A0F.getResources().getConfiguration().orientation;
        String callerType2 = A01(79, 11, 36);
        if (bundle != null) {
            this.A0C = bundle.getString(callerType2);
        } else {
            this.A0C = this.A05.getStringExtra(callerType2);
        }
        C2048kM c2048kM = this.A0J;
        if (A0N[1].length() == 0) {
            throw new RuntimeException();
        }
        A0N[6] = "jwNFZ7FrJR3EZkY";
        c2048kM.A06();
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onDestroy() {
        this.A0K.A0F().A3b(String.valueOf(A05().hashCode()), A00());
        this.A0H.A04(this.A07, this.A0B);
        if (this.A06 != null) {
            this.A06.removeAllViews();
        }
        if (this.A08 != null) {
            this.A08.onDestroy();
            String[] strArr = A0N;
            if (strArr[0].charAt(26) != strArr[4].charAt(26)) {
                throw new RuntimeException();
            }
            A0N[1] = "BK5JyIukG";
            this.A08 = null;
        }
        this.A0J.A05();
        String[] strArr2 = A0N;
        if (strArr2[0].charAt(26) != strArr2[4].charAt(26)) {
            if (this.A09 == null) {
                return;
            }
        } else {
            A0N[2] = "VoJV9dI9dal5KZ60JkB8i5Bpps";
            if (this.A09 == null) {
                return;
            }
        }
        this.A09.A0M();
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onPause() {
        this.A0K.A0F().A3c(String.valueOf(A05().hashCode()), A00());
        this.A03 += System.currentTimeMillis() - this.A04;
        if (this.A08 != null) {
            this.A08.AGF(false);
            if (!this.A0F.isFinishing()) {
                C2232nO.A02(EnumC2231nN.A0E, null, this.A08.getCurrentClientToken(), this.A0K.A0A());
                this.A0E = true;
            }
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onResume() {
        this.A0K.A0F().A3d(String.valueOf(A05().hashCode()), A00());
        this.A04 = System.currentTimeMillis();
        if (this.A08 != null) {
            this.A08.AGp(false);
            if (this.A0E) {
                C2232nO.A02(EnumC2231nN.A0F, null, this.A08.getCurrentClientToken(), this.A0K.A0A());
                InterfaceC1640df interfaceC1640dfA0F = this.A0K.A0F();
                if (AbstractC2503rr.A01(interfaceC1640dfA0F.getId())) {
                    interfaceC1640dfA0F.A5E(EnumC2299oW.A04.name());
                }
            }
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onSaveInstanceState(Bundle bundle) {
        Bundle bundle2 = new Bundle();
        if (this.A08 != null) {
            this.A08.AKD(bundle2);
        }
        bundle2.putInt(A01(165, 24, 62), this.A01);
        bundle2.putString(A01(Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, 8, 86), this.A0B);
        bundle2.putString(A01(79, 11, 36), this.A0C);
        bundle2.putSerializable(A01(Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 8, 105), this.A07);
        C2337p8.A0B(bundle, bundle2);
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onStart() {
        this.A0K.A0F().A3e(String.valueOf(A05().hashCode()), A00());
        if (this.A01 != -1) {
            AbstractC2448qy.A02(this.A0F, this.A01, this.A0K);
        }
        if (this.A08 != null) {
            this.A08.onStart();
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onStop() {
        this.A0K.A0F().A3f(String.valueOf(A05().hashCode()), A00());
        if (this.A08 != null) {
            this.A08.onStop();
        }
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        return this.A0G.onTouchEvent(motionEvent);
    }

    @Override // com.facebook.ads.internal.context.Repairable
    public final void repair(Throwable th2) {
        A09();
        finish(5);
    }
}
