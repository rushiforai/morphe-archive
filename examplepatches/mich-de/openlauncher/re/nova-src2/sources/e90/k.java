package e90;

import java.io.IOException;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* loaded from: classes.dex */
public final class k implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final u f52326a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ q f52327b;

    public k(q qVar, u uVar) {
        this.f52327b = qVar;
        this.f52326a = uVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws IOException {
        q qVar = this.f52327b;
        u uVar = this.f52326a;
        try {
        } catch (IOException e3) {
            qVar.a(2, 2, e3);
        } catch (Throwable th2) {
            qVar.a(3, 3, null);
            y80.c.c(uVar);
            throw th2;
        }
        if (!uVar.a(true, this)) {
            throw new IOException("Required SETTINGS preface not received");
        }
        while (uVar.a(false, this)) {
        }
        qVar.a(1, 9, null);
        y80.c.c(uVar);
        return Unit.f71706a;
    }
}
