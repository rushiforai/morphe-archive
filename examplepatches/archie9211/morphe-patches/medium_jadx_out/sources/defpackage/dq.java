package defpackage;

import android.os.LocaleList;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dq implements ja9 {
    public LocaleList a;
    public h67 b;
    public final dq1 c = new dq1(24);

    @Override // defpackage.ja9
    public final h67 f() {
        LocaleList localeList = LocaleList.getDefault();
        synchronized (this.c) {
            h67 h67Var = this.b;
            if (h67Var != null && localeList == this.a) {
                return h67Var;
            }
            int size = localeList.size();
            ArrayList arrayList = new ArrayList(size);
            for (int i = 0; i < size; i++) {
                arrayList.add(new f67(localeList.get(i)));
            }
            h67 h67Var2 = new h67(arrayList);
            this.a = localeList;
            this.b = h67Var2;
            return h67Var2;
        }
    }
}
