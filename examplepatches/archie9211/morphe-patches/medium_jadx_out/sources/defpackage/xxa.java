package defpackage;

import android.util.SparseArray;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xxa {
    public final SparseArray a = new SparseArray();
    public int b = 0;
    public final Set c = Collections.newSetFromMap(new IdentityHashMap());

    public final wxa a(int i) {
        SparseArray sparseArray = this.a;
        wxa wxaVar = (wxa) sparseArray.get(i);
        if (wxaVar != null) {
            return wxaVar;
        }
        wxa wxaVar2 = new wxa();
        sparseArray.put(i, wxaVar2);
        return wxaVar2;
    }
}
