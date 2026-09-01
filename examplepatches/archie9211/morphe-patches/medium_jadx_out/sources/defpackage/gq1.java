package defpackage;

import android.view.View;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gq1 {
    public final WeakReference a;
    public final String b;

    public gq1(View view, String str) {
        view.getClass();
        this.a = new WeakReference(view);
        this.b = str;
    }

    public final View a() {
        return (View) this.a.get();
    }
}
