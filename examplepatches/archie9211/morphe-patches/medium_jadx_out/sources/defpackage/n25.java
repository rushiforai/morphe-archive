package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class n25 implements kn8, k55 {
    public final /* synthetic */ o8 a;

    public n25(o8 o8Var) {
        this.a = o8Var;
    }

    public final boolean equals(Object obj) {
        if ((obj instanceof kn8) && (obj instanceof k55)) {
            return this.a == ((k55) obj).getFunctionDelegate();
        }
        return false;
    }

    @Override // defpackage.k55
    public final j55 getFunctionDelegate() {
        return this.a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    @Override // defpackage.kn8
    public final /* synthetic */ void onChanged(Object obj) {
        this.a.invoke(obj);
    }
}
