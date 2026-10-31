package fa0;

import org.jf.dexlib2.MethodHandleType$InvalidMethodHandleTypeException;
import xk.o0;
import xk.q2;

/* loaded from: classes5.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final q2 f54567a;

    static {
        o0 o0Var = new o0(4);
        o0Var.w(0, "static-put");
        o0Var.w(1, "static-get");
        o0Var.w(2, "instance-put");
        o0Var.w(3, "instance-get");
        o0Var.w(4, "invoke-static");
        o0Var.w(5, "invoke-instance");
        o0Var.w(6, "invoke-constructor");
        o0Var.w(7, "invoke-direct");
        o0Var.w(8, "invoke-interface");
        f54567a = o0Var.d();
    }

    public static String a(int i5) {
        String str = (String) f54567a.get(Integer.valueOf(i5));
        if (str != null) {
            return str;
        }
        throw new MethodHandleType$InvalidMethodHandleTypeException(null, "Invalid method handle type: %d", Integer.valueOf(i5));
    }
}
