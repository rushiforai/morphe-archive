package ok;

import ai.k4;
import android.content.Context;
import m.w;

/* loaded from: classes3.dex */
public final class m implements tk.l {

    /* renamed from: a, reason: collision with root package name */
    public final tk.k f80485a;

    public m(tk.k kVar) {
        this.f80485a = kVar;
    }

    @Override // tk.m
    public /* bridge */ /* synthetic */ Object a() {
        return new l((h) this.f80485a.a());
    }

    public m(Context context) {
        k4 k4Var = new k4(context, (byte) 0);
        tk.k kVarB = tk.k.b(new og.i(k4Var, tk.k.b(a.f80454b), new b50.d(k4Var)));
        this.f80485a = tk.k.b(new w(kVarB, tk.k.b(new m(kVarB)), false, 5));
    }
}
