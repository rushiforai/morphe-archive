package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zob implements lpb, k55 {
    @Override // defpackage.lpb
    public final boolean a(Object obj) {
        return xob.a(obj);
    }

    public final boolean equals(Object obj) {
        if ((obj instanceof lpb) && (obj instanceof k55)) {
            return getFunctionDelegate().equals(((k55) obj).getFunctionDelegate());
        }
        return false;
    }

    @Override // defpackage.k55
    public final j55 getFunctionDelegate() {
        return new x55(1, 0, uob.class, vob.c, "validateValue", "validateValue(Ljava/lang/Object;)Z");
    }

    public final int hashCode() {
        return getFunctionDelegate().hashCode();
    }
}
