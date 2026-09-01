package defpackage;

import java.util.Iterator;
import java.util.NoSuchElementException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ugc implements Iterator {
    public static final ugc b = new ugc(0);
    public final /* synthetic */ int a;

    public /* synthetic */ ugc(int i) {
        this.a = i;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.a) {
        }
        return false;
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.a) {
            case 0:
                throw new NoSuchElementException();
            case 1:
                throw new NoSuchElementException();
            default:
                throw new NoSuchElementException();
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.a) {
            case 0:
                throw new IllegalStateException();
            case 1:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }
}
