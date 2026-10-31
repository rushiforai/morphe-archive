package cp;

import java.io.IOException;

/* loaded from: classes4.dex */
public final class y extends z {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ z f47788a;

    public y(z zVar) {
        this.f47788a = zVar;
    }

    @Override // cp.z
    public final Object b(kp.a aVar) {
        if (aVar.f0() != 9) {
            return this.f47788a.b(aVar);
        }
        aVar.V();
        return null;
    }

    @Override // cp.z
    public final void c(kp.b bVar, Object obj) throws IOException {
        if (obj == null) {
            bVar.p();
        } else {
            this.f47788a.c(bVar, obj);
        }
    }

    public final String toString() {
        return "NullSafeTypeAdapter[" + this.f47788a + "]";
    }
}
