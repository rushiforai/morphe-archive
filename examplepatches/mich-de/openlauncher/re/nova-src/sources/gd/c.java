package gd;

import android.graphics.drawable.Drawable;
import android.net.Uri;

/* loaded from: classes3.dex */
public final class c extends hg.a {

    /* renamed from: a, reason: collision with root package name */
    public Drawable f57364a;

    /* renamed from: b, reason: collision with root package name */
    public final Uri f57365b;

    public c(Uri uri) {
        this.f57365b = uri;
    }

    @Override // hg.a
    public final Drawable a() {
        return this.f57364a;
    }

    @Override // hg.a
    public final double b() {
        return 1.0d;
    }

    @Override // hg.a
    public final Uri c() {
        return this.f57365b;
    }
}
