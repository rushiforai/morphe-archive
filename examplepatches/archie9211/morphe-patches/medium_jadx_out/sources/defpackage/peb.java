package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class peb implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ sfb b;
    public final /* synthetic */ veb c;
    public final /* synthetic */ r28 d;

    public /* synthetic */ peb(sfb sfbVar, veb vebVar, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = sfbVar;
        this.c = vebVar;
        this.d = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) throws IOException {
        int i = this.a;
        c1e c1eVar = c1e.a;
        r28 r28Var = this.d;
        veb vebVar = this.c;
        sfb sfbVar = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                ep7.g(sfbVar, vebVar, r28Var, x12Var, tr7.y(1));
                break;
            default:
                ep7.h(sfbVar, vebVar, r28Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }
}
