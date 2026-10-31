package aq;

import com.squareup.moshi.JsonDataException;
import java.io.IOException;

/* loaded from: classes4.dex */
public abstract class r {
    public abstract Object a(u uVar);

    public final Object b(String str) {
        m90.g gVar = new m90.g();
        gVar.m0(str);
        v vVar = new v(gVar);
        Object objA = a(vVar);
        if ((this instanceof p) || vVar.w() == 10) {
            return objA;
        }
        throw new JsonDataException("JSON document was not fully consumed.");
    }

    public final bq.a c() {
        return this instanceof bq.a ? (bq.a) this : new bq.a(this);
    }

    public final String d(Object obj) {
        m90.g gVar = new m90.g();
        try {
            e(new w(gVar), obj);
            return gVar.P();
        } catch (IOException e3) {
            throw new AssertionError(e3);
        }
    }

    public abstract void e(x xVar, Object obj);
}
