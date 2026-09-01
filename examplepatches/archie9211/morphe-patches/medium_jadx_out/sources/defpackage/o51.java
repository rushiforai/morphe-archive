package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o51 implements pr4 {
    public static final o51 a = new o51();
    public static Boolean b;

    @Override // defpackage.pr4
    public final boolean b() {
        Boolean bool = b;
        if (bool != null) {
            return bool.booleanValue();
        }
        throw lv8.v("canFocus is read before it is written");
    }

    @Override // defpackage.pr4
    public final void d(boolean z) {
        b = Boolean.valueOf(z);
    }

    @Override // defpackage.pr4
    public final void a(er4 er4Var) {
    }

    @Override // defpackage.pr4
    public final void c(er4 er4Var) {
    }

    @Override // defpackage.pr4
    public final void e(zwa zwaVar) {
    }
}
