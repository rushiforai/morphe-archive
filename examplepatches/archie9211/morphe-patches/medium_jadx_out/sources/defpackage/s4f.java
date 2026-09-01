package defpackage;

import android.view.View;
import android.view.WindowInsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class s4f extends r4f {
    public static final z4f w = z4f.h(WindowInsets.CONSUMED, null);

    public s4f(z4f z4fVar, WindowInsets windowInsets) {
        super(z4fVar, windowInsets);
    }

    @Override // defpackage.o4f, defpackage.w4f
    public b36 i(int i) {
        return b36.d(this.c.getInsets(x4f.a(i)));
    }

    @Override // defpackage.o4f, defpackage.w4f
    public b36 j(int i) {
        return b36.d(this.c.getInsetsIgnoringVisibility(x4f.a(i)));
    }

    @Override // defpackage.o4f, defpackage.w4f
    public boolean u(int i) {
        return this.c.isVisible(x4f.a(i));
    }

    public s4f(z4f z4fVar, s4f s4fVar) {
        super(z4fVar, s4fVar);
    }

    @Override // defpackage.o4f, defpackage.w4f
    public final void d(View view) {
    }
}
