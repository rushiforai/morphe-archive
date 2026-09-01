package defpackage;

import com.medium.android.core.susi.SusiOperation;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m3d {
    public static SusiOperation a(String str) {
        SusiOperation susiOperationB = b(str);
        if (susiOperationB != null) {
            return susiOperationB;
        }
        ywb.g(ev6.x("No SusiOperation with value '", str, "'"));
        return null;
    }

    public static SusiOperation b(String str) {
        Object next;
        Iterator<E> it2 = SusiOperation.getEntries().iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (g76.L(((SusiOperation) next).getValue(), str)) {
                break;
            }
        }
        return (SusiOperation) next;
    }
}
