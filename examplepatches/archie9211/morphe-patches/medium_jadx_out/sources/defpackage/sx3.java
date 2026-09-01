package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class sx3 implements m06 {
    public final boolean a;

    public sx3(boolean z) {
        this.a = z;
    }

    @Override // defpackage.m06
    public final boolean f() {
        return this.a;
    }

    @Override // defpackage.m06
    public final gh8 g() {
        return null;
    }

    public final String toString() {
        return ev6.z(new StringBuilder("Empty{"), this.a ? "Active" : "New", '}');
    }
}
