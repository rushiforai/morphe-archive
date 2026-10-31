package a5;

import androidx.datastore.preferences.protobuf.InvalidProtocolBufferException;
import java.util.List;

/* loaded from: classes.dex */
public abstract class l1 {

    /* renamed from: a, reason: collision with root package name */
    public int f316a;

    /* renamed from: b, reason: collision with root package name */
    public Object f317b;

    public l1(int i5) {
        this.f316a = i5;
    }

    public abstract int A();

    public abstract long B();

    public abstract boolean C(int i5);

    public void E() {
        int iZ;
        do {
            iZ = z();
            if (iZ == 0) {
                return;
            }
            int i5 = this.f316a;
            if (i5 >= 100) {
                throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
            }
            this.f316a = i5 + 1;
            this.f316a--;
        } while (C(iZ));
    }

    public abstract void a(int i5);

    public abstract int b();

    public abstract boolean c();

    public void d(t1 t1Var) {
    }

    public void e() {
    }

    public abstract h2 f(h2 h2Var, List list);

    public c10.a g(t1 t1Var, c10.a aVar) {
        return aVar;
    }

    public abstract void h(int i5);

    public abstract int i(int i5);

    public abstract boolean j();

    public abstract androidx.datastore.preferences.protobuf.h k();

    public abstract double l();

    public abstract int m();

    public abstract int n();

    public abstract long o();

    public abstract float p();

    public abstract int q();

    public abstract long r();

    public abstract int s();

    public abstract long t();

    public abstract int v();

    public abstract long w();

    public abstract String x();

    public abstract String y();

    public abstract int z();
}
