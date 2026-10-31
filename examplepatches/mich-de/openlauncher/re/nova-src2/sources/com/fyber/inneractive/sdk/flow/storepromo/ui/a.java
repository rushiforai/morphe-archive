package com.fyber.inneractive.sdk.flow.storepromo.ui;

import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class a implements Animation.AnimationListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ c f28377a;

    public a(c cVar) {
        this.f28377a = cVar;
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationEnd(Animation animation) {
        c cVar;
        View view;
        c cVar2 = this.f28377a;
        ViewGroup viewGroup = cVar2.f28380b;
        if (viewGroup != null) {
            viewGroup.removeView(cVar2.f28379a);
            this.f28377a.f28380b.setAnimation(null);
            this.f28377a.f28380b.setVisibility(8);
        }
        com.fyber.inneractive.sdk.flow.storepromo.b bVar = this.f28377a.f28384f;
        if (bVar != null) {
            com.fyber.inneractive.sdk.flow.storepromo.controller.b bVar2 = bVar.f28284d;
            com.fyber.inneractive.sdk.flow.storepromo.observer.b bVar3 = new com.fyber.inneractive.sdk.flow.storepromo.observer.b((bVar2 == null || (cVar = bVar2.f28294d) == null || cVar.f28380b == null || (view = cVar.f28379a) == null || view.getParent() == null || cVar.f28380b.getVisibility() != 0) ? false : true, bVar.f28289i);
            Iterator it = bVar.f28288h.iterator();
            while (it.hasNext()) {
                ((com.fyber.inneractive.sdk.flow.storepromo.observer.a) it.next()).a(bVar3);
            }
        }
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationRepeat(Animation animation) {
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationStart(Animation animation) {
    }
}
