package defpackage;

import android.os.Build;
import android.view.View;
import android.view.Window;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class jo3 extends io3 {
    @Override // defpackage.ho3, defpackage.mo3
    public void b(m6d m6dVar, m6d m6dVar2, Window window, View view, boolean z, boolean z2) {
        m6dVar.getClass();
        m6dVar2.getClass();
        window.getClass();
        view.getClass();
        gr7.B(window, false);
        window.setStatusBarColor(0);
        window.setNavigationBarColor(0);
        window.setStatusBarContrastEnforced(false);
        window.setNavigationBarContrastEnforced(true);
        int i = Build.VERSION.SDK_INT;
        rr7 e5fVar = i >= 35 ? new e5f(window) : i >= 30 ? new c5f(window) : i >= 26 ? new b5f(window) : new a5f(window);
        e5fVar.C(!z);
        e5fVar.B(true ^ z2);
    }
}
