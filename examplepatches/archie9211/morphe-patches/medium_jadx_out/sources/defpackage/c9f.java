package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class c9f implements ny6, k55 {
    public final /* synthetic */ l22 a;

    public c9f(l22 l22Var) {
        this.a = l22Var;
    }

    public final boolean equals(Object obj) {
        if ((obj instanceof ny6) && (obj instanceof k55)) {
            return getFunctionDelegate().equals(((k55) obj).getFunctionDelegate());
        }
        return false;
    }

    @Override // defpackage.k55
    public final j55 getFunctionDelegate() {
        return new x55(1, 0, l22.class, this.a, "scheduleFrameEndCallback", "scheduleFrameEndCallback(Lkotlin/jvm/functions/Function0;)Landroidx/compose/runtime/CancellationHandle;");
    }

    public final int hashCode() {
        return getFunctionDelegate().hashCode();
    }
}
