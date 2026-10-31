package ads_mobile_sdk;

import b.d7;
import java.util.Optional;

/* loaded from: classes2.dex */
public final /* synthetic */ class ut3 implements d7 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f10485a;

    public /* synthetic */ ut3(long j11) {
        this.f10485a = j11;
    }

    @Override // java.util.function.Function
    public final /* synthetic */ Object apply(Object obj) {
        try {
            ((qu3) obj).f8820a.a(vu3.a(this.f10485a));
            return Optional.empty();
        } catch (lu3 unused) {
            return Optional.of(hm2.f4441b);
        }
    }
}
