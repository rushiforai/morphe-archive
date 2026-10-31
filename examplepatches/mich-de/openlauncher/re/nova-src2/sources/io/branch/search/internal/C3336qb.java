package io.branch.search.internal;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.qb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3336qb implements T4 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ T4 f65567a;

    public C3336qb(@NotNull U4 daoFactory) {
        Intrinsics.g(daoFactory, "daoFactory");
        this.f65567a = daoFactory.a();
    }

    @Override // io.branch.search.internal.T4
    public final int a() {
        return this.f65567a.a();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3118dd b() {
        return this.f65567a.b();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final H0 c() {
        return this.f65567a.c();
    }

    @Override // io.branch.search.internal.T4
    public final void close() {
        this.f65567a.close();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3120df d() {
        return this.f65567a.d();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3069af e() {
        return this.f65567a.e();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final X4 f() {
        return this.f65567a.f();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final Q0 g() {
        return this.f65567a.g();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final String getName() {
        return this.f65567a.getName();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3154ff h() {
        return this.f65567a.h();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3239l i() {
        return this.f65567a.i();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3426w0 j() {
        return this.f65567a.j();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3130e8 k() {
        return this.f65567a.k();
    }

    @Override // io.branch.search.internal.T4
    public final void l() {
        this.f65567a.l();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final L8 m() {
        return this.f65567a.m();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final P8 n() {
        return this.f65567a.n();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final Ue o() {
        return this.f65567a.o();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final InterfaceC3076b5 p() {
        return this.f65567a.p();
    }

    @NotNull
    public final InterfaceC3365s7 q() {
        return this.f65567a.p().getWritableDatabase();
    }

    public final <O> O a(boolean z11, @NotNull Function1<? super C3336qb, ? extends O> func) {
        Intrinsics.g(func, "func");
        InterfaceC3365s7 readableDatabase = z11 ? this.f65567a.p().getReadableDatabase() : q();
        try {
            if (z11) {
                ((C3178h5) readableDatabase).f64647a.beginTransactionDeferred(true);
            } else {
                ((C3178h5) readableDatabase).f64647a.beginTransaction();
            }
            O o = (O) func.invoke(this);
            ((C3178h5) readableDatabase).f64647a.setTransactionSuccessful();
            return o;
        } finally {
        }
    }

    @Override // io.branch.search.internal.T4
    public final void a(int i5) {
        this.f65567a.a(i5);
    }
}
