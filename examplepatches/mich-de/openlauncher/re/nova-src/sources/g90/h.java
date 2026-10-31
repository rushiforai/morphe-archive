package g90;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class h implements InvocationHandler {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f57259a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f57260b;

    /* renamed from: c, reason: collision with root package name */
    public String f57261c;

    public h(ArrayList arrayList) {
        this.f57259a = arrayList;
    }

    @Override // java.lang.reflect.InvocationHandler
    public final Object invoke(Object proxy, Method method, Object[] objArr) {
        Intrinsics.g(proxy, "proxy");
        Intrinsics.g(method, "method");
        if (objArr == null) {
            objArr = new Object[0];
        }
        String name = method.getName();
        Class<?> returnType = method.getReturnType();
        if (Intrinsics.b(name, "supports") && Intrinsics.b(Boolean.TYPE, returnType)) {
            return Boolean.TRUE;
        }
        if (Intrinsics.b(name, "unsupported") && Intrinsics.b(Void.TYPE, returnType)) {
            this.f57260b = true;
            return null;
        }
        boolean zB = Intrinsics.b(name, "protocols");
        ArrayList arrayList = this.f57259a;
        if (zB && objArr.length == 0) {
            return arrayList;
        }
        if ((Intrinsics.b(name, "selectProtocol") || Intrinsics.b(name, "select")) && String.class.equals(returnType) && objArr.length == 1) {
            Object obj = objArr[0];
            if (obj instanceof List) {
                List list = (List) obj;
                int size = list.size();
                if (size >= 0) {
                    int i5 = 0;
                    while (true) {
                        Object obj2 = list.get(i5);
                        Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.String");
                        String str = (String) obj2;
                        if (!arrayList.contains(str)) {
                            if (i5 == size) {
                                break;
                            }
                            i5++;
                        } else {
                            this.f57261c = str;
                            return str;
                        }
                    }
                }
                String str2 = (String) arrayList.get(0);
                this.f57261c = str2;
                return str2;
            }
        }
        if ((!Intrinsics.b(name, "protocolSelected") && !Intrinsics.b(name, "selected")) || objArr.length != 1) {
            return method.invoke(this, Arrays.copyOf(objArr, objArr.length));
        }
        Object obj3 = objArr[0];
        Intrinsics.e(obj3, "null cannot be cast to non-null type kotlin.String");
        this.f57261c = (String) obj3;
        return null;
    }
}
