package n7;

import java.lang.reflect.InvocationTargetException;
import org.chromium.support_lib_boundary.WebViewProviderFactoryBoundaryInterface;

/* loaded from: classes.dex */
public abstract class y {

    /* renamed from: a, reason: collision with root package name */
    public static final b0 f77965a;

    static {
        b0 fVar;
        try {
            fVar = new c0((WebViewProviderFactoryBoundaryInterface) u90.b.i(WebViewProviderFactoryBoundaryInterface.class, u90.b.A()));
        } catch (ClassNotFoundException unused) {
            fVar = new f();
        } catch (IllegalAccessException | NoSuchMethodException | InvocationTargetException e3) {
            throw new RuntimeException(e3);
        }
        f77965a = fVar;
    }
}
