package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import com.google.android.material.datepicker.n;
import f10.b;
import f10.w;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import l30.k;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u001d\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/RequiresPrimeSwitchCompat;", "Ll30/k;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class RequiresPrimeSwitchCompat extends k {
    public final w P;
    public final n Q;
    public final Drawable R;
    public final Drawable S;

    @JvmOverloads
    public RequiresPrimeSwitchCompat(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        this.P = new w(this);
        this.Q = new n(null, 1);
        this.R = this.f74641a;
        this.S = this.f74646f;
        setOnCheckedChangeListener(new b(this, 1));
    }

    @Override // l30.k
    public final boolean d(float f11, float f12) {
        if (this.P.f54212b) {
            return super.d(f11, f12);
        }
        return false;
    }

    @Override // l30.k, android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        this.P.a(canvas, getWidth(), getHeight());
    }

    @Override // android.view.View
    public final void onWindowVisibilityChanged(int i5) {
        super.onWindowVisibilityChanged(i5);
        if (i5 == 0) {
            this.P.b();
        }
    }

    @Override // android.widget.CompoundButton, android.view.View
    public final boolean performClick() {
        if (this.P.f54212b) {
            return super.performClick();
        }
        this.Q.onClick(this);
        return true;
    }
}
