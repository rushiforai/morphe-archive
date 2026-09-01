package j$.util.stream;

import j$.util.Spliterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class c4 extends v3 {
    public final /* synthetic */ int h;

    public /* synthetic */ c4(int i) {
        this.h = i;
    }

    @Override // j$.util.stream.v3
    public final q4 X() {
        switch (this.h) {
            case 0:
                return new u4();
            case 1:
                return new s4();
            case 2:
                return new v4();
            default:
                return new t4();
        }
    }

    @Override // j$.util.stream.v3, j$.util.stream.e8
    public final Object a(a aVar, Spliterator spliterator) {
        switch (this.h) {
            case 0:
                if (!y6.SIZED.k(aVar.f)) {
                }
                break;
            case 1:
                if (!y6.SIZED.k(aVar.f)) {
                }
                break;
            case 2:
                if (!y6.SIZED.k(aVar.f)) {
                }
                break;
            default:
                if (!y6.SIZED.k(aVar.f)) {
                }
                break;
        }
        return (Long) super.a(aVar, spliterator);
    }

    @Override // j$.util.stream.v3, j$.util.stream.e8
    public final Object b(a aVar, Spliterator spliterator) {
        switch (this.h) {
            case 0:
                if (!y6.SIZED.k(aVar.f)) {
                }
                break;
            case 1:
                if (!y6.SIZED.k(aVar.f)) {
                }
                break;
            case 2:
                if (!y6.SIZED.k(aVar.f)) {
                }
                break;
            default:
                if (!y6.SIZED.k(aVar.f)) {
                }
                break;
        }
        return (Long) super.b(aVar, spliterator);
    }

    @Override // j$.util.stream.v3, j$.util.stream.e8
    public final int f() {
        switch (this.h) {
        }
        return y6.r;
    }
}
