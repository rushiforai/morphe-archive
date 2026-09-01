package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ve7 extends p4d implements c55 {
    public /* synthetic */ boolean b;
    public /* synthetic */ boolean c;

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        boolean zBooleanValue2 = ((Boolean) obj2).booleanValue();
        ve7 ve7Var = new ve7(3, (n92) obj3);
        ve7Var.b = zBooleanValue;
        ve7Var.c = zBooleanValue2;
        return ve7Var.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        float f;
        boolean z = this.b;
        boolean z2 = this.c;
        br7.v(obj);
        if (z2) {
            hl0 hl0Var = as7.a;
            f = 56.0f;
        } else {
            f = 0.0f;
        }
        if (z) {
            hl0 hl0Var2 = as7.a;
            f += 64.0f;
        }
        return new vj3(f);
    }
}
