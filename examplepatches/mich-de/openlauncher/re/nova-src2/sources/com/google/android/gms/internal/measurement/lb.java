package com.google.android.gms.internal.measurement;

import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.StrictMode;
import android.os.SystemClock;
import android.os.Trace;
import android.util.Log;
import com.vungle.ads.internal.protos.Sdk;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicReference;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public abstract class lb {

    /* renamed from: a, reason: collision with root package name */
    public static volatile vk.k f32781a;

    /* renamed from: b, reason: collision with root package name */
    public static final Object f32782b = new Object();

    /* renamed from: c, reason: collision with root package name */
    public static Thread f32783c;

    /* renamed from: d, reason: collision with root package name */
    public static volatile Handler f32784d;

    public static int a(int i5) {
        if (i5 == 0) {
            return 1;
        }
        if (i5 == 1) {
            return 2;
        }
        if (i5 == 2) {
            return 3;
        }
        if (i5 != 3) {
            return i5 != 4 ? 0 : 5;
        }
        return 4;
    }

    public static int b(byte[] bArr, int i5, q0 q0Var) {
        int i11 = i5 + 1;
        byte b11 = bArr[i5];
        if (b11 < 0) {
            return f(b11, i11, q0Var, bArr);
        }
        q0Var.f32977a = b11;
        return i11;
    }

    public static File c(Context context) {
        File filesDir = context.getFilesDir();
        if (filesDir != null) {
            return filesDir;
        }
        SystemClock.sleep(100L);
        File filesDir2 = context.getFilesDir();
        if (filesDir2 != null) {
            return filesDir2;
        }
        throw new IllegalStateException("getFilesDir returned null twice.");
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0036 A[Catch: all -> 0x0022, TryCatch #0 {all -> 0x0022, all -> 0x006c, blocks: (B:6:0x0007, B:8:0x000b, B:10:0x0019, B:20:0x0036, B:75:0x0177, B:15:0x0025, B:17:0x002d, B:21:0x003a, B:23:0x0040, B:25:0x0048, B:74:0x0173, B:76:0x017a, B:77:0x017d, B:78:0x017e, B:26:0x004c, B:28:0x0050, B:29:0x005d, B:31:0x0063, B:37:0x0079, B:39:0x007f, B:40:0x008b, B:61:0x0157, B:62:0x015a, B:70:0x016a, B:69:0x0167, B:71:0x016b, B:72:0x0170, B:73:0x0171, B:32:0x0069, B:36:0x0070), top: B:83:0x0007 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static vk.k d(Context context) {
        vk.k kVar;
        StrictMode.ThreadPolicy threadPolicyAllowThreadDiskReads;
        vk.k oVar;
        vk.k oVar2;
        char c11;
        vk.k kVar2 = f32781a;
        if (kVar2 != null) {
            return kVar2;
        }
        synchronized (lb.class) {
            try {
                kVar = f32781a;
                if (kVar == null) {
                    String str = Build.TYPE;
                    String str2 = Build.TAGS;
                    z.e eVar = mb.f32818a;
                    if (str.equals("eng") || str.equals("userdebug")) {
                        if (str2.contains("dev-keys") || str2.contains("test-keys")) {
                            Context contextCreateDeviceProtectedStorageContext = !context.isDeviceProtectedStorage() ? context.createDeviceProtectedStorageContext() : context;
                            threadPolicyAllowThreadDiskReads = StrictMode.allowThreadDiskReads();
                            StrictMode.allowThreadDiskWrites();
                            char c12 = 0;
                            try {
                                File file = new File(contextCreateDeviceProtectedStorageContext.getDir("phenotype_hermetic", 0), "overrides.txt");
                                oVar = file.exists() ? new vk.o(file) : vk.a.f92803a;
                            } catch (RuntimeException e3) {
                                Log.e("HermeticFileOverrides", "no data dir", e3);
                                oVar = vk.a.f92803a;
                            }
                            if (oVar.b()) {
                                File file2 = (File) oVar.a();
                                try {
                                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(file2)));
                                    try {
                                        z.c1 c1Var = new z.c1(0);
                                        HashMap map = new HashMap();
                                        while (true) {
                                            String line = bufferedReader.readLine();
                                            if (line == null) {
                                                break;
                                            }
                                            String[] strArrSplit = line.split(" ", 3);
                                            if (strArrSplit.length != 3) {
                                                StringBuilder sb2 = new StringBuilder(line.length() + 9);
                                                sb2.append("Invalid: ");
                                                sb2.append(line);
                                                Log.e("HermeticFileOverrides", sb2.toString());
                                            } else {
                                                String str3 = new String(strArrSplit[c12]);
                                                String strDecode = Uri.decode(new String(strArrSplit[1]));
                                                String strDecode2 = (String) map.get(strArrSplit[2]);
                                                if (strDecode2 == null) {
                                                    String str4 = new String(strArrSplit[2]);
                                                    strDecode2 = Uri.decode(str4);
                                                    if (strDecode2.length() < 1024 || strDecode2 == str4) {
                                                        map.put(str4, strDecode2);
                                                    }
                                                }
                                                z.c1 c1Var2 = (z.c1) c1Var.get(str3);
                                                if (c1Var2 == null) {
                                                    c11 = 0;
                                                    c1Var2 = new z.c1(0);
                                                    c1Var.put(str3, c1Var2);
                                                } else {
                                                    c11 = 0;
                                                }
                                                c1Var2.put(strDecode, strDecode2);
                                                c12 = c11;
                                            }
                                        }
                                        String string = file2.toString();
                                        String packageName = contextCreateDeviceProtectedStorageContext.getPackageName();
                                        StringBuilder sb3 = new StringBuilder(string.length() + 28 + String.valueOf(packageName).length());
                                        sb3.append("Parsed ");
                                        sb3.append(string);
                                        sb3.append(" for Android package ");
                                        sb3.append(packageName);
                                        Log.w("HermeticFileOverrides", sb3.toString());
                                        kb kbVar = new kb(c1Var);
                                        bufferedReader.close();
                                        oVar2 = new vk.o(kbVar);
                                    } catch (Throwable th2) {
                                        try {
                                            bufferedReader.close();
                                            throw th2;
                                        } catch (Throwable th3) {
                                            th2.addSuppressed(th3);
                                            throw th2;
                                        }
                                    }
                                } catch (IOException e11) {
                                    throw new RuntimeException(e11);
                                }
                            } else {
                                oVar2 = vk.a.f92803a;
                            }
                            StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskReads);
                            kVar = oVar2;
                        } else {
                            kVar = vk.a.f92803a;
                        }
                        f32781a = kVar;
                    }
                }
            } catch (Throwable th4) {
                StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskReads);
                throw th4;
            } finally {
            }
        }
        return kVar;
    }

    public static boolean e(Thread thread) {
        if (f32783c == null) {
            f32783c = Looper.getMainLooper().getThread();
        }
        return thread == f32783c;
    }

    public static int f(int i5, int i11, q0 q0Var, byte[] bArr) {
        byte b11 = bArr[i11];
        int i12 = i11 + 1;
        int i13 = i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        if (b11 >= 0) {
            q0Var.f32977a = i13 | (b11 << 7);
            return i12;
        }
        int i14 = i13 | ((b11 & AbstractJsonLexerKt.TC_INVALID) << 7);
        int i15 = i11 + 2;
        byte b12 = bArr[i12];
        if (b12 >= 0) {
            q0Var.f32977a = i14 | (b12 << 14);
            return i15;
        }
        int i16 = i14 | ((b12 & AbstractJsonLexerKt.TC_INVALID) << 14);
        int i17 = i11 + 3;
        byte b13 = bArr[i15];
        if (b13 >= 0) {
            q0Var.f32977a = i16 | (b13 << 21);
            return i17;
        }
        int i18 = i16 | ((b13 & AbstractJsonLexerKt.TC_INVALID) << 21);
        int i19 = i11 + 4;
        byte b14 = bArr[i17];
        if (b14 >= 0) {
            q0Var.f32977a = i18 | (b14 << 28);
            return i19;
        }
        int i21 = i18 | ((b14 & AbstractJsonLexerKt.TC_INVALID) << 28);
        while (true) {
            int i22 = i19 + 1;
            if (bArr[i19] >= 0) {
                q0Var.f32977a = i21;
                return i22;
            }
            i19 = i22;
        }
    }

    public static Handler g() {
        if (f32784d == null) {
            synchronized (f32782b) {
                try {
                    if (f32784d == null) {
                        f32784d = new Handler(Looper.getMainLooper());
                    }
                } finally {
                }
            }
        }
        return f32784d;
    }

    public static void h(zg zgVar) {
        dg dgVar;
        if (l(zgVar) || (dgVar = ((dg) zgVar).f32473a) == null) {
            Trace.beginSection(((dg) zgVar).f32475c);
            n(zgVar);
        } else {
            h(dgVar);
            n(zgVar);
        }
    }

    public static int i(byte[] bArr, int i5, q0 q0Var) {
        long j11 = bArr[i5];
        int i11 = i5 + 1;
        if (j11 >= 0) {
            q0Var.f32978b = j11;
            return i11;
        }
        int i12 = i5 + 2;
        byte b11 = bArr[i11];
        long j12 = (j11 & 127) | ((b11 & AbstractJsonLexerKt.TC_INVALID) << 7);
        int i13 = 7;
        while (b11 < 0) {
            int i14 = i12 + 1;
            i13 += 7;
            j12 |= (r10 & AbstractJsonLexerKt.TC_INVALID) << i13;
            b11 = bArr[i12];
            i12 = i14;
        }
        q0Var.f32978b = j12;
        return i12;
    }

    public static void j(zg zgVar) {
        if (!l(zgVar)) {
            dg dgVar = (dg) zgVar;
            if (dgVar.f32473a != null) {
                Trace.endSection();
                j(dgVar.f32473a);
                return;
            }
        }
        Trace.endSection();
        Trace.endSection();
    }

    public static int k(int i5, byte[] bArr) {
        int i11 = bArr[i5] & 255;
        int i12 = bArr[i5 + 1] & 255;
        int i13 = bArr[i5 + 2] & 255;
        return ((bArr[i5 + 3] & 255) << 24) | (i12 << 8) | i11 | (i13 << 16);
    }

    public static boolean l(zg zgVar) {
        return ((dg) zgVar).f32477e != Thread.currentThread();
    }

    public static long m(int i5, byte[] bArr) {
        return (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48) | ((bArr[i5 + 7] & 255) << 56);
    }

    public static void n(zg zgVar) {
        String strSubstring = ((dg) zgVar).f32476d;
        AtomicReference atomicReference = jg.f32692a;
        if (strSubstring.length() > 127) {
            strSubstring = strSubstring.substring(0, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        }
        Trace.beginSection(strSubstring);
    }

    public static int o(byte[] bArr, int i5, q0 q0Var) throws zzaeh {
        int iB = b(bArr, i5, q0Var);
        int i11 = q0Var.f32977a;
        if (i11 < 0) {
            throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        if (i11 == 0) {
            q0Var.f32979c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            return iB;
        }
        q0Var.f32979c = f3.d(bArr, iB, i11);
        return iB + i11;
    }

    public static int p(byte[] bArr, int i5, q0 q0Var) throws zzaeh {
        int iB = b(bArr, i5, q0Var);
        int i11 = q0Var.f32977a;
        if (i11 < 0) {
            throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        if (i11 > bArr.length - iB) {
            throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        if (i11 == 0) {
            q0Var.f32979c = v0.f33120b;
            return iB;
        }
        q0Var.f32979c = v0.k(iB, i11, bArr);
        return iB + i11;
    }

    public static int q(Object obj, t2 t2Var, byte[] bArr, int i5, int i11, q0 q0Var) throws zzaeh {
        int iF = i5 + 1;
        int i12 = bArr[i5];
        if (i12 < 0) {
            iF = f(i12, iF, q0Var, bArr);
            i12 = q0Var.f32977a;
        }
        int i13 = iF;
        if (i12 < 0 || i12 > i11 - i13) {
            throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        int i14 = q0Var.f32980d + 1;
        q0Var.f32980d = i14;
        if (i14 >= 100) {
            throw new zzaeh("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int i15 = i13 + i12;
        t2Var.c(obj, bArr, i13, i15, q0Var);
        q0Var.f32980d--;
        q0Var.f32979c = obj;
        return i15;
    }

    public static int r(Object obj, t2 t2Var, byte[] bArr, int i5, int i11, int i12, q0 q0Var) throws zzaeh {
        l2 l2Var = (l2) t2Var;
        int i13 = q0Var.f32980d + 1;
        q0Var.f32980d = i13;
        if (i13 >= 100) {
            throw new zzaeh("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int iX = l2Var.x(obj, bArr, i5, i11, i12, q0Var);
        q0Var.f32980d--;
        q0Var.f32979c = obj;
        return iX;
    }

    public static int s(int i5, byte[] bArr, int i11, int i12, y1 y1Var, q0 q0Var) {
        p1 p1Var = (p1) y1Var;
        int iB = b(bArr, i11, q0Var);
        p1Var.zzh(q0Var.f32977a);
        while (iB < i12) {
            int iB2 = b(bArr, iB, q0Var);
            if (i5 != q0Var.f32977a) {
                break;
            }
            iB = b(bArr, iB2, q0Var);
            p1Var.zzh(q0Var.f32977a);
        }
        return iB;
    }

    public static int t(byte[] bArr, int i5, y1 y1Var, q0 q0Var) throws zzaeh {
        p1 p1Var = (p1) y1Var;
        int iB = b(bArr, i5, q0Var);
        int i11 = q0Var.f32977a + iB;
        while (iB < i11) {
            iB = b(bArr, iB, q0Var);
            p1Var.zzh(q0Var.f32977a);
        }
        if (iB == i11) {
            return iB;
        }
        throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    public static int u(t2 t2Var, int i5, byte[] bArr, int i11, int i12, y1 y1Var, q0 q0Var) throws zzaeh {
        o1 o1VarZza = t2Var.zza();
        t2 t2Var2 = t2Var;
        byte[] bArr2 = bArr;
        int i13 = i12;
        q0 q0Var2 = q0Var;
        int iQ = q(o1VarZza, t2Var2, bArr2, i11, i13, q0Var2);
        t2Var2.a(o1VarZza);
        q0Var2.f32979c = o1VarZza;
        y1Var.add(o1VarZza);
        while (iQ < i13) {
            q0 q0Var3 = q0Var2;
            int i14 = i13;
            int iB = b(bArr2, iQ, q0Var3);
            if (i5 != q0Var3.f32977a) {
                break;
            }
            byte[] bArr3 = bArr2;
            t2 t2Var3 = t2Var2;
            o1 o1VarZza2 = t2Var3.zza();
            iQ = q(o1VarZza2, t2Var3, bArr3, iB, i14, q0Var3);
            t2Var2 = t2Var3;
            bArr2 = bArr3;
            i13 = i14;
            q0Var2 = q0Var3;
            t2Var2.a(o1VarZza2);
            q0Var2.f32979c = o1VarZza2;
            y1Var.add(o1VarZza2);
        }
        return iQ;
    }

    public static int v(int i5, byte[] bArr, int i11, int i12, y2 y2Var, q0 q0Var) throws zzaeh {
        if ((i5 >>> 3) == 0) {
            throw new zzaeh("Protocol message contained an invalid tag (zero).");
        }
        int i13 = i5 & 7;
        if (i13 == 0) {
            int i14 = i(bArr, i11, q0Var);
            y2Var.d(i5, Long.valueOf(q0Var.f32978b));
            return i14;
        }
        if (i13 == 1) {
            y2Var.d(i5, Long.valueOf(m(i11, bArr)));
            return i11 + 8;
        }
        if (i13 == 2) {
            int iB = b(bArr, i11, q0Var);
            int i15 = q0Var.f32977a;
            if (i15 < 0) {
                throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            }
            if (i15 > bArr.length - iB) {
                throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
            if (i15 == 0) {
                y2Var.d(i5, v0.f33120b);
            } else {
                y2Var.d(i5, v0.k(iB, i15, bArr));
            }
            return iB + i15;
        }
        if (i13 != 3) {
            if (i13 != 5) {
                throw new zzaeh("Protocol message contained an invalid tag (zero).");
            }
            y2Var.d(i5, Integer.valueOf(k(i11, bArr)));
            return i11 + 4;
        }
        int i16 = (i5 & (-8)) | 4;
        y2 y2VarA = y2.a();
        int i17 = q0Var.f32980d + 1;
        q0Var.f32980d = i17;
        if (i17 >= 100) {
            throw new zzaeh("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int i18 = 0;
        while (true) {
            if (i11 >= i12) {
                break;
            }
            int iB2 = b(bArr, i11, q0Var);
            int i19 = q0Var.f32977a;
            if (i19 == i16) {
                i18 = i19;
                i11 = iB2;
                break;
            }
            i11 = v(i19, bArr, iB2, i12, y2VarA, q0Var);
            i18 = i19;
        }
        q0Var.f32980d--;
        if (i11 > i12 || i18 != i16) {
            throw new zzaeh("Failed to parse the message.");
        }
        y2Var.d(i5, y2VarA);
        return i11;
    }

    public static int w(int i5, byte[] bArr, int i11, int i12, q0 q0Var) throws zzaeh {
        if ((i5 >>> 3) == 0) {
            throw new zzaeh("Protocol message contained an invalid tag (zero).");
        }
        int i13 = i5 & 7;
        if (i13 == 0) {
            return i(bArr, i11, q0Var);
        }
        if (i13 == 1) {
            return i11 + 8;
        }
        if (i13 == 2) {
            return b(bArr, i11, q0Var) + q0Var.f32977a;
        }
        if (i13 != 3) {
            if (i13 == 5) {
                return i11 + 4;
            }
            throw new zzaeh("Protocol message contained an invalid tag (zero).");
        }
        int i14 = (i5 & (-8)) | 4;
        int i15 = 0;
        while (i11 < i12) {
            i11 = b(bArr, i11, q0Var);
            i15 = q0Var.f32977a;
            if (i15 == i14) {
                break;
            }
            i11 = w(i15, bArr, i11, i12, q0Var);
        }
        if (i11 > i12 || i15 != i14) {
            throw new zzaeh("Failed to parse the message.");
        }
        return i11;
    }
}
