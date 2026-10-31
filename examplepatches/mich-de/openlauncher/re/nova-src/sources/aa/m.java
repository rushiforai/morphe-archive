package aa;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;

/* loaded from: classes2.dex */
public class m extends Drawable.ConstantState {

    /* renamed from: a, reason: collision with root package name */
    public final Bitmap f615a;

    /* renamed from: b, reason: collision with root package name */
    public final int f616b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f617c;

    public m(Bitmap bitmap, int i5, boolean z11) {
        this.f615a = bitmap;
        this.f616b = i5;
        this.f617c = z11;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public n newDrawable() {
        return new n(this.f615a, this.f616b, this.f617c);
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public int getChangingConfigurations() {
        return 0;
    }
}
