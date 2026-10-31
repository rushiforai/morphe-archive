package kotlin.sequences;

import ab.e0;
import b.c0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.TransformingSequence;
import q20.c;
import q70.d;
import q70.f;
import ul.b;

@Metadata(d1 = {"u90/b", "u90/b", "q70/d", "kotlin/sequences/SequencesKt", "kotlin/sequences/SequencesKt"}, d2 = {}, k = 4, mv = {2, 1, 0}, xi = 49)
/* loaded from: classes.dex */
public final class SequencesKt extends d {
    private SequencesKt() {
    }

    public static List A0(Sequence sequence) {
        Intrinsics.g(sequence, "<this>");
        Iterator it = sequence.iterator();
        if (!it.hasNext()) {
            return EmptyList.f71733a;
        }
        Object next = it.next();
        if (!it.hasNext()) {
            return b.P(next);
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(next);
        while (it.hasNext()) {
            arrayList.add(it.next());
        }
        return arrayList;
    }

    public static ArrayList B0(Sequence sequence) {
        Intrinsics.g(sequence, "<this>");
        ArrayList arrayList = new ArrayList();
        Iterator it = sequence.iterator();
        while (it.hasNext()) {
            arrayList.add(it.next());
        }
        return arrayList;
    }

    public static Set C0(TransformingSequence transformingSequence) {
        TransformingSequence.AnonymousClass1 anonymousClass1 = new TransformingSequence.AnonymousClass1();
        Iterator it = anonymousClass1.f71993a;
        if (!it.hasNext()) {
            return EmptySet.f71734a;
        }
        Object next = anonymousClass1.next();
        if (!it.hasNext()) {
            return e0.U(next);
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        linkedHashSet.add(next);
        while (it.hasNext()) {
            linkedHashSet.add(anonymousClass1.next());
        }
        return linkedHashSet;
    }

    public static int r0(Sequence sequence) {
        Iterator it = sequence.iterator();
        int i5 = 0;
        while (it.hasNext()) {
            it.next();
            i5++;
            if (i5 < 0) {
                b.d0();
                throw null;
            }
        }
        return i5;
    }

    public static Sequence s0(Sequence sequence, int i5) {
        Intrinsics.g(sequence, "<this>");
        if (i5 >= 0) {
            return i5 == 0 ? sequence : sequence instanceof DropTakeSequence ? ((DropTakeSequence) sequence).a(i5) : new DropSequence(sequence, i5);
        }
        throw new IllegalArgumentException(c0.i(i5, "Requested element count ", " is less than zero.").toString());
    }

    public static FilteringSequence t0(Sequence sequence, Function1 predicate) {
        Intrinsics.g(sequence, "<this>");
        Intrinsics.g(predicate, "predicate");
        return new FilteringSequence(sequence, true, predicate);
    }

    public static FilteringSequence u0(Sequence sequence, Function1 predicate) {
        Intrinsics.g(sequence, "<this>");
        Intrinsics.g(predicate, "predicate");
        return new FilteringSequence(sequence, false, predicate);
    }

    public static Object v0(Sequence sequence) {
        Iterator it = sequence.iterator();
        if (it.hasNext()) {
            return it.next();
        }
        return null;
    }

    public static FlatteningSequence w0(Sequence sequence, Function1 transform) {
        Intrinsics.g(transform, "transform");
        return new FlatteningSequence(sequence, transform, f.f83790d);
    }

    public static Object x0(Sequence sequence) {
        Iterator it = sequence.iterator();
        if (!it.hasNext()) {
            throw new NoSuchElementException("Sequence is empty.");
        }
        Object next = it.next();
        while (it.hasNext()) {
            next = it.next();
        }
        return next;
    }

    public static TransformingSequence y0(Sequence sequence, Function1 transform) {
        Intrinsics.g(transform, "transform");
        return new TransformingSequence(sequence, transform);
    }

    public static FilteringSequence z0(Sequence sequence, Function1 transform) {
        Intrinsics.g(transform, "transform");
        return u0(new TransformingSequence(sequence, transform), new c(11));
    }
}
