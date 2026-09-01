package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class bv7 implements zk1 {
    public final /* synthetic */ int a;
    public final String b;

    public /* synthetic */ bv7(String str, int i) {
        this.a = i;
        this.b = str;
    }

    @Override // defpackage.zk1
    public final /* bridge */ String b(g96 g96Var) {
        switch (this.a) {
        }
        return o7f.A(this, g96Var);
    }

    @Override // defpackage.zk1
    public final String getDescription() {
        int i = this.a;
        return this.b;
    }
}
