package androidx.preference;

import android.app.Dialog;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.m0;
import com.amplitude.android.migration.DatabaseConstants;
import h6.o1;
import m.g;
import m.j;
import m.k;
import r6.a;

/* loaded from: classes2.dex */
public abstract class PreferenceDialogFragmentCompat extends DialogFragment implements DialogInterface.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public DialogPreference f14789a;

    /* renamed from: b, reason: collision with root package name */
    public CharSequence f14790b;

    /* renamed from: c, reason: collision with root package name */
    public CharSequence f14791c;

    /* renamed from: d, reason: collision with root package name */
    public CharSequence f14792d;

    /* renamed from: e, reason: collision with root package name */
    public CharSequence f14793e;

    /* renamed from: f, reason: collision with root package name */
    public int f14794f;

    /* renamed from: g, reason: collision with root package name */
    public BitmapDrawable f14795g;

    /* renamed from: h, reason: collision with root package name */
    public int f14796h;

    public final DialogPreference o() {
        if (this.f14789a == null) {
            getArguments().getString(DatabaseConstants.KEY_FIELD);
            ((a) getTargetFragment()).g();
            this.f14789a = null;
        }
        return this.f14789a;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i5) {
        this.f14796h = i5;
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.h0
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        o1 targetFragment = getTargetFragment();
        if (!(targetFragment instanceof a)) {
            throw new IllegalStateException("Target fragment must implement TargetFragment interface");
        }
        a aVar = (a) targetFragment;
        getArguments().getString(DatabaseConstants.KEY_FIELD);
        if (bundle == null) {
            aVar.g();
            this.f14789a = null;
            throw null;
        }
        this.f14790b = bundle.getCharSequence("PreferenceDialogFragment.title");
        this.f14791c = bundle.getCharSequence("PreferenceDialogFragment.positiveText");
        this.f14792d = bundle.getCharSequence("PreferenceDialogFragment.negativeText");
        this.f14793e = bundle.getCharSequence("PreferenceDialogFragment.message");
        this.f14794f = bundle.getInt("PreferenceDialogFragment.layout", 0);
        Bitmap bitmap = (Bitmap) bundle.getParcelable("PreferenceDialogFragment.icon");
        if (bitmap != null) {
            this.f14795g = new BitmapDrawable(getResources(), bitmap);
        }
    }

    @Override // androidx.fragment.app.DialogFragment
    public final Dialog onCreateDialog(Bundle bundle) {
        m0 activity = getActivity();
        this.f14796h = -2;
        j title = new j(activity).setTitle(this.f14790b);
        BitmapDrawable bitmapDrawable = this.f14795g;
        g gVar = title.f75297a;
        gVar.f75246c = bitmapDrawable;
        gVar.f75250g = this.f14791c;
        gVar.f75251h = this;
        gVar.f75252i = this.f14792d;
        gVar.f75253j = this;
        int i5 = this.f14794f;
        View viewInflate = i5 != 0 ? getLayoutInflater().inflate(i5, (ViewGroup) null) : null;
        if (viewInflate != null) {
            p(viewInflate);
            title.setView(viewInflate);
        } else {
            title.f75297a.f75249f = this.f14793e;
        }
        r(title);
        k kVarCreate = title.create();
        if (this instanceof EditTextPreferenceDialogFragmentCompat) {
            kVarCreate.getWindow().setSoftInputMode(5);
        }
        return kVarCreate;
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        super.onDismiss(dialogInterface);
        q(this.f14796h == -1);
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.h0
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putCharSequence("PreferenceDialogFragment.title", this.f14790b);
        bundle.putCharSequence("PreferenceDialogFragment.positiveText", this.f14791c);
        bundle.putCharSequence("PreferenceDialogFragment.negativeText", this.f14792d);
        bundle.putCharSequence("PreferenceDialogFragment.message", this.f14793e);
        bundle.putInt("PreferenceDialogFragment.layout", this.f14794f);
        BitmapDrawable bitmapDrawable = this.f14795g;
        if (bitmapDrawable != null) {
            bundle.putParcelable("PreferenceDialogFragment.icon", bitmapDrawable.getBitmap());
        }
    }

    public void p(View view) {
        int i5;
        View viewFindViewById = view.findViewById(16908299);
        if (viewFindViewById != null) {
            CharSequence charSequence = this.f14793e;
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

    public abstract void q(boolean z11);

    public void r(j jVar) {
    }
}
