package androidx.preference;

import a5.a1;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Build;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.view.accessibility.AccessibilityManager;
import android.widget.Checkable;
import androidx.appcompat.widget.SwitchCompat;
import l30.a;
import r6.h;

/* loaded from: classes2.dex */
public class SwitchPreferenceCompat extends TwoStatePreference {

    /* renamed from: r, reason: collision with root package name */
    public final a f14819r;

    /* renamed from: s, reason: collision with root package name */
    public final String f14820s;

    /* renamed from: t, reason: collision with root package name */
    public final String f14821t;

    public SwitchPreferenceCompat(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130970084);
        this.f14819r = new a(this, 4);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, h.f85551m, 2130970084, 0);
        String string = typedArrayObtainStyledAttributes.getString(7);
        this.n = string == null ? typedArrayObtainStyledAttributes.getString(0) : string;
        if (this.f14822m) {
            c();
        }
        String string2 = typedArrayObtainStyledAttributes.getString(6);
        this.o = string2 == null ? typedArrayObtainStyledAttributes.getString(1) : string2;
        if (!this.f14822m) {
            c();
        }
        String string3 = typedArrayObtainStyledAttributes.getString(9);
        this.f14820s = string3 == null ? typedArrayObtainStyledAttributes.getString(3) : string3;
        c();
        String string4 = typedArrayObtainStyledAttributes.getString(8);
        this.f14821t = string4 == null ? typedArrayObtainStyledAttributes.getString(4) : string4;
        c();
        this.f14824q = typedArrayObtainStyledAttributes.getBoolean(5, typedArrayObtainStyledAttributes.getBoolean(2, false));
        typedArrayObtainStyledAttributes.recycle();
    }

    @Override // androidx.preference.Preference
    public final void j(View view) throws Resources.NotFoundException {
        super.j(view);
        if (((AccessibilityManager) this.f14769a.getSystemService("accessibility")).isEnabled()) {
            KeyEvent.Callback callbackFindViewById = view.findViewById(2131428959);
            boolean z11 = callbackFindViewById instanceof SwitchCompat;
            if (z11) {
                ((SwitchCompat) callbackFindViewById).setOnCheckedChangeListener(null);
            }
            if (callbackFindViewById instanceof Checkable) {
                ((Checkable) callbackFindViewById).setChecked(this.f14822m);
            }
            if (z11) {
                SwitchCompat switchCompat = (SwitchCompat) callbackFindViewById;
                switchCompat.f(this.f14820s);
                switchCompat.requestLayout();
                if (switchCompat.isChecked() && Build.VERSION.SDK_INT >= 30) {
                    CharSequence string = switchCompat.o;
                    if (string == null) {
                        string = switchCompat.getResources().getString(2132017169);
                    }
                    a1.m(switchCompat, string);
                }
                switchCompat.e(this.f14821t);
                switchCompat.requestLayout();
                if (!switchCompat.isChecked() && Build.VERSION.SDK_INT >= 30) {
                    CharSequence string2 = switchCompat.f13790q;
                    if (string2 == null) {
                        string2 = switchCompat.getResources().getString(2132017168);
                    }
                    a1.m(switchCompat, string2);
                }
                switchCompat.setOnCheckedChangeListener(this.f14819r);
            }
            m(view.findViewById(16908304));
        }
    }
}
