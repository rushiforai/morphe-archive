package j7;

import android.content.res.Resources;
import android.graphics.Path;
import android.graphics.drawable.Drawable;
import x9.s;

/* loaded from: classes2.dex */
public final class c extends Drawable.ConstantState {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69075a = 0;

    /* renamed from: b, reason: collision with root package name */
    public Object f69076b;

    /* renamed from: c, reason: collision with root package name */
    public Object f69077c;

    /* renamed from: d, reason: collision with root package name */
    public Object f69078d;

    /* renamed from: e, reason: collision with root package name */
    public Object f69079e;

    public /* synthetic */ c() {
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final int getChangingConfigurations() {
        switch (this.f69075a) {
            case 0:
                return 0;
            default:
                return ((Drawable.ConstantState) this.f69076b).getChangingConfigurations() & ((Drawable.ConstantState) this.f69077c).getChangingConfigurations() & ((Drawable.ConstantState) this.f69078d).getChangingConfigurations();
        }
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable() {
        switch (this.f69075a) {
            case 0:
                throw new IllegalStateException("No constant state support for SDK < 24.");
            default:
                return new s(((Drawable.ConstantState) this.f69076b).newDrawable(), ((Drawable.ConstantState) this.f69077c).newDrawable(), ((Drawable.ConstantState) this.f69078d).newDrawable(), (Path) this.f69079e);
        }
    }

    public c(Drawable.ConstantState constantState, Drawable.ConstantState constantState2, Drawable.ConstantState constantState3, Path path) {
        this.f69076b = constantState;
        this.f69077c = constantState2;
        this.f69078d = constantState3;
        this.f69079e = path;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public Drawable newDrawable(Resources resources) {
        switch (this.f69075a) {
            case 0:
                throw new IllegalStateException("No constant state support for SDK < 24.");
            default:
                return super.newDrawable(resources);
        }
    }
}
