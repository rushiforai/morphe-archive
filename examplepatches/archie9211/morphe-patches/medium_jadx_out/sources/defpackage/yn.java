package defpackage;

import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yn {
    public static final yn a = new yn();

    public final void a(View view) {
        view.clearViewTranslationCallback();
    }

    public final void b(View view) {
        view.setViewTranslationCallback(xn.a);
    }
}
