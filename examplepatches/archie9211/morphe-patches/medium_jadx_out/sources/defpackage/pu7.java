package defpackage;

import android.content.SharedPreferences;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pu7 extends p2 {
    public static final ku7 j = new ku7();
    public final ju7 i;

    public pu7(SharedPreferences sharedPreferences, fh5 fh5Var, sb2 sb2Var, ju7 ju7Var) {
        super(sharedPreferences, fh5Var, sb2Var);
        this.i = ju7Var;
    }

    public final dne O() {
        try {
            String strO = p2.o(this, ek6.SETTINGS_TEXT_SIZE, null, 2, null);
            if (strO == null) {
                strO = "";
            }
            return dne.valueOf(strO);
        } catch (Exception unused) {
            dne.Companion.getClass();
            return dne.NORMAL;
        }
    }

    @Override // defpackage.p2
    public final String s(ek6 ek6Var) {
        ek6Var.getClass();
        return super.t(ek6Var, (String) this.i.get());
    }

    @Override // defpackage.p2
    public final String u(ek6 ek6Var) {
        ek6Var.getClass();
        return super.v(ek6Var, (String) this.i.get());
    }
}
