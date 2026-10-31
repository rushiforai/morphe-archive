package fb0;

import aq.r;
import aq.w;
import eb0.m;
import java.io.EOFException;
import java.util.regex.Pattern;
import m90.g;
import x80.a0;
import x80.k0;
import x80.z;

/* loaded from: classes5.dex */
public final class b implements m {

    /* renamed from: b, reason: collision with root package name */
    public static final a0 f54587b;

    /* renamed from: a, reason: collision with root package name */
    public final r f54588a;

    static {
        Pattern pattern = a0.f95396e;
        f54587b = z.a("application/json; charset=UTF-8");
    }

    public b(r rVar) {
        this.f54588a = rVar;
    }

    @Override // eb0.m
    public final Object convert(Object obj) throws EOFException {
        g gVar = new g();
        this.f54588a.e(new w(gVar), obj);
        return k0.create(f54587b, gVar.H(gVar.f76126b));
    }
}
