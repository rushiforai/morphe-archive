package j$.util.stream;

import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class q2 extends i2 implements f2 {
    @Override // j$.util.stream.f2
    public final Object b() {
        long j = this.c;
        if (j >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            return null;
        }
        Object objNewArray = newArray((int) j);
        f(0, objNewArray);
        return objNewArray;
    }

    @Override // j$.util.stream.f2
    public final void f(int i, Object obj) {
        g2 g2Var = this.a;
        ((f2) g2Var).f(i, obj);
        ((f2) this.b).f(i + ((int) ((f2) g2Var).count()), obj);
    }

    @Override // j$.util.stream.f2
    public final void g(Object obj) {
        ((f2) this.a).g(obj);
        ((f2) this.b).g(obj);
    }

    @Override // j$.util.stream.g2
    public final /* synthetic */ Object[] m(IntFunction intFunction) {
        return v3.m(this, intFunction);
    }

    public final String toString() {
        long j = this.c;
        return j < 32 ? String.format("%s[%s.%s]", getClass().getName(), this.a, this.b) : String.format("%s[size=%d]", getClass().getName(), Long.valueOf(j));
    }
}
