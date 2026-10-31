package p1;

import kotlin.sequences.SequencesKt;
import kotlin.sequences.SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1;

/* loaded from: classes2.dex */
public final class m extends Exception {

    /* renamed from: a, reason: collision with root package name */
    public final z.u0 f81502a;

    /* renamed from: b, reason: collision with root package name */
    public final z.j0 f81503b;

    /* renamed from: c, reason: collision with root package name */
    public final z.k f81504c;

    /* renamed from: d, reason: collision with root package name */
    public final int f81505d;

    public m(z.u0 u0Var, z.j0 j0Var, z.k kVar, int i5, Exception exc) {
        super(exc);
        this.f81502a = u0Var;
        this.f81503b = j0Var;
        this.f81504c = kVar;
        this.f81505d = i5;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return r70.f.p0("\n            |Exception while applying pausable composition. Last 10 operations:\n            |" + b70.g.f1(b70.g.F1(10, SequencesKt.A0(new SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1(new l(this, null)))), "\n", null, null, 0, null, 62) + "\n            ");
    }
}
