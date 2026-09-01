package defpackage;

import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Trace;
import java.util.List;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class rz4 {
    public static final bd7 a = new bd7(16);
    public static final ThreadPoolExecutor b;
    public static final Object c;
    public static final aec d;

    static {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(0, 1, 10000L, TimeUnit.MILLISECONDS, new LinkedBlockingDeque(), new kjc(2));
        threadPoolExecutor.allowCoreThreadTimeOut(true);
        b = threadPoolExecutor;
        c = new Object();
        d = new aec(0);
    }

    public static String a(int i, List list) {
        StringBuilder sb = new StringBuilder();
        for (int i2 = 0; i2 < list.size(); i2++) {
            sb.append(((lz4) list.get(i2)).g);
            sb.append("-");
            sb.append(i);
            if (i2 < list.size() - 1) {
                sb.append(";");
            }
        }
        return sb.toString();
    }

    public static qz4 b(String str, Context context, List list, int i) {
        int i2;
        Typeface typefaceR;
        bd7 bd7Var = a;
        Trace.beginSection(gq7.X("getFontSync"));
        try {
            Typeface typeface = (Typeface) bd7Var.h(str);
            if (typeface != null) {
                return new qz4(typeface);
            }
            f05 f05VarA = kz4.a(context, list);
            List list2 = f05VarA.b;
            int i3 = f05VarA.a;
            if (i3 != 0) {
                i2 = i3 != 1 ? -3 : -2;
            } else {
                g05[] g05VarArr = (g05[]) list2.get(0);
                if (g05VarArr == null || g05VarArr.length == 0) {
                    i2 = 1;
                } else {
                    int length = g05VarArr.length;
                    int i4 = 0;
                    while (true) {
                        if (i4 >= length) {
                            i2 = 0;
                            break;
                        }
                        int i5 = g05VarArr[i4].f;
                        if (i5 == 0) {
                            i4++;
                        } else if (i5 >= 0) {
                            i2 = i5;
                        }
                    }
                }
            }
            if (i2 != 0) {
                return new qz4(i2);
            }
            if (list2.size() <= 1 || Build.VERSION.SDK_INT < 29) {
                g05[] g05VarArr2 = (g05[]) list2.get(0);
                il7 il7Var = txd.a;
                Trace.beginSection(gq7.X("TypefaceCompat.createFromFontInfo"));
                typefaceR = txd.a.r(context, g05VarArr2, i);
                Trace.endSection();
            } else {
                il7 il7Var2 = txd.a;
                Trace.beginSection(gq7.X("TypefaceCompat.createFromFontInfoWithFallback"));
                typefaceR = txd.a.s(context, list2, i);
                Trace.endSection();
            }
            if (typefaceR == null) {
                return new qz4(-3);
            }
            bd7Var.l(str, typefaceR);
            return new qz4(typefaceR);
        } catch (PackageManager.NameNotFoundException unused) {
            return new qz4(-1);
        } catch (Throwable th) {
            throw th;
        } finally {
            Trace.endSection();
        }
    }
}
