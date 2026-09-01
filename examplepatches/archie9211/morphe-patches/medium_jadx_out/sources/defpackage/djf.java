package defpackage;

import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class djf extends BasePendingResult {
    public final Status a;

    public djf(Status status) {
        super(null);
        this.a = status;
    }

    @Override // com.google.android.gms.common.api.internal.BasePendingResult
    public final cjb a(Status status) {
        return this.a;
    }
}
