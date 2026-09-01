package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v34 extends Throwable {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v34(String str, int i) {
        super(str);
        this.a = i;
    }

    @Override // java.lang.Throwable
    public final Throwable fillInStackTrace() {
        int i = this.a;
        return this;
    }
}
