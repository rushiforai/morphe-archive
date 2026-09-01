package defpackage;

import android.content.Context;
import androidx.work.impl.background.systemalarm.RescheduleReceiver;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lp0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ boolean c;
    public final /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lp0(l78 l78Var, boolean z, n92 n92Var) {
        super(2, n92Var);
        this.b = 1;
        this.d = l78Var;
        this.c = z;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                lp0 lp0Var = new lp0((pod) obj2, n92Var, 0);
                lp0Var.c = ((Boolean) obj).booleanValue();
                return lp0Var;
            case 1:
                return new lp0((l78) obj2, this.c, n92Var);
            default:
                lp0 lp0Var2 = new lp0((Context) obj2, n92Var, 2);
                lp0Var2.c = ((Boolean) obj).booleanValue();
                return lp0Var2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                Boolean bool = (Boolean) obj;
                bool.booleanValue();
                ((lp0) create(bool, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 1:
                ((lp0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            default:
                Boolean bool2 = (Boolean) obj;
                bool2.booleanValue();
                ((lp0) create(bool2, (n92) obj2)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                br7.v(obj);
                if (!this.c) {
                    ((pod) obj2).a();
                }
                break;
            case 1:
                l78 l78Var = (l78) obj2;
                br7.v(obj);
                if (((h0a) l78Var.getValue()) != null) {
                    l78Var.setValue(null);
                }
                break;
            default:
                br7.v(obj);
                ay8.a((Context) obj2, RescheduleReceiver.class, this.c);
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lp0(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
    }
}
