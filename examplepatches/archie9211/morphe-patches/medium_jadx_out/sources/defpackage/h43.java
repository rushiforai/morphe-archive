package defpackage;

import androidx.work.impl.WorkDatabase;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class h43 implements Callable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ h43(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        int i = this.a;
        Object obj = this.d;
        Object obj2 = this.c;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                return ((i43) obj3).a.submit(new fi2((Callable) obj2, 7, (zm7) obj));
            default:
                String str = (String) obj;
                WorkDatabase workDatabase = ((i2a) obj3).e;
                i8f i8fVarY = workDatabase.y();
                i8fVarY.getClass();
                str.getClass();
                ((ArrayList) obj2).addAll((List) n01.c0(i8fVarY.a, true, false, new nmc(str, 25)));
                return workDatabase.x().e(str);
        }
    }
}
