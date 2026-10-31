package i6;

import h50.q;
import h6.a0;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import kotlin.Deprecated;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import p1.z2;

/* loaded from: classes.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final androidx.compose.runtime.e f61404a;

    /* JADX WARN: Code restructure failed: missing block: B:11:0x002d, code lost:
    
        r1 = r1.invoke(null, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0033, code lost:
    
        if ((r1 instanceof androidx.compose.runtime.e) == false) goto L7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0035, code lost:
    
        r1 = (androidx.compose.runtime.e) r1;
     */
    static {
        Object objA;
        try {
            int i5 = Result.f71687b;
            ClassLoader classLoader = a0.class.getClassLoader();
            Intrinsics.d(classLoader);
            Method method = classLoader.loadClass("androidx.compose.ui.platform.AndroidCompositionLocals_androidKt").getMethod("getLocalLifecycleOwner", null);
            Annotation[] annotations = method.getAnnotations();
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
        androidx.compose.runtime.e z2Var = (androidx.compose.runtime.e) (objA instanceof Result.Failure ? null : objA);
        if (z2Var == null) {
            z2Var = new z2(new q(4));
        }
        f61404a = z2Var;
    }
}
