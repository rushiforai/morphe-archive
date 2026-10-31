package com.google.android.play.core.hsdp.service;

import ai.h;
import android.content.Context;
import android.content.res.Configuration;
import android.util.AttributeSet;
import android.widget.FrameLayout;

/* loaded from: classes3.dex */
public final class HsdpLoadingPanelContainer extends FrameLayout {

    /* renamed from: a, reason: collision with root package name */
    public h f34552a;

    public HsdpLoadingPanelContainer(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        h hVar = this.f34552a;
        if (hVar != null) {
            removeCallbacks(hVar);
            post(this.f34552a);
        }
    }
}
