package defpackage;

import android.net.Uri;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class so6 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ to6 c;
    public final /* synthetic */ String d;
    public final /* synthetic */ String e;
    public final /* synthetic */ Uri f;
    public final /* synthetic */ SusiOperation g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public so6(to6 to6Var, String str, String str2, Uri uri, SusiOperation susiOperation, n92 n92Var) {
        super(2, n92Var);
        this.c = to6Var;
        this.d = str;
        this.e = str2;
        this.f = uri;
        this.g = susiOperation;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new so6(this.c, this.d, this.e, this.f, this.g, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((so6) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        SusiDestination.Deeplink deeplink = null;
        if (i == 0) {
            br7.v(obj);
            r6c r6cVar = this.c.h;
            String queryParameter = this.f.getQueryParameter("redirect");
            if (queryParameter != null) {
                if (muc.b0(queryParameter)) {
                    queryParameter = null;
                }
                if (queryParameter != null) {
                    deeplink = new SusiDestination.Deeplink(queryParameter);
                }
            }
            ko6 ko6Var = new ko6(this.d, this.e, deeplink, this.g);
            this.b = 1;
            if (r6cVar.a(ko6Var, this) == tb2Var) {
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
