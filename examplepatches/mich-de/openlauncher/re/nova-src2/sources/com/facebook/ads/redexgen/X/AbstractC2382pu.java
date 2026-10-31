package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import com.vungle.ads.internal.protos.Sdk;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.pu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2382pu {
    public static byte[] A00;
    public static String[] A01 = {"Fo6fOQ0HsfRCx9yL67VckHygYzLCvQ6y", "riZa98GPY3AWbvMANKZcBcQCalEMJFPN", "xF93Q6Q84wP28NgbQeYEf1tSiFipj5la", "S1Y1MsvNK5D8hutCnbiwxRc7t2kGsxbE", "4KEw8B1iO7iJz6LKFlaUEil7rK", "9ZIqru89IY59Cmn5xddtyFRfmlsWf5Vx", "UXJRrEbADYCqrbNeMotiPdb4vjzmnMhB", "uyLj4bmIt"};

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 47);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A00 = new byte[]{-76, -8, -2, -8, -7, -22, -14, -76, -26, -11, -11, -76, -40, -6, -11, -22, -9, -6, -8, -22, -9, -77, -26, -11, -16, -109, -96, -2, -17, 2, -10, -52, -63, -70, -86, -89, 125, -124, AbstractJsonLexerKt.TC_INVALID, -120, -105, -107, -98, -107, -94, -103, -109, 5, 7, -30, -45, -31, -30, -101, -39, -45, -25, -31};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 10 out of bounds for length 9
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static boolean A08(String str) {
        File[] fileArrListFiles;
        String str2 = System.getenv(A01(27, 4, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE));
        if (str2 == null) {
            return false;
        }
        for (String str3 : str2.split(A01(25, 1, 42))) {
            File file = new File(str3);
            if (file.exists() && file.isDirectory() && (fileArrListFiles = file.listFiles()) != null) {
                for (File file2 : fileArrListFiles) {
                    if (file2.getName().equals(str)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    static {
        A05();
    }

    public static EnumC2381pt A00(C2095lA c2095lA) {
        try {
            boolean isRooted = A07() || A06() || A08(A01(47, 2, 99));
            return isRooted ? EnumC2381pt.A04 : EnumC2381pt.A06;
        } catch (Throwable t6) {
            c2095lA.A08().ABz(A01(40, 7, 1), AbstractC2126lf.A1M, new C2127lg(t6));
            return EnumC2381pt.A05;
        }
    }

    public static String A02(Context context, String str) throws PackageManager.NameNotFoundException, NoSuchAlgorithmException, CertificateException {
        StringBuilder sb2 = new StringBuilder();
        PackageManager pm2 = context.getPackageManager();
        if (pm2 == null) {
            return A01(0, 0, 21);
        }
        for (Signature signature : pm2.getPackageInfo(str, 64).signatures) {
            String[] strArr = A01;
            if (strArr[3].charAt(2) == strArr[1].charAt(2)) {
                throw new RuntimeException();
            }
            A01[0] = "2riYAheGk3Amb0xMR1UIKZqnGyXb5VAT";
            sb2.append(C2388q0.A04(MessageDigest.getInstance(A01(31, 4, 74)).digest(A04(signature).getEncoded())));
            sb2.append(A01(26, 1, 54));
        }
        return sb2.toString();
    }

    public static String A03(C2095lA c2095lA, String str) {
        try {
            return A02(c2095lA, str);
        } catch (Exception e3) {
            c2095lA.A08().ABz(A01(40, 7, 1), AbstractC2126lf.A1M, new C2127lg(e3));
            return null;
        }
    }

    public static PublicKey A04(Signature signature) throws CertificateException {
        return CertificateFactory.getInstance(A01(35, 5, 32)).generateCertificate(new ByteArrayInputStream(signature.toByteArray())).getPublicKey();
    }

    public static boolean A06() {
        String str = Build.TAGS;
        if (str != null) {
            String buildTags = A01(49, 9, 63);
            if (str.contains(buildTags)) {
                return true;
            }
        }
        return false;
    }

    public static boolean A07() {
        File superUserApk = new File(A01(0, 25, 86));
        return superUserApk.exists();
    }
}
