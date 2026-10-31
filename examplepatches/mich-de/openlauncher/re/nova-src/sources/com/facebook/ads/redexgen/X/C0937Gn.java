package com.facebook.ads.redexgen.X;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.pm.PackageManager;
import android.net.Uri;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Gn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0937Gn implements InterfaceC2237nT {
    public static byte[] A01;
    public final C0958Hi A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 65);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{117, 20, 22, 1, 0, 20, 25, 42, 1, 28, 24, 16, 6, 1, 20, 24, 5, 52, 59, 62, 50, 57, 35, 8, 54, 39, 62, 8, 33, 50, 37, 36, 62, 56, 57, 30, 18, 19, 9, 24, 19, 9, 71, 82, 82, 8, 15, 18, 21, 0, 13, 13, 62, 19, 4, 7, 4, 19, 19, 4, 19, 4, 30, 50, 14, 25, 17, 0, 2, 10, 0, 6, 4, 62, 15, 0, 12, 4};
    }

    public C0937Gn(C0958Hi c0958Hi) {
        this.A00 = c0958Hi;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A03(String str, boolean z11, String str2, String str3, String str4, long j11) {
        this.A00.A0F().ACB(str);
        PackageManager packageManager = this.A00.getPackageManager();
        if (packageManager == null) {
            this.A00.A0F().ACG(str);
            return false;
        }
        ContentResolver contentResolver = this.A00.getContentResolver();
        if (contentResolver == null) {
            this.A00.A0F().ACD(str);
            return false;
        }
        if (packageManager.resolveContentProvider(str, 0) == null) {
            this.A00.A0F().ACC(str);
            return false;
        }
        Uri uri = Uri.parse(A00(35, 10, 60) + str + A00(0, 1, 27) + str2);
        ContentValues values = new ContentValues();
        values.put(A00(17, 18, 22), (Integer) 1);
        values.put(A00(61, 5, 44), Boolean.valueOf(z11));
        values.put(A00(45, 16, 32), str3);
        values.put(A00(66, 12, 32), str4);
        values.put(A00(1, 16, 52), Long.valueOf(j11));
        try {
            contentResolver.insert(uri, values);
            this.A00.A0F().ACI(str);
            return true;
        } catch (UnsupportedOperationException unused) {
            this.A00.A0F().ACF(str);
            return false;
        } catch (Exception unused2) {
            this.A00.A0F().ACE(str);
            return false;
        }
    }

    public final void A04(boolean z11, String str, String str2, String str3, long j11, boolean z12) {
        this.A00.A0F().ACH();
        ExecutorC2431qh.A06.execute(new C0938Go(this, z11, str, str2, str3, j11, z12));
    }
}
