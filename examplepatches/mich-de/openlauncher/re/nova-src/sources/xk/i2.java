package xk;

import java.io.Serializable;

/* loaded from: classes.dex */
public final class i2 extends l2 implements Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final i2 f95937b = new i2(0);

    /* renamed from: c, reason: collision with root package name */
    public static final i2 f95938c = new i2(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f95939a;

    public /* synthetic */ i2(int i5) {
        this.f95939a = i5;
    }

    @Override // xk.l2
    public l2 b() {
        switch (this.f95939a) {
            case 0:
                return b3.f95872a;
            default:
                return super.b();
        }
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f95939a) {
            case 0:
                Comparable comparable = (Comparable) obj;
                Comparable comparable2 = (Comparable) obj2;
                comparable.getClass();
                comparable2.getClass();
                return comparable.compareTo(comparable2);
            default:
                n2 n2Var = (n2) obj;
                n2 n2Var2 = (n2) obj2;
                return g0.f95916a.c(n2Var.f95979a, n2Var2.f95979a).c(n2Var.f95980b, n2Var2.f95980b).f();
        }
    }

    public String toString() {
        switch (this.f95939a) {
            case 0:
                return "Ordering.natural()";
            default:
                return super.toString();
        }
    }
}
