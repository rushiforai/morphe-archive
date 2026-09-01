package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eb7 implements al7 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ Map c;
    public final /* synthetic */ x45 d;
    public final /* synthetic */ x45 e;
    public final /* synthetic */ fb7 f;

    public eb7(int i, int i2, Map map, x45 x45Var, x45 x45Var2, fb7 fb7Var) {
        this.a = i;
        this.b = i2;
        this.c = map;
        this.d = x45Var;
        this.e = x45Var2;
        this.f = fb7Var;
    }

    @Override // defpackage.al7
    public final int a() {
        return this.b;
    }

    @Override // defpackage.al7
    public final int b() {
        return this.a;
    }

    @Override // defpackage.al7
    public final Map c() {
        return this.c;
    }

    @Override // defpackage.al7
    public final void d() {
        this.e.invoke(this.f.l);
    }

    @Override // defpackage.al7
    public final x45 e() {
        return this.d;
    }
}
