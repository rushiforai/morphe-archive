package ah;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class i implements j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f12822a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a f12823b;

    public i(a aVar, int i5) {
        this.f12822a = i5;
        switch (i5) {
            case 1:
                Objects.requireNonNull(aVar);
                this.f12823b = aVar;
                break;
            default:
                Objects.requireNonNull(aVar);
                this.f12823b = aVar;
                break;
        }
    }

    @Override // ah.j
    public final int a() {
        switch (this.f12822a) {
            case 0:
                return 4;
            default:
                return 5;
        }
    }

    @Override // ah.j
    public final void b() {
        switch (this.f12822a) {
            case 0:
                ((c) this.f12823b.f12803a).onStart();
                break;
            default:
                ((c) this.f12823b.f12803a).onResume();
                break;
        }
    }
}
