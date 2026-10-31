package androidx.preference;

import android.content.Context;
import android.content.res.TypedArray;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;

/* loaded from: classes2.dex */
public abstract class TwoStatePreference extends Preference {

    /* renamed from: m, reason: collision with root package name */
    public boolean f14822m;
    public CharSequence n;
    public CharSequence o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f14823p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f14824q;

    public TwoStatePreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
    }

    @Override // androidx.preference.Preference
    public final void g() {
        l(!this.f14822m);
    }

    @Override // androidx.preference.Preference
    public final Object h(TypedArray typedArray, int i5) {
        return Boolean.valueOf(typedArray.getBoolean(i5, false));
    }

    @Override // androidx.preference.Preference
    public final boolean k() {
        return (this.f14824q ? this.f14822m : !this.f14822m) || super.k();
    }

    public final void l(boolean z11) {
        boolean z12 = this.f14822m != z11;
        if (z12 || !this.f14823p) {
            this.f14822m = z11;
            this.f14823p = true;
            if (z12) {
                d(k());
                c();
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0030  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0049  */
    /* JADX WARN: Removed duplicated region for block: B:28:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void m(View view) {
        boolean z11;
        int i5;
        if (!(view instanceof TextView)) {
            return;
        }
        TextView textView = (TextView) view;
        if (this.f14822m && !TextUtils.isEmpty(this.n)) {
            textView.setText(this.n);
        } else {
            if (this.f14822m || TextUtils.isEmpty(this.o)) {
                z11 = true;
                if (z11) {
                    CharSequence charSequenceA = a();
                    if (!TextUtils.isEmpty(charSequenceA)) {
                        textView.setText(charSequenceA);
                        z11 = false;
                    }
                }
                i5 = z11 ? 8 : 0;
                if (i5 == textView.getVisibility()) {
                    textView.setVisibility(i5);
                    return;
                }
                return;
            }
            textView.setText(this.o);
        }
        z11 = false;
        if (z11) {
        }
        if (z11) {
        }
        if (i5 == textView.getVisibility()) {
        }
    }
}
