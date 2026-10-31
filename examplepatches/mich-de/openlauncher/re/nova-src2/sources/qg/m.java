package qg;

import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;

/* loaded from: classes3.dex */
public final class m extends BasePendingResult {

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ int f84065k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m(i iVar, int i5) {
        super(iVar);
        this.f84065k = i5;
    }

    @Override // com.google.android.gms.common.api.internal.BasePendingResult
    public final k z(Status status) {
        switch (this.f84065k) {
            case 0:
                throw new UnsupportedOperationException("Creating failed results is not supported");
            default:
                return status;
        }
    }
}
