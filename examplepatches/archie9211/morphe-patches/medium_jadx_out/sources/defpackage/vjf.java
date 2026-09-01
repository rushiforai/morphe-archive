package defpackage;

import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.ResolvableApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;
import j$.util.Objects;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vjf implements a89 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ BasePendingResult b;
    public final /* synthetic */ Object c;

    public vjf(pif pifVar, BasePendingResult basePendingResult) {
        this.b = basePendingResult;
        Objects.requireNonNull(pifVar);
        this.c = pifVar;
    }

    @Override // defpackage.a89
    public final void a(Status status) {
        int i = this.a;
        BasePendingResult basePendingResult = this.b;
        Object obj = this.c;
        switch (i) {
            case 0:
                wfd wfdVar = (wfd) obj;
                if (status.a > 0) {
                    wfdVar.a(status.c != null ? new ResolvableApiException(status) : new ApiException(status));
                } else {
                    basePendingResult.await(0L, TimeUnit.MILLISECONDS);
                    wfdVar.b(null);
                }
                break;
            default:
                ((pif) obj).a.remove(basePendingResult);
                break;
        }
    }

    public vjf(BasePendingResult basePendingResult, wfd wfdVar, rz5 rz5Var) {
        this.b = basePendingResult;
        this.c = wfdVar;
    }
}
