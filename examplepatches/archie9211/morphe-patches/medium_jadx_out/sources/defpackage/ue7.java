package defpackage;

import android.os.Bundle;
import com.medium.android.donkey.main.MainActivity;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ue7 {
    public final /* synthetic */ MainActivity a;

    public /* synthetic */ ue7(MainActivity mainActivity) {
        this.a = mainActivity;
    }

    public final void a(db8 db8Var, va8 va8Var, Bundle bundle) {
        va8 va8Var2;
        va8 va8Var3;
        int i = MainActivity.H;
        va8Var.getClass();
        MainActivity mainActivity = this.a;
        Object obj = null;
        if (bundle == null) {
            uld uldVar = wld.a;
            CharSequence charSequence = va8Var.d;
            ba8 ba8VarB = db8Var.b();
            uldVar.j(nuc.C("Destination " + ((Object) charSequence) + " has no arguments. Previous back stack entry:\n                        | " + ((Object) ((ba8VarB == null || (va8Var3 = ba8VarB.b) == null) ? null : va8Var3.d))), new Object[0]);
            if (mainActivity.h) {
                ak4 ak4VarA = ak4.a();
                CharSequence charSequence2 = va8Var.d;
                ba8 ba8VarB2 = db8Var.b();
                ak4VarA.b(nuc.C("Destination " + ((Object) charSequence2) + " has no arguments. Previous back stack entry:\n                        | " + ((Object) ((ba8VarB2 == null || (va8Var2 = ba8VarB2.b) == null) ? null : va8Var2.d))));
            }
        }
        Iterator<E> it2 = lv0.getEntries().iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            Object next = it2.next();
            if (((lv0) next).getItemId() == va8Var.b.c) {
                obj = next;
                break;
            }
        }
        lv0 lv0Var = (lv0) obj;
        if (lv0Var != null) {
            mainActivity.v().e(lv0Var);
        }
    }
}
