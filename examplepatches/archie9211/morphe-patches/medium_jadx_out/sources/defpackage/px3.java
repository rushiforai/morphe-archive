package defpackage;

import android.os.Handler;
import android.widget.EditText;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class px3 extends ww3 implements Runnable {
    public final WeakReference a;

    public px3(EditText editText) {
        this.a = new WeakReference(editText);
    }

    @Override // defpackage.ww3
    public final void b() {
        Handler handler;
        EditText editText = (EditText) this.a.get();
        if (editText == null || (handler = editText.getHandler()) == null) {
            return;
        }
        handler.post(this);
    }

    @Override // java.lang.Runnable
    public final void run() {
        qx3.a((EditText) this.a.get(), 1);
    }
}
