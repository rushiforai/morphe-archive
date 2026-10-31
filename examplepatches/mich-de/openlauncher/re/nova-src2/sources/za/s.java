package za;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;

/* loaded from: classes2.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final int f98484a;

    /* renamed from: b, reason: collision with root package name */
    public final CharSequence f98485b;

    /* renamed from: c, reason: collision with root package name */
    public final Drawable f98486c;

    /* renamed from: d, reason: collision with root package name */
    public final ea.d f98487d;

    /* renamed from: e, reason: collision with root package name */
    public final View.OnLongClickListener f98488e;

    public s(Context context, int i5, int i11, ea.d dVar, View.OnLongClickListener onLongClickListener) {
        this.f98484a = i5;
        this.f98485b = context.getText(i5);
        this.f98486c = context.getDrawable(i11);
        this.f98487d = dVar;
        this.f98488e = onLongClickListener;
    }
}
