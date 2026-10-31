package com.facebook.ads.redexgen.X;

import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Build;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.p1, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2330p1 {
    public static byte[] A05;
    public static String[] A06 = {"urwRhK0CK5UGRnO4iaICZFZb7qAlGy", "mzilr1wfe", "SZ9FDPGAkZBACw9tkVUtj7pHN9rS5abx", "dtKk7mnbAbd37arB17jMrf2UHdnm8GOF", "aS5", "gZFI9Tloea", "2aa2EaIeNK", "B3GaWiA9eOHa"};
    public static final Object A07;
    public static final Map<String, String> A08;
    public static final AtomicBoolean A09;
    public final SharedPreferences A00;
    public final C2095lA A01;
    public final C2137lq A02;
    public final String A03;
    public final String A04;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 40);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        String[] strArr = A06;
        if (strArr[3].length() == strArr[0].length()) {
            throw new RuntimeException();
        }
        A06[1] = "McQY2w52D3qLTV4IvOql";
        A05 = new byte[]{116, 114, 117, 99, 8, 92, 121, 119, 106, 121, 105, 80, 92, 94, 29, 82, 93, 87, 65, 92, 90, 87, 29, 69, 86, 93, 87, 90, 93, 84, 71, 87, 69, 84, 77, 82, 66, 93, 86, 82, 6, 4, 15, 4, 19, 8, 2};
    }

    static {
        A04();
        A08 = new HashMap();
        A07 = new Object();
        A09 = new AtomicBoolean();
    }

    public C2330p1(C2095lA c2095lA, String str) {
        this.A01 = c2095lA;
        this.A03 = str;
        this.A02 = new C2137lq(this.A01, str);
        this.A00 = AbstractC2297oU.A00(this.A01);
        this.A04 = A01(1, 4, 27) + str + A01(0, 1, 103) + this.A02.A06();
    }

    private final String A00() {
        return this.A00.getString(this.A04, null);
    }

    public static String A02(C2095lA c2095lA, String str) {
        try {
            PackageManager packageManager = c2095lA.getPackageManager();
            if (packageManager == null) {
                return null;
            }
            return C2388q0.A03(packageManager.getApplicationInfo(str, 0).sourceDir);
        } catch (Exception e3) {
            if (A09.compareAndSet(false, true)) {
                c2095lA.A08().ABz(A01(40, 7, 73), AbstractC2126lf.A1P, new C2127lg(e3));
            }
            return null;
        }
    }

    public static String A03(String str) {
        String str2;
        synchronized (A07) {
            str2 = A08.get(str);
        }
        return str2;
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A05() throws JSONException {
        String strA01 = null;
        if (Build.VERSION.SDK_INT < 31) {
            String strA012 = A01(5, 1, 39);
            String checksumApiFingerprint = Build.VERSION.CODENAME;
            if (strA012.equals(checksumApiFingerprint)) {
                if (C2203mv.A2r(this.A01)) {
                    String strA013 = A01(11, 19, 27);
                    String checksumApiFingerprint2 = this.A02.A0B();
                    if (strA013.equals(checksumApiFingerprint2)) {
                        C2095lA c2095lA = this.A01;
                        String checksumApiFingerprint3 = this.A03;
                        strA01 = C2388q0.A01(c2095lA, checksumApiFingerprint3);
                    }
                }
            }
        }
        if (strA01 == null) {
            C2095lA c2095lA2 = this.A01;
            String checksumApiFingerprint4 = this.A03;
            strA01 = A02(c2095lA2, checksumApiFingerprint4);
        } else if (C2203mv.A1k(this.A01)) {
            C2095lA c2095lA3 = this.A01;
            String checksumApiFingerprint5 = this.A03;
            String strA02 = A02(c2095lA3, checksumApiFingerprint5);
            String checksumApiFingerprint6 = A01(6, 5, 50);
            C2127lg c2127lg = new C2127lg(checksumApiFingerprint6);
            c2127lg.A05(1);
            c2127lg.A06(1);
            c2127lg.A0A(false);
            JSONObject checksumsJson = new JSONObject();
            String checksumApiFingerprint7 = A01(30, 5, 12);
            checksumsJson.put(checksumApiFingerprint7, strA01);
            String checksumApiFingerprint8 = A01(35, 5, 25);
            checksumsJson.put(checksumApiFingerprint8, strA02);
            c2127lg.A07(checksumsJson);
            InterfaceC2125le interfaceC2125leA08 = this.A01.A08();
            String legacyMd5 = A01(40, 7, 73);
            interfaceC2125leA08.AC0(legacyMd5, AbstractC2126lf.A1I, c2127lg);
        }
        synchronized (A07) {
            Map<String, String> map = A08;
            String checksumApiFingerprint9 = this.A03;
            map.put(checksumApiFingerprint9, strA01);
        }
        SharedPreferences.Editor editorEdit = this.A00.edit();
        String checksumApiFingerprint10 = this.A04;
        editorEdit.putString(checksumApiFingerprint10, strA01).apply();
    }

    public final void A06() {
        String strA00 = A00();
        synchronized (A07) {
            Map<String, String> map = A08;
            String storedFingerprint = this.A03;
            map.put(storedFingerprint, strA00);
        }
    }
}
