package wj;

import aa.i0;
import android.animation.ObjectAnimator;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class p extends c3.b {

    /* renamed from: m, reason: collision with root package name */
    public static final jz.b f94470m = new jz.b(6, Float.class, "animationFraction");

    /* renamed from: g, reason: collision with root package name */
    public ObjectAnimator f94471g;

    /* renamed from: h, reason: collision with root package name */
    public final f6.a f94472h;

    /* renamed from: i, reason: collision with root package name */
    public final s f94473i;

    /* renamed from: j, reason: collision with root package name */
    public int f94474j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f94475k;

    /* renamed from: l, reason: collision with root package name */
    public float f94476l;

    public p(s sVar) {
        super(3);
        this.f94474j = 1;
        this.f94473i = sVar;
        this.f94472h = new f6.a(1);
    }

    @Override // c3.b
    public final void A() {
    }

    @Override // c3.b
    public final void C() {
        if (this.f94471g == null) {
            ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, f94470m, 0.0f, 1.0f);
            this.f94471g = objectAnimatorOfFloat;
            objectAnimatorOfFloat.setDuration(333L);
            this.f94471g.setInterpolator(null);
            this.f94471g.setRepeatCount(-1);
            this.f94471g.addListener(new i0(this, 21));
        }
        E();
        this.f94471g.start();
    }

    @Override // c3.b
    public final void D() {
    }

    public final void E() {
        this.f94475k = true;
        this.f94474j = 1;
        Iterator it = ((ArrayList) this.f19223b).iterator();
        while (it.hasNext()) {
            m mVar = (m) it.next();
            s sVar = this.f94473i;
            mVar.f94461c = sVar.f94415c[0];
            mVar.f94462d = sVar.f94419g / 2;
        }
    }

    @Override // c3.b
    public final void g() {
        ObjectAnimator objectAnimator = this.f94471g;
        if (objectAnimator != null) {
            objectAnimator.cancel();
        }
    }

    @Override // c3.b
    public final void r() {
        E();
    }

    @Override // c3.b
    public final void z(b bVar) {
    }
}
