package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import be.f;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.widget.GridPreviewView;
import com.teslacoilsw.launcher.widget.NumberPicker;
import e00.q4;
import e10.t0;
import f10.d;
import h6.c1;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.StringCompanionObject;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0017\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefGridView;", "Lf10/d;", "Le10/t0;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public class FancyPrefGridView extends d {

    /* renamed from: c0, reason: collision with root package name */
    public static final /* synthetic */ int f45998c0 = 0;
    public final GridPreviewView S;
    public final TextView T;
    public final int U;
    public int V;
    public final int W;

    /* renamed from: a0, reason: collision with root package name */
    public int f45999a0;

    /* renamed from: b0, reason: collision with root package name */
    public final String f46000b0;

    @JvmOverloads
    public FancyPrefGridView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final String G(Object obj, String str) {
        t0 t0Var = (t0) obj;
        StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
        return String.format(str, Arrays.copyOf(new Object[]{Integer.valueOf(t0Var.f51821a), Integer.valueOf(t0Var.f51822b)}, 2));
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final void I() {
        CharSequence charSequence;
        if (isEnabled() || (charSequence = this.f46000b0) == null) {
            charSequence = this.B;
        } else if (charSequence.equals(b.f42142b)) {
            charSequence = null;
        }
        if (charSequence != null && k.L0(charSequence, '%') && this.E != null) {
            String string = charSequence.toString();
            t0 t0Var = (t0) r();
            StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
            charSequence = String.format(string, Arrays.copyOf(new Object[]{Integer.valueOf(t0Var.f51821a), Integer.valueOf(t0Var.f51822b)}, 2));
        }
        J(charSequence);
    }

    @Override // f10.d
    public Function0 K(View view) {
        View viewFindViewById = view.findViewById(2131427712);
        Intrinsics.e(viewFindViewById, "null cannot be cast to non-null type com.teslacoilsw.launcher.widget.NumberPicker");
        NumberPicker numberPicker = (NumberPicker) viewFindViewById;
        View viewFindViewById2 = view.findViewById(2131428722);
        Intrinsics.e(viewFindViewById2, "null cannot be cast to non-null type com.teslacoilsw.launcher.widget.NumberPicker");
        NumberPicker numberPicker2 = (NumberPicker) viewFindViewById2;
        View viewFindViewById3 = view.findViewById(2131428620);
        Intrinsics.e(viewFindViewById3, "null cannot be cast to non-null type com.teslacoilsw.launcher.widget.GridPreviewView");
        GridPreviewView gridPreviewView = (GridPreviewView) viewFindViewById3;
        GridPreviewView gridPreviewView2 = this.S;
        int i5 = gridPreviewView2.f46419a;
        int i11 = gridPreviewView2.f46420b;
        gridPreviewView.f46419a = i5;
        gridPreviewView.f46420b = i11;
        gridPreviewView.invalidate();
        f fVar = new f(3, gridPreviewView, numberPicker2, numberPicker);
        numberPicker.n(this.f45999a0);
        numberPicker.o(this.W);
        numberPicker.p(gridPreviewView.f46420b, false);
        numberPicker.f46443m = fVar;
        numberPicker2.n(this.V);
        numberPicker2.o(this.U);
        numberPicker2.p(gridPreviewView.f46419a, false);
        numberPicker2.f46443m = fVar;
        return new q4(8, numberPicker2, numberPicker);
    }

    @Override // android.view.View
    public final void setEnabled(boolean z11) {
        super.setEnabled(z11);
        GridPreviewView gridPreviewView = this.S;
        TextView textView = this.T;
        if (z11) {
            textView.setVisibility(4);
            gridPreviewView.setVisibility(0);
        } else {
            textView.setVisibility(0);
            gridPreviewView.setVisibility(4);
        }
        I();
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final void t(Object obj) {
        t0 t0Var = (t0) obj;
        super.t(t0Var);
        int i5 = t0Var.f51821a;
        int i11 = t0Var.f51822b;
        GridPreviewView gridPreviewView = this.S;
        gridPreviewView.f46419a = i5;
        gridPreviewView.f46420b = i11;
        gridPreviewView.invalidate();
        I();
    }

    public FancyPrefGridView(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet);
        if (this.L == 0) {
            this.L = 2131624097;
        }
        if (this.B == null) {
            C("%d ✕ %d");
        }
        F(2131624141);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80165p);
        try {
            this.U = typedArrayObtainStyledAttributes.getInt(7, 2);
            this.V = typedArrayObtainStyledAttributes.getInt(5, 8);
            this.W = typedArrayObtainStyledAttributes.getInt(6, 2);
            this.f45999a0 = typedArrayObtainStyledAttributes.getInt(4, 8);
            this.f46000b0 = typedArrayObtainStyledAttributes.getString(2);
            typedArrayObtainStyledAttributes.recycle();
            FrameLayout frameLayout = this.f46013u;
            Intrinsics.d(frameLayout);
            GridPreviewView gridPreviewView = (GridPreviewView) frameLayout.findViewById(2131428122);
            this.S = gridPreviewView;
            this.T = (TextView) this.f46013u.findViewById(2131427520);
            TextView textView = this.f46011s;
            if (textView != null) {
                textView.setTextSize(12.0f);
            }
            E(new t0(3, 4, false));
            ViewGroup.LayoutParams layoutParams = gridPreviewView.getLayoutParams();
            if (layoutParams == null) {
                throw new NullPointerException("null cannot be cast to non-null type android.view.ViewGroup.LayoutParams");
            }
            int iH = c1.h(context, 48);
            layoutParams.width = x7.f.O(iH * 0.8f);
            layoutParams.height = iH;
            gridPreviewView.setLayoutParams(layoutParams);
            I();
        } catch (Throwable th2) {
            typedArrayObtainStyledAttributes.recycle();
            throw th2;
        }
    }
}
