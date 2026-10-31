package qg;

import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;

/* loaded from: classes3.dex */
public final class l extends BasePendingResult {

    /* renamed from: k, reason: collision with root package name */
    public final Status f84064k;

    public l(Status status) {
        super(null);
        this.f84064k = status;
    }

    @Override // com.google.android.gms.common.api.internal.BasePendingResult
    public final k z(Status status) {
        return this.f84064k;
    }
}
