package defpackage;

import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yn1 {
    public final int a;
    public final Method b;

    public yn1(int i, Method method) {
        this.a = i;
        this.b = method;
        method.setAccessible(true);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yn1)) {
            return false;
        }
        yn1 yn1Var = (yn1) obj;
        return this.a == yn1Var.a && this.b.getName().equals(yn1Var.b.getName());
    }

    public final int hashCode() {
        return this.b.getName().hashCode() + (this.a * 31);
    }
}
