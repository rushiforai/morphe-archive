package defpackage;

import android.content.SharedPreferences;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bm4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ dm4 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ bm4(dm4 dm4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = dm4Var;
    }

    private final Object i(Object obj) {
        br7.v(obj);
        am4 am4VarA = this.c.a();
        AtomicReference atomicReference = am4VarA.b;
        qn7 qn7Var = am4VarA.a;
        qn7Var.getClass();
        Object obj2 = (Map) p2.h(qn7Var, ek6.STAFF_OVERRIDES_VARIANT_FLAGS, qn7.i, null, 4, null);
        if (obj2 == null) {
            obj2 = fy3.a;
        }
        atomicReference.set(obj2);
        dm4 dm4Var = this.c;
        synchronized (dm4Var.h) {
            dm4Var.d();
        }
        return c1e.a;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        dm4 dm4Var = this.c;
        switch (i) {
            case 0:
                return new bm4(dm4Var, n92Var, 0);
            case 1:
                return new bm4(dm4Var, n92Var, 1);
            default:
                return new bm4(dm4Var, n92Var, 2);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                ((bm4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            case 1:
                ((bm4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((bm4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        switch (this.b) {
            case 0:
                br7.v(obj);
                dm4 dm4Var = this.c;
                synchronized (dm4Var.h) {
                    SharedPreferences.Editor editorEdit = dm4Var.a.edit();
                    editorEdit.clear();
                    editorEdit.commit();
                    dm4Var.d();
                }
                return c1e.a;
            case 1:
                return i(obj);
            default:
                br7.v(obj);
                am4 am4VarA = this.c.a();
                am4VarA.b.set(fy3.a);
                am4VarA.a.e(ek6.STAFF_OVERRIDES_VARIANT_FLAGS);
                return c1e.a;
        }
    }
}
