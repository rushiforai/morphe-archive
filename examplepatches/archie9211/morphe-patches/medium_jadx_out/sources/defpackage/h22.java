package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class h22 extends RuntimeException {
    public final /* synthetic */ int a = 0;

    public /* synthetic */ h22() {
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        switch (this.a) {
            case 0:
                return "Chain of Causes for CompositeException In Order Received =>";
            default:
                return super.getMessage();
        }
    }

    public /* synthetic */ h22(String str) {
        super(str);
    }
}
