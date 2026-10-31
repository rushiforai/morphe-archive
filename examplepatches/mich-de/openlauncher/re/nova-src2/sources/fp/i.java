package fp;

import b.c0;
import com.nimbusds.jose.shaded.gson.JsonSyntaxException;
import cp.x;
import cp.z;
import java.io.IOException;

/* loaded from: classes4.dex */
public final class i extends z {

    /* renamed from: b, reason: collision with root package name */
    public static final h f55508b = new h(new i(x.f47785b), 0);

    /* renamed from: a, reason: collision with root package name */
    public final x f55509a;

    public i(x xVar) {
        this.f55509a = xVar;
    }

    @Override // cp.z
    public final Object b(kp.a aVar) {
        int iF0 = aVar.f0();
        int iF = c0.F(iF0);
        if (iF == 5 || iF == 6) {
            return this.f55509a.a(aVar);
        }
        if (iF == 8) {
            aVar.V();
            return null;
        }
        throw new JsonSyntaxException("Expecting number, got: " + fq.c.y(iF0) + "; at path " + aVar.l(false));
    }

    @Override // cp.z
    public final void c(kp.b bVar, Object obj) throws IOException {
        bVar.P((Number) obj);
    }
}
