package v4;

import android.app.ActivityManager;
import android.app.Application;
import android.os.Build;
import android.os.Process;
import androidx.compose.ui.node.LayoutNode;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.NovaApplication;
import e80.k;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.util.AbstractCollection;
import java.util.Iterator;
import kotlin.KotlinNothingValueException;
import kotlin.internal.ProgressionUtilKt;
import kotlin.jvm.internal.Intrinsics;
import v30.d;
import x80.u;
import y80.c;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static Boolean f92055a;

    /* renamed from: b, reason: collision with root package name */
    public static String f92056b;

    /* renamed from: c, reason: collision with root package name */
    public static String f92057c;

    public static final void a(RandomAccessFile randomAccessFile, ByteBuffer byteBuffer, int i5) throws IOException {
        int i11 = randomAccessFile.read(byteBuffer.array(), byteBuffer.position(), i5);
        if (i11 == -1) {
            throw new RuntimeException("EOF");
        }
    }

    public static boolean b(AbstractCollection abstractCollection, Iterator it) {
        it.getClass();
        boolean zAdd = false;
        while (it.hasNext()) {
            zAdd |= abstractCollection.add(it.next());
        }
        return zAdd;
    }

    public static void c(String str) {
        if (str.length() <= 0) {
            throw new IllegalArgumentException("name is empty");
        }
        int length = str.length();
        for (int i5 = 0; i5 < length; i5++) {
            char cCharAt = str.charAt(i5);
            if ('!' > cCharAt || cCharAt >= 127) {
                throw new IllegalArgumentException(c.g("Unexpected char %#04x at %d in header name: %s", Integer.valueOf(cCharAt), Integer.valueOf(i5), str).toString());
            }
        }
    }

    public static void d(String str, String str2) {
        int length = str.length();
        for (int i5 = 0; i5 < length; i5++) {
            char cCharAt = str.charAt(i5);
            if (cCharAt != '\t' && (' ' > cCharAt || cCharAt >= 127)) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(c.g("Unexpected char %#04x at %d in %s value", Integer.valueOf(cCharAt), Integer.valueOf(i5), str2));
                sb2.append(c.o(str2) ? b.f42142b : ": ".concat(str));
                throw new IllegalArgumentException(sb2.toString().toString());
            }
        }
    }

    public static float e(float f11, float f12, float f13) {
        return f11 < f12 ? f12 : f11 > f13 ? f13 : f11;
    }

    public static int f(int i5, int i11, int i12) {
        return i5 < i11 ? i11 : i5 > i12 ? i12 : i5;
    }

    public static long g(int i5, int i11, int i12, int i13) {
        int i14 = 262142;
        int iMin = Math.min(i12, 262142);
        int iMin2 = LayoutNode.NotPlacedPlaceOrder;
        int iMin3 = i13 == Integer.MAX_VALUE ? Integer.MAX_VALUE : Math.min(i13, 262142);
        int i15 = iMin3 == Integer.MAX_VALUE ? iMin : iMin3;
        if (i15 >= 8191) {
            if (i15 < 32767) {
                i14 = 65534;
            } else if (i15 < 65535) {
                i14 = 32766;
            } else {
                if (i15 >= 262143) {
                    y3.b.l(i15);
                    throw new KotlinNothingValueException();
                }
                i14 = 8190;
            }
        }
        if (i11 != Integer.MAX_VALUE) {
            iMin2 = Math.min(i14, i11);
        }
        return y3.b.a(Math.min(i14, i5), iMin2, iMin, iMin3);
    }

    public static long h(int i5, int i11, int i12, int i13) {
        int i14 = 262142;
        int iMin = Math.min(i5, 262142);
        int iMin2 = LayoutNode.NotPlacedPlaceOrder;
        int iMin3 = i11 == Integer.MAX_VALUE ? Integer.MAX_VALUE : Math.min(i11, 262142);
        int i15 = iMin3 == Integer.MAX_VALUE ? iMin : iMin3;
        if (i15 >= 8191) {
            if (i15 < 32767) {
                i14 = 65534;
            } else if (i15 < 65535) {
                i14 = 32766;
            } else {
                if (i15 >= 262143) {
                    y3.b.l(i15);
                    throw new KotlinNothingValueException();
                }
                i14 = 8190;
            }
        }
        if (i13 != Integer.MAX_VALUE) {
            iMin2 = Math.min(i14, i13);
        }
        return y3.b.a(iMin, iMin3, Math.min(i14, i12), iMin2);
    }

    public static String i(NovaApplication novaApplication) {
        try {
            if (f92056b == null) {
                if (Build.VERSION.SDK_INT >= 28) {
                    f92056b = Application.getProcessName();
                } else {
                    ActivityManager activityManager = (ActivityManager) novaApplication.getSystemService("activity");
                    if (activityManager != null) {
                        for (ActivityManager.RunningAppProcessInfo runningAppProcessInfo : activityManager.getRunningAppProcesses()) {
                            if (runningAppProcessInfo.pid == Process.myPid()) {
                                f92056b = runningAppProcessInfo.processName;
                            }
                        }
                    }
                }
            }
        } catch (Throwable th2) {
            d.a(th2.toString());
        }
        String str = f92056b;
        return str == null ? novaApplication.getApplicationInfo().packageName : str;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:14:0x002e -> B:17:0x0037). Please report as a decompilation issue!!! */
    public static String j(NovaApplication novaApplication) {
        if (f92057c == null) {
            if (l(novaApplication)) {
                f92057c = b.f42142b;
            }
            try {
                String strI = i(novaApplication);
                if (strI.contains(":")) {
                    f92057c = strI.substring(strI.indexOf(58) + 1);
                } else {
                    f92057c = b.f42142b;
                }
            } catch (Exception e3) {
                d.a(e3.toString());
                f92057c = b.f42142b;
            }
        }
        return f92057c;
    }

    public static final long k(k kVar) {
        Intrinsics.g(kVar, "<this>");
        return kVar.i().f52247c;
    }

    public static boolean l(NovaApplication novaApplication) {
        try {
            if (f92055a == null) {
                f92055a = Boolean.valueOf(i(novaApplication).equals(novaApplication.getApplicationInfo().packageName));
            }
            return f92055a.booleanValue();
        } catch (Throwable th2) {
            d.a(th2.toString());
            return true;
        }
    }

    public static double m(int i5) {
        double d5 = i5 / 255.0d;
        return (d5 <= 0.040449936d ? d5 / 12.92d : Math.pow((d5 + 0.055d) / 1.055d, 2.4d)) * 100.0d;
    }

    public static double n(int i5) {
        double[] dArr = {m((i5 >> 16) & 255), m((i5 >> 8) & 255), m(i5 & 255)};
        double[][] dArr2 = {new double[]{0.41233895d, 0.35762064d, 0.18051042d}, new double[]{0.2126d, 0.7152d, 0.0722d}, new double[]{0.01932141d, 0.11916382d, 0.95034478d}};
        double d5 = dArr[0];
        double[] dArr3 = dArr2[0];
        double d11 = dArr3[0] * d5;
        double d12 = dArr[1];
        double d13 = (dArr3[1] * d12) + d11;
        double d14 = dArr[2];
        double d15 = (dArr3[2] * d14) + d13;
        double[] dArr4 = dArr2[1];
        double d16 = (dArr4[2] * d14) + (dArr4[1] * d12) + (dArr4[0] * d5);
        double[] dArr5 = dArr2[2];
        double d17 = new double[]{d15, d16, (d14 * dArr5[2]) + ((d12 * dArr5[1]) + (d5 * dArr5[0]))}[1] / 100.0d;
        return d17 <= 0.008856451679035631d ? d17 * 903.2962962962963d : (Math.pow(d17, 0.3333333333333333d) * 116.0d) - 16.0d;
    }

    public static u o(String... strArr) {
        if (strArr.length % 2 != 0) {
            throw new IllegalArgumentException("Expected alternating header names and values");
        }
        String[] strArr2 = (String[]) strArr.clone();
        int length = strArr2.length;
        int i5 = 0;
        for (int i11 = 0; i11 < length; i11++) {
            String str = strArr2[i11];
            if (str == null) {
                throw new IllegalArgumentException("Headers cannot be null");
            }
            strArr2[i11] = r70.k.u1(str).toString();
        }
        int iA = ProgressionUtilKt.a(0, strArr2.length - 1, 2);
        if (iA >= 0) {
            while (true) {
                String str2 = strArr2[i5];
                String str3 = strArr2[i5 + 1];
                c(str2);
                d(str3, str2);
                if (i5 == iA) {
                    break;
                }
                i5 += 2;
            }
        }
        return new u(strArr2);
    }
}
