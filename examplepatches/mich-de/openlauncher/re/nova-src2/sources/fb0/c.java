package fb0;

import aq.r;
import aq.v;
import com.squareup.moshi.JsonDataException;
import eb0.m;
import lm.e;
import m90.i;
import m90.j;
import x80.p0;

/* loaded from: classes5.dex */
public final class c implements m {

    /* renamed from: b, reason: collision with root package name */
    public static final j f54589b;

    /* renamed from: a, reason: collision with root package name */
    public final r f54590a;

    static {
        j jVar = j.f76130d;
        f54589b = e.m("EFBBBF");
    }

    public c(r rVar) {
        this.f54590a = rVar;
    }

    @Override // eb0.m
    public final Object convert(Object obj) {
        p0 p0Var = (p0) obj;
        i iVarSource = p0Var.source();
        try {
            if (iVarSource.R(0L, f54589b)) {
                iVarSource.skip(r1.f76131a.length);
            }
            v vVar = new v(iVarSource);
            Object objA = this.f54590a.a(vVar);
            if (vVar.w() != 10) {
                throw new JsonDataException("JSON document was not fully consumed.");
            }
            p0Var.close();
            return objA;
        } catch (Throwable th2) {
            p0Var.close();
            throw th2;
        }
    }
}
