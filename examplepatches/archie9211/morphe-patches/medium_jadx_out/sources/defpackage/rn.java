package defpackage;

import android.view.View;
import android.view.accessibility.AccessibilityEvent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rn extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ sn b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rn(sn snVar, int i) {
        super(1);
        this.a = i;
        this.b = snVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        sn snVar = this.b;
        switch (i) {
            case 0:
                View view = snVar.d;
                return Boolean.valueOf(view.getParent().requestSendAccessibilityEvent(view, (AccessibilityEvent) obj));
            default:
                wrb wrbVar = (wrb) obj;
                if (wrbVar.b.contains(wrbVar)) {
                    px8 snapshotObserver = snVar.d.getSnapshotObserver();
                    snapshotObserver.a.d(wrbVar, snVar.M, new cn(wrbVar, 2, snVar));
                }
                return c1e.a;
        }
    }
}
