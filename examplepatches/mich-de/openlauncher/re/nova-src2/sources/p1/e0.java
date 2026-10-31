package p1;

import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class e0 extends androidx.compose.runtime.e {

    /* renamed from: b, reason: collision with root package name */
    public final f0 f81400b;

    public e0(Function1 function1) {
        super(new o00.d(10));
        this.f81400b = new f0(function1);
    }

    @Override // androidx.compose.runtime.e
    public final r1 a(Object obj) {
        return new r1(this, obj, obj == null, null, true);
    }

    @Override // androidx.compose.runtime.e
    public final b3 b() {
        return this.f81400b;
    }
}
