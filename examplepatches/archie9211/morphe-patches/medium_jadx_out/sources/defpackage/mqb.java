package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mqb implements sh3, Runnable {
    public final p0g a;
    public final nqb b;
    public Thread c;

    public mqb(p0g p0gVar, nqb nqbVar) {
        this.a = p0gVar;
        this.b = nqbVar;
    }

    @Override // defpackage.sh3
    public final void dispose() {
        if (this.c == Thread.currentThread()) {
            nqb nqbVar = this.b;
            if (nqbVar instanceof ff8) {
                ff8 ff8Var = (ff8) nqbVar;
                if (ff8Var.b) {
                    return;
                }
                ff8Var.b = true;
                ff8Var.a.shutdown();
                return;
            }
        }
        this.b.dispose();
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.c = Thread.currentThread();
        try {
            this.a.run();
        } finally {
            dispose();
            this.c = null;
        }
    }
}
