package b7;

import a1.m;
import a7.h;
import androidx.compose.runtime.e;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import kotlin.Deprecated;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import p1.z2;

/* loaded from: classes2.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final e f17586a;

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0032, code lost:
    
        r1 = r1.invoke(null, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0038, code lost:
    
        if ((r1 instanceof androidx.compose.runtime.e) == false) goto L7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x003a, code lost:
    
        r1 = (androidx.compose.runtime.e) r1;
     */
    static {
        Object objA;
        try {
            int i5 = Result.f71687b;
            ClassLoader classLoader = h.class.getClassLoader();
            Intrinsics.d(classLoader);
            Method method = classLoader.loadClass("androidx.compose.ui.platform.AndroidCompositionLocals_androidKt").getMethod("getLocalSavedStateRegistryOwner", null);
            Annotation[] annotations = method.getAnnotations();
            Intrinsics.f(annotations, "getAnnotations(...)");
            int length = annotations.length;
            int i11 = 0;
            while (true) {
                if (i11 >= length) {
                    break;
                } else if (annotations[i11] instanceof Deprecated) {
                    break;
                } else {
                    i11++;
                }
            }
            objA = null;
        } catch (Throwable th2) {
            int i12 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        int i13 = Result.f71687b;
        e z2Var = (e) (objA instanceof Result.Failure ? null : objA);
        if (z2Var == null) {
            z2Var = new z2(new m(22));
        }
        f17586a = z2Var;
    }

    public static final e a() {
        return f17586a;
    }
}
