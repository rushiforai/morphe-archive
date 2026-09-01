package defpackage;

import java.lang.reflect.Array;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class s39 extends to7 {
    public final /* synthetic */ int e;
    public final /* synthetic */ to7 f;

    public /* synthetic */ s39(to7 to7Var, int i) {
        this.e = i;
        this.f = to7Var;
    }

    @Override // defpackage.to7
    public final void h(ubb ubbVar, Object obj) {
        int i = this.e;
        to7 to7Var = this.f;
        switch (i) {
            case 0:
                Iterable iterable = (Iterable) obj;
                if (iterable != null) {
                    Iterator it2 = iterable.iterator();
                    while (it2.hasNext()) {
                        to7Var.h(ubbVar, it2.next());
                    }
                    break;
                }
                break;
            default:
                if (obj != null) {
                    int length = Array.getLength(obj);
                    for (int i2 = 0; i2 < length; i2++) {
                        to7Var.h(ubbVar, Array.get(obj, i2));
                    }
                    break;
                }
                break;
        }
    }
}
