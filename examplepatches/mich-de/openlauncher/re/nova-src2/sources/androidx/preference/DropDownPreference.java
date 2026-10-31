package androidx.preference;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ArrayAdapter;
import r.m1;

/* loaded from: classes2.dex */
public class DropDownPreference extends ListPreference {

    /* renamed from: r, reason: collision with root package name */
    public final Context f14744r;

    /* renamed from: s, reason: collision with root package name */
    public final ArrayAdapter f14745s;

    public DropDownPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130969134);
        new m1(this, 1);
        this.f14744r = context;
        ArrayAdapter arrayAdapter = new ArrayAdapter(context, 17367049);
        this.f14745s = arrayAdapter;
        arrayAdapter.clear();
        CharSequence[] charSequenceArr = this.f14751m;
        if (charSequenceArr != null) {
            for (CharSequence charSequence : charSequenceArr) {
                arrayAdapter.add(charSequence.toString());
            }
        }
    }

    @Override // androidx.preference.Preference
    public final void c() {
        super.c();
        ArrayAdapter arrayAdapter = this.f14745s;
        if (arrayAdapter != null) {
            arrayAdapter.notifyDataSetChanged();
        }
    }

    @Override // androidx.preference.DialogPreference, androidx.preference.Preference
    public final void g() {
        throw null;
    }
}
