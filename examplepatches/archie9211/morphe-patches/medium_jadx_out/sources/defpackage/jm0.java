package defpackage;

import java.lang.ref.WeakReference;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jm0 extends que {
    public final String b;
    public qlb c;

    public jm0(vob vobVar) {
        String string = (String) vobVar.a("SaveableStateHolder_BackStackEntryKey");
        if (string == null) {
            string = UUID.randomUUID().toString();
            vobVar.d("SaveableStateHolder_BackStackEntryKey", string);
        }
        this.b = string;
    }

    @Override // defpackage.que
    public final void d() {
        qlb qlbVar = this.c;
        if (qlbVar == null) {
            g76.g0("saveableStateHolderRef");
            throw null;
        }
        nob nobVar = (nob) ((WeakReference) qlbVar.a).get();
        if (nobVar != null) {
            nobVar.f(this.b);
        }
        qlb qlbVar2 = this.c;
        if (qlbVar2 != null) {
            ((WeakReference) qlbVar2.a).clear();
        } else {
            g76.g0("saveableStateHolderRef");
            throw null;
        }
    }
}
