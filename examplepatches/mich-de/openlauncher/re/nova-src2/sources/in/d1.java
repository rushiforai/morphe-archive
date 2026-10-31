package in;

import com.google.gson.Gson;

/* loaded from: classes3.dex */
public final class d1 implements com.google.gson.i0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ mn.a f61676a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.google.gson.h0 f61677b;

    public d1(mn.a aVar, com.google.gson.h0 h0Var) {
        this.f61676a = aVar;
        this.f61677b = h0Var;
    }

    @Override // com.google.gson.i0
    public final com.google.gson.h0 a(Gson gson, mn.a aVar) {
        if (aVar.equals(this.f61676a)) {
            return this.f61677b;
        }
        return null;
    }
}
