package com.google.protobuf;

import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class y {

    /* renamed from: b, reason: collision with root package name */
    public static volatile y f35004b;

    /* renamed from: c, reason: collision with root package name */
    public static final y f35005c = new y();

    /* renamed from: a, reason: collision with root package name */
    public final Map f35006a = Collections.EMPTY_MAP;

    public static y b() {
        y yVar;
        x1 x1Var = x1.f35001c;
        y yVar2 = f35004b;
        if (yVar2 != null) {
            return yVar2;
        }
        synchronized (y.class) {
            try {
                yVar = f35004b;
                if (yVar == null) {
                    Class cls = w.f34996a;
                    y yVar3 = null;
                    if (cls != null) {
                        try {
                            yVar3 = (y) cls.getDeclaredMethod("getEmptyRegistry", null).invoke(null, null);
                        } catch (Exception unused) {
                        }
                    }
                    yVar = yVar3 != null ? yVar3 : f35005c;
                    f35004b = yVar;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return yVar;
    }

    public final l0 a(int i5, o1 o1Var) {
        return (l0) this.f35006a.get(new x(i5, o1Var));
    }
}
