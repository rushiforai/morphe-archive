package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lnb extends onb implements Iterator {
    public mnb a;
    public mnb b;
    public final /* synthetic */ int c;

    public lnb(mnb mnbVar, mnb mnbVar2, int i) {
        this.c = i;
        this.a = mnbVar2;
        this.b = mnbVar;
    }

    @Override // defpackage.onb
    public final void a(mnb mnbVar) {
        mnb mnbVar2;
        mnb mnbVar3 = this.a;
        mnb mnbVarB = null;
        if (mnbVar3 == mnbVar && mnbVar == this.b) {
            this.b = null;
            this.a = null;
            mnbVar3 = null;
        }
        mnb mnbVar4 = mnbVar3;
        if (mnbVar3 == mnbVar) {
            switch (this.c) {
                case 0:
                    mnbVar2 = mnbVar3.d;
                    break;
                default:
                    mnbVar2 = mnbVar3.c;
                    break;
            }
            mnbVar4 = mnbVar2;
            this.a = mnbVar4;
        }
        mnb mnbVar5 = this.b;
        if (mnbVar5 == mnbVar) {
            if (mnbVar5 != mnbVar4 && mnbVar4 != null) {
                mnbVarB = b(mnbVar5);
            }
            this.b = mnbVarB;
        }
    }

    public final mnb b(mnb mnbVar) {
        switch (this.c) {
            case 0:
                return mnbVar.c;
            default:
                return mnbVar.d;
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.b != null;
    }

    @Override // java.util.Iterator
    public final Object next() {
        mnb mnbVar = this.b;
        mnb mnbVar2 = this.a;
        this.b = (mnbVar == mnbVar2 || mnbVar2 == null) ? null : b(mnbVar);
        return mnbVar;
    }
}
