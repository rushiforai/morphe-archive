package defpackage;

import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i95 {
    public final List a;

    public i95(List list) {
        this.a = list;
        if (list.isEmpty()) {
            ay0.e("credentialOptions should not be empty");
            throw null;
        }
        if (list.size() > 1) {
            if (!list.isEmpty()) {
                Iterator it2 = list.iterator();
                while (it2.hasNext()) {
                }
            }
            for (dh2 dh2Var : this.a) {
            }
        }
    }
}
