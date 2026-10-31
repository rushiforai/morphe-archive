package androidx.fragment.app;

import android.content.DialogInterface;

/* loaded from: classes2.dex */
public final class t implements DialogInterface.OnDismissListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ DialogFragment f14688a;

    public t(DialogFragment dialogFragment) {
        this.f14688a = dialogFragment;
    }

    @Override // android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        DialogFragment dialogFragment = this.f14688a;
        if (dialogFragment.mDialog != null) {
            dialogFragment.onDismiss(dialogFragment.mDialog);
        }
    }
}
