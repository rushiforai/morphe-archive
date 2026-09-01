package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bi3 extends co6 implements m45 {
    public final /* synthetic */ boolean a;
    public final /* synthetic */ epb b;
    public final /* synthetic */ String c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bi3(boolean z, epb epbVar, String str) {
        super(0);
        this.a = z;
        this.b = epbVar;
        this.c = str;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        if (this.a) {
            epb epbVar = this.b;
            String str = this.c;
            gpb gpbVar = epbVar.a;
            synchronized (gpbVar.c) {
            }
        }
        return c1e.a;
    }
}
