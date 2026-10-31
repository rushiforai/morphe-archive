package tj;

import android.graphics.Typeface;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f89333a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b f89334b;

    public /* synthetic */ a(b bVar, int i5) {
        this.f89333a = i5;
        this.f89334b = bVar;
    }

    public final void a(Typeface typeface) {
        switch (this.f89333a) {
            case 0:
                b bVar = this.f89334b;
                if (bVar.l(typeface)) {
                    bVar.i(false);
                    break;
                }
                break;
            default:
                b bVar2 = this.f89334b;
                if (bVar2.n(typeface)) {
                    bVar2.i(false);
                    break;
                }
                break;
        }
    }
}
