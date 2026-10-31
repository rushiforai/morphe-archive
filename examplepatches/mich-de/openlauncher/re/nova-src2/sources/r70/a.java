package r70;

import java.util.Iterator;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.Sequence;
import kotlin.text.DelimitedRangesSequence$iterator$1;

/* loaded from: classes5.dex */
public final class a implements Sequence {

    /* renamed from: a, reason: collision with root package name */
    public final CharSequence f85603a;

    /* renamed from: b, reason: collision with root package name */
    public final int f85604b;

    /* renamed from: c, reason: collision with root package name */
    public final Function2 f85605c;

    public a(CharSequence input, int i5, Function2 function2) {
        Intrinsics.g(input, "input");
        this.f85603a = input;
        this.f85604b = i5;
        this.f85605c = function2;
    }

    @Override // kotlin.sequences.Sequence
    public final Iterator iterator() {
        return new DelimitedRangesSequence$iterator$1(this);
    }
}
