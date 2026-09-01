package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ft5 implements ct5 {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ ft5(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.ct5
    public final Object a(jt5 jt5Var, hz2 hz2Var, p92 p92Var) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((hf6) ((ms) obj).c).f(jt5Var, p92Var);
            default:
                jt5 jt5VarA = jt5.a(jt5Var);
                ArrayList arrayList = jt5VarA.c;
                arrayList.addAll((ArrayList) obj);
                return hz2Var.c(new jt5(jt5VarA.a, jt5VarA.b, arrayList, jt5VarA.d, jt5VarA.e), p92Var);
        }
    }

    @Override // defpackage.ct5
    public final void dispose() {
        int i = this.a;
    }

    private final void b() {
    }

    private final void c() {
    }
}
