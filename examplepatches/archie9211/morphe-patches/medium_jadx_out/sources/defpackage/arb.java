package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class arb implements g8a {
    public final /* synthetic */ int a;
    public final g8a b;
    public final g8a c;
    public final g8a d;

    public /* synthetic */ arb(g8a g8aVar, g8a g8aVar2, g8a g8aVar3, int i) {
        this.a = i;
        this.b = g8aVar;
        this.c = g8aVar2;
        this.d = g8aVar3;
    }

    @Override // defpackage.g8a
    public final Object get() {
        int i = this.a;
        g8a g8aVar = this.d;
        g8a g8aVar2 = this.c;
        g8a g8aVar3 = this.b;
        switch (i) {
            case 0:
                return new ku3((Context) g8aVar3.get(), (fnb) g8aVar2.get(), (ck0) ((u44) g8aVar).get(), 13);
            default:
                return new psd(new tz7(25, false), new uob(24), (s13) ((t13) g8aVar3).get(), (sj0) ((s6e) g8aVar2).get(), (o2b) ((l7f) g8aVar).get());
        }
    }
}
