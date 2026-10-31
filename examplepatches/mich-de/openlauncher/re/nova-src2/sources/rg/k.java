package rg;

import com.google.android.gms.common.api.internal.BasePendingResult;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class k extends p50.i {

    /* renamed from: a, reason: collision with root package name */
    public final BasePendingResult f85891a;

    public k(BasePendingResult basePendingResult) {
        this.f85891a = basePendingResult;
    }

    @Override // p50.i
    public final qg.k h() {
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        return this.f85891a.h();
    }
}
