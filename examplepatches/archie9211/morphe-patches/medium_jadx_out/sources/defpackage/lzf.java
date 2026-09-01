package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lzf implements Runnable {
    public final h1g a;
    public final x0g b;

    public lzf(h1g h1gVar, x0g x0gVar) {
        this.a = h1gVar;
        this.b = x0gVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.a.a != this) {
            return;
        }
        x0g x0gVar = this.b;
        if (vzf.g.O(this.a, this, h1g.h(x0gVar))) {
            h1g.j(this.a);
        }
    }
}
