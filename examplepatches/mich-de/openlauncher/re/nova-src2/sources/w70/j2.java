package w70;

import java.util.concurrent.atomic.AtomicReference;
import kotlin.coroutines.Continuation;

/* loaded from: classes.dex */
public final class j2 extends x70.c {

    /* renamed from: a, reason: collision with root package name */
    public final AtomicReference f93945a = new AtomicReference(null);

    @Override // x70.c
    public final boolean a(x70.a aVar) {
        AtomicReference atomicReference = this.f93945a;
        if (atomicReference.get() != null) {
            return false;
        }
        atomicReference.set(u1.f94042b);
        return true;
    }

    @Override // x70.c
    public final Continuation[] b(x70.a aVar) {
        this.f93945a.set(null);
        return x70.b.f95215a;
    }
}
