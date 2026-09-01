package defpackage;

import android.view.MotionEvent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ut extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ due b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ut(due dueVar, int i) {
        super(1);
        this.a = i;
        this.b = dueVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        boolean zDispatchTouchEvent;
        int i = this.a;
        c1e c1eVar = c1e.a;
        due dueVar = this.b;
        switch (i) {
            case 0:
                mx8 mx8Var = (mx8) obj;
                mn mnVar = mx8Var instanceof mn ? (mn) mx8Var : null;
                if (mnVar != null) {
                    mnVar.getAndroidViewsHandler$ui().removeViewInLayout(dueVar);
                    pwd.y(mnVar.getAndroidViewsHandler$ui().getLayoutNodeToHolder()).remove(mnVar.getAndroidViewsHandler$ui().getHolderToLayoutNode().remove(dueVar));
                    dueVar.setImportantForAccessibility(0);
                }
                dueVar.removeAllViewsInLayout();
                return c1eVar;
            case 1:
                dueVar.q = (x45) obj;
                return c1eVar;
            default:
                MotionEvent motionEvent = (MotionEvent) obj;
                switch (motionEvent.getActionMasked()) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                        zDispatchTouchEvent = dueVar.dispatchTouchEvent(motionEvent);
                        break;
                    default:
                        zDispatchTouchEvent = dueVar.dispatchGenericMotionEvent(motionEvent);
                        break;
                }
                return Boolean.valueOf(zDispatchTouchEvent);
        }
    }
}
