package io.branch.search.internal;

import io.branch.search.internal.client.ads.ImpressionInfo;
import java.util.ArrayList;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class J7 implements I7 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final ArrayList f62732a = new ArrayList();

    @Override // io.branch.search.internal.I7
    public final void a(@NotNull ImpressionInfo info) {
        Intrinsics.g(info, "info");
        synchronized (this.f62732a) {
            this.f62732a.add(info);
            Unit unit = Unit.f71706a;
        }
    }

    @Override // io.branch.search.internal.I7
    @NotNull
    public final List<ImpressionInfo> a() {
        List<ImpressionInfo> listI1;
        synchronized (this.f62732a) {
            listI1 = b70.g.I1(this.f62732a);
        }
        return listI1;
    }
}
