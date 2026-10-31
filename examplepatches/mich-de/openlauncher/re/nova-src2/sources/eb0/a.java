package eb0;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
import kotlin.Unit;

/* loaded from: classes5.dex */
public class a implements m {

    /* renamed from: b, reason: collision with root package name */
    public static final a f52530b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f52531c = new a(1);

    /* renamed from: d, reason: collision with root package name */
    public static final a f52532d = new a(2);

    /* renamed from: e, reason: collision with root package name */
    public static final a f52533e = new a(3);

    /* renamed from: f, reason: collision with root package name */
    public static final a f52534f = new a(4);

    /* renamed from: g, reason: collision with root package name */
    public static final a f52535g = new a(5);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52536a;

    public /* synthetic */ a(int i5) {
        this.f52536a = i5;
    }

    public List a(Executor executor) {
        return Collections.singletonList(new o(executor));
    }

    public List b() {
        return Collections.EMPTY_LIST;
    }

    public String c(Method method, int i5) {
        return "parameter #" + (i5 + 1);
    }

    /* JADX WARN: Finally extract failed */
    @Override // eb0.m
    public Object convert(Object obj) {
        switch (this.f52536a) {
            case 0:
                return obj.toString();
            case 1:
                x80.p0 p0Var = (x80.p0) obj;
                try {
                    m90.g gVar = new m90.g();
                    p0Var.source().O(gVar);
                    x80.p0 p0VarCreate = x80.p0.create(p0Var.contentType(), p0Var.contentLength(), gVar);
                    p0Var.close();
                    return p0VarCreate;
                } catch (Throwable th2) {
                    p0Var.close();
                    throw th2;
                }
            case 2:
                return (x80.k0) obj;
            case 3:
                return (x80.p0) obj;
            case 4:
                ((x80.p0) obj).close();
                return Unit.f71706a;
            default:
                ((x80.p0) obj).close();
                return null;
        }
    }

    public Object d(Method method, Class cls, Object obj, Object[] objArr) {
        throw new AssertionError();
    }

    public boolean e(Method method) {
        return false;
    }

    public /* synthetic */ a(boolean z11, int i5) {
        this.f52536a = i5;
    }
}
