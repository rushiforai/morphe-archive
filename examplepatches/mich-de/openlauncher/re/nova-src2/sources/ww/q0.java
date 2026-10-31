package ww;

import android.content.Context;
import android.view.ViewGroup;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.s2;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q0 extends m1 {

    /* renamed from: a, reason: collision with root package name */
    public EmptyList f94828a;

    @Override // androidx.recyclerview.widget.m1
    public final int getItemCount() {
        this.f94828a.getClass();
        return 0;
    }

    @Override // androidx.recyclerview.widget.m1
    public final long getItemId(int i5) {
        this.f94828a.get(i5);
        throw null;
    }

    @Override // androidx.recyclerview.widget.m1
    public final void onBindViewHolder(s2 s2Var, int i5) {
        p0 holder = (p0) s2Var;
        Intrinsics.g(holder, "holder");
        this.f94828a.get(i5);
        throw null;
    }

    @Override // androidx.recyclerview.widget.m1
    public final s2 onCreateViewHolder(ViewGroup viewGroup, int i5) {
        Intrinsics.g(viewGroup, "viewGroup");
        Context context = viewGroup.getContext();
        Intrinsics.f(context, "getContext(...)");
        return new p0(new r0(context));
    }
}
