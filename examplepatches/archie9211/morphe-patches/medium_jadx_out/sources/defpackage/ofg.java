package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ofg implements Iterator {
    public int a;
    public int b;
    public int c;
    public final /* synthetic */ tfg d;
    public final /* synthetic */ int e;
    public final /* synthetic */ tfg f;

    public ofg(tfg tfgVar, int i) {
        this.e = i;
        this.f = tfgVar;
        this.d = tfgVar;
        this.a = tfgVar.e;
        this.b = tfgVar.isEmpty() ? -1 : 0;
        this.c = -1;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.b >= 0;
    }

    @Override // java.util.Iterator
    public final Object next() {
        Object rfgVar;
        tfg tfgVar = this.d;
        if (tfgVar.e != this.a) {
            z10.g();
            return null;
        }
        if (!hasNext()) {
            ywb.n();
            return null;
        }
        int i = this.b;
        this.c = i;
        int i2 = this.e;
        tfg tfgVar2 = this.f;
        switch (i2) {
            case 0:
                rfgVar = tfgVar2.a()[i];
                break;
            case 1:
                rfgVar = new rfg(tfgVar2, i);
                break;
            default:
                rfgVar = tfgVar2.b()[i];
                break;
        }
        int i3 = this.b + 1;
        if (i3 >= tfgVar.f) {
            i3 = -1;
        }
        this.b = i3;
        return rfgVar;
    }

    @Override // java.util.Iterator
    public final void remove() {
        tfg tfgVar = this.d;
        if (tfgVar.e != this.a) {
            z10.g();
            return;
        }
        jq7.y("no calls to next() since the last call to remove()", this.c >= 0);
        this.a += 32;
        tfgVar.remove(tfgVar.a()[this.c]);
        this.b--;
        this.c = -1;
    }
}
