package id;

import android.graphics.drawable.Drawable;
import android.net.Uri;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class l extends hg.a {

    /* renamed from: a, reason: collision with root package name */
    public final Drawable f61540a;

    /* renamed from: b, reason: collision with root package name */
    public final Uri f61541b;

    /* renamed from: c, reason: collision with root package name */
    public final double f61542c;

    public l(Drawable drawable) {
        Uri EMPTY = Uri.EMPTY;
        Intrinsics.f(EMPTY, "EMPTY");
        this.f61540a = drawable;
        this.f61541b = EMPTY;
        this.f61542c = 1.0d;
    }

    @Override // hg.a
    public final Drawable a() {
        return this.f61540a;
    }

    @Override // hg.a
    public final double b() {
        return this.f61542c;
    }

    @Override // hg.a
    public final Uri c() {
        return this.f61541b;
    }
}
