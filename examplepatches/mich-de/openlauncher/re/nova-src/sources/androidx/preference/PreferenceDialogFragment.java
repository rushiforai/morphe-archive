package androidx.preference;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.ComponentCallbacks2;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.amplitude.android.migration.DatabaseConstants;
import r6.a;

@Deprecated
/* loaded from: classes2.dex */
public abstract class PreferenceDialogFragment extends DialogFragment implements DialogInterface.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public DialogPreference f14781a;

    /* renamed from: b, reason: collision with root package name */
    public CharSequence f14782b;

    /* renamed from: c, reason: collision with root package name */
    public CharSequence f14783c;

    /* renamed from: d, reason: collision with root package name */
    public CharSequence f14784d;

    /* renamed from: e, reason: collision with root package name */
    public CharSequence f14785e;

    /* renamed from: f, reason: collision with root package name */
    public int f14786f;

    /* renamed from: g, reason: collision with root package name */
    public BitmapDrawable f14787g;

    /* renamed from: h, reason: collision with root package name */
    public int f14788h;

    @Deprecated
    public PreferenceDialogFragment() {
    }

    public final DialogPreference a() {
        if (this.f14781a == null) {
            getArguments().getString(DatabaseConstants.KEY_FIELD);
            ((a) getTargetFragment()).g();
            this.f14781a = null;
        }
        return this.f14781a;
    }

    public void b(View view) {
        int i5;
        View viewFindViewById = view.findViewById(16908299);
        if (viewFindViewById != null) {
            CharSequence charSequence = this.f14785e;
            if (TextUtils.isEmpty(charSequence)) {
                i5 = 8;
            } else {
                if (viewFindViewById instanceof TextView) {
                    ((TextView) viewFindViewById).setText(charSequence);
                }
                i5 = 0;
            }
            if (viewFindViewById.getVisibility() != i5) {
                viewFindViewById.setVisibility(i5);
            }
        }
    }

    public abstract void c(boolean z11);

    public void d(AlertDialog.Builder builder) {
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i5) {
        this.f14788h = i5;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        ComponentCallbacks2 targetFragment = getTargetFragment();
        if (!(targetFragment instanceof a)) {
            throw new IllegalStateException("Target fragment must implement TargetFragment interface");
        }
        a aVar = (a) targetFragment;
        getArguments().getString(DatabaseConstants.KEY_FIELD);
        if (bundle == null) {
            aVar.g();
            this.f14781a = null;
            throw null;
        }
        this.f14782b = bundle.getCharSequence("PreferenceDialogFragment.title");
        this.f14783c = bundle.getCharSequence("PreferenceDialogFragment.positiveText");
        this.f14784d = bundle.getCharSequence("PreferenceDialogFragment.negativeText");
        this.f14785e = bundle.getCharSequence("PreferenceDialogFragment.message");
        this.f14786f = bundle.getInt("PreferenceDialogFragment.layout", 0);
        Bitmap bitmap = (Bitmap) bundle.getParcelable("PreferenceDialogFragment.icon");
        if (bitmap != null) {
            this.f14787g = new BitmapDrawable(getResources(), bitmap);
        }
    }

    @Override // android.app.DialogFragment
    public final Dialog onCreateDialog(Bundle bundle) {
        Activity activity = getActivity();
        this.f14788h = -2;
        AlertDialog.Builder negativeButton = new AlertDialog.Builder(activity).setTitle(this.f14782b).setIcon(this.f14787g).setPositiveButton(this.f14783c, this).setNegativeButton(this.f14784d, this);
        int i5 = this.f14786f;
        View viewInflate = i5 != 0 ? LayoutInflater.from(activity).inflate(i5, (ViewGroup) null) : null;
        if (viewInflate != null) {
            b(viewInflate);
            negativeButton.setView(viewInflate);
        } else {
            negativeButton.setMessage(this.f14785e);
        }
        d(negativeButton);
        AlertDialog alertDialogCreate = negativeButton.create();
        if (this instanceof EditTextPreferenceDialogFragment) {
            alertDialogCreate.getWindow().setSoftInputMode(5);
        }
        return alertDialogCreate;
    }

    @Override // android.app.DialogFragment, android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        super.onDismiss(dialogInterface);
        c(this.f14788h == -1);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putCharSequence("PreferenceDialogFragment.title", this.f14782b);
        bundle.putCharSequence("PreferenceDialogFragment.positiveText", this.f14783c);
        bundle.putCharSequence("PreferenceDialogFragment.negativeText", this.f14784d);
        bundle.putCharSequence("PreferenceDialogFragment.message", this.f14785e);
        bundle.putInt("PreferenceDialogFragment.layout", this.f14786f);
        BitmapDrawable bitmapDrawable = this.f14787g;
        if (bitmapDrawable != null) {
            bundle.putParcelable("PreferenceDialogFragment.icon", bitmapDrawable.getBitmap());
        }
    }
}
