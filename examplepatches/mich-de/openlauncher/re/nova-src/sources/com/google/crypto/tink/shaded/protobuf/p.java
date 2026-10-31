package com.google.crypto.tink.shaded.protobuf;

import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public static volatile p f34639a;

    /* renamed from: b, reason: collision with root package name */
    public static final p f34640b;

    static {
        p pVar = new p();
        Map map = Collections.EMPTY_MAP;
        f34640b = pVar;
    }

    public static p a() {
        p pVar;
        u0 u0Var = u0.f34670c;
        p pVar2 = f34639a;
        if (pVar2 != null) {
            return pVar2;
        }
        synchronized (p.class) {
            try {
                pVar = f34639a;
                if (pVar == null) {
                    Class cls = o.f34637a;
                    p pVar3 = null;
                    if (cls != null) {
                        try {
                            pVar3 = (p) cls.getDeclaredMethod("getEmptyRegistry", null).invoke(null, null);
                        } catch (Exception unused) {
                        }
                    }
                    pVar = pVar3 != null ? pVar3 : f34640b;
                    f34639a = pVar;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return pVar;
    }
}
