package in;

import com.google.gson.Gson;

/* loaded from: classes3.dex */
public final class h0 implements com.google.gson.i0 {

    /* renamed from: a, reason: collision with root package name */
    public final mn.a f61698a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f61699b;

    /* renamed from: c, reason: collision with root package name */
    public final Class f61700c;

    /* renamed from: d, reason: collision with root package name */
    public final com.google.gson.u f61701d;

    /* renamed from: e, reason: collision with root package name */
    public final com.google.gson.o f61702e;

    public h0(Object obj, mn.a aVar, boolean z11, Class cls) {
        com.google.gson.u uVar = obj instanceof com.google.gson.u ? (com.google.gson.u) obj : null;
        this.f61701d = uVar;
        com.google.gson.o oVar = obj instanceof com.google.gson.o ? (com.google.gson.o) obj : null;
        this.f61702e = oVar;
        if (uVar == null && oVar == null) {
            throw new IllegalArgumentException("Type adapter " + obj.getClass().getName() + " must implement JsonSerializer or JsonDeserializer");
        }
        this.f61698a = aVar;
        this.f61699b = z11;
        this.f61700c = cls;
    }

    @Override // com.google.gson.i0
    public final com.google.gson.h0 a(Gson gson, mn.a aVar) {
        Class<?> cls = aVar.f76504a;
        mn.a aVar2 = this.f61698a;
        if (aVar2 != null ? aVar2.equals(aVar) || (this.f61699b && aVar2.f76505b == cls) : this.f61700c.isAssignableFrom(cls)) {
            return new i0(this.f61701d, this.f61702e, gson, aVar, this, true);
        }
        return null;
    }
}
