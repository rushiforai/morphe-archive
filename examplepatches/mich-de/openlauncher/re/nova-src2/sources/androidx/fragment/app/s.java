package androidx.fragment.app;

import android.content.DialogInterface;

/* loaded from: classes2.dex */
public final class s implements DialogInterface.OnCancelListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ DialogFragment f14680a;

    public s(DialogFragment dialogFragment) {
        this.f14680a = dialogFragment;
    }

    @Override // android.content.DialogInterface.OnCancelListener
    public final void onCancel(DialogInterface dialogInterface) {
        DialogFragment dialogFragment = this.f14680a;
        if (dialogFragment.mDialog != null) {
            dialogFragment.onCancel(dialogFragment.mDialog);
        }
    }
}
