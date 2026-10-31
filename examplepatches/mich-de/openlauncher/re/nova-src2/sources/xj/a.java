package xj;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import com.google.android.gms.internal.consent_sdk.k0;
import ps.f0;
import r.w;
import tj.i;

/* loaded from: classes3.dex */
public final class a extends w {

    /* renamed from: g, reason: collision with root package name */
    public static final int[][] f95843g = {new int[]{16842910, 16842912}, new int[]{16842910, -16842912}, new int[]{-16842910, 16842912}, new int[]{-16842910, -16842912}};

    /* renamed from: e, reason: collision with root package name */
    public ColorStateList f95844e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f95845f;

    public a(Context context, AttributeSet attributeSet) {
        super(hk.a.a(context, attributeSet, 2130969865, 2132083983), attributeSet);
        Context context2 = getContext();
        TypedArray typedArrayF = i.f(context2, attributeSet, bj.a.f17936y, 2130969865, 2132083983, new int[0]);
        if (typedArrayF.hasValue(0)) {
            setButtonTintList(f0.m(context2, typedArrayF, 0));
        }
        this.f95845f = typedArrayF.getBoolean(1, false);
        typedArrayF.recycle();
    }

    @Override // android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.f95845f && getButtonTintList() == null) {
            this.f95845f = true;
            if (this.f95844e == null) {
                int iM = k0.m(2130968934, this);
                int iM2 = k0.m(2130968954, this);
                int iM3 = k0.m(2130968977, this);
                this.f95844e = new ColorStateList(f95843g, new int[]{k0.v(1.0f, iM3, iM), k0.v(0.54f, iM3, iM2), k0.v(0.38f, iM3, iM2), k0.v(0.38f, iM3, iM2)});
            }
            setButtonTintList(this.f95844e);
        }
    }
}
