package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oeg extends aag {
    public final /* synthetic */ wfd b;
    public final /* synthetic */ q3g c;
    public final /* synthetic */ bmg d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oeg(bmg bmgVar, wfd wfdVar, wfd wfdVar2, q3g q3gVar) {
        super(wfdVar);
        this.b = wfdVar2;
        this.c = q3gVar;
        this.d = bmgVar;
    }

    @Override // defpackage.aag
    public final void a() {
        synchronized (this.d.f) {
            try {
                bmg bmgVar = this.d;
                wfd wfdVar = this.b;
                bmgVar.e.add(wfdVar);
                wfdVar.a.a(new zjf(bmgVar, wfdVar));
                if (this.d.k.getAndIncrement() > 0) {
                    this.d.b.h("Already connected to the service.", new Object[0]);
                }
                bmg.b(this.d, this.c);
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
