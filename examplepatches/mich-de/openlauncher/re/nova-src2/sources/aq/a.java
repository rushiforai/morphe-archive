package aq;

import com.squareup.moshi.JsonDataException;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Type;
import java.util.Set;

/* loaded from: classes4.dex */
public final class a extends r {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ d f15404a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ r f15405b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ d f15406c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Set f15407d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Type f15408e;

    public a(d dVar, r rVar, h0 h0Var, d dVar2, Set set, Type type) {
        this.f15404a = dVar;
        this.f15405b = rVar;
        this.f15406c = dVar2;
        this.f15407d = set;
        this.f15408e = type;
    }

    @Override // aq.r
    public final Object a(u uVar) throws IOException {
        d dVar = this.f15406c;
        if (dVar == null) {
            return this.f15405b.a(uVar);
        }
        if (!dVar.f15438g && uVar.w() == 9) {
            uVar.p();
            return null;
        }
        try {
            return dVar.b(uVar);
        } catch (InvocationTargetException e3) {
            Throwable cause = e3.getCause();
            if (cause instanceof IOException) {
                throw ((IOException) cause);
            }
            throw new JsonDataException(cause + " at " + uVar.e(), cause);
        }
    }

    @Override // aq.r
    public final void e(x xVar, Object obj) throws IOException {
        d dVar = this.f15404a;
        if (dVar == null) {
            this.f15405b.e(xVar, obj);
            return;
        }
        if (!dVar.f15438g && obj == null) {
            xVar.e();
            return;
        }
        try {
            dVar.d(xVar, obj);
        } catch (InvocationTargetException e3) {
            Throwable cause = e3.getCause();
            if (cause instanceof IOException) {
                throw ((IOException) cause);
            }
            throw new JsonDataException(cause + " at " + xVar.c(), cause);
        }
    }

    public final String toString() {
        return "JsonAdapter" + this.f15407d + "(" + this.f15408e + ")";
    }
}
