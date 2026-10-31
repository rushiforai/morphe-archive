package ea;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.util.Pair;
import b.c0;
import com.google.android.gms.internal.measurement.k2;
import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import ya.j;

/* loaded from: classes2.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static boolean f52420a = false;

    /* renamed from: b, reason: collision with root package name */
    public static final DateFormat f52421b = DateFormat.getDateTimeInstance(3, 3);

    /* renamed from: c, reason: collision with root package name */
    public static Handler f52422c = null;

    /* renamed from: d, reason: collision with root package name */
    public static File f52423d = null;

    public static void a(String str, String str2) {
        h(str, str2, null);
    }

    public static void b(String str, String str2, Exception exc) {
        h(str, str2, exc);
    }

    public static void c(String str, Exception exc) {
        Log.e("RestoreDbTask", str, exc);
        h("RestoreDbTask", str, exc);
    }

    public static void d(String str, String str2) {
        Log.e(str, str2);
        h(str, str2, null);
    }

    public static void e(PrintWriter printWriter) throws InterruptedException {
        if (f52420a) {
            CountDownLatch countDownLatch = new CountDownLatch(1);
            Message.obtain(f(), 3, Pair.create(printWriter, countDownLatch)).sendToTarget();
            countDownLatch.await(2L, TimeUnit.SECONDS);
            countDownLatch.getCount();
        }
    }

    public static Handler f() {
        synchronized (f52421b) {
            try {
                if (f52422c == null) {
                    ThreadPoolExecutor threadPoolExecutor = j.f97146a;
                    HandlerThread handlerThread = new HandlerThread("file-logger", 0);
                    handlerThread.start();
                    Looper looper = handlerThread.getLooper();
                    a aVar = new a(0);
                    aVar.f52418b = null;
                    aVar.f52419c = null;
                    f52422c = new Handler(looper, aVar);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return f52422c;
    }

    public static File[] g() {
        try {
            e(null);
        } catch (InterruptedException unused) {
        }
        File[] fileArr = new File[4];
        for (int i5 = 0; i5 < 4; i5++) {
            fileArr[i5] = new File(f52423d, c0.h(i5, "log-"));
        }
        return fileArr;
    }

    public static void h(String str, String str2, Exception exc) {
        if (f52420a) {
            String string = f52421b.format(new Date()) + " " + str + " " + str2;
            if (exc != null) {
                StringBuilder sbK = k2.k(string, "\n");
                sbK.append(Log.getStackTraceString(exc));
                string = sbK.toString();
            }
            Message.obtain(f(), 1, string).sendToTarget();
        }
    }

    public static void i(File file) {
        if (f52420a) {
            synchronized (f52421b) {
                try {
                    if (f52422c != null && !file.equals(f52423d)) {
                        ((HandlerThread) f52422c.getLooper().getThread()).quit();
                        f52422c = null;
                    }
                } finally {
                }
            }
        }
        f52423d = file;
    }
}
