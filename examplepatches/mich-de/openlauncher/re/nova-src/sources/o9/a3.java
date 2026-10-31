package o9;

import android.content.Context;
import android.view.View;
import com.android.launcher3.SecondaryDropTarget;

/* loaded from: classes2.dex */
public final class a3 implements k0 {

    /* renamed from: a, reason: collision with root package name */
    public final k0 f79759a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f79760b;

    /* renamed from: c, reason: collision with root package name */
    public String f79761c;

    /* renamed from: d, reason: collision with root package name */
    public l0 f79762d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ SecondaryDropTarget f79763e;

    public a3(SecondaryDropTarget secondaryDropTarget, k0 k0Var, Context context) {
        this.f79763e = secondaryDropTarget;
        this.f79759a = k0Var;
        this.f79760b = context;
    }

    public final void b() {
        l0 l0Var = this.f79762d;
        k0 k0Var = this.f79759a;
        l0Var.f79957i = k0Var;
        l0Var.f79958j = true;
        k0Var.i(this.f79763e, l0Var, false);
    }

    @Override // o9.k0
    public final void i(View view, l0 l0Var, boolean z11) {
        this.f79762d = l0Var;
    }
}
