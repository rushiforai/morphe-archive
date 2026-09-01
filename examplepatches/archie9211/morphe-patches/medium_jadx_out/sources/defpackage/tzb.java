package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tzb implements Iterator, th6 {
    public final /* synthetic */ int a;
    public final Object b;
    public boolean c = true;

    public /* synthetic */ tzb(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.a) {
        }
        return this.c;
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                if (!this.c) {
                    ywb.n();
                } else {
                    this.c = false;
                }
                break;
            case 1:
                if (!this.c) {
                    ywb.n();
                } else {
                    this.c = false;
                }
                break;
            default:
                if (!this.c) {
                    ywb.n();
                } else {
                    this.c = false;
                }
                break;
        }
        return null;
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 1:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }
}
