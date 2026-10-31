package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.graphics.Color;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.facebook.ads.AudienceNetworkActivity;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.kM, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2048kM {
    public static byte[] A03;
    public static String[] A04 = {"RIyp", "8bfHllwZoJb6KTmdH", "gFRo5MPf1zEWFunFtAAEYqP", "2XHgfeMv64qze1uh4GiM7vxhoXT0t7Cn", "quPWe4yK7yTe2sBfqWZeaK6wCXbMRc", "gUzUbxfzFDg4sHtG6Y2fsTTyyICVeZlZ", "LOCp7uX4vp7jyQxaUZAF345u43tgoRc", "drvNVtrUFEvpRd3TylNZ7LyCWMwJR1"};
    public C2615tf A00;
    public final AudienceNetworkActivity A01;
    public final C0958Hi A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 113);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{96, 65, 70, 81, 67, 112, 120, 121, 116, 124, 105, 116, 114, 115, 89, 124, 105, 124, 48, 44, 33, 35, 37, 45, 37, 46, 52, 9, 36, 76, 91, 79, 75, 91, 77, 74, 106, 87, 83, 91};
    }

    static {
        A01();
    }

    public C2048kM(C0958Hi c0958Hi, AudienceNetworkActivity audienceNetworkActivity) {
        this.A02 = c0958Hi;
        this.A01 = audienceNetworkActivity;
    }

    private void A02(int i5, int i11) {
        if (this.A01.getWindow() != null) {
            AudienceNetworkActivity audienceNetworkActivity = this.A01;
            String[] strArr = A04;
            if (strArr[0].length() == strArr[6].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A04;
            strArr2[7] = "nXCJSGtHylGbDsR3FZ0lW1J4MHkyDP";
            strArr2[4] = "Au0OMy1esseUGEC1uzZ3fS0ZPW6iiT";
            audienceNetworkActivity.getWindow().setFlags(i5, i11);
        }
    }

    public final C1908i4 A03(Intent intent, RelativeLayout relativeLayout) {
        String stringExtra = intent.getStringExtra(A00(5, 13, 108));
        if (stringExtra != null) {
            C1908i4 c1908i4A01 = AbstractC1909i5.A01(this.A02, stringExtra);
            if (c1908i4A01 != null) {
                relativeLayout.addView(c1908i4A01, new RelativeLayout.LayoutParams(-1, -1));
            }
            return c1908i4A01;
        }
        return null;
    }

    public final void A04() {
        if (C2203mv.A2K(this.A01)) {
            A02(16777216, 16777216);
        }
    }

    public final void A05() {
        if (this.A00 != null && C2203mv.A1B(this.A01)) {
            this.A00.A07();
        }
    }

    public final void A06() {
        if (C2203mv.A2S(this.A01)) {
            A02(128, 128);
        }
    }

    public final void A07(Intent intent, EnumC2295oR enumC2295oR, RelativeLayout relativeLayout) {
        if (C2203mv.A1B(this.A01) && enumC2295oR != EnumC2295oR.A04) {
            this.A00 = new C2615tf();
            this.A00.A0C(intent.getStringExtra(A00(18, 11, 49)));
            C2615tf c2615tf = this.A00;
            String placementId = this.A01.getPackageName();
            c2615tf.A0B(placementId);
            long longExtra = intent.getLongExtra(A00(29, 11, 79), 0L);
            if (longExtra != 0) {
                C2615tf c2615tf2 = this.A00;
                String[] strArr = A04;
                String str = strArr[7];
                String placementId2 = strArr[4];
                if (str.length() != placementId2.length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A04;
                strArr2[5] = "e0sFc3betYzrocSt2r05YpNlTQ2co3YK";
                strArr2[3] = "r1SSJ0D7soBhWfOqDmBWbr3oKQtX3s0q";
                c2615tf2.A09(longExtra);
            }
            TextView textView = new TextView(this.A01);
            String placementId3 = A00(0, 5, 85);
            textView.setText(placementId3);
            textView.setTextColor(-1);
            AbstractC2426qc.A0O(textView, Color.argb(160, 0, 0, 0));
            textView.setPadding(5, 5, 5, 5);
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.addRule(12, -1);
            layoutParams.addRule(11, -1);
            textView.setLayoutParams(layoutParams);
            ViewOnLongClickListenerC2014jo viewOnLongClickListenerC2014jo = new ViewOnLongClickListenerC2014jo(this.A00, relativeLayout);
            textView.setOnLongClickListener(viewOnLongClickListenerC2014jo);
            relativeLayout.setOnLongClickListener(viewOnLongClickListenerC2014jo);
            relativeLayout.getOverlay().add(this.A00);
        }
    }

    public final void A08(EnumC2295oR enumC2295oR, boolean z11) {
        if (C2203mv.A2z(this.A02)) {
            EnumC2295oR enumC2295oR2 = EnumC2295oR.A04;
            String[] strArr = A04;
            if (strArr[5].charAt(26) == strArr[3].charAt(26)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A04;
            strArr2[0] = "wjWX";
            strArr2[6] = "VbcFO09W4hKPvYCxrEZ3e5LbEpSKqoE";
            if (enumC2295oR == enumC2295oR2 && z11) {
                A02(EventBridgeChannel.QUEUE_CAPACITY, EventBridgeChannel.QUEUE_CAPACITY);
                return;
            }
        }
        this.A01.requestWindowFeature(1);
        A02(1024, 1024);
    }
}
