package k50;

import kotlin.coroutines.CoroutineContext;
import o50.f0;
import o50.m;
import o50.o;
import o50.s;

/* loaded from: classes.dex */
public final class a implements b {

    /* renamed from: a, reason: collision with root package name */
    public final d50.b f71112a;

    /* renamed from: b, reason: collision with root package name */
    public final s f71113b;

    /* renamed from: c, reason: collision with root package name */
    public final f0 f71114c;

    /* renamed from: d, reason: collision with root package name */
    public final o f71115d;

    /* renamed from: e, reason: collision with root package name */
    public final s50.d f71116e;

    public a(d50.b bVar, d dVar) {
        this.f71112a = bVar;
        this.f71113b = dVar.f71124b;
        this.f71114c = dVar.f71123a;
        this.f71115d = dVar.f71125c;
        this.f71116e = dVar.f71128f;
    }

    @Override // o50.q
    public final m a() {
        return this.f71115d;
    }

    @Override // k50.b
    public final s50.d getAttributes() {
        return this.f71116e;
    }

    @Override // k50.b, t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f71112a.getCoroutineContext();
    }

    @Override // k50.b
    public final s getMethod() {
        return this.f71113b;
    }

    @Override // k50.b
    public final f0 getUrl() {
        return this.f71114c;
    }
}
