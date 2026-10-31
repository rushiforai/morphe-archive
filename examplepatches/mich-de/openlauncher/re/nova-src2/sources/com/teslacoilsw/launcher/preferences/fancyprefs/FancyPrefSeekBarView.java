package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.TextView;
import com.instabridge.ai.chat.ui.v2.e;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.widget.DisabledSegmentSeekBar;
import e10.a1;
import io.sentry.internal.debugmeta.c;
import java.util.Arrays;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;
import v4.a;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\b\u0017\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefSeekBarView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefView;", b.f42142b, "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public class FancyPrefSeekBarView extends FancyPrefView<Integer> {
    public static final /* synthetic */ int T = 0;
    public final c K;
    public final TextView L;
    public final TextView M;
    public final ImageView N;
    public final String O;
    public final int P;
    public final int Q;
    public final int R;
    public final List S;

    @JvmOverloads
    public FancyPrefSeekBarView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public static final void L(FancyPrefSeekBarView fancyPrefSeekBarView, String str) throws NumberFormatException {
        if (k.U0(str)) {
            return;
        }
        try {
            int i5 = Integer.parseInt(str);
            String str2 = fancyPrefSeekBarView.O;
            c cVar = fancyPrefSeekBarView.K;
            if (Intrinsics.b(str2, "PERCENT")) {
                fancyPrefSeekBarView.M((Math.max(0, Math.min(100, i5)) * fancyPrefSeekBarView.Q) / 100);
            } else {
                fancyPrefSeekBarView.M(i5);
            }
            bu.k kVar = (bu.k) cVar.f67328b;
            Intrinsics.d(kVar);
            kVar.invoke(Integer.valueOf(cVar.x()), Boolean.TRUE);
        } catch (NumberFormatException unused) {
        }
    }

    public final int K() {
        return Math.min(this.Q, (this.K.x() * this.R) + this.P);
    }

    public final void M(int i5) {
        c cVar = this.K;
        int iF = (a.f(i5, this.P, this.Q) - this.P) / this.R;
        SeekBar seekBarR = cVar.r();
        if (seekBarR != null) {
            seekBarR.setProgress(iF);
        }
        DisabledSegmentSeekBar disabledSegmentSeekBarQ = cVar.q();
        if (disabledSegmentSeekBarQ != null) {
            synchronized (disabledSegmentSeekBarQ) {
                disabledSegmentSeekBarQ.m(iF, false);
            }
        }
        E(Integer.valueOf(K()));
        P(K());
    }

    public final void N() {
        boolean zB = Intrinsics.b(this.O, "PERCENT");
        TextView textView = this.M;
        if (zB) {
            if (textView != null) {
                textView.setText("100%");
            }
        } else {
            if (k.U0(this.O) || textView == null) {
                return;
            }
            textView.setText(String.format(this.O, Arrays.copyOf(new Object[]{Integer.valueOf(this.Q)}, 1)));
        }
    }

    public void O(int i5) {
    }

    public void P(int i5) {
        boolean zB = Intrinsics.b(this.O, "PERCENT");
        TextView textView = this.L;
        if (zB) {
            textView.setText(((int) (((100 * K()) / this.Q) + 0.5f)) + "%");
        } else if (!k.U0(this.O)) {
            textView.setText(String.format(this.O, Arrays.copyOf(new Object[]{Integer.valueOf(i5)}, 1)));
        }
        O(i5);
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public int o(AttributeSet attributeSet) {
        TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, u2.f80169t);
        try {
            String string = typedArrayObtainStyledAttributes.getString(2);
            int i5 = typedArrayObtainStyledAttributes.getInt(1, 0);
            int resourceId = typedArrayObtainStyledAttributes.getResourceId(6, 0);
            if (resourceId != 0) {
                return resourceId;
            }
            if (i5 != 1) {
                return string != null ? 2131624132 : 2131624134;
            }
            typedArrayObtainStyledAttributes.recycle();
            return 2131624136;
        } finally {
            typedArrayObtainStyledAttributes.recycle();
        }
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView, android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        N();
    }

    @Override // androidx.constraintlayout.widget.ConstraintLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        if (Build.VERSION.SDK_INT >= 30) {
            List list = this.S;
            Rect rect = (Rect) list.get(0);
            c cVar = this.K;
            View view = (View) cVar.f67327a;
            View view2 = (View) cVar.f67327a;
            rect.set(view.getLeft(), view2.getTop(), view2.getRight(), view2.getBottom());
            setSystemGestureExclusionRects(list);
        }
    }

    @Override // android.view.View
    public final void setEnabled(boolean z11) {
        super.setEnabled(z11);
        c cVar = this.K;
        SeekBar seekBarR = cVar.r();
        if (seekBarR != null) {
            seekBarR.setEnabled(z11);
        }
        DisabledSegmentSeekBar disabledSegmentSeekBarQ = cVar.q();
        if (disabledSegmentSeekBarQ != null) {
            disabledSegmentSeekBarQ.setEnabled(z11);
        }
        this.L.setEnabled(z11);
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final void t(Object obj) {
        int iIntValue = ((Number) obj).intValue();
        super.t(Integer.valueOf(iIntValue));
        if (K() != iIntValue) {
            M(iIntValue);
        }
    }

    public FancyPrefSeekBarView(Context context, AttributeSet attributeSet, int i5) {
        TextView textView;
        super(context, attributeSet, 0);
        View viewFindViewById = findViewById(2131428789);
        c cVar = new c();
        cVar.f67327a = viewFindViewById;
        a1 a1Var = new a1(cVar, 1);
        if (!(viewFindViewById instanceof SeekBar) && !(viewFindViewById instanceof DisabledSegmentSeekBar)) {
            throw new IllegalStateException();
        }
        SeekBar seekBarR = cVar.r();
        if (seekBarR != null) {
            seekBarR.setOnSeekBarChangeListener(a1Var);
        }
        DisabledSegmentSeekBar disabledSegmentSeekBarQ = cVar.q();
        if (disabledSegmentSeekBarQ != null) {
            disabledSegmentSeekBarQ.E = a1Var;
        }
        this.K = cVar;
        TextView textView2 = (TextView) findViewById(2131429146);
        this.L = textView2;
        this.M = (TextView) findViewById(2131428341);
        this.N = (ImageView) findViewById(2131429145);
        String str = "PERCENT";
        this.O = "PERCENT";
        this.Q = 100;
        this.R = 1;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80169t);
        try {
            int i11 = typedArrayObtainStyledAttributes.getInt(7, 1);
            int iK = K();
            this.R = i11;
            cVar.C((this.Q - this.P) / i11);
            M(iK);
            int i12 = typedArrayObtainStyledAttributes.getInt(5, 0);
            int iK2 = K();
            this.P = i12;
            M(iK2);
            int i13 = typedArrayObtainStyledAttributes.getInt(4, 100);
            int iK3 = K();
            this.Q = i13;
            cVar.C((i13 - this.P) / this.R);
            M(iK3);
            if (this.f46018z) {
                N();
            }
            String string = typedArrayObtainStyledAttributes.getString(3);
            if (string != null) {
                str = string;
            }
            this.O = str;
            P(K());
            ColorStateList colorStateList = typedArrayObtainStyledAttributes.getColorStateList(0);
            if (colorStateList != null && (textView = this.f46010r) != null) {
                textView.setTextColor(colorStateList);
            }
            typedArrayObtainStyledAttributes.recycle();
            cVar.C((this.Q - this.P) / this.R);
            bu.k kVar = new bu.k(this, 21);
            cVar.f67328b = kVar;
            kVar.invoke(Integer.valueOf(cVar.x()), Boolean.FALSE);
            textView2.setOnClickListener(new e(12, context, this));
            this.S = ul.b.P(new Rect());
        } catch (Throwable th2) {
            typedArrayObtainStyledAttributes.recycle();
            throw th2;
        }
    }
}
