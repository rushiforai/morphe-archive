package defpackage;

import androidx.compose.foundation.gestures.FlingCancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class al implements xrb {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ al(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.xrb
    public final float a(float f) {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                cl clVar = (cl) obj2;
                float fC = clVar.J.c(f);
                float fG = fC - clVar.J.f.g();
                ((pl) obj).a(fC, 0.0f);
                return fG;
            default:
                vsb vsbVar = (vsb) obj2;
                if (Math.abs(f) == 0.0f || ((Boolean) vsbVar.h.invoke()).booleanValue()) {
                    return vsbVar.d(vsbVar.g(((tsb) obj).a(2, vsbVar.e(vsbVar.h(f)))));
                }
                throw new FlingCancellationException("The fling animation was cancelled");
        }
    }
}
