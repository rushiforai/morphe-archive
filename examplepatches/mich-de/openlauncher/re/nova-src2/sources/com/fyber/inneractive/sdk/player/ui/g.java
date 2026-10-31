package com.fyber.inneractive.sdk.player.ui;

import android.view.TextureView;
import android.view.View;
import com.fyber.inneractive.sdk.util.v;
import java.lang.ref.WeakReference;

/* loaded from: classes3.dex */
public final class g extends TextureView {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f30689a;

    public g(s sVar) {
        super(sVar.getContext());
        this.f30689a = new WeakReference(sVar);
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        s sVar = (s) v.a(this.f30689a);
        if (sVar instanceof i) {
            sVar = ((i) sVar).f30690z;
        }
        if (sVar != null) {
            i5 = View.MeasureSpec.makeMeasureSpec(sVar.f30740u.f31191a, 1073741824);
            i11 = View.MeasureSpec.makeMeasureSpec(sVar.f30740u.f31192b, 1073741824);
        }
        super.onMeasure(i5, i11);
    }
}
