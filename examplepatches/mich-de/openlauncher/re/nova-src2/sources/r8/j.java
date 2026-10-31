package r8;

import android.net.Uri;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class j implements g {

    /* renamed from: a, reason: collision with root package name */
    public final a70.d f85628a;

    /* renamed from: b, reason: collision with root package name */
    public final a70.d f85629b;

    public j(a70.d dVar, a70.d dVar2) {
        this.f85628a = dVar;
        this.f85629b = dVar2;
    }

    @Override // r8.g
    public final h a(Object obj, x8.n nVar) {
        Uri uri = (Uri) obj;
        if (Intrinsics.b(uri.getScheme(), "http") || Intrinsics.b(uri.getScheme(), "https")) {
            return new m(uri.toString(), nVar, this.f85628a, this.f85629b);
        }
        return null;
    }
}
