package rv;

import com.stripe.android.stripe3ds2.init.Warning;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j extends l {

    /* renamed from: b, reason: collision with root package name */
    public static final Warning f86443b = new Warning("SW02", "The integrity of the SDK has been tampered.", m.f86447b);

    @Override // rv.l
    public final boolean a() throws SecurityException {
        Field[] declaredFields = vv.a.class.getDeclaredFields();
        Intrinsics.f(declaredFields, "getDeclaredFields(...)");
        ArrayList arrayList = new ArrayList();
        for (Field field : declaredFields) {
            if (!field.isSynthetic()) {
                arrayList.add(field);
            }
        }
        if (arrayList.size() != 8) {
            return true;
        }
        Method[] declaredMethods = vv.a.class.getDeclaredMethods();
        Intrinsics.f(declaredMethods, "getDeclaredMethods(...)");
        ArrayList arrayList2 = new ArrayList();
        for (Method method : declaredMethods) {
            if (!method.isSynthetic()) {
                arrayList2.add(method);
            }
        }
        return arrayList2.size() != 5;
    }
}
