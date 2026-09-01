package defpackage;

import android.view.KeyEvent;
import android.view.inputmethod.BaseInputConnection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f6d extends BaseInputConnection {
    public final /* synthetic */ g6d a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f6d(g6d g6dVar) {
        super(g6dVar, false);
        this.a = g6dVar;
    }

    @Override // android.view.inputmethod.BaseInputConnection, android.view.inputmethod.InputConnection
    public final boolean sendKeyEvent(KeyEvent keyEvent) {
        if (keyEvent == null || !this.a.getListener().h(keyEvent)) {
            return super.sendKeyEvent(keyEvent);
        }
        return true;
    }
}
