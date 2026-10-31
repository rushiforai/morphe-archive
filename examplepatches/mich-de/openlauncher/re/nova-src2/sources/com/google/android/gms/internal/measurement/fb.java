package com.google.android.gms.internal.measurement;

import android.content.Context;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Process;
import android.os.UserManager;
import android.system.Os;
import android.util.Log;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Locale;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.logging.Level;
import kotlin.jvm.internal.Ref;

/* loaded from: classes3.dex */
public abstract class fb {

    /* renamed from: a, reason: collision with root package name */
    public static UserManager f32530a = null;

    /* renamed from: b, reason: collision with root package name */
    public static volatile boolean f32531b = false;

    /* renamed from: c, reason: collision with root package name */
    public static final Object f32532c = new Object();

    /* renamed from: d, reason: collision with root package name */
    public static volatile ub f32533d;

    /* renamed from: e, reason: collision with root package name */
    public static volatile ub f32534e;

    public static IOException a(ye yeVar, Uri uri, IOException iOException, String str) {
        try {
            lf lfVar = new lf();
            lfVar.f32797a = true;
            File file = (File) yeVar.a(uri, lfVar);
            return file.exists() ? file.isFile() ? file.canRead() ? file.canWrite() ? d(file, iOException, str) : d(file, iOException, str) : file.canWrite() ? d(file, iOException, str) : d(file, iOException, str) : file.canRead() ? file.canWrite() ? d(file, iOException, str) : d(file, iOException, str) : file.canWrite() ? d(file, iOException, str) : d(file, iOException, str) : d(file, iOException, str);
        } catch (IOException unused) {
            return new IOException(iOException);
        }
    }

    public static void b(Object obj, String str) {
        if (obj == null) {
            throw new NullPointerException(str.concat(" must not be null"));
        }
    }

    public static f6 c(s1 s1Var, j8 j8Var, ArrayList arrayList, boolean z11) {
        f6 f6VarA;
        gh.f(1, "reduce", arrayList);
        gh.g(2, "reduce", arrayList);
        f6 f6VarE = ((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(0));
        if (!(f6VarE instanceof t4)) {
            throw new IllegalArgumentException("Callback should be a method");
        }
        if (arrayList.size() == 2) {
            f6VarA = ((l6) j8Var.f32683c).e(j8Var, (f6) arrayList.get(1));
            if (f6VarA instanceof x2) {
                throw new IllegalArgumentException("Failed to parse initial value");
            }
        } else {
            if (s1Var.j() == 0) {
                throw new IllegalStateException("Empty array with no initial value error");
            }
            f6VarA = null;
        }
        t4 t4Var = (t4) f6VarE;
        int iJ = s1Var.j();
        int i5 = z11 ? 0 : iJ - 1;
        int i11 = z11 ? iJ - 1 : 0;
        int i12 = true == z11 ? 1 : -1;
        if (f6VarA == null) {
            f6VarA = s1Var.k(i5);
            i5 += i12;
        }
        while ((i11 - i5) * i12 >= 0) {
            if (s1Var.n(i5)) {
                f6VarA = t4Var.a(j8Var, Arrays.asList(f6VarA, s1Var.k(i5), new s3(Double.valueOf(i5)), s1Var));
                if (f6VarA instanceof x2) {
                    throw new IllegalStateException("Reduce operation failed");
                }
                i5 += i12;
            } else {
                i5 += i12;
            }
        }
        return f6VarA;
    }

    public static IOException d(File file, IOException iOException, String str) {
        File parentFile = file.getParentFile();
        if (parentFile != null && parentFile.exists()) {
            return parentFile.isDirectory() ? parentFile.canRead() ? parentFile.canWrite() ? f(file, iOException, str) : f(file, iOException, str) : parentFile.canWrite() ? f(file, iOException, str) : f(file, iOException, str) : parentFile.canRead() ? parentFile.canWrite() ? f(file, iOException, str) : f(file, iOException, str) : parentFile.canWrite() ? f(file, iOException, str) : f(file, iOException, str);
        }
        return f(file, iOException, str);
    }

    public static s1 e(s1 s1Var, j8 j8Var, e6 e6Var, Boolean bool, Boolean bool2) {
        s1 s1Var2 = new s1();
        Iterator itH = s1Var.h();
        while (itH.hasNext()) {
            int iIntValue = ((Integer) itH.next()).intValue();
            if (s1Var.n(iIntValue)) {
                f6 f6VarA = e6Var.a(j8Var, Arrays.asList(s1Var.k(iIntValue), new s3(Double.valueOf(iIntValue)), s1Var));
                if (f6VarA.zze().equals(bool)) {
                    break;
                }
                if (bool2 == null || f6VarA.zze().equals(bool2)) {
                    s1Var2.l(iIntValue, f6VarA);
                }
            }
        }
        return s1Var2;
    }

    public static IOException f(File file, IOException iOException, String str) throws IOException {
        String strConcat;
        try {
            Locale locale = Locale.US;
            String str2 = " canonical[" + file.getCanonicalPath() + "] freeSpace[" + file.getFreeSpace() + "] protoName[" + str + "]";
            StringBuilder sb2 = new StringBuilder(str2.length() + 16);
            sb2.append("Inoperable file:");
            sb2.append(str2);
            strConcat = sb2.toString();
            try {
                String str3 = " mode[" + Os.stat(file.getCanonicalPath()).st_mode + "]";
                StringBuilder sb3 = new StringBuilder(strConcat.length() + str3.length());
                sb3.append(strConcat);
                sb3.append(str3);
                strConcat = sb3.toString();
            } catch (Exception unused) {
            }
        } catch (IOException unused2) {
            strConcat = "Inoperable file:".concat(" failed");
        }
        return new IOException(strConcat, iOException);
    }

    public static final void g(Level level, Executor executor, Exception exc, String str, Object... objArr) {
        eb ebVar = new eb(level, exc, str, objArr, 1);
        int i5 = bh.f32414a;
        executor.execute(new ah(new Ref.ObjectRef(), jg.a(), ebVar));
    }

    public static cl.s h(Context context, Callable callable, Executor executor) {
        d2 d2Var = new d2(callable, 8);
        if (i(context)) {
            cl.p1 p1Var = new cl.p1();
            p1Var.f20059h = new cl.n1(p1Var, d2Var);
            executor.execute(p1Var);
            return p1Var;
        }
        cl.m1 m1Var = new cl.m1();
        AtomicBoolean atomicBoolean = new AtomicBoolean();
        db dbVar = new db(atomicBoolean, context, m1Var, d2Var, executor);
        context.registerReceiver(dbVar, new IntentFilter("android.intent.action.USER_UNLOCKED"));
        if (!i(context) || !atomicBoolean.compareAndSet(false, true)) {
            m1Var.b(new eb(m1Var, atomicBoolean, context, dbVar, 0), cl.m0.f20038a);
            return m1Var;
        }
        try {
            context.unregisterReceiver(dbVar);
        } catch (IllegalArgumentException e3) {
            Log.w("DirectBootUtils", "Failed to unregister receiver", e3);
        }
        cl.p1 p1Var2 = new cl.p1();
        p1Var2.f20059h = new cl.n1(p1Var2, d2Var);
        executor.execute(p1Var2);
        m1Var.p(p1Var2);
        return m1Var;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x003b, code lost:
    
        r5 = true;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean i(Context context) {
        boolean z11;
        if (f32531b) {
            return true;
        }
        synchronized (fb.class) {
            try {
                if (f32531b) {
                    return true;
                }
                int i5 = 1;
                while (true) {
                    z11 = false;
                    if (i5 > 2) {
                        break;
                    }
                    if (f32530a == null) {
                        f32530a = (UserManager) context.getSystemService(UserManager.class);
                    }
                    UserManager userManager = f32530a;
                    if (userManager == null) {
                        z11 = true;
                        break;
                    }
                    try {
                        if (userManager.isUserUnlocked()) {
                            break;
                        }
                        if (!userManager.isUserRunning(Process.myUserHandle())) {
                            break;
                        }
                    } catch (NullPointerException e3) {
                        Log.w("DirectBootUtils", "Failed to check if user is unlocked.", e3);
                        f32530a = null;
                        i5++;
                    }
                }
                if (z11) {
                    f32530a = null;
                }
                if (z11) {
                    f32531b = true;
                }
                return z11;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
