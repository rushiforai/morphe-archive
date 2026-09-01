package com.medium.android.pushnotifications.ui.requestpermission;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import defpackage.b15;
import defpackage.d0;
import defpackage.g7;
import defpackage.mz1;
import defpackage.qpa;
import defpackage.rpa;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/medium/android/pushnotifications/ui/requestpermission/PushNotificationPermissionRequestDialogFragment;", "Ld0;", "<init>", "()V", "pushnotifications_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PushNotificationPermissionRequestDialogFragment extends d0 {
    public final b15 C0 = (b15) P(new g7(3), new qpa());

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new rpa(this, 0), true, -1037984089));
        return composeView;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
    }
}
