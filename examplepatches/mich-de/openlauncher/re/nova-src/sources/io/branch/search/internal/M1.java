package io.branch.search.internal;

import io.branch.search.internal.C4;
import java.util.ArrayList;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;

/* loaded from: classes4.dex */
public final class M1 implements D8 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ L1 f62861a;

    public M1(L1 l12) {
        this.f62861a = l12;
    }

    @Override // io.branch.search.internal.D8
    public final void a(@NotNull String callerId, int i5) throws JSONException {
        Intrinsics.g(callerId, "callerId");
        C3240l0 c3240l0 = this.f62861a.f62818f;
        c3240l0.getClass();
        String strB = c3240l0.f64939d.b(callerId);
        this.f62861a.f62817e.a(strB, "BranchAnalytics", "Detected onMoveToBackground skipped, forcing new sessionId, moveCounter " + i5);
        L1 l12 = this.f62861a;
        ArrayList arrayList = new ArrayList();
        EmptyList emptyList = EmptyList.f71733a;
        l12.a(strB, new C4.i.d(arrayList, emptyList, emptyList));
    }

    @Override // io.branch.search.internal.D8
    public final void b(@NotNull String callerId, int i5) {
        Intrinsics.g(callerId, "callerId");
        C3240l0 c3240l0 = this.f62861a.f62818f;
        c3240l0.getClass();
        String strB = c3240l0.f64939d.b(callerId);
        this.f62861a.f62817e.a(strB, "BranchAnalytics", "Detected onMoveToForeground skipped, forcing analytics offload, moveCounter " + i5);
        this.f62861a.a(callerId);
    }
}
