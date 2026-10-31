package androidx.preference;

import android.app.AlertDialog;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.HashSet;
import r6.b;

@Deprecated
/* loaded from: classes2.dex */
public class MultiSelectListPreferenceDialogFragment extends PreferenceDialogFragment {

    /* renamed from: i, reason: collision with root package name */
    public final HashSet f14761i = new HashSet();

    /* renamed from: j, reason: collision with root package name */
    public boolean f14762j;

    /* renamed from: k, reason: collision with root package name */
    public CharSequence[] f14763k;

    /* renamed from: l, reason: collision with root package name */
    public CharSequence[] f14764l;

    @Deprecated
    public MultiSelectListPreferenceDialogFragment() {
    }

    @Override // androidx.preference.PreferenceDialogFragment
    public final void c(boolean z11) {
        MultiSelectListPreference multiSelectListPreference = (MultiSelectListPreference) a();
        if (z11 && this.f14762j) {
            multiSelectListPreference.getClass();
            HashSet hashSet = multiSelectListPreference.f14760m;
            hashSet.clear();
            hashSet.addAll(this.f14761i);
            multiSelectListPreference.c();
        }
        this.f14762j = false;
    }

    @Override // androidx.preference.PreferenceDialogFragment
    public final void d(AlertDialog.Builder builder) {
        int length = this.f14764l.length;
        boolean[] zArr = new boolean[length];
        for (int i5 = 0; i5 < length; i5++) {
            zArr[i5] = this.f14761i.contains(this.f14764l[i5].toString());
        }
        builder.setMultiChoiceItems(this.f14763k, zArr, new b(this, 0));
    }

    @Override // androidx.preference.PreferenceDialogFragment, android.app.DialogFragment, android.app.Fragment
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        HashSet hashSet = this.f14761i;
        hashSet.clear();
        hashSet.addAll(bundle.getStringArrayList("MultiSelectListPreferenceDialogFragment.values"));
        this.f14762j = bundle.getBoolean("MultiSelectListPreferenceDialogFragment.changed", false);
        this.f14763k = bundle.getCharSequenceArray("MultiSelectListPreferenceDialogFragment.entries");
        this.f14764l = bundle.getCharSequenceArray("MultiSelectListPreferenceDialogFragment.entryValues");
    }

    @Override // androidx.preference.PreferenceDialogFragment, android.app.DialogFragment, android.app.Fragment
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putStringArrayList("MultiSelectListPreferenceDialogFragment.values", new ArrayList<>(this.f14761i));
        bundle.putBoolean("MultiSelectListPreferenceDialogFragment.changed", this.f14762j);
        bundle.putCharSequenceArray("MultiSelectListPreferenceDialogFragment.entries", this.f14763k);
        bundle.putCharSequenceArray("MultiSelectListPreferenceDialogFragment.entryValues", this.f14764l);
    }
}
