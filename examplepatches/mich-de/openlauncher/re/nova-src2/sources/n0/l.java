package n0;

import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class l implements z2.e {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m f77444a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f77445b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f77446c;

    public l(m mVar, Ref.ObjectRef objectRef, int i5) {
        this.f77444a = mVar;
        this.f77445b = objectRef;
        this.f77446c = i5;
    }

    @Override // z2.e
    public final boolean a() {
        return this.f77444a.B((i) this.f77445b.f71863a, this.f77446c);
    }
}
