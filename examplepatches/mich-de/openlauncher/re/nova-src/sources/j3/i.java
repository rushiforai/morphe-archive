package j3;

import kotlin.jvm.functions.Function0;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final Function0 f68786a;

    /* renamed from: b, reason: collision with root package name */
    public final Function0 f68787b;

    public i(Function0 function0, Function0 function02) {
        this.f68786a = function0;
        this.f68787b = function02;
    }

    public final String toString() {
        return "ScrollAxisRange(value=" + ((Number) this.f68786a.invoke()).floatValue() + ", maxValue=" + ((Number) this.f68787b.invoke()).floatValue() + ", reverseScrolling=false)";
    }
}
