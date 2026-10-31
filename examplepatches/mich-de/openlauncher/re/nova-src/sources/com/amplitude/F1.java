package com.amplitude;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.LinkedHashSet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class F1 implements ViewTreeObserver.OnPreDrawListener {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f20230a;

    /* renamed from: b, reason: collision with root package name */
    public final LinkedHashSet f20231b;

    public F1(View rootView) {
        Intrinsics.g(rootView, "rootView");
        this.f20230a = new WeakReference(rootView);
        this.f20231b = new LinkedHashSet();
    }

    public final void a(View view) {
        if (view.isDirty()) {
            this.f20231b.add(Integer.valueOf(view.hashCode()));
        }
        ViewGroup viewGroup = view instanceof ViewGroup ? (ViewGroup) view : null;
        if (viewGroup != null) {
            a5.c1 c1Var = new a5.c1(viewGroup);
            while (c1Var.hasNext()) {
                a((View) c1Var.next());
            }
        }
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    public final boolean onPreDraw() {
        this.f20231b.clear();
        View view = (View) this.f20230a.get();
        if (view == null) {
            return true;
        }
        a(view);
        return true;
    }
}
