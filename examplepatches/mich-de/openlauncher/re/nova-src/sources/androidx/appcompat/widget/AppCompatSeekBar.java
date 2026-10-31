package androidx.appcompat.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.SeekBar;
import r.c2;
import r.z;

/* loaded from: classes2.dex */
public class AppCompatSeekBar extends SeekBar {

    /* renamed from: a, reason: collision with root package name */
    public final z f13760a;

    public AppCompatSeekBar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130969918);
        c2.a(getContext(), this);
        z zVar = new z(this);
        this.f13760a = zVar;
        zVar.b(attributeSet, 2130969918);
    }

    @Override // android.widget.AbsSeekBar, android.widget.ProgressBar, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        z zVar = this.f13760a;
        AppCompatSeekBar appCompatSeekBar = zVar.f84917e;
        Drawable drawable = zVar.f84918f;
        if (drawable != null && drawable.isStateful() && drawable.setState(appCompatSeekBar.getDrawableState())) {
            appCompatSeekBar.invalidateDrawable(drawable);
        }
    }

    @Override // android.widget.AbsSeekBar, android.widget.ProgressBar, android.view.View
    public final void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        Drawable drawable = this.f13760a.f84918f;
        if (drawable != null) {
            drawable.jumpToCurrentState();
        }
    }

    @Override // android.widget.AbsSeekBar, android.widget.ProgressBar, android.view.View
    public final synchronized void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        this.f13760a.f(canvas);
    }
}
