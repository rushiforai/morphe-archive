package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class n94 implements jmb {
    public final imb a;

    public n94(Throwable th) {
        this.a = new imb(this, th, 2);
    }

    @Override // defpackage.jmb
    public final jmb a() {
        throw new IllegalStateException("unexpected retry");
    }

    @Override // defpackage.jmb
    public final dva b() {
        throw new IllegalStateException("unexpected call");
    }

    @Override // defpackage.jmb
    public final boolean c() {
        return false;
    }

    @Override // defpackage.jmb
    public final void cancel() {
        throw new IllegalStateException("unexpected cancel");
    }

    @Override // defpackage.jmb
    public final imb d() {
        return this.a;
    }

    @Override // defpackage.jmb
    public final imb g() {
        return this.a;
    }
}
