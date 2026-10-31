package q;

import android.content.Context;
import android.view.ActionProvider;

/* loaded from: classes2.dex */
public final class n implements ActionProvider.VisibilityListener {

    /* renamed from: a, reason: collision with root package name */
    public final Context f83281a;

    /* renamed from: b, reason: collision with root package name */
    public c f83282b;

    /* renamed from: c, reason: collision with root package name */
    public final ActionProvider f83283c;

    public n(r rVar, Context context, ActionProvider actionProvider) {
        this.f83281a = context;
        this.f83283c = actionProvider;
    }

    @Override // android.view.ActionProvider.VisibilityListener
    public final void onActionProviderVisibilityChanged(boolean z11) {
        c cVar = this.f83282b;
        if (cVar != null) {
            k kVar = ((m) cVar.f83189b).n;
            kVar.f83239h = true;
            kVar.p(true);
        }
    }
}
