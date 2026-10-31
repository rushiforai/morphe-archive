package q70;

import java.util.Iterator;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.ConstrainedOnceSequence;
import kotlin.sequences.FlatteningSequence;
import kotlin.sequences.Sequence;
import kotlin.sequences.TransformingSequence;
import p1.v1;

/* loaded from: classes.dex */
public abstract class d extends u90.b {
    public static Sequence m0(final Iterator it) {
        Intrinsics.g(it, "<this>");
        return n0(new Sequence<Object>() { // from class: kotlin.sequences.SequencesKt__SequencesKt$asSequence$$inlined$Sequence$1
            @Override // kotlin.sequences.Sequence
            /* renamed from: iterator, reason: from getter */
            public final Iterator getF71970a() {
                return it;
            }
        });
    }

    public static Sequence n0(Sequence sequence) {
        return sequence instanceof ConstrainedOnceSequence ? sequence : new ConstrainedOnceSequence(sequence);
    }

    public static final FlatteningSequence o0(Sequence sequence, Function1 function1) {
        if (!(sequence instanceof TransformingSequence)) {
            return new FlatteningSequence(sequence, new pu.e(22), function1);
        }
        TransformingSequence transformingSequence = (TransformingSequence) sequence;
        return new FlatteningSequence(transformingSequence.f71991a, transformingSequence.f71992b, function1);
    }

    public static Sequence p0(Object obj, Function1 nextFunction) {
        Intrinsics.g(nextFunction, "nextFunction");
        return obj == null ? a.f83782a : new b(new a7.f(obj, 26), nextFunction);
    }

    public static Sequence q0(Function0 function0) {
        return n0(new b(function0, new v1(function0)));
    }
}
