package defpackage;

import android.view.textclassifier.TextClassifier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sa9 extends p4d implements b55 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ va9 d;
    public final /* synthetic */ CharSequence e;
    public final /* synthetic */ long f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sa9(long j, n92 n92Var, va9 va9Var, CharSequence charSequence) {
        super(2, n92Var);
        this.d = va9Var;
        this.e = charSequence;
        this.f = j;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        sa9 sa9Var = new sa9(this.f, n92Var, this.d, this.e);
        sa9Var.c = obj;
        return sa9Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((sa9) create(lg8.c(obj), (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            TextClassifier textClassifierC = lg8.c(this.c);
            this.b = 1;
            if (this.d.b(this.e, this.f, textClassifierC, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }
}
