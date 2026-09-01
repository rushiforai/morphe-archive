package com.medium.android.yourfollowingfeed.ui;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import defpackage.bsb;
import defpackage.k40;
import defpackage.l2f;
import defpackage.mz1;
import defpackage.o7f;
import defpackage.ood;
import defpackage.pn5;
import defpackage.r6c;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.yw6;
import defpackage.zbf;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0007²\u0006\f\u0010\u0006\u001a\u00020\u00058\nX\u008a\u0084\u0002"}, d2 = {"Lcom/medium/android/yourfollowingfeed/ui/YourFollowingFeedFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "Lbsb;", "<init>", "()V", "Lvj3;", "bottomMargin", "yourfollowingfeed_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class YourFollowingFeedFragment extends pn5 implements bsb {
    public final vq6 u0;
    public final r6c v0;

    public YourFollowingFeedFragment() {
        super(9);
        this.u0 = vx0.d0(yw6.NONE, new l2f(7, this));
        this.v0 = k40.x(0, 7, null);
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new zbf(this, 0), true, 693567305));
        return composeView;
    }

    @Override // defpackage.bsb
    public final void b() {
        vx0.c0(o7f.x(q()), null, null, new ood(this, null, 9), 3);
    }
}
