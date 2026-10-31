package androidx.lifecycle;

import ae.m;
import h6.a0;
import h6.c0;
import h6.u;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Landroidx/lifecycle/ProcessLifecycleOwner;", "Lh6/a0;", "<init>", "()V", "lifecycle-process_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ProcessLifecycleOwner implements a0 {

    /* renamed from: c, reason: collision with root package name */
    public static final ProcessLifecycleOwner f14727c = new ProcessLifecycleOwner();

    /* renamed from: a, reason: collision with root package name */
    public boolean f14728a = true;

    /* renamed from: b, reason: collision with root package name */
    public final c0 f14729b = new c0(this);

    private ProcessLifecycleOwner() {
        new m(this, 8);
    }

    @Override // h6.a0
    public final u getLifecycle() {
        return this.f14729b;
    }
}
