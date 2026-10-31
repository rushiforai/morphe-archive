package androidx.compose.ui.graphics;

import androidx.recyclerview.widget.u1;
import b2.t;
import i2.b0;
import i2.r0;
import i2.v0;
import i2.y0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public abstract class a {
    public static final t a(t tVar, Function1 function1) {
        return tVar.then(new BlockGraphicsLayerElement(function1));
    }

    public static t b(t tVar, float f11, float f12, float f13, float f14, v0 v0Var, int i5) {
        float f15 = (i5 & 1) != 0 ? 1.0f : f11;
        float f16 = (i5 & 2) != 0 ? 1.0f : f12;
        float f17 = (i5 & 4) != 0 ? 1.0f : f13;
        float f18 = (i5 & 32) != 0 ? 0.0f : f14;
        long j11 = y0.f61191b;
        v0 v0Var2 = (i5 & 2048) != 0 ? r0.f61135a : v0Var;
        long j12 = b0.f61098a;
        return tVar.then(new GraphicsLayerElement(f15, f16, f17, f18, 0.0f, j11, v0Var2, false, j12, j12));
    }

    public static t c(t tVar, float f11, float f12, float f13, float f14, v0 v0Var, int i5) {
        float f15 = (i5 & 1) != 0 ? 1.0f : f11;
        float f16 = (i5 & 2) != 0 ? 1.0f : f12;
        float f17 = (i5 & 4) != 0 ? 1.0f : f13;
        float f18 = (i5 & 256) != 0 ? 0.0f : f14;
        long j11 = y0.f61191b;
        v0 v0Var2 = (i5 & 2048) != 0 ? r0.f61135a : v0Var;
        boolean z11 = (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0;
        long j12 = b0.f61098a;
        return tVar.then(new GraphicsLayerElement(f15, f16, f17, 0.0f, f18, j11, v0Var2, z11, j12, j12));
    }
}
