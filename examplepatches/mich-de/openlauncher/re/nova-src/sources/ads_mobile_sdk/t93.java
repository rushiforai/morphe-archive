package ads_mobile_sdk;

import b.x3;
import java.lang.reflect.Method;

/* loaded from: classes2.dex */
public abstract class t93 implements b.o9 {

    /* renamed from: a, reason: collision with root package name */
    public final String f9811a;

    /* renamed from: b, reason: collision with root package name */
    public final String f9812b;

    /* renamed from: c, reason: collision with root package name */
    public final rp1 f9813c;

    /* renamed from: d, reason: collision with root package name */
    public final x3 f9814d;

    /* renamed from: e, reason: collision with root package name */
    public final sh3 f9815e;

    public t93(String str, String str2, x3 x3Var, rp1 rp1Var, sh3 sh3Var) {
        this.f9811a = str;
        this.f9812b = str2;
        this.f9814d = x3Var;
        this.f9813c = rp1Var;
        this.f9815e = sh3Var;
    }

    public abstract void a(Method method, x3 x3Var);

    @Override // java.util.concurrent.Callable
    public final Object call() {
        sh3 sh3Var = this.f9815e;
        try {
            sh3Var.b();
            Method methodA = this.f9813c.a(this.f9811a, this.f9812b);
            if (methodA != null) {
                a(methodA, this.f9814d);
            }
            sh3Var.a();
            return null;
        } finally {
        }
    }
}
