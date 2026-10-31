package kl;

import h6.c1;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes.dex */
public final class a0 {

    /* renamed from: b, reason: collision with root package name */
    public static final a0 f71564b = new a0();

    /* renamed from: a, reason: collision with root package name */
    public final AtomicReference f71565a = new AtomicReference(new n0(new ab.c0(3)));

    public final synchronized void a(k0 k0Var) {
        ab.c0 c0Var = new ab.c0((n0) this.f71565a.get());
        c0Var.f(k0Var);
        this.f71565a.set(new n0(c0Var));
    }

    public final synchronized void b(o0 o0Var) {
        ab.c0 c0Var = new ab.c0((n0) this.f71565a.get());
        HashMap map = (HashMap) c0Var.f692c;
        Class clsB = o0Var.b();
        if (map.containsKey(clsB)) {
            o0 o0Var2 = (o0) map.get(clsB);
            if (!o0Var2.equals(o0Var) || !o0Var.equals(o0Var2)) {
                throw new GeneralSecurityException(c1.r(clsB, "Attempt to register non-equal PrimitiveWrapper object or input class object for already existing object of type"));
            }
        } else {
            map.put(clsB, o0Var);
        }
        this.f71565a.set(new n0(c0Var));
    }
}
