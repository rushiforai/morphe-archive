package z2;

import java.util.Map;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class j0 implements s0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ s0 f98087a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n0 f98088b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f98089c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ s0 f98090d;

    public j0(s0 s0Var, n0 n0Var, int i5, s0 s0Var2) {
        this.f98088b = n0Var;
        this.f98089c = i5;
        this.f98090d = s0Var2;
        this.f98087a = s0Var;
    }

    @Override // z2.s0
    public final Map a() {
        return this.f98087a.a();
    }

    @Override // z2.s0
    public final void b() {
        int i5 = this.f98089c;
        n0 n0Var = this.f98088b;
        n0Var.f98110d = i5;
        this.f98090d.b();
        n0Var.b(n0Var.f98110d);
    }

    @Override // z2.s0
    public final Function1 c() {
        return this.f98087a.c();
    }

    @Override // z2.s0
    public final int getHeight() {
        return this.f98087a.getHeight();
    }

    @Override // z2.s0
    public final int getWidth() {
        return this.f98087a.getWidth();
    }
}
