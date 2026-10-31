package o0;

import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class d implements n0.q {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f78723a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f78724b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f78725c;

    /* renamed from: d, reason: collision with root package name */
    public final x1.e f78726d;

    public d(Function1 function1, Function1 function12, Function1 function13, x1.e eVar) {
        this.f78723a = function1;
        this.f78724b = function12;
        this.f78725c = function13;
        this.f78726d = eVar;
    }

    @Override // n0.q
    public final Function1 getKey() {
        return this.f78723a;
    }

    @Override // n0.q
    public final Function1 getType() {
        return this.f78724b;
    }
}
