package defpackage;

import com.apollographql.apollo.exception.ApolloException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e31 implements q44 {
    public static final cd7 b = new cd7();
    public static final wz7 c = new wz7(13);
    public static final uob d = new uob(17);
    public final /* synthetic */ int a;

    public e31(long j, long j2, long j3, long j4, boolean z, ApolloException apolloException) {
        this.a = 1;
    }

    @Override // defpackage.s44
    public final /* synthetic */ s44 a(r44 r44Var) {
        int i = this.a;
        return ho2.b(this, r44Var);
    }

    @Override // defpackage.s44
    public final Object b(Object obj, p44 p44Var) {
        switch (this.a) {
        }
        return p44Var.invoke(obj, this);
    }

    @Override // defpackage.s44
    public final /* synthetic */ s44 c(s44 s44Var) {
        int i = this.a;
        return ho2.c(this, s44Var);
    }

    @Override // defpackage.s44
    public final /* synthetic */ q44 d(r44 r44Var) {
        int i = this.a;
        return ho2.a(this, r44Var);
    }

    @Override // defpackage.q44
    public final r44 getKey() {
        switch (this.a) {
            case 0:
                return b;
            case 1:
                return c;
            default:
                return d;
        }
    }

    public /* synthetic */ e31(int i) {
        this.a = i;
    }
}
