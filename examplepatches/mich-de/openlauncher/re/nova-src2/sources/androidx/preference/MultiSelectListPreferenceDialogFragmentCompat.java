package androidx.preference;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.HashSet;
import m.g;
import m.j;
import r6.b;

/* loaded from: classes2.dex */
public class MultiSelectListPreferenceDialogFragmentCompat extends PreferenceDialogFragmentCompat {

    /* renamed from: i, reason: collision with root package name */
    public final HashSet f14765i = new HashSet();

    /* renamed from: j, reason: collision with root package name */
    public boolean f14766j;

    /* renamed from: k, reason: collision with root package name */
    public CharSequence[] f14767k;

    /* renamed from: l, reason: collision with root package name */
    public CharSequence[] f14768l;

    @Override // androidx.preference.PreferenceDialogFragmentCompat, androidx.fragment.app.DialogFragment, androidx.fragment.app.h0
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        HashSet hashSet = this.f14765i;
        hashSet.clear();
        hashSet.addAll(bundle.getStringArrayList("MultiSelectListPreferenceDialogFragmentCompat.values"));
        this.f14766j = bundle.getBoolean("MultiSelectListPreferenceDialogFragmentCompat.changed", false);
        this.f14767k = bundle.getCharSequenceArray("MultiSelectListPreferenceDialogFragmentCompat.entries");
        this.f14768l = bundle.getCharSequenceArray("MultiSelectListPreferenceDialogFragmentCompat.entryValues");
    }

    @Override // androidx.preference.PreferenceDialogFragmentCompat, androidx.fragment.app.DialogFragment, androidx.fragment.app.h0
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putStringArrayList("MultiSelectListPreferenceDialogFragmentCompat.values", new ArrayList<>(this.f14765i));
        bundle.putBoolean("MultiSelectListPreferenceDialogFragmentCompat.changed", this.f14766j);
        bundle.putCharSequenceArray("MultiSelectListPreferenceDialogFragmentCompat.entries", this.f14767k);
        bundle.putCharSequenceArray("MultiSelectListPreferenceDialogFragmentCompat.entryValues", this.f14768l);
    }

    @Override // androidx.preference.PreferenceDialogFragmentCompat
    public final void q(boolean z11) {
        if (z11 && this.f14766j) {
            MultiSelectListPreference multiSelectListPreference = (MultiSelectListPreference) o();
            multiSelectListPreference.getClass();
            HashSet hashSet = multiSelectListPreference.f14760m;
            hashSet.clear();
            hashSet.addAll(this.f14765i);
            multiSelectListPreference.c();
        }
        this.f14766j = false;
    }

    @Override // androidx.preference.PreferenceDialogFragmentCompat
    public final void r(j jVar) {
        int length = this.f14768l.length;
        boolean[] zArr = new boolean[length];
        for (int i5 = 0; i5 < length; i5++) {
            zArr[i5] = this.f14765i.contains(this.f14768l[i5].toString());
        }
        CharSequence[] charSequenceArr = this.f14767k;
        b bVar = new b(this, 1);
        g gVar = jVar.f75297a;
        gVar.n = charSequenceArr;
        gVar.f75263v = bVar;
        gVar.f75259r = zArr;
        gVar.f75260s = true;
    }
}
