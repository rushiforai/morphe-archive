package ads_mobile_sdk;

import b.k9;
import java.lang.reflect.Method;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

/* loaded from: classes2.dex */
public final class tn3 extends k9 {

    /* renamed from: a, reason: collision with root package name */
    public static final Method f10018a;

    static {
        Method method;
        try {
            method = String.class.getMethod("encodedLength", Charset.class);
        } catch (ReflectiveOperationException unused) {
            method = null;
        }
        f10018a = method;
    }

    @Override // b.k9
    public final int a(String str) {
        try {
            return ((Integer) f10018a.invoke(str, StandardCharsets.UTF_8)).intValue();
        } catch (ReflectiveOperationException e3) {
            throw new IllegalStateException(e3);
        }
    }
}
