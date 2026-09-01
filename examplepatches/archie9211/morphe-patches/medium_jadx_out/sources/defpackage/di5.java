package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class di5 implements yh3 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ di5(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.yh3
    public final void dispose() {
        switch (this.a) {
            case 0:
                ei5 ei5Var = (ei5) this.b;
                ei5Var.c.removeCallbacks((Runnable) this.c);
                return;
            default:
                String str = (String) this.b;
                jr jrVar = (jr) this.c;
                synchronized (x58.b) {
                    LinkedHashMap linkedHashMap = x58.c;
                    x58 x58Var = (x58) linkedHashMap.get(str);
                    if (x58Var != null) {
                        x58Var.a.remove(jrVar);
                        if (x58Var.a.isEmpty()) {
                            linkedHashMap.remove(str);
                            x58Var.stopWatching();
                        }
                    }
                    break;
                }
                return;
        }
    }
}
