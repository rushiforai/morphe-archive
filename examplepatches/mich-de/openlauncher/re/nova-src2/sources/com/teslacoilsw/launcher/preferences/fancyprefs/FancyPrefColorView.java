package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.TextView;
import com.instabridge.ai.chat.ui.v2.e;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.preferences.fancyprefs.color.ColorPickerButton;
import e10.z2;
import g10.f;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.SourceDebugExtension;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r4.a;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefColorView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefView;", b.f42142b, "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class FancyPrefColorView extends FancyPrefView<Integer> {
    public static final /* synthetic */ int P = 0;
    public final boolean K;
    public final boolean L;
    public final int M;
    public final ColorPickerButton N;
    public final String O;

    @JvmOverloads
    public FancyPrefColorView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        F(2131624140);
        this.N = (ColorPickerButton) z2.V((ViewGroup) findViewById(2131429213), 0);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80164m);
        try {
            String string = typedArrayObtainStyledAttributes.getString(2);
            if (string == null) {
                TextView textView = this.f46010r;
                string = String.valueOf(textView != null ? textView.getText() : null);
            }
            this.O = string;
            this.K = typedArrayObtainStyledAttributes.getBoolean(3, false);
            this.L = typedArrayObtainStyledAttributes.getBoolean(4, false);
            L(typedArrayObtainStyledAttributes.getInt(1, -1));
            this.M = typedArrayObtainStyledAttributes.getInt(5, 0);
            typedArrayObtainStyledAttributes.recycle();
            setOnClickListener(new e(11, this, context));
        } catch (Throwable th2) {
            typedArrayObtainStyledAttributes.recycle();
            throw th2;
        }
    }

    public final int K() {
        return this.N.f46045a.f56840c;
    }

    public final void L(int i5) {
        boolean z11 = this.K;
        ColorPickerButton colorPickerButton = this.N;
        if (z11 || (this.L && i5 == 262914)) {
            f fVar = colorPickerButton.f46045a;
            if (fVar.f56840c != i5) {
                fVar.b(i5);
                colorPickerButton.invalidate();
            }
        } else {
            int iN = a.n(i5, 255);
            f fVar2 = colorPickerButton.f46045a;
            if (fVar2.f56840c != iN) {
                fVar2.b(iN);
                colorPickerButton.invalidate();
            }
        }
        E(Integer.valueOf(colorPickerButton.f46045a.f56840c));
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final void t(Object obj) {
        int iIntValue = ((Number) obj).intValue();
        super.t(Integer.valueOf(iIntValue));
        if (K() != iIntValue) {
            L(iIntValue);
        }
    }
}
