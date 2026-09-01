package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ip0 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ sb2 b;
    public final /* synthetic */ pod c;

    public /* synthetic */ ip0(sb2 sb2Var, pod podVar, int i) {
        this.a = i;
        this.b = sb2Var;
        this.c = podVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        pod podVar = this.c;
        sb2 sb2Var = this.b;
        switch (i) {
            case 0:
                vx0.c0(sb2Var, null, null, new kp0(podVar, null, 0), 3);
                break;
            case 1:
                vx0.c0(sb2Var, null, null, new kp0(podVar, null, 2), 3);
                break;
            default:
                vx0.c0(sb2Var, null, null, new kp0(podVar, null, 3), 3);
                break;
        }
        return c1eVar;
    }
}
