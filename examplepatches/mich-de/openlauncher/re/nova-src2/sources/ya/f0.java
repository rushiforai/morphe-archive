package ya;

import android.content.Context;
import android.graphics.Canvas;
import com.android.systemui.plugins.shared.LauncherOverlayManager;
import o9.g3;

/* loaded from: classes.dex */
public final class f0 extends i {

    /* renamed from: a, reason: collision with root package name */
    public final LauncherOverlayManager.LauncherOverlay f97126a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f97127b;

    /* renamed from: c, reason: collision with root package name */
    public float f97128c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f97129d;

    public f0(Context context, LauncherOverlayManager.LauncherOverlay launcherOverlay) {
        super(context);
        this.f97126a = launcherOverlay;
        this.f97127b = g3.p(context.getResources());
    }

    @Override // android.widget.EdgeEffect
    public final boolean draw(Canvas canvas) {
        return false;
    }

    @Override // android.widget.EdgeEffect
    public final void finish() {
        this.f97128c = 0.0f;
    }

    @Override // ya.i, android.widget.EdgeEffect
    public final float getDistance() {
        return this.f97128c;
    }

    @Override // android.widget.EdgeEffect
    public final boolean isFinished() {
        return this.f97128c <= 0.0f;
    }

    @Override // android.widget.EdgeEffect
    public final void onAbsorb(int i5) {
    }

    @Override // ya.i, android.widget.EdgeEffect
    public final float onPullDistance(float f11, float f12) {
        this.f97128c = Math.max(0.0f, this.f97128c + f11);
        boolean z11 = this.f97129d;
        LauncherOverlayManager.LauncherOverlay launcherOverlay = this.f97126a;
        if (!z11) {
            launcherOverlay.onScrollInteractionBegin();
            this.f97129d = true;
        }
        launcherOverlay.onScrollChange(this.f97128c, this.f97127b);
        if (this.f97128c > 0.0f) {
            return f11;
        }
        return 0.0f;
    }

    @Override // android.widget.EdgeEffect
    public final void onRelease() {
        if (this.f97129d) {
            this.f97128c = 0.0f;
            this.f97126a.onScrollInteractionEnd();
            this.f97129d = false;
        }
    }
}
