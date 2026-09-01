package defpackage;

import com.medium.android.postpublishing.ui.TopicData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tea extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ wea d;
    public final /* synthetic */ TopicData e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ tea(wea weaVar, TopicData topicData, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = weaVar;
        this.e = topicData;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        TopicData topicData = this.e;
        wea weaVar = this.d;
        switch (i) {
            case 0:
                return new tea(weaVar, topicData, n92Var, 0);
            default:
                return new tea(weaVar, topicData, n92Var, 1);
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
        return ((tea) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        TopicData topicData = this.e;
        wea weaVar = this.d;
        switch (i) {
            case 0:
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
                r6c r6cVar = weaVar.d;
                lea leaVar = new lea(topicData);
                this.c = 1;
                return r6cVar.a(leaVar, this) == tb2Var ? tb2Var : c1eVar;
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
                r6c r6cVar2 = weaVar.d;
                mea meaVar = new mea(topicData);
                this.c = 1;
                return r6cVar2.a(meaVar, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
