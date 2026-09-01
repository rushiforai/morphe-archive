package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gsd implements vh3 {
    public final /* synthetic */ int a;
    public final /* synthetic */ dsd b;

    public /* synthetic */ gsd(dsd dsdVar, int i) {
        this.a = i;
        this.b = dsdVar;
    }

    @Override // defpackage.vh3
    public final void dispose() {
        int i = this.a;
        dsd dsdVar = this.b;
        switch (i) {
            case 0:
                dsdVar.i();
                dsdVar.a.v0();
                break;
            default:
                dsdVar.i();
                dsdVar.a.v0();
                break;
        }
    }
}
