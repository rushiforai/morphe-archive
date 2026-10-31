package com.teslacoilsw.launcher.preferences.fancyprefs;

import aa.p;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;
import g10.f;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r4.a;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u001d\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefTransparencySeekBarView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefSeekBarView;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class FancyPrefTransparencySeekBarView extends FancyPrefSeekBarView {
    public int U;

    @JvmOverloads
    public FancyPrefTransparencySeekBarView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        int iH = c1.h(context, 2);
        this.N.setPadding(iH, iH, iH, iH);
        Q(p.b(context, 16842806));
        this.N.setImageDrawable(new f(context, this.U, 1.0f, p.b(context, 16842806), 16));
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSeekBarView
    public final void O(int i5) {
        ImageView imageView = this.N;
        Object drawable = imageView != null ? imageView.getDrawable() : null;
        f fVar = drawable instanceof f ? (f) drawable : null;
        if (fVar == null) {
            return;
        }
        fVar.b(a.n(this.U, 255 - i5));
    }

    public final void Q(int i5) {
        this.U = i5;
        O(K());
    }
}
