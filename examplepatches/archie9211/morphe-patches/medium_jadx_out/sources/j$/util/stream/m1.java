package j$.util.stream;

import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class m1 implements Supplier {
    public final /* synthetic */ int a;
    public final /* synthetic */ s1 b;

    public /* synthetic */ m1(s1 s1Var, int i) {
        this.a = i;
        this.b = s1Var;
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        switch (this.a) {
            case 0:
                return new p1(this.b);
            case 1:
                return new o1(this.b);
            default:
                return new q1(this.b);
        }
    }
}
