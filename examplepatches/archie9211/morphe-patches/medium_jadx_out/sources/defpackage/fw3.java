package defpackage;

import android.text.InputFilter;
import android.text.Spanned;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fw3 implements InputFilter {
    public final m45 a;
    public final m45 b;
    public final hw3 c;

    public fw3(m45 m45Var, m45 m45Var2, hw3 hw3Var) {
        this.a = m45Var;
        this.b = m45Var2;
        this.c = hw3Var;
    }

    @Override // android.text.InputFilter
    public final CharSequence filter(CharSequence charSequence, int i, int i2, Spanned spanned, int i3, int i4) {
        charSequence.getClass();
        spanned.getClass();
        Object objInvoke = this.a.invoke();
        if (((Number) objInvoke).intValue() == -1) {
            objInvoke = null;
        }
        Integer num = (Integer) objInvoke;
        if (num != null) {
            int iIntValue = num.intValue();
            Iterable iterable = (Iterable) this.b.invoke();
            ArrayList arrayList = new ArrayList();
            for (Object obj : iterable) {
                if (obj instanceof rv3) {
                    arrayList.add(obj);
                }
            }
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                nu3 nu3VarE = ((rv3) it2.next()).e(iIntValue, charSequence, i, i2, spanned, i3, i4);
                if (nu3VarE != null) {
                    this.c.c = nu3VarE;
                    return ew3.a;
                }
            }
        }
        return null;
    }
}
