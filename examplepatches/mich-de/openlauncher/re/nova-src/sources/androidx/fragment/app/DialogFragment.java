package androidx.fragment.app;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;

/* loaded from: classes2.dex */
public class DialogFragment extends h0 implements DialogInterface.OnCancelListener, DialogInterface.OnDismissListener {
    private static final String SAVED_BACK_STACK_ID = "android:backStackId";
    private static final String SAVED_CANCELABLE = "android:cancelable";
    private static final String SAVED_DIALOG_STATE_TAG = "android:savedDialogState";
    private static final String SAVED_INTERNAL_DIALOG_SHOWING = "android:dialogShowing";
    private static final String SAVED_SHOWS_DIALOG = "android:showsDialog";
    private static final String SAVED_STYLE = "android:style";
    private static final String SAVED_THEME = "android:theme";
    public static final int STYLE_NORMAL = 0;
    public static final int STYLE_NO_FRAME = 2;
    public static final int STYLE_NO_INPUT = 3;
    public static final int STYLE_NO_TITLE = 1;
    private int mBackStackId;
    private boolean mCancelable;
    private boolean mCreatingDialog;
    private Dialog mDialog;
    private boolean mDialogCreated;
    private Runnable mDismissRunnable;
    private boolean mDismissed;
    private Handler mHandler;
    private h6.n0 mObserver;
    private DialogInterface.OnCancelListener mOnCancelListener;
    private DialogInterface.OnDismissListener mOnDismissListener;
    private boolean mShownByMe;
    private boolean mShowsDialog;
    private int mStyle;
    private int mTheme;
    private boolean mViewDestroyed;

    public DialogFragment() {
        this.mDismissRunnable = new r(this, 0);
        this.mOnCancelListener = new s(this);
        this.mOnDismissListener = new t(this);
        this.mStyle = 0;
        this.mTheme = 0;
        this.mCancelable = true;
        this.mShowsDialog = true;
        this.mBackStackId = -1;
        this.mObserver = new u(this);
        this.mDialogCreated = false;
    }

    @Override // androidx.fragment.app.h0
    public p0 createFragmentContainer() {
        return new v(this, super.createFragmentContainer());
    }

    public void dismissAllowingStateLoss() {
        n(true, false, false);
    }

    public void dismissNow() {
        n(false, false, true);
    }

    public Dialog getDialog() {
        return this.mDialog;
    }

    public boolean getShowsDialog() {
        return this.mShowsDialog;
    }

    public int getTheme() {
        return this.mTheme;
    }

    public boolean isCancelable() {
        return this.mCancelable;
    }

    public final void n(boolean z11, boolean z12, boolean z13) {
        if (this.mDismissed) {
            return;
        }
        this.mDismissed = true;
        this.mShownByMe = false;
        Dialog dialog = this.mDialog;
        if (dialog != null) {
            dialog.setOnDismissListener(null);
            this.mDialog.dismiss();
            if (!z12) {
                if (Looper.myLooper() == this.mHandler.getLooper()) {
                    onDismiss(this.mDialog);
                } else {
                    this.mHandler.post(this.mDismissRunnable);
                }
            }
        }
        this.mViewDestroyed = true;
        if (this.mBackStackId >= 0) {
            if (z13) {
                h1 parentFragmentManager = getParentFragmentManager();
                int i5 = this.mBackStackId;
                if (i5 < 0) {
                    parentFragmentManager.getClass();
                    throw new IllegalArgumentException(b.c0.h(i5, "Bad id: "));
                }
                parentFragmentManager.S(i5, 1);
            } else {
                h1 parentFragmentManager2 = getParentFragmentManager();
                int i11 = this.mBackStackId;
                parentFragmentManager2.getClass();
                if (i11 < 0) {
                    throw new IllegalArgumentException(b.c0.h(i11, "Bad id: "));
                }
                parentFragmentManager2.y(new f1(parentFragmentManager2, i11), z11);
            }
            this.mBackStackId = -1;
            return;
        }
        h1 parentFragmentManager3 = getParentFragmentManager();
        parentFragmentManager3.getClass();
        a aVar = new a(parentFragmentManager3);
        aVar.f14674r = true;
        aVar.s(this);
        if (z13) {
            if (aVar.f14667i) {
                throw new IllegalStateException("This transaction is already being added to the back stack");
            }
            aVar.f14668j = false;
            aVar.f14487t.B(aVar, false);
            return;
        }
        if (z11) {
            aVar.l(true, true);
        } else {
            aVar.k();
        }
    }

    @Override // androidx.fragment.app.h0
    @Deprecated
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
    }

    @Override // androidx.fragment.app.h0
    public void onAttach(Context context) {
        super.onAttach(context);
        getViewLifecycleOwnerLiveData().f(this.mObserver);
        if (this.mShownByMe) {
            return;
        }
        this.mDismissed = false;
    }

    public void onCancel(DialogInterface dialogInterface) {
    }

    @Override // androidx.fragment.app.h0
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mHandler = new Handler();
        this.mShowsDialog = this.mContainerId == 0;
        if (bundle != null) {
            this.mStyle = bundle.getInt(SAVED_STYLE, 0);
            this.mTheme = bundle.getInt(SAVED_THEME, 0);
            this.mCancelable = bundle.getBoolean(SAVED_CANCELABLE, true);
            this.mShowsDialog = bundle.getBoolean(SAVED_SHOWS_DIALOG, this.mShowsDialog);
            this.mBackStackId = bundle.getInt(SAVED_BACK_STACK_ID, -1);
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        if (h1.K(3)) {
            toString();
        }
        return new g.q(requireContext(), getTheme());
    }

    @Override // androidx.fragment.app.h0
    public void onDestroyView() {
        super.onDestroyView();
        Dialog dialog = this.mDialog;
        if (dialog != null) {
            this.mViewDestroyed = true;
            dialog.setOnDismissListener(null);
            this.mDialog.dismiss();
            if (!this.mDismissed) {
                onDismiss(this.mDialog);
            }
            this.mDialog = null;
            this.mDialogCreated = false;
        }
    }

    @Override // androidx.fragment.app.h0
    public void onDetach() {
        super.onDetach();
        if (!this.mShownByMe && !this.mDismissed) {
            this.mDismissed = true;
        }
        getViewLifecycleOwnerLiveData().i(this.mObserver);
    }

    @Override // android.content.DialogInterface.OnDismissListener
    public void onDismiss(DialogInterface dialogInterface) {
        if (this.mViewDestroyed) {
            return;
        }
        if (h1.K(3)) {
            toString();
        }
        n(true, true, false);
    }

    public View onFindViewById(int i5) {
        Dialog dialog = this.mDialog;
        if (dialog != null) {
            return dialog.findViewById(i5);
        }
        return null;
    }

    @Override // androidx.fragment.app.h0
    public LayoutInflater onGetLayoutInflater(Bundle bundle) {
        LayoutInflater layoutInflaterOnGetLayoutInflater = super.onGetLayoutInflater(bundle);
        boolean z11 = this.mShowsDialog;
        if (z11 && !this.mCreatingDialog) {
            if (z11 && !this.mDialogCreated) {
                try {
                    this.mCreatingDialog = true;
                    Dialog dialogOnCreateDialog = onCreateDialog(bundle);
                    this.mDialog = dialogOnCreateDialog;
                    if (this.mShowsDialog) {
                        setupDialog(dialogOnCreateDialog, this.mStyle);
                        Context context = getContext();
                        if (context instanceof Activity) {
                            this.mDialog.setOwnerActivity((Activity) context);
                        }
                        this.mDialog.setCancelable(this.mCancelable);
                        this.mDialog.setOnCancelListener(this.mOnCancelListener);
                        this.mDialog.setOnDismissListener(this.mOnDismissListener);
                        this.mDialogCreated = true;
                    } else {
                        this.mDialog = null;
                    }
                    this.mCreatingDialog = false;
                } catch (Throwable th2) {
                    this.mCreatingDialog = false;
                    throw th2;
                }
            }
            if (h1.K(2)) {
                toString();
            }
            Dialog dialog = this.mDialog;
            if (dialog != null) {
                return layoutInflaterOnGetLayoutInflater.cloneInContext(dialog.getContext());
            }
        } else if (h1.K(2)) {
            toString();
        }
        return layoutInflaterOnGetLayoutInflater;
    }

    public boolean onHasView() {
        return this.mDialogCreated;
    }

    @Override // androidx.fragment.app.h0
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        Dialog dialog = this.mDialog;
        if (dialog != null) {
            Bundle bundleOnSaveInstanceState = dialog.onSaveInstanceState();
            bundleOnSaveInstanceState.putBoolean(SAVED_INTERNAL_DIALOG_SHOWING, false);
            bundle.putBundle(SAVED_DIALOG_STATE_TAG, bundleOnSaveInstanceState);
        }
        int i5 = this.mStyle;
        if (i5 != 0) {
            bundle.putInt(SAVED_STYLE, i5);
        }
        int i11 = this.mTheme;
        if (i11 != 0) {
            bundle.putInt(SAVED_THEME, i11);
        }
        boolean z11 = this.mCancelable;
        if (!z11) {
            bundle.putBoolean(SAVED_CANCELABLE, z11);
        }
        boolean z12 = this.mShowsDialog;
        if (!z12) {
            bundle.putBoolean(SAVED_SHOWS_DIALOG, z12);
        }
        int i12 = this.mBackStackId;
        if (i12 != -1) {
            bundle.putInt(SAVED_BACK_STACK_ID, i12);
        }
    }

    @Override // androidx.fragment.app.h0
    public void onStart() {
        super.onStart();
        Dialog dialog = this.mDialog;
        if (dialog != null) {
            this.mViewDestroyed = false;
            dialog.show();
            View decorView = this.mDialog.getWindow().getDecorView();
            h6.y0.f(decorView, this);
            h6.y0.g(decorView, this);
            u90.b.a0(decorView, this);
        }
    }

    @Override // androidx.fragment.app.h0
    public void onStop() {
        super.onStop();
        Dialog dialog = this.mDialog;
        if (dialog != null) {
            dialog.hide();
        }
    }

    @Override // androidx.fragment.app.h0
    public void onViewStateRestored(Bundle bundle) {
        Bundle bundle2;
        super.onViewStateRestored(bundle);
        if (this.mDialog == null || bundle == null || (bundle2 = bundle.getBundle(SAVED_DIALOG_STATE_TAG)) == null) {
            return;
        }
        this.mDialog.onRestoreInstanceState(bundle2);
    }

    @Override // androidx.fragment.app.h0
    public void performCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        Bundle bundle2;
        super.performCreateView(layoutInflater, viewGroup, bundle);
        if (this.mView != null || this.mDialog == null || bundle == null || (bundle2 = bundle.getBundle(SAVED_DIALOG_STATE_TAG)) == null) {
            return;
        }
        this.mDialog.onRestoreInstanceState(bundle2);
    }

    public final g.q requireComponentDialog() {
        Dialog dialogRequireDialog = requireDialog();
        if (dialogRequireDialog instanceof g.q) {
            return (g.q) dialogRequireDialog;
        }
        throw new IllegalStateException("DialogFragment " + this + " did not return a ComponentDialog instance from requireDialog(). The actual Dialog is " + dialogRequireDialog);
    }

    public final Dialog requireDialog() {
        Dialog dialog = getDialog();
        if (dialog != null) {
            return dialog;
        }
        throw new IllegalStateException("DialogFragment " + this + " does not have a Dialog.");
    }

    public void setCancelable(boolean z11) {
        this.mCancelable = z11;
        Dialog dialog = this.mDialog;
        if (dialog != null) {
            dialog.setCancelable(z11);
        }
    }

    public void setShowsDialog(boolean z11) {
        this.mShowsDialog = z11;
    }

    public void setStyle(int i5, int i11) {
        if (h1.K(2)) {
            toString();
        }
        this.mStyle = i5;
        if (i5 == 2 || i5 == 3) {
            this.mTheme = 16973913;
        }
        if (i11 != 0) {
            this.mTheme = i11;
        }
    }

    public void setupDialog(Dialog dialog, int i5) {
        if (i5 != 1 && i5 != 2) {
            if (i5 != 3) {
                return;
            }
            Window window = dialog.getWindow();
            if (window != null) {
                window.addFlags(24);
            }
        }
        dialog.requestWindowFeature(1);
    }

    public void show(h1 h1Var, String str) {
        this.mDismissed = false;
        this.mShownByMe = true;
        h1Var.getClass();
        a aVar = new a(h1Var);
        aVar.f14674r = true;
        aVar.e(0, this, str, 1);
        aVar.k();
    }

    public void showNow(h1 h1Var, String str) {
        this.mDismissed = false;
        this.mShownByMe = true;
        h1Var.getClass();
        a aVar = new a(h1Var);
        aVar.f14674r = true;
        aVar.e(0, this, str, 1);
        if (aVar.f14667i) {
            throw new IllegalStateException("This transaction is already being added to the back stack");
        }
        aVar.f14668j = false;
        aVar.f14487t.B(aVar, false);
    }

    public int show(q1 q1Var, String str) {
        this.mDismissed = false;
        this.mShownByMe = true;
        q1Var.e(0, this, str, 1);
        this.mViewDestroyed = false;
        int iL = ((a) q1Var).l(false, true);
        this.mBackStackId = iL;
        return iL;
    }

    public DialogFragment(int i5) {
        super(i5);
        this.mDismissRunnable = new r(this, 0);
        this.mOnCancelListener = new s(this);
        this.mOnDismissListener = new t(this);
        this.mStyle = 0;
        this.mTheme = 0;
        this.mCancelable = true;
        this.mShowsDialog = true;
        this.mBackStackId = -1;
        this.mObserver = new u(this);
        this.mDialogCreated = false;
    }
}
