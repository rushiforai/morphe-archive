package defpackage;

import android.os.Bundle;
import android.view.inputmethod.InputContentInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class am8 extends zl8 {
    @Override // defpackage.yl8, android.view.inputmethod.InputConnection
    public final boolean commitContent(InputContentInfo inputContentInfo, int i, Bundle bundle) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.commitContent(inputContentInfo, i, bundle);
        }
        return false;
    }
}
