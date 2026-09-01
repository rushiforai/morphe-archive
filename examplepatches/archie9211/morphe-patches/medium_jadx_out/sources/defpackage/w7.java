package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class w7 implements uue {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ w7(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.uue
    public final que a(Class cls) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException("`Factory.create(String, CreationExtras)` is not implemented. You may need to override the method and provide a custom implementation. Note that using `Factory.create(String)` is not supported and considered an error.");
            case 1:
                Object objInvoke = ((m45) this.b).invoke();
                que queVar = objInvoke instanceof que ? (que) objInvoke : null;
                if (queVar != null) {
                    return queVar;
                }
                ay0.e("Unknown viewmodel class!");
                return null;
            case 2:
                throw new UnsupportedOperationException("`Factory.create(String, CreationExtras)` is not implemented. You may need to override the method and provide a custom implementation. Note that using `Factory.create(String)` is not supported and considered an error.");
            default:
                throw new UnsupportedOperationException("`Factory.create(String, CreationExtras)` is not implemented. You may need to override the method and provide a custom implementation. Note that using `Factory.create(String)` is not supported and considered an error.");
        }
    }

    @Override // defpackage.uue
    public final que c(wg6 wg6Var, g68 g68Var) {
        switch (this.a) {
        }
        return wgd.a(this, wg6Var, g68Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0639  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x063d  */
    @Override // defpackage.uue
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.que b(java.lang.Class r8, defpackage.g68 r9) {
        /*
            Method dump skipped, instruction units count: 1694
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w7.b(java.lang.Class, g68):que");
    }
}
