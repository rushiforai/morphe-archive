package defpackage;

import android.os.Bundle;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lsa8;", "Lsc8;", "Lva8;", "navigation-runtime_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class sa8 extends sc8 {
    @Override // defpackage.sc8
    public final va8 a() {
        return new va8("permissive");
    }

    @Override // defpackage.sc8
    public final va8 c(va8 va8Var, Bundle bundle, ob8 ob8Var, w6 w6Var) {
        throw new IllegalStateException("navigate is not supported");
    }

    @Override // defpackage.sc8
    public final boolean j() {
        throw new IllegalStateException("popBackStack is not supported");
    }
}
