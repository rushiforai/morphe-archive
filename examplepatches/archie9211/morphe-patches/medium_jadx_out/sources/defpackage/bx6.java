package defpackage;

import com.medium.android.donkey.susi.SusiActivity;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class bx6 implements m45 {
    public final /* synthetic */ int a;
    public final Object b;

    public bx6(a3 a3Var, SusiActivity susiActivity) {
        this.a = 13;
        this.b = a3Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        int i2 = 1;
        Object obj = this.b;
        switch (i) {
            case 0:
                qn6 qn6Var = (qn6) ((cx6) obj).c.invoke();
                qn6Var.getClass();
                return (mn6) qn6Var;
            case 1:
                return new w7(i2, (em4) obj);
            case 2:
                return new w7(i2, (te7) obj);
            case 3:
                m45 m45Var = ((we8) obj).b;
                if (m45Var != null) {
                    return (List) m45Var.invoke();
                }
                return null;
            case 4:
                return (List) ((rya) obj).a;
            case 5:
                return new w7(i2, (v2a) obj);
            case 6:
                return (ev7) ((hrb) obj).b.invoke(sn6.a);
            case 7:
                return new w7(i2, (f5c) obj);
            case 8:
                return new w7(i2, (r8c) obj);
            case 9:
                return er7.H((swd) ((onc) obj).b);
            case 10:
                return new w7(i2, (fwc) obj);
            case 11:
                return new ixd(((ixd) obj).a);
            case 12:
                t0d t0dVar = (t0d) obj;
                return t0dVar.i(qo7.o(t0dVar.b, null, 3));
            case 13:
                return (qg2) ((a3) obj).invoke();
            case 14:
                return l24.c(k24.CANNOT_COMPUTE_ERASED_BOUND, ((mya) obj).toString());
            default:
                return (List) ((kqe) obj).m.getValue();
        }
    }

    public /* synthetic */ bx6(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public bx6(sn6 sn6Var, cx6 cx6Var) {
        this.a = 0;
        this.b = cx6Var;
    }
}
