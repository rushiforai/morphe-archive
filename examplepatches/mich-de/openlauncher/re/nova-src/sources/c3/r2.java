package c3;

import kotlin.Unit;
import kotlin.sequences.Sequence;

/* loaded from: classes.dex */
public abstract class r2 implements o2 {

    /* renamed from: a, reason: collision with root package name */
    public q2 f19417a;

    public final q2 a() {
        q2 q2Var = this.f19417a;
        if (q2Var == null) {
            q2Var = new q2();
            Unit unit = Unit.f71706a;
        }
        this.f19417a = q2Var;
        return q2Var;
    }

    @Override // c3.o2
    public final Sequence getInspectableElements() {
        return a().b();
    }

    @Override // c3.o2
    public final String getNameFallback() {
        return a().a();
    }

    @Override // c3.o2
    public final Object getValueOverride() {
        return a().c();
    }
}
