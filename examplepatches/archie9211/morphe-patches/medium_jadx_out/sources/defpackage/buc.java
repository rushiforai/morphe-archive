package defpackage;

import android.graphics.Canvas;
import android.graphics.RenderNode;
import android.widget.EdgeEffect;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class buc extends b43 implements xl3 {
    public final ep q;
    public final do3 r;
    public RenderNode s;

    public buc(w4d w4dVar, ep epVar, do3 do3Var) {
        this.q = epVar;
        this.r = do3Var;
        I0(w4dVar);
    }

    public static boolean L0(float f, EdgeEffect edgeEffect, Canvas canvas) {
        if (f == 0.0f) {
            return edgeEffect.draw(canvas);
        }
        int iSave = canvas.save();
        canvas.rotate(f);
        boolean zDraw = edgeEffect.draw(canvas);
        canvas.restoreToCount(iSave);
        return zDraw;
    }

    public final RenderNode M0() {
        RenderNode renderNode = this.s;
        if (renderNode != null) {
            return renderNode;
        }
        RenderNode renderNodeB = cs0.b();
        this.s = renderNodeB;
        return renderNodeB;
    }

    /* JADX WARN: Removed duplicated region for block: B:111:0x01ec A[PHI: r20
      0x01ec: PHI (r20v2 boolean) = (r20v1 boolean), (r20v11 boolean) binds: [B:92:0x019e, B:100:0x01b9] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // defpackage.xl3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e0(defpackage.cq6 r26) {
        /*
            Method dump skipped, instruction units count: 902
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.buc.e0(cq6):void");
    }

    @Override // defpackage.xl3
    public final void L() {
    }
}
