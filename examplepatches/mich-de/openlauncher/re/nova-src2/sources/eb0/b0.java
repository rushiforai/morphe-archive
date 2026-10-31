package eb0;

import java.util.Objects;

/* loaded from: classes5.dex */
public final class b0 extends w0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f52541d;

    /* renamed from: e, reason: collision with root package name */
    public final String f52542e;

    /* renamed from: f, reason: collision with root package name */
    public final a f52543f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f52544g;

    public b0(int i5, String str, boolean z11) {
        this.f52541d = i5;
        switch (i5) {
            case 1:
                a aVar = a.f52530b;
                Objects.requireNonNull(str, "name == null");
                this.f52542e = str;
                this.f52543f = aVar;
                this.f52544g = z11;
                break;
            case 2:
                a aVar2 = a.f52530b;
                Objects.requireNonNull(str, "name == null");
                this.f52542e = str;
                this.f52543f = aVar2;
                this.f52544g = z11;
                break;
            default:
                a aVar3 = a.f52530b;
                Objects.requireNonNull(str, "name == null");
                this.f52542e = str;
                this.f52543f = aVar3;
                this.f52544g = z11;
                break;
        }
    }

    @Override // eb0.w0
    public final void a(m0 m0Var, Object obj) {
        switch (this.f52541d) {
            case 0:
                if (obj != null) {
                    this.f52543f.getClass();
                    String string = obj.toString();
                    if (string != null) {
                        m0Var.a(this.f52542e, string, this.f52544g);
                        break;
                    }
                }
                break;
            case 1:
                if (obj != null) {
                    this.f52543f.getClass();
                    String string2 = obj.toString();
                    if (string2 != null) {
                        m0Var.b(this.f52542e, string2, this.f52544g);
                        break;
                    }
                }
                break;
            default:
                if (obj != null) {
                    this.f52543f.getClass();
                    String string3 = obj.toString();
                    if (string3 != null) {
                        m0Var.d(this.f52542e, string3, this.f52544g);
                        break;
                    }
                }
                break;
        }
    }
}
