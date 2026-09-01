package defpackage;

import android.graphics.Rect;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class er4 extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ fr4 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ er4(fr4 fr4Var, int i) {
        super(1);
        this.a = i;
        this.b = fr4Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        fr4 fr4Var = this.b;
        switch (i) {
            case 0:
                r51 r51Var = (r51) obj;
                View viewG = t40.G(fr4Var);
                if (!viewG.isFocused() && !viewG.hasFocus()) {
                    lr4 focusOwner = ((mn) flb.w0(fr4Var)).getFocusOwner();
                    View viewU = guc.U(fr4Var);
                    Integer numC = ir4.c(r51Var.a);
                    int[] iArr = new int[2];
                    viewU.getLocationOnScreen(iArr);
                    int[] iArr2 = new int[2];
                    viewG.getLocationOnScreen(iArr2);
                    es4 es4VarM = rx0.M(((or4) focusOwner).c);
                    Rect rect = null;
                    zwa zwaVarN = es4VarM != null ? rx0.N(es4VarM) : null;
                    if (zwaVarN != null) {
                        int i2 = (int) zwaVarN.a;
                        int i3 = iArr[0];
                        int i4 = iArr2[0];
                        int i5 = (int) zwaVarN.b;
                        int i6 = iArr[1];
                        int i7 = iArr2[1];
                        rect = new Rect((i2 + i3) - i4, (i5 + i6) - i7, (((int) zwaVarN.c) + i3) - i4, (((int) zwaVarN.d) + i6) - i7);
                    }
                    if (!ir4.b(viewG, numC, rect)) {
                        r51Var.b = true;
                    }
                }
                break;
            default:
                t40.G(fr4Var);
                break;
        }
        return c1eVar;
    }
}
