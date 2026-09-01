package defpackage;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b7f {
    public static final String i = d87.k("WorkContinuationImpl");
    public final m7f a;
    public final String b;
    public final j54 c;
    public final List d;
    public final ArrayList e;
    public final ArrayList f = new ArrayList();
    public boolean g;
    public md5 h;

    public b7f(m7f m7fVar, String str, j54 j54Var, List list, int i2) {
        this.a = m7fVar;
        this.b = str;
        this.c = j54Var;
        this.d = list;
        this.e = new ArrayList(list.size());
        for (int i3 = 0; i3 < list.size(); i3++) {
            if (j54Var == j54.REPLACE && ((y7f) list.get(i3)).b.u != Long.MAX_VALUE) {
                ay0.e("Next Schedule Time Override must be used with ExistingPeriodicWorkPolicyUPDATE (preferably) or KEEP");
                throw null;
            }
            String string = ((y7f) list.get(i3)).a.toString();
            string.getClass();
            this.e.add(string);
            this.f.add(string);
        }
    }

    public static HashSet b(b7f b7fVar) {
        HashSet hashSet = new HashSet();
        b7fVar.getClass();
        return hashSet;
    }

    public final md5 a() {
        if (this.g) {
            d87.h().l(i, "Already enqueued work ids (" + TextUtils.join(", ", this.e) + ")");
        } else {
            m7f m7fVar = this.a;
            this.h = tp7.x(m7fVar.b.h, "EnqueueRunnable_" + this.c.name(), ((q7f) m7fVar.d).a, new l2f(2, this));
        }
        return this.h;
    }
}
