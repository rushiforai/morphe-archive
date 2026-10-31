package ads_mobile_sdk;

import java.io.IOException;
import java.net.UnknownServiceException;
import kotlinx.coroutines.DispatchException;
import x80.i;
import x80.m0;

/* loaded from: classes2.dex */
public final class gq3 implements x80.j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t70.m f4033a;

    public /* synthetic */ gq3(t70.m mVar) {
        this.f4033a = mVar;
    }

    @Override // x80.j
    public void onFailure(i iVar, IOException iOException) throws DispatchException {
        Object qu0Var;
        if (iOException instanceof UnknownServiceException) {
            String message = iOException.getMessage();
            if (message == null) {
                message = "Non-retryable OkHttp network error";
            }
            qu0Var = new vu0(message, iOException);
        } else {
            qu0Var = new qu0(iOException, wd1.f11217e, null, 4);
        }
        this.f4033a.o(qu0Var, new o11(iVar, 0));
    }

    @Override // x80.j
    public void onResponse(i iVar, m0 m0Var) throws DispatchException {
        this.f4033a.o(new xu0(m0Var), new o11(iVar, 1));
    }
}
