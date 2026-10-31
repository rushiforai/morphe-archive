package com.pgl.ssdk;

import android.text.TextUtils;
import com.pgl.ssdk.ces.out.DungeonFlag;
import com.pgl.ssdk.g;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Locale;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class v {

    /* renamed from: a, reason: collision with root package name */
    private static String f42380a = null;

    /* renamed from: b, reason: collision with root package name */
    private static String f42381b = null;

    /* renamed from: c, reason: collision with root package name */
    private static Boolean f42382c = null;

    /* renamed from: d, reason: collision with root package name */
    private static String f42383d = null;

    /* renamed from: e, reason: collision with root package name */
    private static String f42384e = null;

    /* renamed from: f, reason: collision with root package name */
    private static String f42385f = null;

    /* renamed from: g, reason: collision with root package name */
    private static int f42386g = -1;

    /* renamed from: h, reason: collision with root package name */
    private static long f42387h;

    /* renamed from: i, reason: collision with root package name */
    private static long f42388i;

    /* JADX WARN: Removed duplicated region for block: B:16:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0038  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0026 A[EXC_TOP_SPLITTER, PHI: r1
      0x0026: PHI (r1v3 java.io.RandomAccessFile) = (r1v2 java.io.RandomAccessFile), (r1v4 java.io.RandomAccessFile) binds: [B:8:0x001f, B:11:0x0023] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    @DungeonFlag
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static e a(File file) throws Throwable {
        RandomAccessFile randomAccessFile;
        List<e> listA;
        try {
            randomAccessFile = new RandomAccessFile(file, "r");
            try {
                q qVarA = r.a(randomAccessFile, 0L, randomAccessFile.length());
                listA = l.a(qVarA, c.a(qVarA));
                try {
                    randomAccessFile.close();
                } catch (IOException unused) {
                }
            } catch (g.a unused2) {
                if (randomAccessFile != null) {
                    try {
                        randomAccessFile.close();
                    } catch (IOException unused3) {
                    }
                }
                listA = null;
                if (listA == null) {
                    listA = k.a(file);
                }
                if (listA != null) {
                }
                return null;
            } catch (Throwable unused4) {
                if (randomAccessFile != null) {
                }
                listA = null;
                if (listA == null) {
                }
                if (listA != null) {
                }
                return null;
            }
        } catch (g.a unused5) {
            randomAccessFile = null;
        } catch (Throwable unused6) {
            randomAccessFile = null;
        }
        if (listA == null || listA.isEmpty()) {
            listA = k.a(file);
        }
        if (listA != null || listA.isEmpty()) {
            return null;
        }
        return listA.get(0);
    }

    public static long b(File file) throws Throwable {
        String str;
        ZipFile zipFile = null;
        try {
            ZipFile zipFile2 = new ZipFile(file);
            int i5 = 1;
            long size = 0;
            while (true) {
                if (i5 == 1) {
                    str = "classes.dex";
                } else {
                    str = String.format(Locale.getDefault(), "classes%d.dex", Integer.valueOf(i5));
                }
                ZipEntry entry = zipFile2.getEntry(str);
                if (entry != null) {
                    try {
                        size += entry.getSize();
                        i5++;
                    } catch (IOException unused) {
                        zipFile = zipFile2;
                        if (zipFile != null) {
                            try {
                                zipFile.close();
                            } catch (IOException unused2) {
                            }
                        }
                        return 0L;
                    } catch (Throwable th2) {
                        th = th2;
                        zipFile = zipFile2;
                        if (zipFile != null) {
                            try {
                                zipFile.close();
                            } catch (IOException unused3) {
                            }
                        }
                        throw th;
                    }
                } else {
                    try {
                        break;
                    } catch (IOException unused4) {
                    }
                }
            }
            zipFile2.close();
            return size;
        } catch (IOException unused5) {
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public static String c() throws Throwable {
        if (TextUtils.isEmpty(f42384e) || TextUtils.isEmpty(f42380a) || TextUtils.isEmpty(f42385f) || TextUtils.isEmpty(f42381b)) {
            d();
        }
        return b();
    }

    public static void d() throws Throwable {
        if (TextUtils.isEmpty(f42380a) || TextUtils.isEmpty(f42381b)) {
            f();
        }
        String strE = e();
        if (TextUtils.isEmpty(strE)) {
            return;
        }
        File file = new File(strE);
        if (file.exists() && file.canRead()) {
            f42387h = file.length();
            f42388i = b(file);
            f42384e = c(file);
            if (f42386g == -1 || TextUtils.isEmpty(f42385f)) {
                Object[] objArr = (Object[]) com.pgl.ssdk.ces.a.meta(158, z.a(), strE);
                Integer num = (Integer) objArr[0];
                String str = (String) objArr[1];
                if (str != null) {
                    f42385f = str;
                }
                if (num != null) {
                    f42386g = num.intValue();
                }
            }
        }
    }

    public static String e() {
        if (z.a() == null) {
            return null;
        }
        String packageCodePath = z.a().getPackageCodePath();
        if (TextUtils.isEmpty(packageCodePath)) {
            return null;
        }
        File file = new File(packageCodePath);
        if (file.exists() && file.canRead()) {
            return packageCodePath;
        }
        return null;
    }

    public static void f() throws Throwable {
        String strE = e();
        if (TextUtils.isEmpty(strE)) {
            return;
        }
        File file = new File(strE);
        if (file.exists() && file.canRead()) {
            e eVarA = a(file);
            if (eVarA != null) {
                f42380a = a(eVarA.a());
                f42383d = eVarA.b();
            }
            f42381b = g();
        }
    }

    public static String g() {
        try {
            return a(z.a().getPackageManager().getPackageInfo(z.a().getPackageName(), 64).signatures[0].toByteArray());
        } catch (Throwable unused) {
            return null;
        }
    }

    public static boolean h() throws Throwable {
        if (TextUtils.isEmpty(f42380a) || TextUtils.isEmpty(f42381b)) {
            f();
        }
        return a();
    }

    public static String a(byte[] bArr) {
        try {
            byte[] bArrDigest = MessageDigest.getInstance("SHA1").digest(bArr);
            StringBuilder sb2 = new StringBuilder();
            for (byte b11 : bArrDigest) {
                sb2.append(Integer.toHexString((b11 & 255) | 256).substring(1, 3).toUpperCase());
                sb2.append(":");
            }
            return sb2.substring(0, sb2.length() - 1);
        } catch (NoSuchAlgorithmException unused) {
            return null;
        }
    }

    private static String b() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            if (!TextUtils.isEmpty(f42380a)) {
                jSONObject.put("sign", f42380a);
            }
            if (!TextUtils.isEmpty(f42383d)) {
                jSONObject.put("subject", f42383d);
            }
            if (!TextUtils.isEmpty(f42384e)) {
                jSONObject.put("md5", f42384e);
            }
            if (!TextUtils.isEmpty(f42385f)) {
                jSONObject.put("path", f42385f);
            }
            long j11 = f42387h;
            if (j11 != 0) {
                jSONObject.put("apkSize", j11);
            }
            long j12 = f42388i;
            if (j12 != 0) {
                jSONObject.put("dexSize", j12);
            }
            int i5 = f42386g;
            if (i5 != -1) {
                jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, i5);
            }
            if (!TextUtils.isEmpty(f42381b)) {
                jSONObject.put("signpm", f42381b);
            }
            jSONObject.put("rebud", a());
            return jSONObject.toString();
        } catch (JSONException unused) {
            return null;
        }
    }

    public static String c(File file) throws Throwable {
        RandomAccessFile randomAccessFile = null;
        try {
            RandomAccessFile randomAccessFile2 = new RandomAccessFile(file, "r");
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                byte[] bArr = new byte[1048576];
                while (true) {
                    int i5 = randomAccessFile2.read(bArr);
                    if (i5 == -1) {
                        break;
                    }
                    messageDigest.update(bArr, 0, i5);
                }
                String string = new BigInteger(1, messageDigest.digest()).toString(16);
                while (string.length() < 32) {
                    string = "0".concat(string);
                }
                try {
                    randomAccessFile2.close();
                } catch (IOException unused) {
                }
                return string;
            } catch (IOException | NoSuchAlgorithmException unused2) {
                randomAccessFile = randomAccessFile2;
                if (randomAccessFile == null) {
                    return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                try {
                    randomAccessFile.close();
                    return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                } catch (IOException unused3) {
                    return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
            } catch (Throwable th2) {
                th = th2;
                randomAccessFile = randomAccessFile2;
                if (randomAccessFile != null) {
                    try {
                        randomAccessFile.close();
                    } catch (IOException unused4) {
                    }
                }
                throw th;
            }
        } catch (IOException | NoSuchAlgorithmException unused5) {
        } catch (Throwable th3) {
            th = th3;
        }
    }

    private static boolean a() {
        Boolean bool = f42382c;
        if (bool != null) {
            return bool.booleanValue();
        }
        if (TextUtils.isEmpty(f42381b) || TextUtils.isEmpty(f42380a)) {
            return false;
        }
        boolean z11 = !f42381b.equals(f42380a);
        f42382c = Boolean.valueOf(z11);
        return z11;
    }
}
