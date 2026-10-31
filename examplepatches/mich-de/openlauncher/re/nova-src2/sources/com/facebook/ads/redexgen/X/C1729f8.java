package com.facebook.ads.redexgen.X;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.vungle.ads.internal.protos.Sdk;
import java.io.Serializable;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.f8, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1729f8 extends BroadcastReceiver {
    public static byte[] A03;
    public static String[] A04 = {"X1IVw5mZrPwWgp59pDL9aLZ3Fov3W2Wm", "N1AsLxATz8LfRIPBbwS0prqi9bKFNGwZ", "KvfN8PD7zJtQDsMeVTqT5dRzLvhiPQFs", "CwJ4sBopjGul5sxVyPsrv7O0APgi12j8", "riYYfsMk5nddhbnpPSj9znzkTr5bDpPf", "Be1xHvNUMQ0R9QZ", "t7JwnvsmbbV8km6q46", "oSYhwD14tF3vT8zAS1lFRiV2H2FAfEUD"};
    public Context A00;
    public AnonymousClass72 A01;
    public boolean A02 = false;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 97);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{25, 3, 15, 13, 78, 6, 1, 3, 5, 2, 15, 15, 11, 78, 1, 4, 19, 78, 9, 14, 20, 5, 18, 19, 20, 9, 20, 9, 1, 12, 78, 4, 9, 19, 16, 12, 1, 25, 5, 4, 19, 31, 29, 94, 22, 17, 19, 21, 18, 31, 31, 27, 94, 17, 20, 3, 94, 25, 30, 4, 21, 2, 3, 4, 25, 4, 25, 17, 28, 94, 20, 25, 3, 0, 28, 17, 9, 21, 20, 74, 18, 1, 18, 25, 3, 81, 68, 83, 71, 78, 83, 76, 98, 85, 64, 98, 77, 72, 66, 74, 83, 70, 81, 69, 76, 81, 78, 96, 87, 66, 96, 79, 74, 64, 72, 25, 45, 50, 63, 62, 52, 18, 53, 47, 62, 41, 40, 47, 50, 47, 58, 55, 30, 45, 62, 53, 47, 2, 29, 16, 17, 27, 61, 26, 0, 17, 6, 7, 0, 29, 0, 21, 24, 49, 2, 17, 26, 0, 78};
    }

    static {
        A01();
    }

    public C1729f8(AnonymousClass72 anonymousClass72, Context context) {
        this.A01 = anonymousClass72;
        this.A00 = context;
    }

    public final void A02() {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(A00(40, 40, 17) + this.A01.getUniqueId());
        intentFilter.addAction(A00(Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, 22, 21) + this.A01.getUniqueId());
        intentFilter.addAction(A00(100, 16, 66) + this.A01.getUniqueId());
        C1840gw.A00(this.A00).A06(this, intentFilter);
    }

    public final void A03() {
        try {
            C1840gw.A00(this.A00).A05(this);
        } catch (Exception unused) {
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:54:0x0139, code lost:
    
        if (r5 != false) goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0141, code lost:
    
        if (r7.A01.getListener() == null) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0143, code lost:
    
        r7.A01.getListener().AGH();
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x014c, code lost:
    
        r7.A02 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0156, code lost:
    
        if (r5 != false) goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x015b, code lost:
    
        if ((r4 instanceof com.facebook.ads.redexgen.X.C5W) == false) goto L80;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0163, code lost:
    
        if (r7.A01.getListener() == null) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0165, code lost:
    
        r7.A01.getListener().onPause();
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:?, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:?, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:?, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:?, code lost:
    
        return;
     */
    @Override // android.content.BroadcastReceiver
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if (action == null) {
            return;
        }
        String action2 = A00(0, 1, 66);
        String[] strArrSplit = action.split(action2);
        if (strArrSplit.length != 2) {
            return;
        }
        String str = strArrSplit[1];
        String action3 = this.A01.getUniqueId();
        if (!str.equals(action3)) {
            return;
        }
        String str2 = strArrSplit[0];
        String action4 = A00(1, 39, 1);
        if (str2.equals(action4)) {
            if (this.A01.getListener() != null) {
                this.A01.getListener().AEp();
                AnonymousClass72 anonymousClass72 = this.A01;
                String[] split = A04;
                if (split[2].charAt(17) != 'T') {
                    throw new RuntimeException();
                }
                A04[7] = "czH1g8WXqBVBzZgoSLVA20jYFFcQLh15";
                anonymousClass72.getListener().AHo();
                return;
            }
            return;
        }
        String str3 = strArrSplit[0];
        String action5 = A00(Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, 21, 58);
        if (str3.equals(action5)) {
            String action6 = A00(80, 5, 22);
            Serializable event = intent.getSerializableExtra(action6);
            if (event instanceof BA) {
                if (this.A01.getListener() != null) {
                    this.A01.getListener().AEv();
                    this.A01.getListener().AHo();
                }
                if (this.A02) {
                    this.A01.A0b(1);
                } else {
                    this.A01.A0b(((BA) event).A01());
                }
                this.A01.setVisibility(0);
                this.A01.A0f(EnumC1664e4.A05, 1);
                return;
            }
            boolean z11 = event instanceof BI;
            String[] split2 = A04;
            if (split2[4].charAt(15) != 'p') {
                throw new RuntimeException();
            }
            A04[0] = "WizhEabCQfIhxCPZxjxQrLo8096TZ2te";
            if (z11) {
                if (this.A01.getListener() != null) {
                    this.A01.getListener().AF4();
                    return;
                }
                return;
            }
            if (event instanceof BH) {
                if (this.A01.getListener() != null) {
                    this.A01.getListener().AF6();
                }
            } else if (event instanceof C5Y) {
                if (this.A01.getListener() != null) {
                    this.A01.getListener().AER();
                }
                this.A02 = true;
            } else {
                boolean z12 = event instanceof BF;
                String[] split3 = A04;
                String action7 = split3[5];
                if (action7.length() != 15) {
                    A04[5] = "OhpiyJuLhpOH2Z5";
                } else {
                    A04[1] = "rjxpcIZarLCWG40Y5u8euDt94bevKfNO";
                }
            }
        } else {
            String str4 = strArrSplit[0];
            String action8 = A00(85, 15, 64);
            if (str4.equals(action8)) {
                this.A01.A0s();
            }
        }
    }
}
