package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.SeekBar;
import bh.g;
import com.teslacoilsw.launcher.widget.DisabledSegmentSeekBar;
import f10.s;
import io.sentry.internal.debugmeta.c;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w20.e;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefGradientSeekBarView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefSeekBarView;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class FancyPrefGradientSeekBarView extends FancyPrefSeekBarView {
    public final GradientDrawable U;
    public final float[] V;

    @JvmOverloads
    public FancyPrefGradientSeekBarView(@NotNull Context context, @Nullable AttributeSet attributeSet) throws Throwable {
        super(context, attributeSet, 0);
        this.V = new float[3];
        int iK = e.k(8);
        int iK2 = e.k(16);
        View view = (View) this.K.f67327a;
        view.setPadding(view.getPaddingLeft(), ((View) this.K.f67327a).getPaddingTop() + iK, ((View) this.K.f67327a).getPaddingRight(), ((View) this.K.f67327a).getPaddingBottom() + iK);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(-1);
        int iN = g.N(context.getResources().getDisplayMetrics(), 20);
        gradientDrawable.setSize(iN, iN);
        gradientDrawable.setShape(1);
        gradientDrawable.setStroke(e.k(1), -9079435);
        c cVar = this.K;
        SeekBar seekBarR = cVar.r();
        if (seekBarR != null) {
            seekBarR.setThumb(gradientDrawable);
        }
        DisabledSegmentSeekBar disabledSegmentSeekBarQ = cVar.q();
        if (disabledSegmentSeekBarQ != null) {
            disabledSegmentSeekBarQ.v(gradientDrawable);
        }
        c cVar2 = this.K;
        SeekBar seekBarR2 = cVar2.r();
        if (seekBarR2 != null) {
            seekBarR2.setProgressDrawable(null);
        }
        DisabledSegmentSeekBar disabledSegmentSeekBarQ2 = cVar2.q();
        if (disabledSegmentSeekBarQ2 != null) {
            disabledSegmentSeekBarQ2.n(null);
        }
        GradientDrawable gradientDrawable2 = new GradientDrawable();
        this.U = gradientDrawable2;
        gradientDrawable2.setOrientation(GradientDrawable.Orientation.LEFT_RIGHT);
        int i5 = iK / 2;
        ((View) this.K.f67327a).setBackground(new s(gradientDrawable2, iK2, ((View) this.K.f67327a).getPaddingTop() - i5, iK2, ((View) this.K.f67327a).getPaddingBottom() - i5, 0));
    }

    public final void Q(int i5) {
        Drawable thumb;
        c cVar = this.K;
        SeekBar seekBarR = cVar.r();
        if (seekBarR == null || (thumb = seekBarR.getThumb()) == null) {
            DisabledSegmentSeekBar disabledSegmentSeekBarQ = cVar.q();
            Intrinsics.d(disabledSegmentSeekBarQ);
            thumb = disabledSegmentSeekBarQ.G;
        }
        Intrinsics.e(thumb, "null cannot be cast to non-null type android.graphics.drawable.GradientDrawable");
        GradientDrawable gradientDrawable = (GradientDrawable) thumb;
        gradientDrawable.setColor(i5);
        float[] fArr = this.V;
        Color.colorToHSV(i5, fArr);
        fArr[1] = 0.39f;
        int iHSVToColor = Color.HSVToColor(fArr);
        fArr[1] = 0.12f;
        fArr[2] = 0.5f;
        int iHSVToColor2 = Color.HSVToColor(fArr);
        float f11 = fArr[0];
        if (200.0f >= f11 || f11 >= 300.0f) {
            gradientDrawable.setStroke(e.k(1), iHSVToColor2);
        } else {
            gradientDrawable.setStroke(e.k(1), iHSVToColor);
        }
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSeekBarView, com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final int o(AttributeSet attributeSet) {
        int iO = super.o(attributeSet);
        if (iO == 2131624132) {
            return 2131624133;
        }
        return iO;
    }
}
