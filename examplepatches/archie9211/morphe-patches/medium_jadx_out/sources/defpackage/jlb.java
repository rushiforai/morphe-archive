package defpackage;

import android.os.Looper;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jlb extends t76 {
    public final /* synthetic */ glb b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jlb(String[] strArr, glb glbVar) {
        super(strArr);
        this.b = glbVar;
    }

    @Override // defpackage.t76
    public final void a(Set set) {
        set.getClass();
        c70 c70VarN = c70.N();
        b2a b2aVar = new b2a(2, this.b);
        c70VarN.getClass();
        if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
            b2aVar.run();
        } else {
            c70VarN.O(b2aVar);
        }
    }
}
