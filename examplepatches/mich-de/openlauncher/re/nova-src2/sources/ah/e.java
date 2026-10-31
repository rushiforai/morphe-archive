package ah;

import android.app.Activity;
import android.os.Bundle;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class e implements j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Activity f12808a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Bundle f12809b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Bundle f12810c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ a f12811d;

    public e(a aVar, Activity activity, Bundle bundle, Bundle bundle2) {
        this.f12808a = activity;
        this.f12809b = bundle;
        this.f12810c = bundle2;
        Objects.requireNonNull(aVar);
        this.f12811d = aVar;
    }

    @Override // ah.j
    public final int a() {
        return 0;
    }

    @Override // ah.j
    public final void b() {
        ((c) this.f12811d.f12803a).b(this.f12808a, this.f12809b, this.f12810c);
    }
}
