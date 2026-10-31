package c90;

import java.util.regex.Pattern;
import m90.d0;
import m90.i;
import x80.a0;
import x80.p0;
import x80.z;

/* loaded from: classes.dex */
public final class g extends p0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f19897d;

    /* renamed from: e, reason: collision with root package name */
    public final long f19898e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f19899f;

    /* renamed from: g, reason: collision with root package name */
    public final i f19900g;

    public /* synthetic */ g(Object obj, long j11, i iVar, int i5) {
        this.f19897d = i5;
        this.f19899f = obj;
        this.f19898e = j11;
        this.f19900g = iVar;
    }

    @Override // x80.p0
    public final long contentLength() {
        switch (this.f19897d) {
        }
        return this.f19898e;
    }

    @Override // x80.p0
    public final a0 contentType() {
        int i5 = this.f19897d;
        Object obj = this.f19899f;
        switch (i5) {
            case 0:
                String str = (String) obj;
                if (str == null) {
                    return null;
                }
                Pattern pattern = a0.f95396e;
                return z.b(str);
            default:
                return (a0) obj;
        }
    }

    @Override // x80.p0
    public final i source() {
        switch (this.f19897d) {
            case 0:
                return (d0) this.f19900g;
            default:
                return this.f19900g;
        }
    }
}
