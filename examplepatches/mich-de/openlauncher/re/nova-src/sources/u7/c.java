package u7;

import kotlin.jvm.internal.Intrinsics;
import x7.q;

/* loaded from: classes.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public final v7.e f90665a;

    public c(v7.e tracker) {
        Intrinsics.g(tracker, "tracker");
        this.f90665a = tracker;
    }

    public abstract int a();

    public abstract boolean b(q qVar);

    public abstract boolean c(Object obj);
}
