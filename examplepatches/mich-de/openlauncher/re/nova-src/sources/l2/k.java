package l2;

import android.view.RenderNode;

/* loaded from: classes2.dex */
public abstract class k {
    public static int a(RenderNode renderNode) {
        return renderNode.getAmbientShadowColor();
    }

    public static int b(RenderNode renderNode) {
        return renderNode.getSpotShadowColor();
    }

    public static void c(RenderNode renderNode, int i5) {
        renderNode.setAmbientShadowColor(i5);
    }

    public static void d(RenderNode renderNode, int i5) {
        renderNode.setSpotShadowColor(i5);
    }
}
