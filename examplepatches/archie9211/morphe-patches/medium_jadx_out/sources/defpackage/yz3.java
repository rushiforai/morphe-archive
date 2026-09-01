package defpackage;

import android.text.Spanned;
import android.text.TextUtils;
import android.view.KeyEvent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yz3 implements rv3, hv3 {
    public final fi9 a;
    public final b55 b;

    public yz3(fi9 fi9Var) {
        this.a = fi9Var;
        this.b = null;
    }

    @Override // defpackage.hv3
    public final boolean c(int i, int i2, int i3, KeyEvent keyEvent) {
        if (keyEvent.getAction() != 0 || keyEvent.getKeyCode() != 66) {
            return false;
        }
        new o53(this, i, i3, i2).run();
        return true;
    }

    @Override // defpackage.rv3
    public final nu3 e(int i, CharSequence charSequence, int i2, int i3, Spanned spanned, int i4, int i5) {
        if (TextUtils.equals(charSequence.subSequence(i2, i3), "\n")) {
            return new o53(this, i, i5, i4);
        }
        return null;
    }

    public yz3(fi9 fi9Var, v08 v08Var) {
        this.a = fi9Var;
        this.b = v08Var;
    }
}
