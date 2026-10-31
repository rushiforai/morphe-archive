package ah;

import android.os.Bundle;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class f implements j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Bundle f12812a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a f12813b;

    public f(a aVar, Bundle bundle) {
        this.f12812a = bundle;
        Objects.requireNonNull(aVar);
        this.f12813b = aVar;
    }

    @Override // ah.j
    public final int a() {
        return 1;
    }

    @Override // ah.j
    public final void b() {
        ((c) this.f12813b.f12803a).onCreate(this.f12812a);
    }
}
