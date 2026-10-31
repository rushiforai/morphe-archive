package c0;

import kotlin.jvm.functions.Function0;
import p1.s2;

/* loaded from: classes.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final i2 f18857a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f18858b;

    /* renamed from: c, reason: collision with root package name */
    public final long f18859c;

    /* renamed from: d, reason: collision with root package name */
    public final Function0 f18860d;

    /* renamed from: e, reason: collision with root package name */
    public final p1.e1 f18861e;

    /* renamed from: f, reason: collision with root package name */
    public s f18862f;

    /* renamed from: g, reason: collision with root package name */
    public long f18863g;

    /* renamed from: h, reason: collision with root package name */
    public long f18864h = Long.MIN_VALUE;

    /* renamed from: i, reason: collision with root package name */
    public final p1.e1 f18865i = androidx.compose.runtime.d.k(Boolean.TRUE);

    public l(Object obj, i2 i2Var, s sVar, long j11, Object obj2, long j12, Function0 function0) {
        this.f18857a = i2Var;
        this.f18858b = obj2;
        this.f18859c = j12;
        this.f18860d = function0;
        this.f18861e = androidx.compose.runtime.d.k(obj);
        this.f18862f = f.d(sVar);
        this.f18863g = j11;
    }

    public final void a() {
        ((s2) this.f18865i).setValue(Boolean.FALSE);
        this.f18860d.invoke();
    }
}
