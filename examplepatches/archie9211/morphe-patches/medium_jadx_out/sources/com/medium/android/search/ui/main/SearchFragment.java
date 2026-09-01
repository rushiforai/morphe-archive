package com.medium.android.search.ui.main;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import defpackage.cn5;
import defpackage.gtb;
import defpackage.htb;
import defpackage.i5b;
import defpackage.mz1;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0006²\u0006\f\u0010\u0005\u001a\u00020\u00048\nX\u008a\u0084\u0002"}, d2 = {"Lcom/medium/android/search/ui/main/SearchFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "<init>", "()V", "Lvj3;", "bottomMargin", "search_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SearchFragment extends cn5 {
    public final vq6 u0;

    public SearchFragment() {
        super(17);
        this.u0 = vx0.d0(yw6.NONE, new i5b(16, this));
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        htb htbVar = new htb(this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new gtb(this, htbVar, 0), true, 1943182956));
        return composeView;
    }
}
