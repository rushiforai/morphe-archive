package n7;

import androidx.webkit.PrefetchException;
import androidx.webkit.PrefetchNetworkException;
import b.hb;
import org.chromium.support_lib_boundary.PrefetchOperationCallbackBoundaryInterface;

/* loaded from: classes2.dex */
public final class k implements PrefetchOperationCallbackBoundaryInterface {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m7.d f77923a;

    public k(m7.d dVar) {
        this.f77923a = dVar;
    }

    @Override // org.chromium.support_lib_boundary.PrefetchOperationCallbackBoundaryInterface
    public final void onFailure(int i5, String str, int i11) {
        m7.d dVar = this.f77923a;
        if (i5 == 1) {
            new PrefetchNetworkException(str);
            ((hb) dVar).getClass();
        } else {
            new PrefetchException(str);
            ((hb) dVar).getClass();
        }
    }

    @Override // org.chromium.support_lib_boundary.PrefetchOperationCallbackBoundaryInterface
    public final void onSuccess() {
        ((hb) this.f77923a).getClass();
    }
}
