package defpackage;

import android.app.Dialog;
import android.os.Bundle;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b'\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Ld0;", "Ldw0;", "<init>", "()V", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public abstract class d0 extends dw0 {
    @Override // defpackage.dw0, defpackage.i20, defpackage.fb3
    public Dialog a0(Bundle bundle) {
        Dialog dialogA0 = super.a0(bundle);
        BottomSheetBehavior bottomSheetBehaviorG = ((cw0) dialogA0).g();
        bottomSheetBehaviorG.getClass();
        d0(bottomSheetBehaviorG);
        return dialogA0;
    }

    public void d0(BottomSheetBehavior bottomSheetBehavior) {
    }
}
