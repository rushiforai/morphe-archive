package defpackage;

import com.medium.android.core.navigation.NotificationFilterType;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kl8 extends p4d implements c55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ do4 d;
    public /* synthetic */ Object[] e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kl8(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        int i2 = 3;
        do4 do4Var = (do4) obj;
        Object[] objArr = (Object[]) obj2;
        n92 n92Var = (n92) obj3;
        switch (i) {
            case 0:
                kl8 kl8Var = new kl8(i2, 0, n92Var);
                kl8Var.d = do4Var;
                kl8Var.e = objArr;
                return kl8Var.invokeSuspend(c1eVar);
            default:
                kl8 kl8Var2 = new kl8(i2, 1, n92Var);
                kl8Var2.d = do4Var;
                kl8Var2.e = objArr;
                return kl8Var2.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        m72 m72Var;
        int i = this.b;
        c1e c1eVar = c1e.a;
        m72 m72Var2 = null;
        switch (i) {
            case 0:
                do4 do4Var = this.d;
                Object[] objArr = this.e;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Map mapV = ei7.V(bu1.t1(k80.Q0((fl8[]) objArr), NotificationFilterType.getEntries()));
                this.d = null;
                this.e = null;
                this.c = 1;
                return do4Var.a(mapV, this) == tb2Var ? tb2Var : c1eVar;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                do4 do4Var2 = this.d;
                m72[] m72VarArr = (m72[]) this.e;
                int length = m72VarArr.length;
                int i4 = 0;
                while (true) {
                    m72Var = k72.a;
                    if (i4 < length) {
                        m72 m72Var3 = m72VarArr[i4];
                        if (g76.L(m72Var3, m72Var)) {
                            i4++;
                        } else {
                            m72Var2 = m72Var3;
                        }
                    }
                }
                if (m72Var2 != null) {
                    m72Var = m72Var2;
                }
                this.c = 1;
                return do4Var2.a(m72Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
