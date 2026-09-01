package defpackage;

import com.medium.proto.obv.post.DeltaType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class b1 {
    public final DeltaType a;
    public final z63 b;
    public z63 c;
    public boolean d;

    public b1(DeltaType deltaType, z63 z63Var) {
        deltaType.getClass();
        this.a = deltaType;
        this.b = z63Var;
    }

    public abstract z63 a(fb9 fb9Var);

    public abstract int b();

    public b1 c(b1 b1Var) {
        return null;
    }
}
