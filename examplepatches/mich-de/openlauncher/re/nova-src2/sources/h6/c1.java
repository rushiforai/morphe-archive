package h6;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.media.MediaDrm;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import com.teslacoilsw.launcher.NovaLauncher;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.TimeUnit;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.MutablePropertyReference1Impl;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.reflect.KMutableProperty1;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import w70.i2;

/* loaded from: classes.dex */
public abstract /* synthetic */ class c1 {
    public static void A(String str, String str2, String str3) {
        zy.c.i(str3, b70.k.e0(new Pair(str, str2)));
    }

    public static void B(boolean z11, i2 i2Var, Object obj) {
        Boolean boolValueOf = Boolean.valueOf(z11);
        i2Var.getClass();
        i2Var.k(obj, boolValueOf);
    }

    public static /* synthetic */ String C(int i5) {
        switch (i5) {
            case 1:
                return "NOT_REQUIRED";
            case 2:
                return "CONNECTED";
            case 3:
                return "UNMETERED";
            case 4:
                return "NOT_ROAMING";
            case 5:
                return "METERED";
            case 6:
                return "TEMPORARILY_UNMETERED";
            default:
                return AbstractJsonLexerKt.NULL;
        }
    }

    public static /* synthetic */ boolean a(int i5) {
        return i5 != 1 ? c(i5) : b(i5);
    }

    public static final boolean b(int i5) {
        return !jl.a.a();
    }

    public static final boolean c(int i5) {
        Boolean bool;
        if (jl.a.a()) {
            try {
                bool = (Boolean) Class.forName("org.conscrypt.Conscrypt").getMethod("isBoringSslFIPSBuild", null).invoke(null, null);
            } catch (Exception unused) {
                jl.a.f69593a.info("Conscrypt is not available or does not support checking for FIPS build.");
                bool = Boolean.FALSE;
            }
            if (!bool.booleanValue()) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ boolean d(int i5) {
        if (i5 == 1 || i5 == 2) {
            return true;
        }
        if (i5 == 3 || i5 == 4) {
            return false;
        }
        throw null;
    }

    public static /* synthetic */ boolean e(int i5) {
        if (i5 == 1) {
            return true;
        }
        if (i5 == 2) {
            return false;
        }
        if (i5 == 3) {
            return true;
        }
        if (i5 == 4) {
            return false;
        }
        throw null;
    }

    public static float f(float f11, float f12, float f13, float f14) {
        return (f13 - (f11 * f12)) / f14;
    }

    public static int g(float f11, float f12, float f13) {
        return Math.round((f11 + f12) * f13);
    }

    public static int h(Context context, int i5) {
        return bh.g.N(context.getResources().getDisplayMetrics(), i5);
    }

    public static int i(Bitmap bitmap, int i5, int i11) {
        return (bitmap.getRowBytes() * i5) + i11;
    }

    public static int j(NovaLauncher novaLauncher, int i5) {
        return bh.g.N(novaLauncher.getResources().getDisplayMetrics(), i5);
    }

    public static int k(Set set, int i5, int i11) {
        return (set.hashCode() + i5) * i11;
    }

    public static Object l(ArrayList arrayList, int i5) {
        return arrayList.get(arrayList.size() - i5);
    }

    public static String m(char c11, String str, String str2) {
        return str + str2 + c11;
    }

    public static String n(int i5, String str, String str2, int i11, String str3) {
        return str + i5 + str2 + i11 + str3;
    }

    public static String o(long j11, String str, String str2) {
        return str + j11 + str2;
    }

    public static String p(Uri uri, String str) {
        return str + uri;
    }

    public static String q(File file, String str) {
        return str + file;
    }

    public static String r(Class cls, String str) {
        return str + cls;
    }

    public static String s(Exception exc, StringBuilder sb2) {
        sb2.append(exc.getMessage());
        return sb2.toString();
    }

    public static String t(StringBuilder sb2, String str, char c11) {
        sb2.append(str);
        sb2.append(c11);
        return sb2.toString();
    }

    public static String u(ReflectionFactory reflectionFactory, Class cls, StringBuilder sb2) {
        sb2.append(reflectionFactory.getOrCreateKotlinClass(cls));
        return sb2.toString();
    }

    public static KMutableProperty1 v(Class cls, String str, String str2, int i5, ReflectionFactory reflectionFactory) {
        return reflectionFactory.mutableProperty1(new MutablePropertyReference1Impl(cls, str, str2, i5));
    }

    public static /* synthetic */ void w(int i5) {
        if (i5 != 0) {
            return;
        }
        NullPointerException nullPointerException = new NullPointerException();
        Intrinsics.l(nullPointerException, Intrinsics.class.getName());
        throw nullPointerException;
    }

    public static void x(int i5, HashMap map, String str, int i11, String str2) {
        map.put(str, Integer.valueOf(i5));
        map.put(str2, Integer.valueOf(i11));
    }

    public static void y(int i5, x1.e eVar, p1.t tVar, boolean z11) {
        eVar.invoke(tVar, Integer.valueOf(i5));
        tVar.p(z11);
    }

    public static /* synthetic */ void z(AutoCloseable autoCloseable) throws Exception {
        boolean zIsTerminated;
        if (autoCloseable instanceof AutoCloseable) {
            autoCloseable.close();
            return;
        }
        if (!(autoCloseable instanceof ExecutorService)) {
            if (autoCloseable instanceof TypedArray) {
                ((TypedArray) autoCloseable).recycle();
                return;
            } else if (autoCloseable instanceof MediaMetadataRetriever) {
                ((MediaMetadataRetriever) autoCloseable).release();
                return;
            } else {
                if (!(autoCloseable instanceof MediaDrm)) {
                    throw new IllegalArgumentException();
                }
                ((MediaDrm) autoCloseable).release();
                return;
            }
        }
        ExecutorService executorService = (ExecutorService) autoCloseable;
        if (executorService == ForkJoinPool.commonPool() || (zIsTerminated = executorService.isTerminated())) {
            return;
        }
        executorService.shutdown();
        boolean z11 = false;
        while (!zIsTerminated) {
            try {
                zIsTerminated = executorService.awaitTermination(1L, TimeUnit.DAYS);
            } catch (InterruptedException unused) {
                if (!z11) {
                    executorService.shutdownNow();
                    z11 = true;
                }
            }
        }
        if (z11) {
            Thread.currentThread().interrupt();
        }
    }
}
