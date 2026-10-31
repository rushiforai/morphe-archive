package il;

import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final AtomicBoolean f61637a;

    public a(boolean z11) {
        this.f61637a = new AtomicBoolean(z11);
    }

    public boolean a() {
        return this.f61637a.get();
    }

    public void b() {
        this.f61637a.set(true);
    }

    public a(int i5) {
        switch (i5) {
            case 1:
                this.f61637a = new AtomicBoolean(false);
                break;
            default:
                this.f61637a = new AtomicBoolean(false);
                break;
        }
    }
}
