package r6;

import android.content.DialogInterface;
import androidx.preference.MultiSelectListPreferenceDialogFragment;
import androidx.preference.MultiSelectListPreferenceDialogFragmentCompat;
import java.util.HashSet;

/* loaded from: classes2.dex */
public final class b implements DialogInterface.OnMultiChoiceClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85529a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f85530b;

    public /* synthetic */ b(Object obj, int i5) {
        this.f85529a = i5;
        this.f85530b = obj;
    }

    @Override // android.content.DialogInterface.OnMultiChoiceClickListener
    public final void onClick(DialogInterface dialogInterface, int i5, boolean z11) {
        switch (this.f85529a) {
            case 0:
                MultiSelectListPreferenceDialogFragment multiSelectListPreferenceDialogFragment = (MultiSelectListPreferenceDialogFragment) this.f85530b;
                HashSet hashSet = multiSelectListPreferenceDialogFragment.f14761i;
                if (!z11) {
                    multiSelectListPreferenceDialogFragment.f14762j = hashSet.remove(multiSelectListPreferenceDialogFragment.f14764l[i5].toString()) | multiSelectListPreferenceDialogFragment.f14762j;
                    break;
                } else {
                    multiSelectListPreferenceDialogFragment.f14762j = hashSet.add(multiSelectListPreferenceDialogFragment.f14764l[i5].toString()) | multiSelectListPreferenceDialogFragment.f14762j;
                    break;
                }
            default:
                MultiSelectListPreferenceDialogFragmentCompat multiSelectListPreferenceDialogFragmentCompat = (MultiSelectListPreferenceDialogFragmentCompat) this.f85530b;
                HashSet hashSet2 = multiSelectListPreferenceDialogFragmentCompat.f14765i;
                if (!z11) {
                    multiSelectListPreferenceDialogFragmentCompat.f14766j = hashSet2.remove(multiSelectListPreferenceDialogFragmentCompat.f14768l[i5].toString()) | multiSelectListPreferenceDialogFragmentCompat.f14766j;
                    break;
                } else {
                    multiSelectListPreferenceDialogFragmentCompat.f14766j = hashSet2.add(multiSelectListPreferenceDialogFragmentCompat.f14768l[i5].toString()) | multiSelectListPreferenceDialogFragmentCompat.f14766j;
                    break;
                }
        }
    }
}
