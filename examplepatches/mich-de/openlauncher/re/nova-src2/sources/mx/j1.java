package mx;

import android.content.pm.PackageInfo;
import android.graphics.drawable.Drawable;
import java.util.List;
import java.util.Vector;

/* loaded from: classes4.dex */
public final class j1 extends c implements lb.a {

    /* renamed from: c, reason: collision with root package name */
    public final PackageInfo f77181c;

    /* renamed from: d, reason: collision with root package name */
    public final Vector f77182d;

    public j1(PackageInfo packageInfo, String str, Drawable drawable, Vector vector) {
        super(str, drawable);
        this.f77181c = packageInfo;
        this.f77182d = vector;
    }

    @Override // lb.a
    public final List a() {
        return this.f77182d;
    }
}
