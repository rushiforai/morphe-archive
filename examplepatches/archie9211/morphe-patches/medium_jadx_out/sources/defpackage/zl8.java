package defpackage;

import android.os.Handler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class zl8 extends yl8 {
    @Override // defpackage.yl8
    public final void a(xwa xwaVar) {
        xwaVar.closeConnection();
    }

    @Override // defpackage.yl8, android.view.inputmethod.InputConnection
    public final boolean deleteSurroundingTextInCodePoints(int i, int i2) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.deleteSurroundingTextInCodePoints(i, i2);
        }
        return false;
    }

    @Override // defpackage.yl8, android.view.inputmethod.InputConnection
    public final Handler getHandler() {
        return null;
    }
}
