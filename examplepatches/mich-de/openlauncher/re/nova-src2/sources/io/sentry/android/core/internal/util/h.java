package io.sentry.android.core.internal.util;

import a5.a1;
import a5.h2;
import a5.t0;
import android.view.View;
import android.view.ViewTreeObserver;
import java.util.WeakHashMap;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class h implements ViewTreeObserver.OnGlobalLayoutListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f66956a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f66957b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f66958c;

    public /* synthetic */ h(View view, e1 e1Var) {
        this.f66957b = view;
        this.f66958c = e1Var;
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public final void onGlobalLayout() {
        int i5 = this.f66956a;
        Object obj = this.f66958c;
        View view = this.f66957b;
        switch (i5) {
            case 0:
                i iVar = (i) obj;
                iVar.getClass();
                view.getViewTreeObserver().removeOnDrawListener(iVar);
                break;
            default:
                e1 e1Var = (e1) obj;
                WeakHashMap weakHashMap = a1.f250a;
                h2 h2VarA = t0.a(view);
                e1Var.setValue(Boolean.valueOf(h2VarA != null ? h2VarA.f296a.q(8) : true));
                break;
        }
    }

    public /* synthetic */ h(i iVar, View view) {
        this.f66958c = iVar;
        this.f66957b = view;
    }
}
