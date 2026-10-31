package q70;

import java.util.Iterator;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.GeneratorSequence$iterator$1;
import kotlin.sequences.Sequence;

/* loaded from: classes.dex */
public final class b implements Sequence {

    /* renamed from: a, reason: collision with root package name */
    public final Function0 f83783a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f83784b;

    public b(Function0 function0, Function1 getNextValue) {
        Intrinsics.g(getNextValue, "getNextValue");
        this.f83783a = function0;
        this.f83784b = getNextValue;
    }

    @Override // kotlin.sequences.Sequence
    public final Iterator iterator() {
        return new GeneratorSequence$iterator$1(this);
    }
}
