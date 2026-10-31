package za;

import android.content.Context;
import android.graphics.Canvas;
import android.widget.EdgeEffect;
import com.android.launcher3.views.SpringRelativeLayout;

/* loaded from: classes2.dex */
public final class w extends EdgeEffect {

    /* renamed from: a, reason: collision with root package name */
    public final EdgeEffect f98497a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ SpringRelativeLayout f98498b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(SpringRelativeLayout springRelativeLayout, Context context, EdgeEffect edgeEffect) {
        super(context);
        this.f98498b = springRelativeLayout;
        this.f98497a = edgeEffect;
    }

    public final void a() {
        if (this.f98497a.isFinished()) {
            return;
        }
        this.f98498b.invalidate();
    }

    @Override // android.widget.EdgeEffect
    public final boolean draw(Canvas canvas) {
        return false;
    }

    @Override // android.widget.EdgeEffect
    public final void finish() {
        this.f98497a.finish();
    }

    @Override // android.widget.EdgeEffect
    public final boolean isFinished() {
        return this.f98497a.isFinished();
    }

    @Override // android.widget.EdgeEffect
    public final void onAbsorb(int i5) {
        this.f98497a.onAbsorb(i5);
        a();
    }

    @Override // android.widget.EdgeEffect
    public final void onPull(float f11) {
        this.f98497a.onPull(f11);
        a();
    }

    @Override // android.widget.EdgeEffect
    public final void onRelease() {
        this.f98497a.onRelease();
        a();
    }

    @Override // android.widget.EdgeEffect
    public final void onPull(float f11, float f12) {
        this.f98497a.onPull(f11, f12);
        a();
    }
}
