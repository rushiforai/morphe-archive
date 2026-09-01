package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class by1 implements n92 {
    public static final by1 b = new by1(0);
    public static final by1 c = new by1(1);
    public final /* synthetic */ int a;

    public /* synthetic */ by1(int i) {
        this.a = i;
    }

    @Override // defpackage.n92
    public final ib2 getContext() {
        switch (this.a) {
            case 0:
                throw new IllegalStateException("This continuation is already complete");
            default:
                return zx3.a;
        }
    }

    @Override // defpackage.n92
    public final void resumeWith(Object obj) {
        switch (this.a) {
            case 0:
                throw new IllegalStateException("This continuation is already complete");
            default:
                return;
        }
    }

    public String toString() {
        switch (this.a) {
            case 0:
                return "This continuation is already complete";
            default:
                return super.toString();
        }
    }

    private final void a(Object obj) {
    }
}
