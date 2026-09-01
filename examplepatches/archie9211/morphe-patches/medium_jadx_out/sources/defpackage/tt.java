package defpackage;

import android.view.WindowInsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tt extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ due b;
    public final /* synthetic */ aq6 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ tt(due dueVar, aq6 aq6Var, int i) {
        super(1);
        this.a = i;
        this.b = dueVar;
        this.c = aq6Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        WindowInsets windowInsetsG;
        int i = this.a;
        c1e c1eVar = c1e.a;
        aq6 aq6Var = this.c;
        due dueVar = this.b;
        switch (i) {
            case 0:
                mx8 mx8Var = (mx8) obj;
                mn mnVar = mx8Var instanceof mn ? (mn) mx8Var : null;
                if (mnVar != null) {
                    mnVar.getAndroidViewsHandler$ui().getHolderToLayoutNode().put(dueVar, aq6Var);
                    mnVar.getAndroidViewsHandler$ui().addView(dueVar);
                    mnVar.getAndroidViewsHandler$ui().getLayoutNodeToHolder().put(aq6Var, dueVar);
                    dueVar.setImportantForAccessibility(1);
                    ute.o(dueVar, new an(mnVar, aq6Var, mnVar));
                }
                if (dueVar.getView().getParent() != dueVar) {
                    dueVar.addView(dueVar.getView());
                }
                break;
            case 1:
                s42.Y(dueVar, aq6Var);
                break;
            default:
                s42.Y(dueVar, aq6Var);
                ((mn) dueVar.c).H = true;
                int[] iArr = dueVar.n;
                int i2 = iArr[0];
                int i3 = iArr[1];
                dueVar.getView().getLocationOnScreen(iArr);
                long j = dueVar.o;
                long j2 = ((hp6) obj).j();
                dueVar.o = j2;
                z4f z4fVar = dueVar.p;
                if (z4fVar != null && ((i2 != iArr[0] || i3 != iArr[1] || !s46.a(j, j2)) && (windowInsetsG = dueVar.e(z4fVar).g()) != null)) {
                    dueVar.getView().dispatchApplyWindowInsets(windowInsetsG);
                }
                break;
        }
        return c1eVar;
    }
}
