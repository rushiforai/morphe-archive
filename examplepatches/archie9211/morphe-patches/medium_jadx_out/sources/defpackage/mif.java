package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mif extends kif {
    public final /* synthetic */ wfd b;
    public final /* synthetic */ ohf c;
    public final /* synthetic */ mgf d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mif(mgf mgfVar, wfd wfdVar, wfd wfdVar2, ohf ohfVar) {
        super(wfdVar);
        this.b = wfdVar2;
        this.c = ohfVar;
        this.d = mgfVar;
    }

    @Override // defpackage.kif
    public final void b() {
        synchronized (this.d.f) {
            try {
                mgf mgfVar = this.d;
                wfd wfdVar = this.b;
                mgfVar.e.add(wfdVar);
                wfdVar.a.a(new d2f(mgfVar, 4, wfdVar));
                if (this.d.l.getAndIncrement() > 0) {
                    this.d.b.b("Already connected to the service.", new Object[0]);
                }
                mgf.b(this.d, this.c);
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
