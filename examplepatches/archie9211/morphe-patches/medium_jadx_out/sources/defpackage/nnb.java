package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nnb extends onb implements Iterator {
    public mnb a;
    public boolean b = true;
    public final /* synthetic */ pnb c;

    public nnb(pnb pnbVar) {
        this.c = pnbVar;
    }

    @Override // defpackage.onb
    public final void a(mnb mnbVar) {
        mnb mnbVar2 = this.a;
        if (mnbVar == mnbVar2) {
            mnb mnbVar3 = mnbVar2.d;
            this.a = mnbVar3;
            this.b = mnbVar3 == null;
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        if (this.b) {
            return this.c.a != null;
        }
        mnb mnbVar = this.a;
        return (mnbVar == null || mnbVar.c == null) ? false : true;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (this.b) {
            this.b = false;
            mnb mnbVar = this.c.a;
            this.a = mnbVar;
            return mnbVar;
        }
        mnb mnbVar2 = this.a;
        mnb mnbVar3 = mnbVar2 != null ? mnbVar2.c : null;
        this.a = mnbVar3;
        return mnbVar3;
    }
}
