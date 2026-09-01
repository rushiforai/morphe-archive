package defpackage;

import android.view.View;
import android.view.WindowInsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class u4f extends t4f {
    public static final z4f x = z4f.h(WindowInsets.CONSUMED, null);

    public u4f(z4f z4fVar, WindowInsets windowInsets) {
        super(z4fVar, windowInsets);
    }

    @Override // defpackage.s4f, defpackage.o4f, defpackage.w4f
    public b36 i(int i) {
        return b36.d(this.c.getInsets(y4f.a(i)));
    }

    @Override // defpackage.s4f, defpackage.o4f, defpackage.w4f
    public b36 j(int i) {
        return b36.d(this.c.getInsetsIgnoringVisibility(y4f.a(i)));
    }

    @Override // defpackage.s4f, defpackage.o4f, defpackage.w4f
    public boolean u(int i) {
        return this.c.isVisible(y4f.a(i));
    }

    public u4f(z4f z4fVar, u4f u4fVar) {
        super(z4fVar, u4fVar);
    }

    @Override // defpackage.o4f, defpackage.w4f
    public void p(View view) {
    }
}
