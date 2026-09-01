package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class kif implements Runnable {
    public final wfd a;

    public kif() {
        this.a = null;
    }

    public void a(Exception exc) {
        wfd wfdVar = this.a;
        if (wfdVar != null) {
            wfdVar.c(exc);
        }
    }

    public abstract void b();

    @Override // java.lang.Runnable
    public final void run() {
        try {
            b();
        } catch (Exception e) {
            a(e);
        }
    }

    public kif(wfd wfdVar) {
        this.a = wfdVar;
    }
}
