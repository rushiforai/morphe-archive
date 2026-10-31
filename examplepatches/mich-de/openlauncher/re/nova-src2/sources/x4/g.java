package x4;

import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Trace;
import com.amplitude.core.events.Identify;
import java.util.List;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import z.c1;
import z.x;

/* loaded from: classes2.dex */
public abstract class g {

    /* renamed from: a, reason: collision with root package name */
    public static final x f95081a = new x(16);

    /* renamed from: b, reason: collision with root package name */
    public static final ThreadPoolExecutor f95082b;

    /* renamed from: c, reason: collision with root package name */
    public static final Object f95083c;

    /* renamed from: d, reason: collision with root package name */
    public static final c1 f95084d;

    static {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(0, 1, 10000, TimeUnit.MILLISECONDS, new LinkedBlockingDeque(), new o80.c(3));
        threadPoolExecutor.allowCoreThreadTimeOut(true);
        f95082b = threadPoolExecutor;
        f95083c = new Object();
        f95084d = new c1(0);
    }

    public static String a(int i5, List list) {
        StringBuilder sb2 = new StringBuilder();
        for (int i11 = 0; i11 < list.size(); i11++) {
            sb2.append(((c) list.get(i11)).f95071e);
            sb2.append(Identify.UNSET_VALUE);
            sb2.append(i5);
            if (i11 < list.size() - 1) {
                sb2.append(";");
            }
        }
        return sb2.toString();
    }

    /* JADX WARN: Code restructure failed: missing block: B:59:0x00b5, code lost:
    
        r8 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x00b9, code lost:
    
        throw r8;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static f b(String str, Context context, List list, int i5) {
        int i11;
        Typeface typefaceL;
        x xVar = f95081a;
        t2.c.o("getFontSync");
        try {
            Typeface typeface = (Typeface) xVar.c(str);
            if (typeface != null) {
                return new f(typeface);
            }
            ag.b bVarA = b.a(context, list);
            List list2 = bVarA.f12781b;
            int i12 = bVarA.f12780a;
            if (i12 != 0) {
                i11 = i12 != 1 ? -3 : -2;
            } else {
                h[] hVarArr = (h[]) list2.get(0);
                if (hVarArr == null || hVarArr.length == 0) {
                    i11 = 1;
                } else {
                    int length = hVarArr.length;
                    int i13 = 0;
                    while (true) {
                        if (i13 >= length) {
                            i11 = 0;
                            break;
                        }
                        int i14 = hVarArr[i13].f95089e;
                        if (i14 == 0) {
                            i13++;
                        } else if (i14 >= 0) {
                            i11 = i14;
                        }
                    }
                }
            }
            if (i11 != 0) {
                return new f(i11);
            }
            if (list2.size() <= 1 || Build.VERSION.SDK_INT < 29) {
                h[] hVarArr2 = (h[]) list2.get(0);
                p50.i iVar = r4.c.f85480a;
                t2.c.o("TypefaceCompat.createFromFontInfo");
                typefaceL = r4.c.f85480a.l(context, hVarArr2, i5);
                Trace.endSection();
            } else {
                p50.i iVar2 = r4.c.f85480a;
                t2.c.o("TypefaceCompat.createFromFontInfoWithFallback");
                typefaceL = r4.c.f85480a.m(context, list2, i5);
                Trace.endSection();
            }
            if (typefaceL == null) {
                return new f(-3);
            }
            xVar.d(str, typefaceL);
            return new f(typefaceL);
        } catch (PackageManager.NameNotFoundException unused) {
            return new f(-1);
        } catch (Throwable th2) {
            throw th2;
        } finally {
        }
    }
}
