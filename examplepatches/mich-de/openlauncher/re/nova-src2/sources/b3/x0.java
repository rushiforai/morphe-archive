package b3;

import java.util.Map;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class x0 implements z2.s0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17393a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f17394b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Map f17395c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function1 f17396d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function1 f17397e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ y0 f17398f;

    public x0(int i5, int i11, Map map, Function1 function1, Function1 function12, y0 y0Var) {
        this.f17393a = i5;
        this.f17394b = i11;
        this.f17395c = map;
        this.f17396d = function1;
        this.f17397e = function12;
        this.f17398f = y0Var;
    }

    @Override // z2.s0
    public final Map a() {
        return this.f17395c;
    }

    @Override // z2.s0
    public final void b() {
        this.f17397e.invoke(this.f17398f.f17408l);
    }

    @Override // z2.s0
    public final Function1 c() {
        return this.f17396d;
    }

    @Override // z2.s0
    public final int getHeight() {
        return this.f17394b;
    }

    @Override // z2.s0
    public final int getWidth() {
        return this.f17393a;
    }
}
