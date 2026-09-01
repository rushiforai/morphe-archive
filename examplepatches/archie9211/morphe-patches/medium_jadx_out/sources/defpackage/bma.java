package defpackage;

import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class bma implements m45 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ kma b;
    public final /* synthetic */ x45 c;

    public /* synthetic */ bma(x45 x45Var, kma kmaVar) {
        this.c = x45Var;
        this.b = kmaVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        x45 x45Var = this.c;
        kma kmaVar = this.b;
        switch (i) {
            case 0:
                x45Var.invoke(Boolean.valueOf(((ima) kmaVar).g));
                break;
            default:
                Object obj = null;
                ima imaVar = kmaVar instanceof ima ? (ima) kmaVar : null;
                if (imaVar != null) {
                    Iterator it2 = imaVar.b.iterator();
                    while (true) {
                        if (it2.hasNext()) {
                            Object next = it2.next();
                            if (((PublicationData) next).isSelected()) {
                                obj = next;
                            }
                        }
                    }
                    x45Var.invoke(obj);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ bma(kma kmaVar, x45 x45Var) {
        this.b = kmaVar;
        this.c = x45Var;
    }
}
