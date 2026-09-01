package defpackage;

import androidx.work.CoroutineWorker;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yb2 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ CoroutineWorker d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yb2(CoroutineWorker coroutineWorker, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = coroutineWorker;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        CoroutineWorker coroutineWorker = this.d;
        switch (i) {
            case 0:
                return new yb2(coroutineWorker, n92Var, 0);
            default:
                return new yb2(coroutineWorker, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((yb2) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        CoroutineWorker coroutineWorker = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    Object foregroundInfo = coroutineWorker.getForegroundInfo(this);
                    return foregroundInfo == tb2Var ? tb2Var : foregroundInfo;
                }
                if (i2 == 1) {
                    br7.v(obj);
                    return obj;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    Object objDoWork = coroutineWorker.doWork(this);
                    return objDoWork == tb2Var2 ? tb2Var2 : objDoWork;
                }
                if (i3 == 1) {
                    br7.v(obj);
                    return obj;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }
}
