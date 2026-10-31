package g8;

import android.view.animation.Animation;

/* loaded from: classes2.dex */
public final class a implements Animation.AnimationListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57197a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f57198b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ f f57199c;

    public /* synthetic */ a(f fVar, e eVar, int i5) {
        this.f57197a = i5;
        this.f57199c = fVar;
        this.f57198b = eVar;
    }

    private final void a(Animation animation) {
    }

    private final void b(Animation animation) {
    }

    private final void c(Animation animation) {
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationEnd(Animation animation) {
        switch (this.f57197a) {
            case 0:
                e eVar = this.f57198b;
                eVar.f57214j = (eVar.f57214j + 1) % eVar.f57213i.length;
                eVar.f57215k = eVar.f57208d;
                eVar.f57216l = eVar.f57209e;
                eVar.f57217m = eVar.f57210f;
                f fVar = this.f57199c;
                fVar.f57227e.startAnimation(fVar.f57228f);
                break;
        }
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationRepeat(Animation animation) {
        switch (this.f57197a) {
            case 0:
                break;
            default:
                e eVar = this.f57198b;
                eVar.f57215k = eVar.f57208d;
                float f11 = eVar.f57209e;
                eVar.f57216l = f11;
                eVar.f57217m = eVar.f57210f;
                eVar.f57214j = (eVar.f57214j + 1) % eVar.f57213i.length;
                eVar.f57208d = f11;
                eVar.a();
                f fVar = this.f57199c;
                fVar.f57229g = (fVar.f57229g + 1.0f) % 5.0f;
                break;
        }
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationStart(Animation animation) {
        switch (this.f57197a) {
            case 0:
                break;
            default:
                this.f57199c.f57229g = 0.0f;
                break;
        }
    }
}
