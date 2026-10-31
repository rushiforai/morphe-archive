package p1;

import kotlin.KotlinNothingValueException;

/* loaded from: classes.dex */
public final class r1 {

    /* renamed from: a, reason: collision with root package name */
    public final androidx.compose.runtime.e f81538a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f81539b;

    /* renamed from: c, reason: collision with root package name */
    public final t2 f81540c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f81541d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f81542e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f81543f = true;

    public r1(androidx.compose.runtime.e eVar, Object obj, boolean z11, t2 t2Var, boolean z12) {
        this.f81538a = eVar;
        this.f81539b = z11;
        this.f81540c = t2Var;
        this.f81541d = z12;
        this.f81542e = obj;
    }

    public final Object a() {
        if (this.f81539b) {
            return null;
        }
        Object obj = this.f81542e;
        if (obj != null) {
            return obj;
        }
        u.d("Unexpected form of a provided value");
        throw new KotlinNothingValueException();
    }
}
