package f50;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import kotlin.LazyKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function0;
import org.jetbrains.annotations.NotNull;
import t70.c0;
import t70.e0;
import t70.i0;
import t70.i2;
import t70.q1;
import t70.s1;
import t70.t;
import t70.y0;

/* loaded from: classes.dex */
public abstract class f implements d {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f54324c = AtomicIntegerFieldUpdater.newUpdater(f.class, "closed");

    /* renamed from: a, reason: collision with root package name */
    public final a70.d f54325a;

    /* renamed from: b, reason: collision with root package name */
    public final a70.d f54326b;

    @NotNull
    private volatile /* synthetic */ int closed = 0;

    public f() {
        final int i5 = 0;
        this.f54325a = LazyKt.a(new Function0(this) { // from class: f50.e

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ f f54323b;

            {
                this.f54323b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i11 = i5;
                f fVar = this.f54323b;
                switch (i11) {
                    case 0:
                        ((g50.e) fVar).f57183d.getClass();
                        a80.e eVar = y0.f88884a;
                        return a80.d.f488c;
                    default:
                        return CoroutineContext.Element.DefaultImpls.d(new i2(null), new s50.e(e0.f88787a)).plus((c0) fVar.f54325a.getValue()).plus(new i0("ktor-android-context"));
                }
            }
        });
        final int i11 = 1;
        this.f54326b = LazyKt.a(new Function0(this) { // from class: f50.e

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ f f54323b;

            {
                this.f54323b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i112 = i11;
                f fVar = this.f54323b;
                switch (i112) {
                    case 0:
                        ((g50.e) fVar).f57183d.getClass();
                        a80.e eVar = y0.f88884a;
                        return a80.d.f488c;
                    default:
                        return CoroutineContext.Element.DefaultImpls.d(new i2(null), new s50.e(e0.f88787a)).plus((c0) fVar.f54325a.getValue()).plus(new i0("ktor-android-context"));
                }
            }
        });
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        if (f54324c.compareAndSet(this, 0, 1)) {
            CoroutineContext.Element element = getCoroutineContext().get(q1.f88853a);
            t tVar = element instanceof t ? (t) element : null;
            if (tVar == null) {
                return;
            }
            ((s1) tVar).j0();
        }
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return (CoroutineContext) this.f54326b.getValue();
    }
}
