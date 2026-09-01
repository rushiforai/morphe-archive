package defpackage;

import android.graphics.Rect;
import android.view.WindowInsets;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v4f extends u4f {
    public v4f(z4f z4fVar, WindowInsets windowInsets) {
        super(z4fVar, windowInsets);
    }

    @Override // defpackage.o4f, defpackage.w4f
    public List<Rect> f(int i) {
        return this.c.getBoundingRects(y4f.a(i));
    }

    @Override // defpackage.o4f, defpackage.w4f
    public List<Rect> g(int i) {
        return this.c.getBoundingRectsIgnoringVisibility(y4f.a(i));
    }

    public v4f(z4f z4fVar, v4f v4fVar) {
        super(z4fVar, v4fVar);
    }

    @Override // defpackage.o4f, defpackage.w4f
    public void q() {
    }
}
