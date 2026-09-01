package com.medium.android.catalogs.addnotetolistitem;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.android.core.navigation.s;
import defpackage.g76;
import defpackage.k6c;
import defpackage.lm5;
import defpackage.mz1;
import defpackage.p13;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/medium/android/catalogs/addnotetolistitem/AddNoteToListItemDialogFragment;", "Ld0;", "<init>", "()V", "catalogs_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AddNoteToListItemDialogFragment extends lm5 {
    public p13 H0;

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new k6c(4, this), true, -1441539058));
        return composeView;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
        bottomSheetBehavior.l = -1;
    }

    public final s f0() {
        p13 p13Var = this.H0;
        if (p13Var != null) {
            return p13Var;
        }
        g76.g0("router");
        throw null;
    }
}
