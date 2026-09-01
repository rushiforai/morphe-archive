package defpackage;

import android.os.Handler;
import android.os.Looper;
import android.webkit.JavascriptInterface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vv5 {
    public final /* synthetic */ cw5 a;

    public vv5(cw5 cw5Var) {
        this.a = cw5Var;
    }

    @JavascriptInterface
    public final void resize(int i) {
        new Handler(Looper.getMainLooper()).post(new yy(i, 1, this.a));
    }
}
