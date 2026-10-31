package r10;

import android.net.Uri;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b implements r8.g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85114a;

    /* renamed from: b, reason: collision with root package name */
    public final fz.d0 f85115b;

    public /* synthetic */ b(fz.d0 d0Var, int i5) {
        this.f85114a = i5;
        this.f85115b = d0Var;
    }

    @Override // r8.g
    public final r8.h a(Object obj, x8.n nVar) {
        switch (this.f85114a) {
            case 0:
                Uri uri = (Uri) obj;
                if (Intrinsics.b(uri.getScheme(), "appIcon")) {
                    return new d(nVar.f95352a, this.f85115b, uri);
                }
                return null;
            default:
                Uri uri2 = (Uri) obj;
                if (Intrinsics.b(uri2.getScheme(), "deepShortcutIcon")) {
                    return new g0(nVar.f95352a, this.f85115b, uri2);
                }
                return null;
        }
    }
}
