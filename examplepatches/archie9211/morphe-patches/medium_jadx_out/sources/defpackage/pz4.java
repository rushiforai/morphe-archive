package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pz4 implements t72 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ pz4(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.t72
    public final void accept(Object obj) {
        switch (this.a) {
            case 0:
                qz4 qz4Var = (qz4) obj;
                if (qz4Var == null) {
                    qz4Var = new qz4(-3);
                }
                ((s26) this.b).s0(qz4Var);
                return;
            default:
                qz4 qz4Var2 = (qz4) obj;
                synchronized (rz4.c) {
                    try {
                        aec aecVar = rz4.d;
                        ArrayList arrayList = (ArrayList) aecVar.get((String) this.b);
                        if (arrayList == null) {
                            return;
                        }
                        aecVar.remove((String) this.b);
                        for (int i = 0; i < arrayList.size(); i++) {
                            ((t72) arrayList.get(i)).accept(qz4Var2);
                        }
                        return;
                    } finally {
                    }
                }
        }
    }
}
