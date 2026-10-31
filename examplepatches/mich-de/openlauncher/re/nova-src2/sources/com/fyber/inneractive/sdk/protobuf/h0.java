package com.fyber.inneractive.sdk.protobuf;

import java.util.Collections;
import java.util.Map;

/* loaded from: classes3.dex */
public final class h0 {

    /* renamed from: b, reason: collision with root package name */
    public static volatile h0 f30811b;

    /* renamed from: c, reason: collision with root package name */
    public static final h0 f30812c = new h0();

    /* renamed from: a, reason: collision with root package name */
    public final Map f30813a = Collections.EMPTY_MAP;

    public static h0 a() {
        h0 h0Var;
        h0 h0Var2 = f30811b;
        if (h0Var2 != null) {
            return h0Var2;
        }
        synchronized (h0.class) {
            h0Var = f30811b;
            if (h0Var == null) {
                Class cls = f0.f30801a;
                h0 h0Var3 = null;
                if (cls != null) {
                    try {
                        h0Var3 = (h0) cls.getDeclaredMethod("getEmptyRegistry", null).invoke(null, null);
                    } catch (Exception unused) {
                    }
                }
                h0Var = h0Var3 != null ? h0Var3 : f30812c;
                f30811b = h0Var;
            }
        }
        return h0Var;
    }

    public final x0 a(int i5, d2 d2Var) {
        return (x0) this.f30813a.get(new g0(i5, d2Var));
    }
}
