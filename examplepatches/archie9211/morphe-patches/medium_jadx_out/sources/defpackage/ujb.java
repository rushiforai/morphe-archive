package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ujb implements jmb {
    public final dva a;

    public ujb(dva dvaVar) {
        dvaVar.getClass();
        this.a = dvaVar;
    }

    @Override // defpackage.jmb
    public final jmb a() {
        throw new IllegalStateException("unexpected retry");
    }

    @Override // defpackage.jmb
    public final dva b() {
        return this.a;
    }

    @Override // defpackage.jmb
    public final boolean c() {
        return true;
    }

    @Override // defpackage.jmb
    public final void cancel() {
        throw new IllegalStateException("unexpected cancel");
    }

    @Override // defpackage.jmb
    public final imb d() {
        throw new IllegalStateException("already connected");
    }

    @Override // defpackage.jmb
    public final imb g() {
        throw new IllegalStateException("already connected");
    }
}
