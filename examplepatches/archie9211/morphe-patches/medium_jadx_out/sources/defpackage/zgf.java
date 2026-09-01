package defpackage;

import sprig.i.b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class zgf implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ b b;

    public /* synthetic */ zgf(b bVar, int i) {
        this.a = i;
        this.b = bVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        b bVar = this.b;
        switch (i) {
            case 0:
                b.a(bVar);
                break;
            default:
                b.b(bVar);
                break;
        }
    }
}
