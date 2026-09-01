package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qz7 implements g8a {
    public final /* synthetic */ int a;
    public final g8a b;
    public final g8a c;

    public /* synthetic */ qz7(g8a g8aVar, g8a g8aVar2, int i) {
        this.a = i;
        this.b = g8aVar;
        this.c = g8aVar2;
    }

    @Override // defpackage.g8a
    public final Object get() {
        int i = this.a;
        g8a g8aVar = this.b;
        switch (i) {
            case 0:
                return new pz7((Context) ((ng2) g8aVar).b, (m50) ((ng2) this.c).get());
            default:
                return new fnb(new tz7(25, false), new uob(24), jj0.f, (erb) g8aVar.get(), this.c);
        }
    }
}
