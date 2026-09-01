package defpackage;

import com.medium.android.core.models.EntityType;
import com.medium.android.profile.ui.view.m;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rje extends p4d implements b55 {
    public final /* synthetic */ int b = 0;
    public int c;
    public final /* synthetic */ String d;
    public final /* synthetic */ m e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rje(m mVar, String str, String str2, n92 n92Var) {
        super(2, n92Var);
        this.e = mVar;
        this.d = str;
        this.f = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        String str = this.f;
        m mVar = this.e;
        String str2 = this.d;
        switch (i) {
            case 0:
                return new rje(mVar, str2, str, n92Var);
            default:
                return new rje(str2, mVar, str, n92Var);
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
        return ((rje) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objD;
        int i = this.b;
        m mVar = this.e;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return obj;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                o2b o2bVar = mVar.g;
                EntityType entityType = EntityType.AUTHOR;
                this.c = 1;
                Object objU = o2bVar.u(this, entityType, null, this.d, this.f, false);
                return objU == tb2Var ? tb2Var : objU;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    String str = this.d;
                    if (str == null) {
                        return null;
                    }
                    eoc eocVar = mVar.k;
                    EntityType entityType2 = EntityType.AUTHOR;
                    this.c = 1;
                    objD = eocVar.d(this, entityType2, str, this.f, false);
                    if (objD == tb2Var2) {
                        return tb2Var2;
                    }
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objD = ((bjb) obj).a;
                }
                return new bjb(objD);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rje(String str, m mVar, String str2, n92 n92Var) {
        super(2, n92Var);
        this.d = str;
        this.e = mVar;
        this.f = str2;
    }
}
