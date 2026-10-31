package b80;

import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;
import t70.a1;
import y70.t;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final Object f17611a;

    /* renamed from: b, reason: collision with root package name */
    public final Function3 f17612b;

    /* renamed from: c, reason: collision with root package name */
    public final Function3 f17613c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f17614d;

    /* renamed from: e, reason: collision with root package name */
    public final SuspendLambda f17615e;

    /* renamed from: f, reason: collision with root package name */
    public final Function3 f17616f;

    /* renamed from: g, reason: collision with root package name */
    public Object f17617g;

    /* renamed from: h, reason: collision with root package name */
    public int f17618h = -1;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ f f17619i;

    public d(f fVar, Object obj, Function3 function3, Function3 function32, w50.g gVar, SuspendLambda suspendLambda, Function3 function33) {
        this.f17619i = fVar;
        this.f17611a = obj;
        this.f17612b = function3;
        this.f17613c = function32;
        this.f17614d = gVar;
        this.f17615e = suspendLambda;
        this.f17616f = function33;
    }

    public final void a() {
        Object obj = this.f17617g;
        if (obj instanceof t) {
            ((t) obj).h(this.f17618h, this.f17619i.f17625a);
            return;
        }
        a1 a1Var = obj instanceof a1 ? (a1) obj : null;
        if (a1Var != null) {
            a1Var.dispose();
        }
    }
}
