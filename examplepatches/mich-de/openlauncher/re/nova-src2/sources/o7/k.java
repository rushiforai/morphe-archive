package o7;

import java.lang.reflect.InvocationTargetException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final String f79675a;

    static {
        String strE = r.e("InputMerger");
        Intrinsics.f(strE, "tagWithPrefix(\"InputMerger\")");
        f79675a = strE;
    }

    public static final j a(String className) throws IllegalAccessException, InstantiationException, IllegalArgumentException, InvocationTargetException {
        Intrinsics.g(className, "className");
        try {
            Object objNewInstance = Class.forName(className).getDeclaredConstructor(null).newInstance(null);
            Intrinsics.e(objNewInstance, "null cannot be cast to non-null type androidx.work.InputMerger");
            return (j) objNewInstance;
        } catch (Exception e3) {
            r.c().b(f79675a, "Trouble instantiating ".concat(className), e3);
            return null;
        }
    }
}
