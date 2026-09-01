package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v0c implements e8a {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ v0c(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public static v0c a(Object obj) {
        if (obj != null) {
            return new v0c(2, obj);
        }
        z72.c("instance cannot be null");
        return null;
    }

    @Override // defpackage.g8a
    public final Object get() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return new u0c((e1c) ((e8a) obj).get());
            case 1:
                return new m1c((g7c) ((e8a) obj).get());
            default:
                return obj;
        }
    }
}
