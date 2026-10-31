package fp;

import cp.a0;
import cp.z;

/* loaded from: classes4.dex */
public final class r implements a0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Class f55539a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Class f55540b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ z f55541c;

    public r(Class cls, Class cls2, z zVar) {
        this.f55539a = cls;
        this.f55540b = cls2;
        this.f55541c = zVar;
    }

    @Override // cp.a0
    public final z a(cp.m mVar, jp.a aVar) {
        Class cls = aVar.f69629a;
        if (cls == this.f55539a || cls == this.f55540b) {
            return this.f55541c;
        }
        return null;
    }

    public final String toString() {
        return "Factory[type=" + this.f55540b.getName() + "+" + this.f55539a.getName() + ",adapter=" + this.f55541c + "]";
    }
}
