package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import android.widget.CompoundButton;
import android.widget.FrameLayout;
import ay.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.preferences.widget.UserSwitchCompat;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import l30.j;
import lx.d;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0000\b\u0017\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u00012\u00020\u0003¨\u0006\u0004"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefCheckableView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefView;", b.f42142b, "Ll30/j;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public class FancyPrefCheckableView extends FancyPrefView<Boolean> implements j {
    public final CompoundButton K;
    public final boolean L;

    @JvmOverloads
    public FancyPrefCheckableView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 4);
    }

    @Override // l30.j
    public final void h(boolean z11, boolean z12) {
        KeyEvent.Callback callback = this.K;
        j jVar = callback instanceof j ? (j) callback : null;
        if (jVar != null) {
            jVar.h(z11, false);
        }
        E(Boolean.valueOf(z11));
    }

    @Override // android.widget.Checkable
    public final boolean isChecked() {
        return ((Boolean) r()).booleanValue();
    }

    @Override // android.widget.Checkable
    public final void setChecked(boolean z11) {
        E(Boolean.valueOf(z11));
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final void t(Object obj) {
        Boolean bool = (Boolean) obj;
        boolean zBooleanValue = bool.booleanValue();
        super.t(bool);
        this.K.setChecked(zBooleanValue);
    }

    @Override // android.widget.Checkable
    public final void toggle() {
        if (this.L && isChecked()) {
            return;
        }
        E(Boolean.valueOf(!((Boolean) r()).booleanValue()));
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public FancyPrefCheckableView(Context context, AttributeSet attributeSet, int i5) {
        attributeSet = (i5 & 2) != 0 ? null : attributeSet;
        super(context, attributeSet, 0);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80163l);
        int i11 = typedArrayObtainStyledAttributes.getInt(1, 0);
        FrameLayout frameLayout = this.f46013u;
        Intrinsics.d(frameLayout);
        if (frameLayout.getChildCount() == 0) {
            int i12 = 2131624139;
            if (i11 != 0 && i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalArgumentException();
                }
                if (!((AccessibilityManager) context.getSystemService(AccessibilityManager.class)).isTouchExplorationEnabled()) {
                    FrameLayout frameLayout2 = this.f46013u;
                    ViewGroup.LayoutParams layoutParams = frameLayout2.getLayoutParams();
                    if (layoutParams == null) {
                        throw new NullPointerException("null cannot be cast to non-null type android.view.ViewGroup.MarginLayoutParams");
                    }
                    ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
                    marginLayoutParams.setMarginEnd(0);
                    frameLayout2.setLayoutParams(marginLayoutParams);
                    i12 = 2131624147;
                }
            }
            F(i12);
        }
        CompoundButton compoundButton = (CompoundButton) this.f46013u.findViewById(2131427666);
        this.K = compoundButton;
        E(Boolean.valueOf(typedArrayObtainStyledAttributes.getBoolean(0, false)));
        typedArrayObtainStyledAttributes.recycle();
        boolean z11 = i11 == 1;
        this.L = z11;
        if (z11) {
            compoundButton.setButtonDrawable(d.c(context, 16843289));
        }
        if (compoundButton instanceof UserSwitchCompat) {
            compoundButton.setOnCheckedChangeListener(new f10.b(this, 0));
        }
        setOnClickListener(new k(this, 18));
    }
}
