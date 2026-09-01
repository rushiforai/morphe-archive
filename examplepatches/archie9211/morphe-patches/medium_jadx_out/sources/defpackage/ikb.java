package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ikb extends e1 {
    public int c;
    public int d;
    public final /* synthetic */ jkb e;

    public ikb(jkb jkbVar) {
        this.e = jkbVar;
        this.c = jkbVar.d;
        this.d = jkbVar.c;
    }

    @Override // defpackage.e1
    public final void a() {
        int i = this.c;
        if (i == 0) {
            this.a = 2;
            return;
        }
        jkb jkbVar = this.e;
        Object[] objArr = jkbVar.a;
        int i2 = this.d;
        this.b = objArr[i2];
        this.a = 1;
        this.d = (i2 + 1) % jkbVar.b;
        this.c = i - 1;
    }
}
