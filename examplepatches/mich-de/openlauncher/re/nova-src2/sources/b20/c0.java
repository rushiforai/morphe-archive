package b20;

import android.content.Intent;
import android.os.UserHandle;
import com.android.launcher3.util.ComponentKey;
import java.util.List;
import kotlin.jvm.functions.Function0;
import nova.branch.engage.sesame_lite.internal.IdHash;
import r10.o1;

/* loaded from: classes4.dex */
public final class c0 implements e {

    /* renamed from: a, reason: collision with root package name */
    public final e f17060a;

    /* renamed from: b, reason: collision with root package name */
    public final Function0 f17061b;

    public c0(e eVar, Function0 function0) {
        this.f17060a = eVar;
        this.f17061b = function0;
    }

    @Override // b20.e
    public final void a(String str, String str2, UserHandle userHandle, pp.u uVar, IdHash idHash) {
        this.f17061b.invoke();
        this.f17060a.a(str, str2, userHandle, uVar, idHash);
    }

    @Override // b20.e
    public final ga.a b(ComponentKey componentKey) {
        return this.f17060a.b(componentKey);
    }

    @Override // b20.e
    public final long c(UserHandle userHandle) {
        return this.f17060a.c(userHandle);
    }

    @Override // b20.e
    public final boolean d() {
        return this.f17060a.d();
    }

    @Override // b20.e
    public final void e(Intent intent, pp.u uVar, IdHash idHash) {
        this.f17060a.e(intent, uVar, idHash);
    }

    @Override // b20.e
    public final void f(ga.a aVar) {
        this.f17061b.invoke();
        this.f17060a.f(aVar);
    }

    @Override // b20.e
    public final void g(o1 o1Var) {
        this.f17061b.invoke();
        this.f17060a.g(o1Var);
    }

    @Override // b20.e
    public final String getString(int i5) {
        return this.f17060a.getString(i5);
    }

    @Override // b20.e
    public final UserHandle getUserHandle(long j11) {
        return this.f17060a.getUserHandle(j11);
    }

    @Override // b20.e
    public final ga.a h(long j11, String str, String str2) {
        return this.f17060a.h(j11, str, str2);
    }

    @Override // b20.e
    public final void i(Intent intent, pp.u uVar, IdHash idHash) {
        this.f17061b.invoke();
        this.f17060a.i(intent, uVar, idHash);
    }

    @Override // b20.e
    public final List j(String str, String str2, long j11, List list, int i5) {
        return this.f17060a.j(str, str2, j11, list, i5);
    }
}
