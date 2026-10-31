package androidx.datastore.preferences.protobuf;

import java.nio.charset.Charset;

/* loaded from: classes.dex */
public final class j0 {

    /* renamed from: b, reason: collision with root package name */
    public static final v f14336b = new v(1);

    /* renamed from: a, reason: collision with root package name */
    public final Object f14337a;

    public j0(m mVar) {
        Charset charset = b0.f14278a;
        this.f14337a = mVar;
        mVar.f14355b = this;
    }

    public void a(int i5, Object obj, z0 z0Var) {
        m mVar = (m) this.f14337a;
        mVar.A0(i5, 3);
        z0Var.e((a) obj, mVar.f14355b);
        mVar.A0(i5, 4);
    }

    public j0() {
        o0 o0Var;
        w0 w0Var = w0.f14415c;
        try {
            o0Var = (o0) Class.forName("androidx.datastore.preferences.protobuf.DescriptorMessageInfoFactory").getDeclaredMethod("getInstance", null).invoke(null, null);
        } catch (Exception unused) {
            o0Var = f14336b;
        }
        o0[] o0VarArr = {v.f14405b, o0Var};
        i0 i0Var = new i0();
        i0Var.f14328a = o0VarArr;
        Charset charset = b0.f14278a;
        this.f14337a = i0Var;
    }
}
