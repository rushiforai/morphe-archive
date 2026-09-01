package defpackage;

import com.medium.android.profile.ui.view.m;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qje extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ m d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qje(m mVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = mVar;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new qje(this.d, this.e, this.f, n92Var, 0);
            default:
                return new qje(this.d, this.e, this.f, n92Var, 1);
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
        return ((qje) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object obj2;
        Object objW;
        int i = this.b;
        m mVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    lod lodVar = mVar.e;
                    String str = mVar.d;
                    String str2 = mVar.z;
                    this.c = 1;
                    Object objA = lodVar.a(this.e, str, this.f, str2, false, this);
                    if (objA == tb2Var) {
                        return tb2Var;
                    }
                    obj2 = objA;
                } else {
                    if (i2 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    obj2 = ((bjb) obj).a;
                }
                return new bjb(obj2);
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    o2b o2bVar = mVar.i;
                    String str3 = mVar.d;
                    String str4 = mVar.z;
                    this.c = 1;
                    objW = o2bVar.w(this.e, str3, this.f, str4, false, this);
                    if (objW == tb2Var2) {
                        return tb2Var2;
                    }
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objW = ((bjb) obj).a;
                }
                return new bjb(objW);
        }
    }
}
