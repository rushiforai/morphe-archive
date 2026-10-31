package androidx.preference;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.widget.SeekBar;
import e10.a1;
import r6.h;
import r6.i;

/* loaded from: classes2.dex */
public class SeekBarPreference extends Preference {

    /* renamed from: m, reason: collision with root package name */
    public int f14811m;
    public final int n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final int f14812p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f14813q;

    /* renamed from: r, reason: collision with root package name */
    public final boolean f14814r;

    /* renamed from: s, reason: collision with root package name */
    public final boolean f14815s;

    public SeekBarPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130969917);
        new a1(this, 2);
        new i(this);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, h.f85549k, 2130969917, 0);
        this.n = typedArrayObtainStyledAttributes.getInt(3, 0);
        int i5 = typedArrayObtainStyledAttributes.getInt(1, 100);
        int i11 = this.n;
        i5 = i5 < i11 ? i11 : i5;
        if (i5 != this.o) {
            this.o = i5;
            c();
        }
        int i12 = typedArrayObtainStyledAttributes.getInt(4, 0);
        if (i12 != this.f14812p) {
            this.f14812p = Math.min(this.o - this.n, Math.abs(i12));
            c();
        }
        this.f14814r = typedArrayObtainStyledAttributes.getBoolean(2, true);
        typedArrayObtainStyledAttributes.getBoolean(5, false);
        this.f14815s = typedArrayObtainStyledAttributes.getBoolean(6, false);
        typedArrayObtainStyledAttributes.recycle();
    }

    @Override // androidx.preference.Preference
    public final Object h(TypedArray typedArray, int i5) {
        return Integer.valueOf(typedArray.getInt(i5, 0));
    }

    public final void l(SeekBar seekBar) {
        int progress = seekBar.getProgress() + this.n;
        int i5 = this.f14811m;
        if (progress != i5) {
            int i11 = this.n;
            if (progress < i11) {
                progress = i11;
            }
            int i12 = this.o;
            if (progress > i12) {
                progress = i12;
            }
            if (progress != i5) {
                this.f14811m = progress;
            }
        }
    }
}
