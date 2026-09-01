package defpackage;

import android.os.Build;
import android.os.Bundle;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputConnectionWrapper;
import android.view.inputmethod.InputContentInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n26 extends InputConnectionWrapper {
    public final /* synthetic */ f70 a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n26(InputConnection inputConnection, f70 f70Var) {
        super(inputConnection, false);
        this.a = f70Var;
    }

    @Override // android.view.inputmethod.InputConnectionWrapper, android.view.inputmethod.InputConnection
    public final boolean commitContent(InputContentInfo inputContentInfo, int i, Bundle bundle) {
        rz2 rz2Var = null;
        if (inputContentInfo != null && Build.VERSION.SDK_INT >= 25) {
            rz2Var = new rz2(21, new p26(inputContentInfo));
        }
        if (this.a.j(rz2Var, i, bundle)) {
            return true;
        }
        return super.commitContent(inputContentInfo, i, bundle);
    }
}
