package y70;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.Result;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlinx.coroutines.DispatchException;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import t70.c0;
import t70.i1;
import t70.k2;
import t70.m0;
import t70.v0;

/* loaded from: classes.dex */
public final class f extends v0 implements CoroutineStackFrame, Continuation {

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f96792h = AtomicReferenceFieldUpdater.newUpdater(f.class, Object.class, "_reusableCancellableContinuation$volatile");
    private volatile /* synthetic */ Object _reusableCancellableContinuation$volatile;

    /* renamed from: d, reason: collision with root package name */
    public final c0 f96793d;

    /* renamed from: e, reason: collision with root package name */
    public final ContinuationImpl f96794e;

    /* renamed from: f, reason: collision with root package name */
    public Object f96795f;

    /* renamed from: g, reason: collision with root package name */
    public final Object f96796g;

    public f(c0 c0Var, ContinuationImpl continuationImpl) {
        super(-1);
        this.f96793d = c0Var;
        this.f96794e = continuationImpl;
        this.f96795f = g.f96797a;
        this.f96796g = w.b(continuationImpl.getContext());
    }

    @Override // t70.v0
    public final Continuation e() {
        return this;
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    public final CoroutineStackFrame getCallerFrame() {
        return this.f96794e;
    }

    @Override // kotlin.coroutines.Continuation
    public final CoroutineContext getContext() {
        return this.f96794e.getContext();
    }

    @Override // t70.v0
    public final Object k() {
        Object obj = this.f96795f;
        this.f96795f = g.f96797a;
        return obj;
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(Object obj) throws DispatchException {
        Throwable thA = Result.a(obj);
        Object vVar = thA == null ? obj : new t70.v(false, thA);
        ContinuationImpl continuationImpl = this.f96794e;
        CoroutineContext context = continuationImpl.getContext();
        c0 c0Var = this.f96793d;
        if (g.f(c0Var, context)) {
            this.f96795f = vVar;
            this.f88870c = 0;
            g.e(c0Var, continuationImpl.getContext(), this);
            return;
        }
        i1 i1VarA = k2.a();
        if (i1VarA.f88806c >= 4294967296L) {
            this.f96795f = vVar;
            this.f88870c = 0;
            i1VarA.h0(this);
            return;
        }
        i1VarA.j0(true);
        try {
            CoroutineContext context2 = continuationImpl.getContext();
            Object objC = w.c(context2, this.f96796g);
            try {
                continuationImpl.resumeWith(obj);
                Unit unit = Unit.f71706a;
                while (i1VarA.l0()) {
                }
            } finally {
                w.a(context2, objC);
            }
        } finally {
            try {
            } finally {
            }
        }
    }

    public final String toString() {
        return "DispatchedContinuation[" + this.f96793d + ", " + m0.w(this.f96794e) + AbstractJsonLexerKt.END_LIST;
    }
}
