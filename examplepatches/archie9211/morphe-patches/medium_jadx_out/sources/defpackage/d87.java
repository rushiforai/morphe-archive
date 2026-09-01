package defpackage;

import android.text.TextUtils;
import android.util.Log;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.spec.AlgorithmParameterSpec;
import java.util.List;
import java.util.Properties;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d87 implements mqe, keg, eeg {
    public static final d87 A;
    public static final d87 A0;
    public static final d87 B;
    public static final d87 B0;
    public static final d87 C;
    public static final d87 C0;
    public static final d87 D;
    public static final d87 D0;
    public static final d87 E;
    public static final d87 E0;
    public static final d87 F;
    public static final d87 F0;
    public static final d87 G;
    public static final d87 G0;
    public static final d87 H;
    public static final d87 H0;
    public static final d87 I;
    public static final d87 I0;
    public static final d87 J;
    public static final d87 J0;
    public static final d87 K;
    public static final d87 K0;
    public static final d87 L;
    public static final d87 L0;
    public static final d87 M;
    public static final d87 M0;
    public static final d87 N;
    public static final d87 N0;
    public static final d87 O;
    public static final d87 O0;
    public static final d87 P;
    public static final d87 P0;
    public static final d87 Q;
    public static final d87 Q0;
    public static final d87 R;
    public static final d87 R0;
    public static final d87 S;
    public static final d87 S0;
    public static final d87 T0;
    public static final d87 U0;
    public static final d87 V0;
    public static final d87 W0;
    public static final d87 X;
    public static final d87 X0;
    public static final d87 Y;
    public static final d87 Y0;
    public static final d87 Z;
    public static final d87 Z0;
    public static final d87 a1;
    public static final d87 b1;
    public static final Object c = new Object();
    public static volatile d87 d;
    public static final d87 e;
    public static final d87 f;
    public static final d87 g;
    public static final d87 h;
    public static final d87 i;
    public static final d87 j;
    public static final d87 k;
    public static final d87 l;
    public static final d87 l0;
    public static final d87 m;
    public static final d87 m0;
    public static final d87 n;
    public static final d87 n0;
    public static final d87 o;
    public static final d87 o0;
    public static final d87 p;
    public static final d87 p0;
    public static final d87 q;
    public static final d87 q0;
    public static final d87 r;
    public static final d87 r0;
    public static final d87 s;
    public static final d87 s0;
    public static final d87 t;
    public static final d87 t0;
    public static final d87 u;
    public static final d87 u0;
    public static final d87 v;
    public static final d87 v0;
    public static final d87 w;
    public static final d87 w0;
    public static final d87 x;
    public static final d87 x0;
    public static final d87 y;
    public static final d87 y0;
    public static final d87 z;
    public static final d87 z0;
    public final /* synthetic */ int a;
    public int b;

    static {
        int i2 = 1;
        e = new d87(0, i2);
        f = new d87(8, i2);
        g = new d87(9, i2);
        h = new d87(11, i2);
        i = new d87(12, i2);
        j = new d87(13, i2);
        k = new d87(14, i2);
        l = new d87(15, i2);
        m = new d87(17, i2);
        n = new d87(20, i2);
        o = new d87(42, i2);
        p = new d87(43, i2);
        q = new d87(45, i2);
        r = new d87(47, i2);
        s = new d87(48, i2);
        t = new d87(54, i2);
        u = new d87(61, i2);
        v = new d87(67, i2);
        w = new d87(64, i2);
        x = new d87(66, i2);
        y = new d87(68, i2);
        z = new d87(74, i2);
        A = new d87(75, i2);
        B = new d87(79, i2);
        C = new d87(81, i2);
        D = new d87(82, i2);
        E = new d87(83, i2);
        F = new d87(84, i2);
        G = new d87(85, i2);
        H = new d87(87, i2);
        I = new d87(88, i2);
        J = new d87(89, i2);
        K = new d87(90, i2);
        L = new d87(91, i2);
        M = new d87(93, i2);
        N = new d87(95, i2);
        O = new d87(96, i2);
        P = new d87(97, i2);
        Q = new d87(98, i2);
        R = new d87(99, i2);
        S = new d87(100, i2);
        X = new d87(101, i2);
        Y = new d87(102, i2);
        Z = new d87(103, i2);
        l0 = new d87(104, i2);
        m0 = new d87(PanasonicMakernoteDirectory.TAG_COUNTRY, i2);
        n0 = new d87(106, i2);
        o0 = new d87(107, i2);
        p0 = new d87(108, i2);
        q0 = new d87(109, i2);
        r0 = new d87(110, i2);
        s0 = new d87(PanasonicMakernoteDirectory.TAG_LANDMARK, i2);
        t0 = new d87(PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, i2);
        u0 = new d87(113, i2);
        v0 = new d87(114, i2);
        w0 = new d87(115, i2);
        x0 = new d87(116, i2);
        y0 = new d87(117, i2);
        z0 = new d87(118, i2);
        A0 = new d87(PanasonicMakernoteDirectory.TAG_BURST_SPEED, i2);
        B0 = new d87(120, i2);
        C0 = new d87(PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE, i2);
        D0 = new d87(122, i2);
        E0 = new d87(123, i2);
        F0 = new d87(ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER, i2);
        G0 = new d87(127, i2);
        H0 = new d87(128, i2);
        I0 = new d87(NikonType2MakernoteDirectory.TAG_LENS, i2);
        J0 = new d87(NikonType2MakernoteDirectory.TAG_MANUAL_FOCUS_DISTANCE, i2);
        K0 = new d87(NikonType2MakernoteDirectory.TAG_DIGITAL_ZOOM, i2);
        L0 = new d87(NikonType2MakernoteDirectory.TAG_FLASH_USED, i2);
        M0 = new d87(136, i2);
        N0 = new d87(137, i2);
        O0 = new d87(138, i2);
        P0 = new d87(NikonType2MakernoteDirectory.TAG_LENS_STOPS, i2);
        Q0 = new d87(140, i2);
        R0 = new d87(142, i2);
        int i3 = 2;
        S0 = new d87(0, i3);
        T0 = new d87(1, i3);
        U0 = new d87(3, i3);
        V0 = new d87(4, i3);
        W0 = new d87(5, i3);
        X0 = new d87(6, i3);
        Y0 = new d87(7, i3);
        Z0 = new d87(9, i3);
        a1 = new d87(10, i3);
        b1 = new d87(11, i3);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1 */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v2, types: [int] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Object[]] */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v6 */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9 */
    /* JADX WARN: Type inference failed for: r2v0 */
    /* JADX WARN: Type inference failed for: r2v1, types: [int] */
    /* JADX WARN: Type inference failed for: r2v10 */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v6 */
    /* JADX WARN: Type inference failed for: r2v7 */
    /* JADX WARN: Type inference failed for: r2v8 */
    /* JADX WARN: Type inference failed for: r2v9 */
    /* JADX WARN: Type inference failed for: r8v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v10 */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v5, types: [int] */
    /* JADX WARN: Type inference failed for: r8v9 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:15:0x0063 -> B:16:0x0064). Please report as a decompilation issue!!! */
    public d87(String str) {
        List listM;
        this.a = 7;
        int i2 = 2;
        i2 = 2;
        i2 = 2;
        ?? r02 = 2;
        ?? r2 = 3;
        r2 = 3;
        r2 = 3;
        ?? r22 = 3;
        try {
            listM = wjc.l().m(str);
        } catch (IllegalArgumentException e2) {
            boolean zIsLoggable = Log.isLoggable("LibraryVersionContainer", r2);
            r02 = i2;
            r22 = zIsLoggable;
            if (zIsLoggable) {
                ?? r03 = new Object[i2];
                r03[0] = str;
                r03[1] = e2;
                Log.d("LibraryVersionContainer", String.format("Version code parsing failed for: %s with exception %s.", r03));
                r02 = r03;
                r22 = zIsLoggable;
            }
        }
        if (listM.size() == 1) {
            str = Integer.parseInt(str);
        } else if (listM.size() >= 3) {
            str = Integer.parseInt((String) listM.get(2)) + (Integer.parseInt((String) listM.get(1)) * PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE) + (Integer.parseInt((String) listM.get(0)) * 1000000);
        } else {
            str = -1;
            i2 = r02;
            r2 = r22;
        }
        this.b = str;
    }

    public static d87 h() {
        d87 d87Var;
        synchronized (c) {
            try {
                if (d == null) {
                    d = new d87(3, 0);
                }
                d87Var = d;
            } catch (Throwable th) {
                throw th;
            }
        }
        return d87Var;
    }

    public static String k(String str) {
        int length = str.length();
        StringBuilder sb = new StringBuilder(23);
        sb.append("WM-");
        if (length >= 20) {
            sb.append(str.substring(0, 20));
        } else {
            sb.append(str);
        }
        return sb.toString();
    }

    public static d87 m() throws Throwable {
        String str;
        InputStream resourceAsStream;
        String str2;
        qx6 qx6Var = qx6.c;
        qx6Var.getClass();
        d1g d1gVar = qx6.b;
        vp7.o("firebase-auth", "Please provide a valid libraryName");
        ConcurrentHashMap concurrentHashMap = qx6Var.a;
        if (concurrentHashMap.containsKey("firebase-auth")) {
            str2 = (String) concurrentHashMap.get("firebase-auth");
        } else {
            Properties properties = new Properties();
            InputStream inputStream = null;
            property = null;
            String property = null;
            inputStream = null;
            try {
                try {
                    resourceAsStream = qx6.class.getResourceAsStream("/firebase-auth.properties");
                } catch (IOException e2) {
                    e = e2;
                    str = null;
                }
            } catch (Throwable th) {
                th = th;
            }
            try {
                if (resourceAsStream != null) {
                    properties.load(resourceAsStream);
                    property = properties.getProperty("version", null);
                    StringBuilder sb = new StringBuilder(25 + String.valueOf(property).length());
                    sb.append("firebase-auth version is ");
                    sb.append(property);
                    String string = sb.toString();
                    d1gVar.getClass();
                    if (Log.isLoggable("LibraryVersion", 2)) {
                        String str3 = d1gVar.b;
                        if (str3 != null) {
                            string = str3.concat(string);
                        }
                        Log.v("LibraryVersion", string);
                    }
                } else {
                    StringBuilder sb2 = new StringBuilder(56);
                    sb2.append("Failed to get app version for libraryName: firebase-auth");
                    String string2 = sb2.toString();
                    d1gVar.getClass();
                    if (Log.isLoggable("LibraryVersion", 5)) {
                        String str4 = d1gVar.b;
                        if (str4 != null) {
                            string2 = str4.concat(string2);
                        }
                        Log.w("LibraryVersion", string2);
                    }
                }
            } catch (IOException e3) {
                e = e3;
                str = null;
                inputStream = resourceAsStream;
                StringBuilder sb3 = new StringBuilder(56);
                sb3.append("Failed to get app version for libraryName: firebase-auth");
                String string3 = sb3.toString();
                d1gVar.getClass();
                if (Log.isLoggable("LibraryVersion", 6)) {
                    String str5 = d1gVar.b;
                    if (str5 != null) {
                        string3 = str5.concat(string3);
                    }
                    Log.e("LibraryVersion", string3, e);
                }
                resourceAsStream = inputStream;
                property = str;
            } catch (Throwable th2) {
                th = th2;
                inputStream = resourceAsStream;
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException unused) {
                    }
                }
                throw th;
            }
            if (resourceAsStream != null) {
                try {
                    resourceAsStream.close();
                } catch (IOException unused2) {
                }
            }
            if (property == null) {
                d1gVar.getClass();
                if (Log.isLoggable("LibraryVersion", 3)) {
                    String str6 = d1gVar.b;
                    Log.d("LibraryVersion", str6 != null ? str6.concat(".properties file is dropped during release process. Failure to read app version is expected during Google internal testing where locally-built libraries are used") : ".properties file is dropped during release process. Failure to read app version is expected during Google internal testing where locally-built libraries are used");
                }
                str2 = "UNKNOWN";
            } else {
                str2 = property;
            }
            concurrentHashMap.put("firebase-auth", str2);
        }
        if (TextUtils.isEmpty(str2) || str2.equals("UNKNOWN")) {
            str2 = "-1";
        }
        return new d87(str2);
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x00d3  */
    @Override // defpackage.mqe
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object L0(defpackage.id6 r21, float r22) {
        /*
            Method dump skipped, instruction units count: 624
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.d87.L0(id6, float):java.lang.Object");
    }

    @Override // defpackage.keg
    public byte[] a() throws GeneralSecurityException {
        int i2 = this.b;
        if (i2 == 16) {
            return weg.i;
        }
        if (i2 == 32) {
            return weg.j;
        }
        ygf.l("Could not determine HPKE AEAD ID");
        return null;
    }

    @Override // defpackage.eeg
    public byte[] b(int i2, byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (bArr2.length < i2) {
            ygf.l("ciphertext too short");
            return null;
        }
        if (bArr.length != this.b) {
            ygf.l("invalid key size");
            return null;
        }
        bt btVar = b6g.a;
        mo7.W(bArr.length);
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr, "AES");
        int i3 = i2 + 12;
        if (bArr2.length < i2 + 28) {
            ygf.l("ciphertext too short");
            return null;
        }
        AlgorithmParameterSpec algorithmParameterSpecA = b6g.a(bArr2, i2, 12);
        Cipher cipher = (Cipher) b6g.a.get();
        cipher.init(2, secretKeySpec, algorithmParameterSpecA);
        return cipher.doFinal(bArr2, i3, (bArr2.length - i2) - 12);
    }

    @Override // defpackage.keg
    public byte[] c(byte[] bArr, byte[] bArr2, byte[] bArr3, int i2, byte[] bArr4) throws InvalidAlgorithmParameterException {
        if (bArr.length == this.b) {
            return new v7g(bArr).a(bArr2, bArr3, i2, bArr4);
        }
        throw new InvalidAlgorithmParameterException(b09.w(bArr.length, "Unexpected key length: "));
    }

    public void d(String str, String str2) {
        if (this.b <= 3) {
            Log.d(str, str2);
        }
    }

    public void e(String str, String str2, Throwable th) {
        if (this.b <= 3) {
            Log.d(str, str2, th);
        }
    }

    public void f(String str, String str2) {
        if (this.b <= 6) {
            Log.e(str, str2);
        }
    }

    public void g(String str, String str2, Throwable th) {
        if (this.b <= 6) {
            Log.e(str, str2, th);
        }
    }

    public Object i(fj6 fj6Var, Object obj) {
        fj6Var.getClass();
        return ((uvd) obj).a.get(this.b);
    }

    public void j(String str, String str2) {
        if (this.b <= 4) {
            Log.i(str, str2);
        }
    }

    public void l(String str, String str2) {
        if (this.b <= 5) {
            Log.w(str, str2);
        }
    }

    public String n() {
        return ka1.r("X", Integer.toString(this.b));
    }

    @Override // defpackage.keg, defpackage.eeg
    public int zza() {
        switch (this.a) {
        }
        return this.b;
    }

    public /* synthetic */ d87(int i2, int i3) {
        this.a = i3;
        this.b = i2;
    }

    public d87(g2g g2gVar) throws GeneralSecurityException {
        this.a = 9;
        if (g2gVar.b == 12) {
            if (g2gVar.c == 16) {
                if (g2gVar.d == d2g.e) {
                    this.b = g2gVar.a;
                    return;
                } else {
                    ygf.l("invalid variant");
                    throw null;
                }
            }
            ygf.l("invalid tag size");
            throw null;
        }
        ygf.l("invalid IV size");
        throw null;
    }

    public d87(int i2) throws InvalidAlgorithmParameterException {
        this.a = 8;
        if (i2 != 16 && i2 != 32) {
            throw new InvalidAlgorithmParameterException(b09.w(i2, "Unsupported key length: "));
        }
        this.b = i2;
    }

    public /* synthetic */ d87(int i2, byte b) {
        this.a = i2;
    }
}
