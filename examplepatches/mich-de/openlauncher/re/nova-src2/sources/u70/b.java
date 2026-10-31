package u70;

import android.os.Build;
import java.lang.Thread;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import kotlin.coroutines.AbstractCoroutineContextElement;
import kotlin.coroutines.CoroutineContext;
import org.jetbrains.annotations.Nullable;
import t70.e0;
import t70.f0;

/* loaded from: classes5.dex */
public final class b extends AbstractCoroutineContextElement implements f0 {

    @Nullable
    private volatile Object _preHandler;

    public b() {
        super(e0.f88787a);
        this._preHandler = this;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x002b  */
    @Override // t70.f0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void handleException(CoroutineContext coroutineContext, Throwable th2) {
        Method declaredMethod;
        if (Build.VERSION.SDK_INT < 28) {
            Object obj = this._preHandler;
            if (obj != this) {
                declaredMethod = (Method) obj;
            } else {
                try {
                    declaredMethod = Thread.class.getDeclaredMethod("getUncaughtExceptionPreHandler", null);
                } catch (Throwable unused) {
                }
                if (Modifier.isPublic(declaredMethod.getModifiers())) {
                    if (!Modifier.isStatic(declaredMethod.getModifiers())) {
                        declaredMethod = null;
                    }
                    this._preHandler = declaredMethod;
                }
            }
            Object objInvoke = declaredMethod != null ? declaredMethod.invoke(null, null) : null;
            Thread.UncaughtExceptionHandler uncaughtExceptionHandler = objInvoke instanceof Thread.UncaughtExceptionHandler ? (Thread.UncaughtExceptionHandler) objInvoke : null;
            if (uncaughtExceptionHandler != null) {
                uncaughtExceptionHandler.uncaughtException(Thread.currentThread(), th2);
            }
        }
    }
}
